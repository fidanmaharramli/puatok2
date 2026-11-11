using System.ComponentModel.DataAnnotations;

namespace PustokMvcApp.Areas.Manage.ViewModels.RoleVms;

public class RoleCreateVm
{
    [Required, StringLength(256)]
    [Display(Name = "Role name")]
    public string Name { get; set; } = string.Empty;
}
