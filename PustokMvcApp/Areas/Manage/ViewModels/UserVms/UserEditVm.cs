using System.ComponentModel.DataAnnotations;
using Microsoft.AspNetCore.Mvc.ModelBinding;
using Microsoft.AspNetCore.Mvc.ModelBinding.Validation;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace PustokMvcApp.Areas.Manage.ViewModels.UserVms;

public class UserEditVm : UserFormVm
{
    [Required]
    public string ConcurrencyStamp { get; set; } = string.Empty;

    [StringLength(100, MinimumLength = 6)]
    [DataType(DataType.Password)]
    [Display(Name = "New password")]
    public string? NewPassword { get; set; }

    [Compare(nameof(NewPassword), ErrorMessage = "The passwords do not match.")]
    [DataType(DataType.Password)]
    [Display(Name = "Confirm new password")]
    public string? ConfirmNewPassword { get; set; }

    [Required, MinLength(1, ErrorMessage = "Select at least one role.")]
    [Display(Name = "Roles")]
    public List<string> RoleIds { get; set; } = new();

    [BindNever, ValidateNever]
    public List<SelectListItem> AvailableRoles { get; set; } = new();
}
