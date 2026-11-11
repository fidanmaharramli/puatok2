namespace PustokMvcApp.Settings
{
    public class EmailSetting
    {
        public string From { get; set; } = null!;
        public string SmtpHost { get; set; } = null!;
        public string Password { get; set; } = null!;
        public string Username { get; set; } = null!;
        public int SmtpPort { get; set; }
    }
}
