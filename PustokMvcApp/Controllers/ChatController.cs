using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Authorization;
using PustokMvcApp.Models;

namespace PustokMvcApp.Controllers
{
    
    [Authorize]
    public class ChatController(UserManager<AppUser> userManager) : Controller
    {
        public IActionResult Index()
        {
            ViewBag.UserId = userManager.Users.ToList();
            return View();
        }
    }
}
