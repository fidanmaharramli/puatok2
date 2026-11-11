using PustokMvcApp.Models;

namespace PustokMvcApp.Areas.Manage.ViewModels.BookVms
{
    public class BookCreateVm
    {
        public string Name { get; set; } = null!;
        public string Description { get; set; } = null!;
        public int DiscountPercent { get; set; }
        public decimal Price { get; set; }
        public string Code { get; set; } = null!;
        public bool InStock { get; set; }
        public bool IsFeatured { get; set; }
        public bool IsNew { get; set; }
        public IFormFile MainFile { get; set; } = null!;
        public IFormFile HoverFile { get; set; } = null!;
        public List<IFormFile> Files { get; set; } = null!;
        public Guid AuthorId { get; set; }
        public List<Guid> TagIds { get; set; } = new();
    }
}
