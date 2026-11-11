namespace PustokMvcApp.Areas.Manage.ViewModels.UserVms;

public class UserDetailsVm
{
    public string Id { get; set; } = string.Empty;
    public string FullName { get; set; } = string.Empty;
    public string UserName { get; set; } = string.Empty;
    public string Email { get; set; } = string.Empty;
    public IList<string> Roles { get; set; } = new List<string>();
    public bool EmailConfirmed { get; set; }
    public bool IsLockedOut { get; set; }
    public DateTimeOffset? LockoutEnd { get; set; }
    public bool IsAdmin => Roles.Contains("Admin");
}
