using MyAppAspNet.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
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
            string idusr = "Admin";
            var UserRoles = myAppEntities.UserRole.Where(a => a.Users.userid == idusr).Where(a => a.Roles.url != "").ToList();
            foreach (var userrole in UserRoles)
            {
                if (userrole.allow_view == true)
                {
                    routes.MapRoute(
                    name: userrole.id.ToString() + "view",
                    url: (userrole.Roles.url + "").Replace("//", "/"),
                    defaults: new { controller = userrole.Roles.controller, action = "Index", id = UrlParameter.Optional }
                    );
                    routes.MapRoute(
                    name: userrole.id.ToString() + "details",
                    url: (userrole.Roles.url + "/Details/{id}").Replace("//", "/"),
                    defaults: new { controller = userrole.Roles.controller, action = "Details", id = UrlParameter.Optional }
                    );
                }
                if (userrole.allow_add == true)
                {
                    routes.MapRoute(
                    name: userrole.id.ToString() + "add",
                    url: (userrole.Roles.url + "/add").Replace("//", "/"),
                    defaults: new { controller = userrole.Roles.controller, action = "Create", id = UrlParameter.Optional }
                    );
                }
                if (userrole.allow_edit == true)
                {
                    routes.MapRoute(
                    name: userrole.id.ToString() + "edit",
                    url: (userrole.Roles.url + "/edit/{id}").Replace("//", "/"),
                    defaults: new { controller = userrole.Roles.controller, action = "Edit", id = UrlParameter.Optional }
                    );
                }
                if (userrole.allow_delete == true)
                {
                    routes.MapRoute(
                    name: userrole.id.ToString() + "delete",
                    url: (userrole.Roles.url + "/delete/{id}").Replace("//", "/"),
                    defaults: new { controller = userrole.Roles.controller, action = "Delete", id = UrlParameter.Optional }
                    );
                }
                if (userrole.allow_print == true)
                {
                    routes.MapRoute(
                    name: userrole.id.ToString() + "print",
                    url: (userrole.Roles.url + "/print").Replace("//", "/"),
                    defaults: new { controller = userrole.Roles.controller, action = "Print", id = UrlParameter.Optional }
                    );
                }
                if (userrole.allow_custom == true)
                {
                    routes.MapRoute(
                    name: userrole.id.ToString() + "custom",
                    url: (userrole.Roles.url + "/custom").Replace("//","/"),
                    defaults: new { controller = userrole.Roles.controller, action = "Custom", id = UrlParameter.Optional }
                    );
                }

            }
        }
    }
}
