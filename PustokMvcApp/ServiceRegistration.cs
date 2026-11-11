using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using PustokMvcApp.Data;
using PustokMvcApp.Models;
using PustokMvcApp.Services;
using PustokMvcApp.Settings;

namespace PustokMvcApp
{
    public static class ServiceRegistration
    {
        public static void AddServices(this IServiceCollection services, IConfiguration config)
        {
            services.AddControllersWithViews();
            services.AddScoped<IEmailService, EmailService>();
            services.Configure<EmailSetting>(config.GetSection("EmailSettings"));

            services.AddDbContext<AppDbContext>(options =>
            {
                options.UseSqlServer(config.GetConnectionString("DefaultConnection"));
            });

            // userManager, signInManager, roleManager
            services.AddIdentity<AppUser, IdentityRole>(options =>
            {
                options.Password.RequiredLength = 6;
                options.Password.RequireNonAlphanumeric = true;
                options.Password.RequireUppercase = true;
                options.Password.RequireLowercase = true;
                options.Password.RequireDigit = true;
                options.User.RequireUniqueEmail = true;
                options.SignIn.RequireConfirmedEmail = true;

                options.Lockout.MaxFailedAccessAttempts = 3;
                options.Lockout.DefaultLockoutTimeSpan = TimeSpan.FromMinutes(2);
                options.Lockout.AllowedForNewUsers = true;

                // options.SignIn.RequireConfirmedEmail = true;


            })
                .AddEntityFrameworkStores<AppDbContext>()
                .AddDefaultTokenProviders()
                .AddErrorDescriber<CustomIdentityErrorDescriber>();
            // Apply password/role changes to existing sessions on their next request.
            services.Configure<SecurityStampValidatorOptions>(options =>
                options.ValidationInterval = TimeSpan.Zero);
            services.AddHttpContextAccessor();
            services.AddScoped<LayoutService>();

            services.ConfigureApplicationCookie(options =>
            {
                options.LoginPath = "/Account/Login";

                options.Events.OnRedirectToLogin = context =>
                {
                    var path = context.Request.Path;

                    string loginPath = path.StartsWithSegments("/Manage")
                        ? "/Manage/AdminAccount/Login"
                        : "/Account/Login";

                    string returnUrl =
                        context.Request.Path + context.Request.QueryString;

                    string redirectUrl =
                        $"{loginPath}?ReturnUrl={Uri.EscapeDataString(returnUrl)}";

                    context.Response.Redirect(redirectUrl);

                    return Task.CompletedTask;
                };

                options.Events.OnRedirectToAccessDenied = context =>
                {
                    if (context.Request.Path.StartsWithSegments("/Manage"))
                    {
                        string returnUrl = context.Request.PathBase
                            + context.Request.Path + context.Request.QueryString;
                        string loginPath = context.Request.PathBase + "/Manage/AdminAccount/Login";

                        context.Response.Redirect(
                            $"{loginPath}?ReturnUrl={Uri.EscapeDataString(returnUrl)}");
                    }
                    else
                    {
                        context.Response.StatusCode = StatusCodes.Status403Forbidden;
                    }

                    return Task.CompletedTask;
                };
            });
            services.AddSignalR();

        }
    }
}
