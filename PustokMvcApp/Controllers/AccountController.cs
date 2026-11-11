using MailKit.Net.Smtp;
using MailKit.Security;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using MimeKit;
using MimeKit.Text;
using PustokMvcApp.Data;
using PustokMvcApp.Models;
using PustokMvcApp.Services;
using PustokMvcApp.ViewModels.UserVms;
using System.Security.Cryptography;

namespace PustokMvcApp.Controllers;

public class AccountController
    (
    UserManager<AppUser> userManager,
    SignInManager<AppUser> signInManager,
    RoleManager<IdentityRole> roleManager,
    IEmailService emailService,
    AppDbContext context
    ) : Controller
{
    public IActionResult Index()
    {
        return View();
    }

    [HttpGet]
    public IActionResult Register()
    {
        return View();
    }

    [HttpPost]
    public async Task<IActionResult> Register(UserRegisterVm registerVM)
    {
        if (!ModelState.IsValid) return View(registerVM);
        var user = await userManager.FindByNameAsync(registerVM.UserName);
        if (user != null)
        {
            ModelState.AddModelError("", "This username already exists");
            return View(registerVM);
        }
        user = new AppUser
        {
            UserName = registerVM.UserName,
            FullName = registerVM.FullName,
            Email = registerVM.Email
        };

        IdentityResult result = await userManager.CreateAsync(user, registerVM.Password);
        if (!result.Succeeded)
        {
            foreach (var error in result.Errors)
            {
                ModelState.AddModelError("", error.Description);
            }
            return View(registerVM);
        }
        await userManager.AddToRoleAsync(user, "Member");
        var token = await userManager.GenerateEmailConfirmationTokenAsync(user);
        var confirmationLink = Url.Action("ConfirmEmail", "Account", new { email = user.Email, token = token }, Request.Scheme);

        FileStream fileStream = new FileStream("wwwroot/EmailTemplates/EmailConfirmation.html", FileMode.Open);
        using StreamReader reader = new StreamReader(fileStream);
        var emailBody = await reader.ReadToEndAsync();
        emailBody = emailBody.Replace("{{ConfirmationLink}}", confirmationLink);
        emailBody = emailBody.Replace("{{UserName}}", user.UserName);

        await emailService.SendEmailAsync(user.Email, "Email Confirmation", emailBody, true);

        return RedirectToAction("Login");
    }

    [HttpPost]
    public async Task<IActionResult> Login(UserLoginVm UserLoginVm, string? ReturnUrl)
    {
        if (!ModelState.IsValid) return View();

        var user = await userManager.FindByNameAsync(UserLoginVm.UserNameorEmail);
        if (user == null)
        {
            user = await userManager.FindByEmailAsync(UserLoginVm.UserNameorEmail);
            if (user == null)
            {
                ModelState.AddModelError("", "Invalid username or password");
                return View();
            }
        }

        if (await userManager.IsInRoleAsync(user, "Admin"))
        {
            ModelState.AddModelError("", "Admins cannot log in here");
            return View();
        }

        var result = await signInManager.PasswordSignInAsync(user, UserLoginVm.Password, UserLoginVm.RememberMe, lockoutOnFailure: true);

        if (!user.EmailConfirmed)
        {
            ModelState.AddModelError("", "Emailini tesdiq etmeyiniz teleb edilir");
            return View(UserLoginVm);
        }

        if (result.IsLockedOut)
        {
            ModelState.AddModelError("", "Your account is locked. Please try again later.");
            return View(UserLoginVm);
        }


        if (!result.Succeeded)
        {
            ModelState.AddModelError("", "Invalid username or password");
            return View(UserLoginVm);
        }

        Response.Cookies.Delete("basket", new CookieOptions
        {
            Expires = DateTimeOffset.UtcNow.AddDays(-1),
        });

        if (Url.IsLocalUrl(ReturnUrl))
        {
            return LocalRedirect(ReturnUrl);
        }

        return RedirectToAction("Index", "Home");
    }

    [HttpGet]
    public IActionResult Login()
    {
        return View();
    }

    [HttpGet]
    public async Task<IActionResult> Logout()
    {
        Response.Cookies.Delete("basket", new CookieOptions
        {
            Expires = DateTimeOffset.UtcNow.AddDays(-1),
        });

        await signInManager.SignOutAsync();
        return RedirectToAction("Index", "Home");
    }

    [HttpGet]
    public async Task<IActionResult> ConfirmEmail(string email, string token)
    {
        if (email == null || token == null)
            return RedirectToAction("Index", "Home");
        var user = await userManager.FindByEmailAsync(email);
        if (user == null)
            return NotFound();
        var result = await userManager.ConfirmEmailAsync(user, token);
        if (result.Succeeded)
        {
            await userManager.UpdateSecurityStampAsync(user);
            return RedirectToAction(nameof(Login));
        }

        return BadRequest();
    }

    [HttpGet]
    public IActionResult ForgotPassword()
    {
        return View();
    }

    [HttpPost]
    public async Task<IActionResult> ForgotPassword(ForgotPasswordVm forgotPasswordVm)
    {
        if (!ModelState.IsValid)
            return View(forgotPasswordVm);

        var user = await userManager.FindByEmailAsync(forgotPasswordVm.Email);
        if (user == null)
        {
            ModelState.AddModelError("", "User not found");
            return View(forgotPasswordVm);
        }

        var code = RandomNumberGenerator.GetInt32(100000, 1000000).ToString();

        var passwordResetToken = await context.PasswordResetTokens
            .FirstOrDefaultAsync(x => x.UserEmail == user.Email);

        if (passwordResetToken == null)
        {
            passwordResetToken = new PasswordResetToken
            {
                UserEmail = user.Email
            };

            await context.PasswordResetTokens.AddAsync(passwordResetToken);
        }

        passwordResetToken.Key = code;
        passwordResetToken.ExpireDate = DateTime.UtcNow.AddMinutes(15);

        var emailBody = await System.IO.File.ReadAllTextAsync(
        "wwwroot/EmailTemplates/PasswordResetWithCode.html");
        emailBody = emailBody.Replace("{{ResetCode}}", code);
        emailBody = emailBody.Replace("{{UserName}}", user.UserName);

        await emailService.SendEmailAsync(user.Email, "Password Reset", emailBody, true);

        await context.SaveChangesAsync();

        return RedirectToAction(nameof(ResetPasswordWithCode), new { email = user.Email });
    }

    [HttpGet]
    public IActionResult ResetPasswordWithCode(string email)
    {
        ResetPasswordWithCodeVm resetPasswordWithCodeVm = new ResetPasswordWithCodeVm
        {
            Email = email
        };
        return View(resetPasswordWithCodeVm);
    }

    [HttpPost]
    public async Task<IActionResult> ResetPasswordWithCode(ResetPasswordWithCodeVm resetPasswordWithCodeVm)
    {
        if (!ModelState.IsValid)
            return View(resetPasswordWithCodeVm);

        var user = await userManager.FindByEmailAsync(resetPasswordWithCodeVm.Email);
        if (user == null)
            return BadRequest();

        var resetToken = await context.PasswordResetTokens.FirstOrDefaultAsync(x => x.UserEmail == user.Email );
        if (resetToken == null || resetToken.ExpireDate < DateTime.UtcNow || resetToken.Key != resetPasswordWithCodeVm.Code)
        {
            ModelState.AddModelError("", "Invalid or expired code");
            return View(resetPasswordWithCodeVm);
        }
        var token = await userManager.GeneratePasswordResetTokenAsync(user);    

        context.PasswordResetTokens.Remove(resetToken);
        await context.SaveChangesAsync();

        return RedirectToAction(nameof(ResetPassword), new { email = user.Email, token = token });
    }


    [HttpGet]
    public async Task<IActionResult> ResetPassword(string email, string token)
    {
        var user = await userManager.FindByEmailAsync(email);
        if (user == null)
            return BadRequest();

        var result = await userManager.VerifyUserTokenAsync(user, userManager.Options.Tokens.PasswordResetTokenProvider, "ResetPassword", token);
        if (!result)
            return BadRequest();

        ResetPasswordVm resetPasswordVm = new ResetPasswordVm
        {
            Email = email,
            Token = token
        };

        return View(resetPasswordVm);
    }

    [HttpPost]
    public async Task<IActionResult> ResetPassword(ResetPasswordVm resetPasswordVm)
    {
        if (!ModelState.IsValid)
            return View(resetPasswordVm);

        var user = await userManager.FindByEmailAsync(resetPasswordVm.Email);
        if (user == null)
        {
            ModelState.AddModelError("", "User not found");
            return View(resetPasswordVm);
        }
        var result = await userManager.ResetPasswordAsync(user, resetPasswordVm.Token, resetPasswordVm.Password);
        if (!result.Succeeded)
        {
            foreach (var error in result.Errors)
            {
                ModelState.AddModelError("", error.Description);
            }
            return View(resetPasswordVm);
        }
        await userManager.UpdateSecurityStampAsync(user);
        return RedirectToAction(nameof(Login));
    }


}
