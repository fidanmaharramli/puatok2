using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Authorization;
using PustokMvcApp.Areas.Manage.ViewModels.AdminVms;
using PustokMvcApp.Models;

namespace PustokMvcApp.Areas.Manage.Controllers
{
    [Area("Manage")]
    [Authorize(Roles = "Admin")]
    public class AdminAccountController(
        UserManager<AppUser> userManager,
        SignInManager<AppUser> signInManager,
        RoleManager<IdentityRole> roleManager



        ) : Controller
    {
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> CreateAdmin()
        {
            var user = HttpContext.User;
            var admin = new AppUser
            {
                UserName = "_admin",
                FullName = "Admin Adminov",
                Email = "admin@gmail.com",

            };
            var result = await userManager.CreateAsync(admin, "_Admin123");
            if (!result.Succeeded)
            {
                return Json(result.Errors);
            }
            await userManager.AddToRoleAsync(admin, "Admin");
            return Content("Admin Create");

        }
        [HttpGet]
        [AllowAnonymous]
        public IActionResult Login(string? ReturnUrl)
        {
            ViewData["ReturnUrl"] = ReturnUrl;
            return View();
        }


        [HttpPost]
        [ValidateAntiForgeryToken]
        [AllowAnonymous]
        public async Task<IActionResult> Login(AdminLoginVm adminLogin, string? ReturnUrl)
        {
            ViewData["ReturnUrl"] = ReturnUrl;
            if (!ModelState.IsValid)
                return View(adminLogin);
            var user = await userManager.FindByNameAsync(adminLogin.UserName);
            if (user == null)
            {
                ModelState.AddModelError("", "UserName or Password is wrong");
                return View(adminLogin);
            }
            var result = await userManager.CheckPasswordAsync(user, adminLogin.Password);
            if (!result)
            {
                ModelState.AddModelError("", "UserName or Password is wrong");
                return View(adminLogin);
            }

            var roles = await userManager.GetRolesAsync(user);
            if (!roles.Contains("Admin"))
            {
                ModelState.AddModelError("", "Only admins can log in here");
                return View(adminLogin);
            }

            Response.Cookies.Delete("basket", new CookieOptions
            {
                Expires = DateTimeOffset.UtcNow.AddDays(-1),
            });

            await signInManager.SignInAsync(user, true);
            if (Url.IsLocalUrl(ReturnUrl))
            {
                return LocalRedirect(ReturnUrl);
            }

            return RedirectToAction("index", "dashboard");
        }
        [HttpGet]
        public async Task<IActionResult> Logout()
        {
            Response.Cookies.Delete("basket", new CookieOptions
            {
                Expires = DateTimeOffset.UtcNow.AddDays(-1),
            }); 

            await signInManager.SignOutAsync();
            return RedirectToAction("login", "adminaccount");
        }

        [HttpGet]
        public async Task<IActionResult> GetProfile()
        {
            var user = HttpContext.User;
            var dbUser = await userManager.FindByNameAsync(user.Identity?.Name);
            return Json(new
            {
                user.Identity?.Name,
                dbUser.FullName,
                dbUser.Email,
            });
        }







        //public async Task<IActionResult> CreateRole()
        //{
        //    var role1 = new IdentityRole("SuperAdmin");
        //    var role2 = new IdentityRole("Admin");
        //    var role3 = new IdentityRole("Member");
        //    await roleManager.CreateAsync(role1);
        //    await roleManager.CreateAsync(role2);
        //    await roleManager.CreateAsync(role3);
        //    return Content("Role Created");
        //}
    }
}
