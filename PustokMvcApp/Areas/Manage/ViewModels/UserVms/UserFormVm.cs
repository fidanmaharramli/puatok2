using System.ComponentModel.DataAnnotations;

namespace PustokMvcApp.Areas.Manage.ViewModels.UserVms;

public class UserFormVm
{
    [Required, StringLength(100, MinimumLength = 3)]
    [Display(Name = "Full name")]
    public string FullName { get; set; } = string.Empty;

    [Required, StringLength(256, MinimumLength = 3)]
    [Display(Name = "Username")]
    public string UserName { get; set; } = string.Empty;

    [Required, EmailAddress, StringLength(256)]
    public string Email { get; set; } = string.Empty;
}
