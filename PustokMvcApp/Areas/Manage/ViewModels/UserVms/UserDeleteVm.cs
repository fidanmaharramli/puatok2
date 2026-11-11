using System.ComponentModel.DataAnnotations;

namespace PustokMvcApp.Areas.Manage.ViewModels.UserVms;

public class UserDeleteVm
{
    [Required]
    public string Id { get; set; } = string.Empty;
}
