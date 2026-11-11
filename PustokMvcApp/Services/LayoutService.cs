using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using PustokMvcApp.Data;
using PustokMvcApp.Models;
using PustokMvcApp.ViewModels.BasketVms;
using System.Text.Json;
using System.Text.Json.Serialization;

namespace PustokMvcApp.Services;

public class LayoutService(
    IHttpContextAccessor httpContextAccessor,
    UserManager<AppUser> userManager,
    AppDbContext dbContext
    )
{
    public async Task<AppUser?> GetUser()
    {
        if (httpContextAccessor.HttpContext.User.Identity.IsAuthenticated)
        {
            var user = await userManager.FindByNameAsync(httpContextAccessor.HttpContext.User.Identity.Name);
            return user;
        }
        return null;
    }



    internal async Task<Dictionary<string, string>> GetSettings()
    {
        var settings = dbContext.Settings.ToDictionary(x => x.Key, x => x.Value);
        return settings;
    }


    internal async Task<List<BasketItemVm>> GetBasketItems()
    {
        var httpContext = httpContextAccessor.HttpContext;
        var basketStr = httpContext.Request.Cookies["basket"];
        List<BasketItemVm> basketItemVms = new();
        if (basketStr is not null)
        {
            basketItemVms = JsonSerializer.Deserialize<List<BasketItemVm>>(basketStr);
        }
        if (httpContext.User.Identity.IsAuthenticated)
        {
            var user = await dbContext.Users
                  .Include(x => x.BasketItems)
                  .ThenInclude(x => x.Book)
                  .FirstOrDefaultAsync(x => x.UserName == httpContext.User.Identity.Name);
            foreach (var basketItem in user.BasketItems)
            {
                var existBasketItemVm = basketItemVms.FirstOrDefault(x => x.BookId == basketItem.BookId);
                if (existBasketItemVm is not null)
                {
                    existBasketItemVm.Quantity = basketItem.Count;
                    existBasketItemVm.Price = basketItem.Book.Price-(basketItem.Book.Price*basketItem.Book.DiscountPercent/100);
                    existBasketItemVm.Name = basketItem.Book.Name;
                    existBasketItemVm.Image = basketItem.Book.MainImageUrl  ;
                }
                else
                {
                    basketItemVms.Add(new BasketItemVm
                    {
                        BookId = basketItem.BookId,
                        Name = basketItem.Book.Name,
                        Image = basketItem.Book.MainImageUrl  ,
                        Price = basketItem.Price,
                        Quantity = basketItem.Count

                    });
                    await dbContext.SaveChangesAsync();
                }

            }
        }
        return basketItemVms;

    }
}
