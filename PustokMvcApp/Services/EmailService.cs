using MailKit.Net.Smtp;
using MailKit.Security;
using Microsoft.Extensions.Options;
using MimeKit;
using MimeKit.Text;
using PustokMvcApp.Settings;

namespace PustokMvcApp.Services
{
    public class EmailService(IOptions<EmailSetting> emailSetting) : IEmailService

    {
        //public void Send()
        //{
        //    var to = emailSetting.Value.To;
        //    var from = emailSetting.Value.From;
        //    var subject = emailSetting.Value.Subject;
        //    var body = emailSetting.Value.Body;
        //    var password = emailSetting.Value.Password;
        //    var port = emailSetting.Value.Port;

        //    Console.WriteLine("Email sent successfully.");
        //}

        public async Task SendEmailAsync(string to, string subject, string body, bool isHtml = true)
        {
            // create email message
            
            var email = new MimeMessage();
            email.From.Add(MailboxAddress.Parse(emailSetting.Value.From));
            email.To.Add(MailboxAddress.Parse(to));
            email.Subject = subject;
            if (isHtml)
                email.Body = new TextPart(TextFormat.Html) { Text = body };
            else
                email.Body = new TextPart(TextFormat.Text) { Text = body };

            // send email
            using var smtp = new SmtpClient();
            await smtp.ConnectAsync(emailSetting.Value.SmtpHost, emailSetting.Value.SmtpPort, SecureSocketOptions.StartTls);
            await smtp.AuthenticateAsync(emailSetting.Value.Username, emailSetting.Value.Password);
            await smtp.SendAsync(email);
            await smtp.DisconnectAsync(true);
        }
    }
}
