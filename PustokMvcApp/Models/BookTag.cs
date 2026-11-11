using PustokMvcApp.Models.Common;

namespace PustokMvcApp.Models
{
    public class BookTag : BaseEntity
    {
        public Guid BookId { get; set; }
        public Book Book { get; set; } = null!;
        public Guid TagId { get; set; }
        public Tag Tag { get; set; } = null!;
    }
}
