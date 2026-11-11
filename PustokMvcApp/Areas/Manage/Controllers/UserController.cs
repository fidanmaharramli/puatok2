using Microsoft.AspNetCore.Mvc;

using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using PustokMvcApp.Areas.Manage.ViewModels.UserVms;
using PustokMvcApp.Data;
using PustokMvcApp.Models;

namespace PustokMvcApp.Areas.Manage.Controllers;

[Area("Manage")]
[Authorize(Roles = "Admin")]
public class UserController(
    UserManager<AppUser> userManager,
    RoleManager<IdentityRole> roleManager,
    SignInManager<AppUser> signInManager,
    AppDbContext context) : Controller
{
    [HttpGet]
    public async Task<IActionResult> Index()
    {
        var users = await userManager.Users.OrderBy(u => u.UserName).ToListAsync();
        var model = new List<UserDetailsVm>();
        foreach (var user in users)
        {
            model.Add(await ToDetailsVm(user));
        }

        return View(model);
    }

    [HttpGet]
    public IActionResult Create() => View(new UserCreateVm());

    [HttpPost]
    [ValidateAntiForgeryToken]
    public async Task<IActionResult> Create(UserCreateVm model)
    {
        if (!ModelState.IsValid) return View(model);

        if (!await roleManager.RoleExistsAsync("Member"))
        {
            ModelState.AddModelError("", "The Member role is missing. Create this role before adding users.");
            return View(model);
        }

        var user = new AppUser
        {
            FullName = model.FullName.Trim(),
            UserName = model.UserName.Trim(),
            Email = model.Email.Trim()
        };

        // Save the account and its role together; a role failure must not leave a partial account.
        await using var transaction = await context.Database.BeginTransactionAsync();
        var result = await userManager.CreateAsync(user, model.Password);
        if (!result.Succeeded)
        {
            AddIdentityErrors(result);
            return View(model);
        }

        result = await userManager.AddToRoleAsync(user, "Member");
        if (!result.Succeeded)
        {
            AddIdentityErrors(result);
            return View(model);
        }

        await transaction.CommitAsync();
        TempData["UserSuccess"] = "User created successfully.";
        return RedirectToAction(nameof(Index));
    }

    [HttpGet]
    public async Task<IActionResult> Details(string? id)
    {
        if (string.IsNullOrWhiteSpace(id)) return NotFound();
        var user = await userManager.FindByIdAsync(id);
        if (user is null) return NotFound();
        return View(await ToDetailsVm(user));
    }

    [HttpGet]
    public async Task<IActionResult> Edit(string? id)
    {
        if (string.IsNullOrWhiteSpace(id)) return NotFound();
        var user = await userManager.FindByIdAsync(id);
        if (user is null) return NotFound();

        var roles = await userManager.GetRolesAsync(user);
        var model = new UserEditVm
        {
            FullName = user.FullName,
            UserName = user.UserName ?? string.Empty,
            Email = user.Email ?? string.Empty,
            ConcurrencyStamp = user.ConcurrencyStamp ?? string.Empty
        };
        await LoadRoles(model);
        model.RoleIds = model.AvailableRoles.Where(r => roles.Contains(r.Text)).Select(r => r.Value).ToList();
        return View(model);
    }

    [HttpPost]
    [ValidateAntiForgeryToken]
    public async Task<IActionResult> Edit(string? id, UserEditVm model)
    {
        if (string.IsNullOrWhiteSpace(id)) return NotFound();
        var user = await userManager.FindByIdAsync(id);
        if (user is null) return NotFound();
        await LoadRoles(model);
        if (!ModelState.IsValid) return View(model);

        if (user.ConcurrencyStamp != model.ConcurrencyStamp)
        {
            ModelState.AddModelError("", "This user was changed by another request. Reload this page before editing again.");
            return View(model);
        }

        var selectedRoleIds = model.RoleIds.Distinct().ToList();
        var selectedRoles = model.AvailableRoles.Where(r => selectedRoleIds.Contains(r.Value)).ToList();
        if (selectedRoles.Count != selectedRoleIds.Count)
        {
            ModelState.AddModelError(nameof(model.RoleIds), "One or more selected roles no longer exist.");
            return View(model);
        }

        var roleNames = selectedRoles.Select(r => r.Text).ToList();
        var isCurrentUser = userManager.GetUserId(User) == user.Id;
        if (isCurrentUser && !roleNames.Contains("Admin"))
        {
            ModelState.AddModelError(nameof(model.RoleIds), "You cannot remove your own Admin role. Another admin can change it.");
            return View(model);
        }

        var changePassword = !string.IsNullOrEmpty(model.NewPassword);
        if (changePassword)
        {
            foreach (var validator in userManager.PasswordValidators)
            {
                var passwordResult = await validator.ValidateAsync(userManager, user, model.NewPassword);
                if (!passwordResult.Succeeded)
                    AddIdentityErrors(passwordResult, nameof(model.NewPassword));
            }
            if (!ModelState.IsValid) return View(model);
        }

        // Profile, password and role changes must either all succeed or all roll back.
        await using var transaction = await context.Database.BeginTransactionAsync();
        var email = model.Email.Trim();
        if (!string.Equals(user.Email, email, StringComparison.OrdinalIgnoreCase))
        {
            user.EmailConfirmed = false;
        }

        user.FullName = model.FullName.Trim();
        user.UserName = model.UserName.Trim();
        user.Email = email;

        var result = await userManager.UpdateAsync(user);
        if (!result.Succeeded)
        {
            AddIdentityErrors(result);
            return View(model);
        }

        var currentRoles = await userManager.GetRolesAsync(user);
        var rolesToRemove = currentRoles.Except(roleNames).ToList();
        var rolesToAdd = roleNames.Except(currentRoles).ToList();
        if (rolesToRemove.Count > 0)
        {
            result = await userManager.RemoveFromRolesAsync(user, rolesToRemove);
            if (!result.Succeeded)
            {
                AddIdentityErrors(result);
                return View(model);
            }
        }
        if (rolesToAdd.Count > 0)
        {
            result = await userManager.AddToRolesAsync(user, rolesToAdd);
            if (!result.Succeeded)
            {
                AddIdentityErrors(result);
                return View(model);
            }
        }

        if (changePassword)
        {
            var token = await userManager.GeneratePasswordResetTokenAsync(user);
            result = await userManager.ResetPasswordAsync(user, token, model.NewPassword!);
            if (!result.Succeeded)
            {
                AddIdentityErrors(result, nameof(model.NewPassword));
                return View(model);
            }
        }

        // Revoke other sessions so removed roles and old passwords cannot retain access.
        result = await userManager.UpdateSecurityStampAsync(user);
        if (!result.Succeeded)
        {
            AddIdentityErrors(result);
            return View(model);
        }

        await transaction.CommitAsync();
        if (isCurrentUser)
        {
            await signInManager.RefreshSignInAsync(user);
        }

        TempData["UserSuccess"] = "User updated successfully.";
        return RedirectToAction(nameof(Index));
    }

    [HttpGet]
    public async Task<IActionResult> Delete(string? id)
    {
        if (string.IsNullOrWhiteSpace(id)) return NotFound();
        var user = await userManager.FindByIdAsync(id);
        if (user is null) return NotFound();
        return View(await ToDetailsVm(user));
    }

    [HttpPost, ActionName("Delete")]
    [ValidateAntiForgeryToken]
    public async Task<IActionResult> DeleteConfirmed(UserDeleteVm model)
    {
        if (!ModelState.IsValid)
        {
            TempData["UserError"] = "A valid user must be selected.";
            return RedirectToAction(nameof(Index));
        }

        var user = await userManager.FindByIdAsync(model.Id);
        if (user is null)
        {
            TempData["UserError"] = "The user no longer exists.";
            return RedirectToAction(nameof(Index));
        }

        // Always check the stored role again, even if the Delete button was hidden.
        if (await userManager.IsInRoleAsync(user, "Admin"))
        {
            TempData["UserError"] = "Admin users cannot be deleted.";
            return RedirectToAction(nameof(Index));
        }

        var result = await userManager.DeleteAsync(user);
        if (!result.Succeeded)
        {
            AddIdentityErrors(result);
            return View("Delete", await ToDetailsVm(user));
        }

        TempData["UserSuccess"] = "User deleted successfully.";
        return RedirectToAction(nameof(Index));
    }

    private async Task<UserDetailsVm> ToDetailsVm(AppUser user) => new()
    {
        Id = user.Id,
        FullName = user.FullName,
        UserName = user.UserName ?? string.Empty,
        Email = user.Email ?? string.Empty,
        Roles = await userManager.GetRolesAsync(user),
        EmailConfirmed = user.EmailConfirmed,
        IsLockedOut = await userManager.IsLockedOutAsync(user),
        LockoutEnd = user.LockoutEnd
    };

    private async Task LoadRoles(UserEditVm model)
    {
        model.AvailableRoles = await roleManager.Roles.OrderBy(r => r.Name)
            .Select(r => new SelectListItem { Value = r.Id, Text = r.Name ?? string.Empty })
            .ToListAsync();
    }

    private void AddIdentityErrors(IdentityResult result, string passwordField = nameof(UserCreateVm.Password))
    {
        foreach (var error in result.Errors)
        {
            var field = error.Code switch
            {
                "DuplicateUserName" or "InvalidUserName" => nameof(UserFormVm.UserName),
                "DuplicateEmail" or "InvalidEmail" => nameof(UserFormVm.Email),
                _ when error.Code.StartsWith("Password", StringComparison.Ordinal) => passwordField,
                _ => string.Empty
            };
            ModelState.AddModelError(field, error.Description);
        }
    }
}
