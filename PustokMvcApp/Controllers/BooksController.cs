using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Authorization;
using Microsoft.EntityFrameworkCore;
using PustokMvcApp.Data;
using PustokMvcApp.ViewModels;

namespace PustokMvcApp.Controllers
{
    public class BooksController(AppDbContext dbContext) : Controller
    {
        public IActionResult FirstDetails()
        {
            var bookId = dbContext.Books
                .OrderBy(b => b.Name)
                .ThenBy(b => b.Id)
                .Select(b => (Guid?)b.Id)
                .FirstOrDefault();

            if (bookId == null)
            {
                return RedirectToAction("Index", "Home");
            }

            return RedirectToAction(nameof(Details), new { id = bookId.Value });
        }

        [Authorize]
        public IActionResult Details(Guid id)
        {
            var book = dbContext.Books
                .Include(x => x.Author)
                .Include(x => x.BookImages)
                .Include(x => x.BookTags)
                .ThenInclude(x => x.Tag)
                .FirstOrDefault(b => b.Id == id);

            if (book == null)
            {
                return NotFound();
            }

            var imageUrls = new List<string> { book.MainImageUrl };
            if (book.BookImages != null)
            {
                imageUrls.AddRange(book.BookImages.OrderBy(image => image.Id).Select(image => image.ImageUrl));
            }

            BookVm bookVm = new()
            {
                Book = book,
                ImageUrls = imageUrls.Where(url => !string.IsNullOrWhiteSpace(url)).Distinct().ToList(),
                RelatedBooks = dbContext.Books
                    .Include(b => b.Author)
                    .Where(b => b.AuthorId == book.AuthorId && b.Id != book.Id)
                    .OrderBy(b => b.Name)
                    .ThenBy(b => b.Id)
                    .Take(4)
                    .ToList()
            };

            return View(bookVm);
        }

        public IActionResult BookModal(Guid id)
        {
            var book = dbContext.Books
                .Include(x => x.Author)
                .Include(x => x.BookImages)
                .Include(x => x.BookTags)
                .ThenInclude(x => x.Tag)
                .FirstOrDefault(b => b.Id == id);

            if (book == null)
            {
                return NotFound();
            }

            return PartialView("_BookModal", book);
        }
    }
}
