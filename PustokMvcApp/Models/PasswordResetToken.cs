using PustokMvcApp.Models.Common;
using System.ComponentModel.DataAnnotations;

namespace PustokMvcApp.Models
{
    public class PasswordResetToken 
    {
        [Key]
        public string UserEmail { get; set; }
        public string Key { get; set; }
        public DateTime ExpireDate { get; set; }
    }
}
