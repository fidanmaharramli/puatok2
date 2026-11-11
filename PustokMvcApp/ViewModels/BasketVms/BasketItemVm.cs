namespace PustokMvcApp.ViewModels.BasketVms;

public class BasketItemVm
{
    public Guid BookId { get; set; }
    public string Name { get; set; } = null!;
    public int Quantity { get; set; }
    public decimal Price { get; set; }
    public string Image { get; set; } = null!;
}
