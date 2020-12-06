using Owin;
using Microsoft.Owin;
using System.Web.Helpers;
using System.Security.Claims;
using MyAppAsp.Helper;
using System.Configuration;
using System;

[assembly: OwinStartupAttribute(typeof(MyAppAspNet.Startup))]
namespace MyAppAspNet
{
    public partial class Startup
    {

        public void Configuration(IAppBuilder app)
        {
            string AppPath = ConfigurationManager.AppSettings["DataDirectory"];
            
            string strcon = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=\"E:\\Project\\visual studio\\MyAppAspNet\\MyAppAspNet\\App_Data\\MyAppAsp.mdf\";Integrated Security=True;MultipleActiveResultSets=True;Connect Timeout=30;Application Name=EntityFramework";
            SqlService.SetConnection(strcon);
            AntiForgeryConfig.UniqueClaimTypeIdentifier = ClaimTypes.NameIdentifier;
            ConfigureAuth(app);

        }
    }
}