using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(DoctorBooking.Startup))]
namespace DoctorBooking
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
