namespace PustokMvcApp.Areas.Manage.Views.Slider
{
    public class SliderCreateVm
    {
        public string Title { get; set; } = null!;
        public string Description { get; set; } = null!;
        public IFormFile? ImageFile { get; set; }
        public string ButtonText { get; set; } = null!;
        public string ButtonUrl { get; set; } = null!;
        public int Order { get; set; }
    }
}
