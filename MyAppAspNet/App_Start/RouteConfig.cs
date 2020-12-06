using MyAppAspNet.Models;
using System.Linq;
using System.Web.Mvc;
using System.Web.Routing;

namespace MyAppAspNet
{
    public class RouteConfig 
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");
            routes.MapRoute(
                name: "Default",
                url: "",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional }
            );
            routes.MapRoute(
               name: "Logout",
               url: "Authorize/Logout",
               defaults: new { controller = "Authorize", action = "Logout", id = UrlParameter.Optional }
           );
            routes.MapRoute(
               name: "Login",
               url: "Authorize/Login",
               defaults: new { controller = "Authorize", action = "Login", id = UrlParameter.Optional}
           );
            
            var myAppEntities = new MyAppEntities();
            var UserRoles = myAppEntities.Roles.Where(a => a.url != "").ToList();
            foreach (var userrole in UserRoles)
            {
                if (userrole.AccessView == true)
                {
                    routes.MapRoute(
                    name: userrole.id.ToString() + "view",
                    url: (userrole.url + "").Replace("//", "/"),
                    defaults: new { controller = userrole.controller, action = "Index", id = UrlParameter.Optional }
                    );
                    routes.MapRoute(
                    name: userrole.id.ToString() + "details",
                    url: (userrole.url + "/Details/{id}").Replace("//", "/"),
                    defaults: new { controller = userrole.controller, action = "Details", id = UrlParameter.Optional }
                    );
                }
                if (userrole.AccessAdd == true)
                {
                    routes.MapRoute(
                    name: userrole.id.ToString() + "add",
                    url: (userrole.url + "/add").Replace("//", "/"),
                    defaults: new { controller = userrole.controller, action = "Create", id = UrlParameter.Optional }
                    );
                }
                if (userrole.AccessEdit == true)
                {
                    routes.MapRoute(
                    name: userrole.id.ToString() + "edit",
                    url: (userrole.url + "/edit/{id}").Replace("//", "/"),
                    defaults: new { controller = userrole.controller, action = "Edit", id = UrlParameter.Optional }
                    );
                }
                if (userrole.AccessDelete == true)
                {
                    routes.MapRoute(
                    name: userrole.id.ToString() + "delete",
                    url: (userrole.url + "/delete/{id}").Replace("//", "/"),
                    defaults: new { controller = userrole.controller, action = "Delete", id = UrlParameter.Optional }
                    );
                }
                if (userrole.AccessPrint == true)
                {
                    routes.MapRoute(
                    name: userrole.id.ToString() + "print",
                    url: (userrole.url + "/print").Replace("//", "/"),
                    defaults: new { controller = userrole.controller, action = "Print", id = UrlParameter.Optional }
                    );
                }
                if (userrole.AccessCustom == true)
                {
                    routes.MapRoute(
                    name: userrole.id.ToString() + "custom",
                    url: (userrole.url + "/custom").Replace("//","/"),
                    defaults: new { controller = userrole.controller, action = "Custom", id = UrlParameter.Optional }
                    );
                }

            }
        }
    }
}
