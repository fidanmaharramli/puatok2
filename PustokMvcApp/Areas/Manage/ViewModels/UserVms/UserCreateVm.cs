using System.ComponentModel.DataAnnotations;

namespace PustokMvcApp.Areas.Manage.ViewModels.UserVms;

public class UserCreateVm : UserFormVm
{
    [Required, StringLength(100, MinimumLength = 6)]
    [DataType(DataType.Password)]
    public string Password { get; set; } = string.Empty;

    [Required, Compare(nameof(Password))]
    [DataType(DataType.Password)]
    [Display(Name = "Confirm password")]
    public string ConfirmPassword { get; set; } = string.Empty;
}
