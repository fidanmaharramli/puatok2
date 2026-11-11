using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using PustokMvcApp.Areas.Manage.ViewModels.RoleVms;
using PustokMvcApp.Models;

namespace PustokMvcApp.Areas.Manage.Controllers;

[Area("Manage")]
[Authorize(Roles = "Admin")]
public class RoleController(RoleManager<IdentityRole> roleManager, UserManager<AppUser> userManager) : Controller
{
    [HttpGet]
    public async Task<IActionResult> Index()
    {
        var roles = await roleManager.Roles.OrderBy(r => r.Name).ToListAsync();
        var model = new List<RoleListVm>();
        foreach (var role in roles)
        {
            if (role.Name is null) continue;
            var users = await userManager.GetUsersInRoleAsync(role.Name);
            model.Add(new RoleListVm { Name = role.Name, UserCount = users.Count });
        }
        return View(model);
    }

    [HttpGet]
    public IActionResult Create() => View(new RoleCreateVm());

    [HttpPost]
    [ValidateAntiForgeryToken]
    public async Task<IActionResult> Create(RoleCreateVm model)
    {
        if (!ModelState.IsValid) return View(model);

        var result = await roleManager.CreateAsync(new IdentityRole(model.Name.Trim()));
        if (!result.Succeeded)
        {
            foreach (var error in result.Errors)
                ModelState.AddModelError(nameof(model.Name), error.Description);
            return View(model);
        }

        TempData["RoleSuccess"] = "Role created successfully. You can now assign it from Users > Edit.";
        return RedirectToAction(nameof(Index));
    }
}
