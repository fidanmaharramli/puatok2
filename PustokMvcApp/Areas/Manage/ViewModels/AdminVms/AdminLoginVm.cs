using System.ComponentModel.DataAnnotations;

namespace PustokMvcApp.Areas.Manage.ViewModels.AdminVms
{
    public class AdminLoginVm
    {
        [Required]
        [MinLength(3)]
        public string UserName { get; set; } = null!;
        [Required]
        [MinLength(6)]
        [DataType(DataType.Password)]
        public string Password { get; set; } = null!;
    }
}
