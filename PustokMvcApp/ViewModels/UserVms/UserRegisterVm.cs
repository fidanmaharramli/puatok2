using System.ComponentModel.DataAnnotations;

namespace PustokMvcApp.ViewModels.UserVms
{
    public class UserRegisterVm
    {
        [Required]
        [MinLength(3)]
        public string UserName { get; set; } = null!;
        [Required]
        [MinLength(3)]
        public string FullName { get; set; } = null!;
        [Required]
        [EmailAddress]
        public string Email { get; set; } = null!;
        [Required]
        [MinLength(6)]
        [DataType(DataType.Password)]
        public string Password { get; set; } = null!;
        [Required]
        [Compare("Password")]
        [DataType(DataType.Password)]
        public string ConfirmPasword { get; set; } = null!;
    }
}
