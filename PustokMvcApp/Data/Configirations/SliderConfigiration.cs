using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using PustokMvcApp.Models;

namespace PustokMvcApp.Data.Configurations
{
    public class SliderConfiguration : IEntityTypeConfiguration<Slider>
    {
        public void Configure(EntityTypeBuilder<Slider> builder)
        {
            builder.Property(s => s.Title).IsRequired().HasMaxLength(100);
            builder.Property(s => s.Description).IsRequired().HasMaxLength(500);
            builder.Property(s => s.ButtonText).IsRequired().HasMaxLength(50);
            builder.Property(s => s.ButtonUrl).IsRequired().HasMaxLength(200);
            builder.Property(s => s.ImageUrl).HasMaxLength(200);
            builder.Property(s => s.Order).IsRequired();
        }
    }
}
