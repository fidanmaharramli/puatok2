using PustokMvcApp.Models.Common;

namespace PustokMvcApp.Models
{
    public class Book : BaseEntity
    {
        public string Name { get; set; } = null!;
        public string Description { get; set; } = null!;
        public int DiscountPercent { get; set; }
        public decimal Price { get; set; }
        public string Code { get; set; } = null!;
        public bool InStock { get; set; }
        public bool IsFeatured { get; set; }
        public bool IsNew { get; set; }
        public string MainImageUrl { get; set; } = null!;
        public string HoverImageUrl { get; set; } = null!;
        public Guid AuthorId { get; set; }
        public Author? Author { get; set; }
        public List<BookTag> BookTags { get; set; } = new();
        public List<BookImage>? BookImages { get; set; } = new ();

       

    }
}
