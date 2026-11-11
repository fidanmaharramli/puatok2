using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using PustokMvcApp.Models;

namespace PustokMvcApp.Data.Configirations
{
    public class TagConfigiration : IEntityTypeConfiguration<Tag>
    {
        public void Configure(EntityTypeBuilder<Tag> builder)
        {
            builder.Property(t => t.Name).IsRequired().HasMaxLength(50);
        }
    }
}
