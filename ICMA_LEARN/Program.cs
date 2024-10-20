using ICMA_LEARN.Common;
using ICMA_LEARN.Models;
using Microsoft.EntityFrameworkCore;
using Serilog;

namespace ICMA_LEARN
{
    public class Program
    {
        public static void Main(string[] args)
        {
            var builder = WebApplication.CreateBuilder(args);

            // Add services to the container.
            builder.Services.AddControllersWithViews();
            builder.Services.AddTransient<IUserSearchHelper, UserSearchHelper>();
            //This section below is for connectionstring 
            var connectionString = builder.Configuration.GetConnectionString("MainConnectionStringSQL");
            builder.Services.AddDbContext<MyDbContext>(options => options.UseSqlServer(connectionString));
            var appSettings = builder.Configuration.GetSection("AppSettings").Get<AppSettings>();
            var logPath = $@"{appSettings.LogFolder}\ICMA_LEARN-.txt";
            Log.Logger = new LoggerConfiguration()
                 .Enrich.FromLogContext()
                 .MinimumLevel.Debug()
                 .MinimumLevel.Override("Microsoft.EntityFrameworkCore.Database.Command", Serilog.Events.LogEventLevel.Error)
                 .MinimumLevel.Override("Microsoft.EntityFrameworkCore.SqlServer", Serilog.Events.LogEventLevel.Error)
                 .MinimumLevel.Override("Microsoft", Serilog.Events.LogEventLevel.Error)
                 .MinimumLevel.Override("ICMA_LEARN.Models.Models.MyDbContext", Serilog.Events.LogEventLevel.Error)
                 .WriteTo.File(logPath, fileSizeLimitBytes: 15_000_000, rollOnFileSizeLimit: true, shared: true, rollingInterval: RollingInterval.Day, flushToDiskInterval: TimeSpan.FromSeconds(1))
                 .CreateLogger();
            builder.Host.UseSerilog();

            var app = builder.Build();

            // Configure the HTTP request pipeline.
            if (!app.Environment.IsDevelopment())
            {
                app.UseExceptionHandler("/Home/Error");
                // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
                app.UseHsts();
            }

            app.UseHttpsRedirection();
            app.UseStaticFiles();

            app.UseRouting();

            app.UseAuthorization();

            app.MapControllerRoute(
                name: "default",
                pattern: "{controller=Home}/{action=Index}/{id?}");

            app.Run();

        }

    }
}


