using Microsoft.EntityFrameworkCore;
using PustokMvcApp.Models;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace PustokMvcApp.Data.Configiration
{
    public class AuthorConfigiration : IEntityTypeConfiguration<Author>
    {
        public void Configure(EntityTypeBuilder<Author> builder)
        {
            builder.Property(a => a.FullName).IsRequired().HasMaxLength(50);
        }
    }
}
