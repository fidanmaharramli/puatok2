using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using PustokMvcApp.Models;

namespace PustokMvcApp.Data.Configirations
{
    public class BookConfigiration : IEntityTypeConfiguration<Book>
    {
        public void Configure(EntityTypeBuilder<Book> builder)
        {
            builder.HasMany(b => b.BookImages)
                .WithOne(bt => bt.Book)
                .HasForeignKey(bt => bt.BookId)
                .OnDelete(DeleteBehavior.Cascade);


            builder.Property(b => b.Name).IsRequired().HasMaxLength(100);
            builder.Property(b => b.Description).IsRequired().HasMaxLength(500);
            builder.Property(b => b.Price).HasPrecision(18, 2);

        }
    }
}
