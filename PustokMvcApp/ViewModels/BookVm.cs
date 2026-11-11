using PustokMvcApp.Models;

namespace PustokMvcApp.ViewModels
{
    public class BookVm
    {
        public Book Book { get; set; } = null!;
        public List<string> ImageUrls { get; set; } = new();
        public List<Book> RelatedBooks { get; set; } = new();
    }
}
