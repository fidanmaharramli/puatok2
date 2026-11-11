using System.ComponentModel.DataAnnotations;

namespace PustokMvcApp.ViewModels.UserVms
{
    public class UserLoginVm
    {
        [Required]
        [MinLength(3)]
        public string UserNameorEmail { get; set; } = null!;
        [Required]
        [MinLength(6)]
        [DataType(DataType.Password)]
        public string Password { get; set; } = null!;
        public bool RememberMe { get; set; }
    }
}
