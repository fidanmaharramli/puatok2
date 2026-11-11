using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Options;
using PustokMvcApp.Data;
using PustokMvcApp.Settings;
using PustokMvcApp.ViewModels.BasketVms;
using System.Text.Json;
using System.Security.Claims;

namespace PustokMvcApp.Controllers
{
    public class BasketController
        (
        AppDbContext context
        ) : Controller
    {
        // Silmə yalnız POST ilə aparılır; formun təhlükəsizlik token-i serverdə yoxlanılır.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Remove(Guid id)
        {
            if (id == Guid.Empty)
                return BadRequest();

            List<BasketItemVm> basketItems;
            if (User.Identity?.IsAuthenticated == true)
            {
                // İstifadəçi ID-si brauzerdən deyil, login məlumatından alınır.
                var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
                if (string.IsNullOrWhiteSpace(userId))
                    return Unauthorized();

                // Yalnız bu istifadəçinin seçdiyi kitab səbətdən çıxarılır; kitabın özü silinmir.
                var itemsToRemove = await context.BasketItems
                    .Where(x => x.AppUserId == userId && x.BookId == id)
                    .ToListAsync();
                context.BasketItems.RemoveRange(itemsToRemove);
                await context.SaveChangesAsync();

                // Qalan səbət bazadan hazırlanır ki, cookie-də olmayan kitablar da ekranda qalsın.
                basketItems = await context.BasketItems
                    .AsNoTracking()
                    .Where(x => x.AppUserId == userId)
                    .Select(x => new BasketItemVm
                    {
                        BookId = x.BookId,
                        Name = x.Book.Name,
                        Quantity = x.Count,
                        Price = x.Book.DiscountPercent > 0
                            ? x.Book.Price - x.Book.Price * x.Book.DiscountPercent / 100
                            : x.Book.Price,
                        Image = x.Book.MainImageUrl
                    })
                    .ToListAsync();
            }
            else
            {
                // Qonağın səbəti cookie-dən oxunur; baza məlumatları dəyişdirilmir.
                var basketJson = Request.Cookies["basket"];
                try
                {
                    basketItems = string.IsNullOrWhiteSpace(basketJson)
                        ? new List<BasketItemVm>()
                        : JsonSerializer.Deserialize<List<BasketItemVm>>(basketJson) ?? new List<BasketItemVm>();
                }
                catch (JsonException)
                {
                    return BadRequest();
                }

                // Kitabın sayı neçə olursa olsun, həmin kitabın bütün sətri səbətdən çıxarılır.
                basketItems.RemoveAll(x => x.BookId == id);
            }

            // Cookie qalan səbətlə əvəz olunur; boş səbət üçün cookie silinir.
            if (basketItems.Count == 0)
                Response.Cookies.Delete("basket", new CookieOptions { Path = "/" });
            else
                Response.Cookies.Append("basket", JsonSerializer.Serialize(basketItems), new CookieOptions { Path = "/" });

            // Yenilənmiş siyahı, say və ümumi qiymət eyni partial vasitəsilə qaytarılır.
            return PartialView("_BasketPartial", basketItems);
        }

        public IActionResult Add(Guid id)
        {
            var existingProduct = context.Books.FirstOrDefault(x => x.Id == id);
            if (existingProduct == null) return NotFound();
            List<BasketItemVm> BasketItemVms;
            var basketStr = Request.Cookies["basket"];
            if (string.IsNullOrEmpty(basketStr))
            {
                BasketItemVms =new List<BasketItemVm>();
            }
            else
            {
                BasketItemVms = JsonSerializer.Deserialize<List<BasketItemVm>>(basketStr);
            }
            var existingBasketItem = BasketItemVms.FirstOrDefault(x => x.BookId == id);
            if (existingBasketItem != null)
            {
                existingBasketItem.Quantity++;
            }
            else
            {
                BasketItemVms.Add(new BasketItemVm
                {
                    BookId = existingProduct.Id,
                    Name = existingProduct.Name,
                    Quantity = 1,
                    Price = existingProduct.DiscountPercent > 0 ? existingProduct.Price - (existingProduct.Price * existingProduct.DiscountPercent / 100) : existingProduct.Price,
                    Image = existingProduct.MainImageUrl
                });
            }

            if (User.Identity.IsAuthenticated)
            {
                var user = context.Users
                    .Include(x => x.BasketItems)
                    .FirstOrDefault(x => x.UserName == User.Identity.Name);
                var existingBasketItemDb = user.BasketItems.FirstOrDefault(x => x.BookId == id);
                if (existingBasketItemDb is null)
                {
                    context.BasketItems.Add(new Models.BasketItem
                    {
                        BookId = existingProduct.Id,
                        AppUserId = user.Id,
                        Price = existingProduct.DiscountPercent > 0 ? existingProduct.Price - (existingProduct.Price * existingProduct.DiscountPercent / 100) : existingProduct.Price,
                        Count = 1
                    });
                }
                else
                {
                    existingBasketItemDb.Count++;
                }
                context.SaveChanges();
            }

            Response.Cookies.Append("basket", JsonSerializer.Serialize(BasketItemVms));
            return PartialView("_BasketPartial", BasketItemVms);
        }
    }
}
