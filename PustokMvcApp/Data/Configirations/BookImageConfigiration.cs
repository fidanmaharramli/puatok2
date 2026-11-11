using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using PustokMvcApp.Models;

namespace PustokMvcApp.Data.Configirations
{
    public class BookImageConfigiration : IEntityTypeConfiguration<BookImage>
    {
        public void Configure(EntityTypeBuilder<BookImage> builder)
        {
            builder.Property(bi => bi.ImageUrl).IsRequired().HasMaxLength(200);
           
        }
    }
}
