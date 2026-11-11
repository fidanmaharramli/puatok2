using Microsoft.AspNetCore.Identity;

namespace PustokMvcApp
{
    public class CustomIdentityErrorDescriber : IdentityErrorDescriber
    {
        public override IdentityError PasswordRequiresNonAlphanumeric()
        {
            return new IdentityError
            {
                Code = nameof(PasswordRequiresNonAlphanumeric),
                Description = "Şifrə ən azı 1 simvol olmalıdır"
            };
        }
    }
}
