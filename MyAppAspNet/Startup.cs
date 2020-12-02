using Owin;
using Microsoft.Owin;
[assembly: OwinStartupAttribute(typeof(MyAppAspNet.Startup))]
namespace MyAppAspNet
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}