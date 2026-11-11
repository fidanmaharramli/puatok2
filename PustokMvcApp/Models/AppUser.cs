using Microsoft.AspNetCore.Identity;

namespace PustokMvcApp.Models
{
    public class AppUser : IdentityUser
    {
        public string FullName { get; set; } = null!;
        public string? ConnectionId { get; set; }
        public List<BasketItem>? BasketItems { get; set; } 
    }
}
