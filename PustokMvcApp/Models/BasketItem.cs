using PustokMvcApp.Models.Common;

namespace PustokMvcApp.Models;

public class BasketItem : BaseEntity
{
    public decimal Price { get; set; }
    public int Count { get; set; }
    public Guid BookId { get; set; }
    public Book Book { get; set; } = null!;
    public string AppUserId { get; set; } = null!;
    public AppUser AppUser { get; set; } = null!;
}
