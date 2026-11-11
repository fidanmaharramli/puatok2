using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using PustokMvcApp.Areas.Manage.ViewModels.BookVms;
using PustokMvcApp.Data;
using PustokMvcApp.Models;

namespace PustokMvcApp.Areas.Manage.Controllers;

[Area("Manage")]
[Authorize(Roles = "Admin")]
public class BookController(AppDbContext context) : Controller
{
    public IActionResult Index()
    {
        var books = context.Books.ToList();
        return View(books);
    }
    public IActionResult Create()
    {
        ViewBag.Authors = context.Authors.ToList();
        ViewBag.Tags = context.Tags.ToList();
        return View();
    }

    [HttpPost]
    public async Task<IActionResult> Create(BookCreateVm bookCreateVm)
    {
        ViewBag.Authors = context.Authors.ToList();
        ViewBag.Tags = context.Tags.ToList();
        if (!ModelState.IsValid)
        {
            return View(bookCreateVm);
        }
        if (!context.Authors.Any(b => b.Id == bookCreateVm.AuthorId))
        {
            ModelState.AddModelError("AuthorId", "Selected author does not exist.");
            return View(bookCreateVm);
        }
        var mainFile = bookCreateVm.MainFile;
        var hoverFile = bookCreateVm.HoverFile;
        var files = bookCreateVm.Files;

        var book = new Book
        {
            Name = bookCreateVm.Name,
            Description = bookCreateVm.Description,
            Price = bookCreateVm.Price,
            AuthorId = bookCreateVm.AuthorId,
            IsFeatured = bookCreateVm.IsFeatured,
            IsNew = bookCreateVm.IsNew,
            InStock = bookCreateVm.InStock,
            Code = bookCreateVm.Code,
            DiscountPercent = bookCreateVm.DiscountPercent

        };

        if (mainFile != null)
        {
            var mainFileName = Guid.NewGuid().ToString() + Path.GetExtension(mainFile.FileName);
            var mainFilePath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "image", "products", mainFileName);

            if (!mainFile.ContentType.Contains("image/"))
            {
                ModelState.AddModelError("MainFile", "Main file mus be an image.");
                return View(bookCreateVm);
            }
            if (mainFile.Length > 2 * 1024 * 1024)
            {
                ModelState.AddModelError("MainFile", "Main file must be less than 2MB.");
                return View(bookCreateVm);
            }
            using (var stream = new FileStream(mainFilePath, FileMode.Create))
            {
                mainFile.CopyTo(stream);
            }
            book.MainImageUrl = "/image/products/" + mainFileName;
        }

        if (hoverFile != null)
        {
            var hoverFileName = Guid.NewGuid().ToString() + Path.GetExtension(hoverFile.FileName);
            var hoverFilePath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "image", "products", hoverFileName);

