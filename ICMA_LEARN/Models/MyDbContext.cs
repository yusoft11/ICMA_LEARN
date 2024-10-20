using ICMA_LEARN.Common;
using Microsoft.EntityFrameworkCore;

namespace ICMA_LEARN.Models
{
    public partial class MyDbContext : DbContext
    {
        public MyDbContext(DbContextOptions<MyDbContext> options) : base(options)
        {


        }
        public DbSet<Category> Categories { get; set; } = null!;
        public DbSet<Course> Courses { get; set; } = null!;

        public DbSet<UserListSearchDetail> UserListDetails { get; set; } = null!;
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            //OnModelCreating
            modelBuilder.Entity<UserListSearchDetail>().HasNoKey();
        }
    }
}
