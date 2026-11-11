using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using PustokMvcApp.Data;
using PustokMvcApp.Models;
using PustokMvcApp.ViewModels;
using System.Diagnostics;

namespace PustokMvcApp.Controllers
{
    public class HomeController(AppDbContext dbContext) : Controller
    {
        public IActionResult Index()
        {
            HomeVm homeVm = new HomeVm
            {
                Sliders = dbContext.Sliders.ToList(),

                FeaturedBooks = dbContext.Books
                .Include(b => b.Author)
                .Where(b => b.IsFeatured).ToList(),

                NewBooks = dbContext.Books
                .Include(b => b.Author)
                .Where(b => b.IsNew).ToList(),

                DiscointedBooks = dbContext.Books
                .Include(b => b.Author)
                .Where(b => b.DiscountPercent > 0).ToList(),

                DealBooks = dbContext.Books
                .Include(b => b.Author)
                .Where(b => b.DiscountPercent > 0 &&
                    b.BookTags!.Any(bt => bt.Tag.Name == "Deal of the day"))
                .OrderBy(b => b.Name).ThenBy(b => b.Id).ToList(),

                BestSellerBooks = dbContext.Books
                .Include(b => b.Author)
                .Where(b => b.BookTags!.Any(bt => bt.Tag.Name == "Best sellers"))
                .OrderBy(b => b.Name).ThenBy(b => b.Id).ToList(),

                ChildrenBooks = dbContext.Books
                .Include(b => b.Author)
                .Where(b => b.BookTags!.Any(bt => bt.Tag.Name == "Children"))
                .OrderBy(b => b.Name).ThenBy(b => b.Id).ToList(),

                ArtsBooks = dbContext.Books
                .Include(b => b.Author)
                .Where(b => b.BookTags!.Any(bt => bt.Tag.Name == "Arts & Photography"))
                .OrderBy(b => b.Name).ThenBy(b => b.Id).ToList()

            };


            return View(homeVm);
        }

      
    }
}
