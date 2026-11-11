using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.SignalR;
using Microsoft.AspNetCore.Authorization;
using PustokMvcApp.Models;

namespace PustokMvcApp.Hubs
{
    
    [Authorize]
    public class ChatHub(UserManager<AppUser> userManager) : Hub
    {
        // Brauzerdən yalnız mesaj gəlir; göndərənin adı login hesabından götürülür.
        public async Task SendMessage(string message)
        {
            var userName = Context.User?.Identity?.Name;
            if (string.IsNullOrWhiteSpace(userName))
            {
                throw new HubException("Göndərən istifadəçi müəyyən edilmədi.");
            }

            await Clients.All.SendAsync("ReceiveMessage", userName, message);
        }

        // Yazma vəziyyəti bazaya yazılmır; ad login hesabından, ID isə bağlantıdan alınır.
        public async Task Typing(bool isTyping)
        {
            var userName = Context.User?.Identity?.Name;
            if (string.IsNullOrWhiteSpace(userName))
                return;

            // Bildiriş yazan şəxsin bu bağlantısından başqa bütün bağlantılara göndərilir.
            await Clients.Others.SendAsync("UserTyping", Context.ConnectionId, userName, isTyping);
        }

       public override async Task OnConnectedAsync()
        {
            var userName = Context.User?.Identity?.Name;
            if (userName is not null && !string.IsNullOrWhiteSpace(userName))
            {
                var user = await userManager.FindByNameAsync(userName);

                if (user is not null)
                {
                    user.ConnectionId = Context.ConnectionId;
                    await userManager.UpdateAsync(user);
                    await Clients.All.SendAsync("UserConnected", user.Id);
                }
            }
            await base.OnConnectedAsync();
        }

        public override async Task OnDisconnectedAsync(Exception? exception)
        {
            // Bağlanan tabın yazma bildirişi digər istifadəçilərin ekranından silinir.
            await Clients.Others.SendAsync("UserTyping", Context.ConnectionId, Context.User?.Identity?.Name, false);
            var userName = Context.User?.Identity?.Name;
            if (!string.IsNullOrWhiteSpace(userName))
            {
                var user = await userManager.FindByNameAsync(userName);

                if (user is not null && user.ConnectionId == Context.ConnectionId)
                {
                    user.ConnectionId = null;
                    await userManager.UpdateAsync(user);
                    await Clients.All.SendAsync("UserDisconnected", user.Id);
                }
            }
            await base.OnDisconnectedAsync(exception);
        }
    }
   
}
