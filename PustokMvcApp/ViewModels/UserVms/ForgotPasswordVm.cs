using System.ComponentModel.DataAnnotations;

namespace PustokMvcApp.ViewModels.UserVms
{
    public class ForgotPasswordVm
    {
        [Required(ErrorMessage = "Email is required")]
        [EmailAddress(ErrorMessage = "Invalid email address")]
        public string Email { get; set; } = null!;
    }
}
