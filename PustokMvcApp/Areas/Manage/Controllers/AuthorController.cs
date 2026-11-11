using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using PustokMvcApp.Areas.Manage.ViewModels.AuthorVms;
using PustokMvcApp.Data;
using PustokMvcApp.Models;

namespace PustokMvcApp.Areas.Manage.Controllers
{
    [Area("Manage")]
    [Authorize(Roles = "Admin")]
    public class AuthorController(AppDbContext context) : Controller
    {
        public IActionResult Index()
        {
            var authors = context.Authors.ToList();
            return View(authors);
        }

        public async Task<IActionResult> Delete(Guid id)
        {
            var author = context.Authors.Find(id);
            if (author is null)
            {
                return NotFound();
            }
            context.Authors.Remove(author);
            await context.SaveChangesAsync();
            return Ok();
        }

        public IActionResult Details (Guid id)
        {
            var author = context.Authors
                .Include(a => a.Books)
                .FirstOrDefault(a => a.Id == id);
            if (author is null)
            {
                return NotFound();
            }
            return View(author);
        }

        [HttpGet]
        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Create(AuthorCreateVm authorCreateVm)
        {
            if (!ModelState.IsValid)
            {
                return View(authorCreateVm);
            }
            Author author = new Author
            {
                FullName = authorCreateVm.FullName
            };
            await context.Authors.AddAsync(author);
            await context.SaveChangesAsync();
            return RedirectToAction("Index");
        }

        [HttpGet]
        public IActionResult Edit(Guid id)
        {
            var author = context.Authors.Find(id);
            if (author is null)
            {
                return NotFound();
            }
            var authorEditVm = new AuthorEditVm
            {
                FullName = author.FullName
            };
            return View(authorEditVm);
        }

        [HttpPost]
        public async Task<IActionResult> Edit(Guid id, AuthorEditVm authorEditVm)
        {
            if (!ModelState.IsValid)
            {
                return View(authorEditVm);
            }

            var author = context.Authors.FirstOrDefault(x => x.Id == id);
            if (author is null)
            {
                return NotFound();
            }

            if (context.Authors.Any(x => x.Id != id &&
                x.FullName.ToLower() == authorEditVm.FullName.ToLower()))
            {
                ModelState.AddModelError("FullName", "This author already exists");
                return View(authorEditVm);
            }

            author.FullName = authorEditVm.FullName;
            await context.SaveChangesAsync();
            return RedirectToAction("Index");
        }
    }
}
