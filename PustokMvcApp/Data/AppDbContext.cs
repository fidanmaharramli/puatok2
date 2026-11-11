using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using PustokMvcApp.Models;

namespace PustokMvcApp.Data
{
    public class AppDbContext(DbContextOptions<AppDbContext> options) : IdentityDbContext<AppUser>(options)
    {
        public DbSet<Author> Authors { get; set; }
        public DbSet<Book> Books { get; set; }
        public DbSet<BookImage> BookImages { get; set; }
        public DbSet<BookTag> BookTags { get; set; }
        public DbSet<Tag> Tags { get; set; }
        public DbSet<Slider> Sliders { get; set; }
        public DbSet<Setting> Settings { get; set; }
        public DbSet<BasketItem> BasketItems { get; set; }
        public DbSet<PasswordResetToken> PasswordResetTokens { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.ApplyConfigurationsFromAssembly(typeof(AppDbContext).Assembly);
            base.OnModelCreating(modelBuilder);
        }
    }
}