            if (!hoverFile.ContentType.Contains("image/"))
            {
                ModelState.AddModelError("HoverFile", "Hover file must be an image.");
                return View(bookCreateVm);
            }
            if (hoverFile.Length > 2 * 1024 * 1024)
            {
                ModelState.AddModelError("HoverFile", "Hover file must be less than 2MB.");
                return View(bookCreateVm);
            }
            using (var stream = new FileStream(hoverFilePath, FileMode.Create))
            {
                hoverFile.CopyTo(stream);
            }
            book.HoverImageUrl = "/image/products/" + hoverFileName;
        }

        if (files != null)
        {
            foreach (var file in files)
            {
                if (file != null)
                {
                    var fileName = Guid.NewGuid().ToString() + Path.GetExtension(file.FileName);
                    var filePath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "image", "products", fileName);

                    if (!file.ContentType.Contains("image/"))
                    {
                        ModelState.AddModelError("Files", "Files must be images.");
                        return View(bookCreateVm);
                    }
                    if (file.Length > 2 * 1024 * 1024)
                    {
                        ModelState.AddModelError("Files", "Files must be less than 2MB.");
                        return View(bookCreateVm);
                    }
                    using (var stream = new FileStream(filePath, FileMode.Create))
                    {
                        file.CopyTo(stream);
                    }
                    book.BookImages.Add(new BookImage { ImageUrl = "/image/products/" + fileName });
                }
            }
        }

        foreach (var tagId in bookCreateVm.TagIds)
        {
            if (!context.Tags.Any(t=>t.Id == tagId))
            {
                ModelState.AddModelError("TagIds", "One or more selected tags do not exist.");
                return View(bookCreateVm);

            }
            book.BookTags.Add(new BookTag { TagId = tagId });
        }


        await context.Books.AddAsync(book);
        await context.SaveChangesAsync();

        return RedirectToAction("Index");
    }


    [HttpGet]

    public IActionResult Edit(Guid id)
    {
        var book = context.Books
            .Include(b => b.BookTags)
            .Include(b => b.BookImages)
            .FirstOrDefault(b => b.Id == id);
        if (book == null) return NotFound();
        ViewBag.Authors = context.Authors.ToList();
        ViewBag.Tags = context.Tags.ToList();
        var bookEditVm = new BookEditVm
        {
            Name = book.Name,
            Description = book.Description,
            Price = book.Price,
            AuthorId = book.AuthorId,
            IsFeatured = book.IsFeatured,
            IsNew = book.IsNew,
            InStock = book.InStock,
            Code = book.Code,
            DiscountPercent = book.DiscountPercent,
            TagIds = book.BookTags.Select(bt => bt.TagId).ToList(),
            BookImages = book.BookImages ?? new()
        };
        return View(bookEditVm);
    }

    [HttpPost]

    public async Task<IActionResult> Edit(Guid id, BookEditVm bookEditVm)
    {
        var book = context.Books
            .Include(b => b.BookTags)
            .Include(b => b.BookImages)
            .FirstOrDefault(b => b.Id == id);

        if (book == null) return NotFound();

        bookEditVm.BookImages = book.BookImages ?? new();

        ViewBag.Authors = context.Authors.ToList();
        ViewBag.Tags = context.Tags.ToList();

        if (!ModelState.IsValid)
        {
            return View(bookEditVm);
        }

        var mainFile = bookEditVm.MainFile;
        var hoverFile = bookEditVm.HoverFile;
        var files = bookEditVm.Files;

        if (mainFile != null)
        {
            var mainFileName = Guid.NewGuid().ToString() + Path.GetExtension(mainFile.FileName);
            var mainFilePath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "image", "products", mainFileName);
            var oldMainFilePath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "image", "products", book.MainImageUrl.TrimStart('/'));
            
            if (!mainFile.ContentType.Contains("image/"))
            {
                ModelState.AddModelError("MainFile", "Main file mus be an image.");
                return View(bookEditVm);
            }
            if (mainFile.Length > 2 * 1024 * 1024)
            {
                ModelState.AddModelError("MainFile", "Main file must be less than 2MB.");
                return View(bookEditVm);
            }
            using (var stream = new FileStream(mainFilePath, FileMode.Create))
            {
                mainFile.CopyTo(stream);
            }
            book.MainImageUrl = "/image/products/" + mainFileName;

            if (System.IO.File.Exists(oldMainFilePath))
            {
                System.IO.File.Delete(oldMainFilePath);
            }
        }

        if (hoverFile != null)
        {
            var hoverFileName = Guid.NewGuid().ToString() + Path.GetExtension(hoverFile.FileName);
            var hoverFilePath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "image", "products", hoverFileName);
            var oldHoverFilePath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "image", "products", book.HoverImageUrl.TrimStart('/'));
            if (!hoverFile.ContentType.Contains("image/"))
            {
                ModelState.AddModelError("HoverFile", "Hover file must be an image.");
                return View(bookEditVm);
            }
            if (hoverFile.Length > 2 * 1024 * 1024)
            {
                ModelState.AddModelError("HoverFile", "Hover file must be less than 2MB.");
                return View(bookEditVm);
            }
            using (var stream = new FileStream(hoverFilePath, FileMode.Create))
            {
                hoverFile.CopyTo(stream);
            }
            book.HoverImageUrl = "/image/products/" + hoverFileName;

            if (System.IO.File.Exists(oldHoverFilePath))
            {
                System.IO.File.Delete(oldHoverFilePath);
            }
        }

        if (files != null)
        {
            foreach (var file in files)
            {
                if (file != null)
                {
                    var fileName = Guid.NewGuid().ToString() + Path.GetExtension(file.FileName);
                    var filePath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "image", "products", fileName);

                    if (!file.ContentType.Contains("image/"))
                    {
                        ModelState.AddModelError("Files", "Files must be images.");
                        return View(bookEditVm);
                    }
                    if (file.Length > 2 * 1024 * 1024)
                    {
                        ModelState.AddModelError("Files", "Files must be less than 2MB.");
                        return View(bookEditVm);
                    }
                    using (var stream = new FileStream(filePath, FileMode.Create))
                    {
                        file.CopyTo(stream);
                    }
                    var bookImage = new BookImage
                    {
                        BookId = book.Id,
                        ImageUrl = "/image/products/" + fileName
                    };
                    context.BookImages.Add(bookImage);
                }
            }
        }

        if (!context.Authors.Any(b => b.Id == bookEditVm.AuthorId) && bookEditVm.AuthorId != book.AuthorId)
        {
            ModelState.AddModelError("AuthorId", "Selected author does not exist.");
            return View(bookEditVm);
        }

        book.Name = bookEditVm.Name;
        book.Description = bookEditVm.Description;
        book.Price = bookEditVm.Price;
        book.AuthorId = bookEditVm.AuthorId;
        book.IsFeatured = bookEditVm.IsFeatured;
        book.IsNew = bookEditVm.IsNew;
        book.InStock = bookEditVm.InStock;
        book.Code = bookEditVm.Code;
        book.DiscountPercent = bookEditVm.DiscountPercent;

        // Update tags
        var existingTagIds = book.BookTags.Select(bt => bt.TagId).ToList();
        var newTagIds = bookEditVm.TagIds;

        // Remove tags that are no longer selected
        foreach (var existingTagId in existingTagIds)
        {
            if (!newTagIds.Contains(existingTagId))
            {
                var tagToRemove = book.BookTags.FirstOrDefault(bt => bt.TagId == existingTagId);
                if (tagToRemove != null)
                {
                    context.Remove(tagToRemove);
                }
            }
        }

        // Add new tags that are selected
        foreach (var newTagId in newTagIds)
        {
            if (!existingTagIds.Contains(newTagId))
            {
                if (!context.Tags.Any(t => t.Id == newTagId))
                {
                    ModelState.AddModelError("TagIds", "One or more selected tags do not exist.");
                    return View(bookEditVm);
                }
                var newBookTag = new BookTag { TagId = newTagId };
                book.BookTags.Add(newBookTag);
            }
        }
        await context.SaveChangesAsync();
        return RedirectToAction("Index");
    }

    [HttpPost]
    [ValidateAntiForgeryToken]
    public async Task<IActionResult> Delete(Guid id)
    {
        var book = await context.Books
            .Include(b => b.BookImages)
            .FirstOrDefaultAsync(b => b.Id == id);

        if (book is null) return NotFound();

        var imageUrls = new List<string> { book.MainImageUrl, book.HoverImageUrl };
        if (book.BookImages != null)
        {
            imageUrls.AddRange(book.BookImages.Select(image => image.ImageUrl));
        }

        // BookImages and BookTags are deleted through the configured cascade relationships.
        context.Books.Remove(book);
        await context.SaveChangesAsync();

        foreach (var imageUrl in imageUrls.Where(url => !string.IsNullOrWhiteSpace(url)).Distinct())
        {
            var isUsedElsewhere = await context.Books.AnyAsync(b => b.MainImageUrl == imageUrl || b.HoverImageUrl == imageUrl)
                || await context.BookImages.AnyAsync(image => image.ImageUrl == imageUrl)
                || await context.Sliders.AnyAsync(slider => slider.ImageUrl == imageUrl);

            var fileName = Path.GetFileName(imageUrl);
            var imagePath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "image", "products", fileName);
            if (!isUsedElsewhere && imageUrl == "/image/products/" + fileName && System.IO.File.Exists(imagePath))
            {
                System.IO.File.Delete(imagePath);
            }
        }

        return RedirectToAction("Index");
    }

    [HttpPost]
    [ValidateAntiForgeryToken]
    public async Task<IActionResult> DeleteImage(Guid id)
    {
        var bookImage = await context.BookImages.FindAsync(id);
        if (bookImage is null) return NotFound();

        var imageUrl = bookImage.ImageUrl;
        var isUsedElsewhere = await context.BookImages.AnyAsync(x => x.Id != id && x.ImageUrl == imageUrl)
            || await context.Books.AnyAsync(x => x.MainImageUrl == imageUrl || x.HoverImageUrl == imageUrl)
            || await context.Sliders.AnyAsync(x => x.ImageUrl == imageUrl);

        context.BookImages.Remove(bookImage);
        await context.SaveChangesAsync();

        var fileName = Path.GetFileName(imageUrl);
        var imagePath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "image", "products", fileName);
        if (!isUsedElsewhere && imageUrl == "/image/products/" + fileName && System.IO.File.Exists(imagePath))
        {
            System.IO.File.Delete(imagePath);
        }

        return RedirectToAction("Edit", new { id = bookImage.BookId });
    }

    [HttpGet]
    public IActionResult Details(Guid id)
    {
        var book = context.Books
            .Include(b => b.Author)
            .Include(b => b.BookImages)
            .Include(b => b.BookTags)
                .ThenInclude(bt => bt.Tag)
            .FirstOrDefault(b => b.Id == id);
        if (book is null) return NotFound();
        return View(book);
    }



}



