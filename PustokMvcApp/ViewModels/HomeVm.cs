using PustokMvcApp.Models;

namespace PustokMvcApp.ViewModels
{
    public class HomeVm
    {
        public List<Slider> Sliders { get; set; } = null!;
        public List<Book> FeaturedBooks { get; set; } = null!;
        public List<Book> NewBooks { get; set; } = null!;
        public List<Book> DiscointedBooks { get; set; } = null!;
        public List<Book> DealBooks { get; set; } = new();
        public List<Book> BestSellerBooks { get; set; } = new();
        public List<Book> ChildrenBooks { get; set; } = new();
        public List<Book> ArtsBooks { get; set; } = new();
    }
}
