using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MyAppAspNet.Models;
using MyAppAspNet.Helper;
using System.Security.Claims;

namespace MyAppAspNet
{
    public class AuthorizeUserAttribute: AuthorizeAttribute
    {
        public string Access { set; get; }
        protected override bool AuthorizeCore(HttpContextBase httpContext)
        {
            var isAuthorized = base.AuthorizeCore(httpContext);
            if (!isAuthorized) return false;
            var myAppEntities = new MyAppEntities();
            var userRoles = new UserRole();
            var rd = httpContext.Request.RequestContext.RouteData;
            if(Access == null) Access = rd.GetRequiredString("action");
            string controllerName = rd.GetRequiredString("controller");
            var UserID = MyAppHelper.GetUserIdentityValue(httpContext.User, ClaimTypes.NameIdentifier);
            if (Access == AuthorizeUserType.View || Access == "Details")
                userRoles = myAppEntities.UserRole.Where(a => a.allow_view == true).Where(a => a.Users.userid == UserID).Where(a => a.Roles.controller == controllerName).FirstOrDefault();
            else if (Access == AuthorizeUserType.Add)
                userRoles = myAppEntities.UserRole.Where(a => a.allow_view == true).Where(a => a.Users.userid == UserID).Where(a => a.Roles.controller == controllerName).FirstOrDefault();
            else if (Access == AuthorizeUserType.Edit)
                userRoles = myAppEntities.UserRole.Where(a => a.allow_view == true).Where(a => a.Users.userid == UserID).Where(a => a.Roles.controller == controllerName).FirstOrDefault();
            else if (Access == AuthorizeUserType.Delete)
                userRoles = myAppEntities.UserRole.Where(a => a.allow_view == true).Where(a => a.Users.userid == UserID).Where(a => a.Roles.controller == controllerName).FirstOrDefault();
            else if (Access == AuthorizeUserType.Print)
                userRoles = myAppEntities.UserRole.Where(a => a.allow_view == true).Where(a => a.Users.userid == UserID).Where(a => a.Roles.controller == controllerName).FirstOrDefault();
            else if (Access == AuthorizeUserType.Custom)
                userRoles = myAppEntities.UserRole.Where(a => a.allow_view == true).Where(a => a.Users.userid == UserID).Where(a => a.Roles.controller == controllerName).FirstOrDefault();
            else
                return false;

            return (userRoles != null);
        }
    }
    public class AuthorizeUserType
    {
        public const  string View = "Index";
        public const string Add = "Create";
        public const string Edit = "Edit";
        public const string Delete = "Delete";
        public const string Print = "Print";
        public const string Custom = "Custom";
    }
}