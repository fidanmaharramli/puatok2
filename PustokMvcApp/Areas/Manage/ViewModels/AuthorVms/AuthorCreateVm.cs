using System.ComponentModel.DataAnnotations;

namespace PustokMvcApp.Areas.Manage.ViewModels.AuthorVms
{
    public class AuthorCreateVm
    {
        [Required(ErrorMessage = "Full name is required")]
        [MaxLength(20, ErrorMessage = "Full name cannot exceed 20 characters")]
        public string FullName { get; set; } = null!;
    }
}
