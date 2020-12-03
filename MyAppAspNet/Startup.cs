using Owin;
using Microsoft.Owin;
using System.Web.Helpers;
using System.Security.Claims;

[assembly: OwinStartupAttribute(typeof(MyAppAspNet.Startup))]
namespace MyAppAspNet
{
    public partial class Startup
    {

        public void Configuration(IAppBuilder app)
        {
            AntiForgeryConfig.UniqueClaimTypeIdentifier = ClaimTypes.NameIdentifier;
            ConfigureAuth(app);
        }
    }
}