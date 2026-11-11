namespace PustokMvcApp.Areas.Manage.ViewModels.SliderVms
{
    public class SliderEditVm
    {
        public string Title { get; set; } = null!;
        public string Description { get; set; } = null!;
        public IFormFile? ImageFile { get; set; }
        public string ButtonText { get; set; } = null!;
        public string ButtonUrl { get; set; } = null!;
        public int Order { get; set; }
        public string? Image { get; set; }
    }
}
