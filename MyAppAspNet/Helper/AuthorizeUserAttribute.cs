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
            var access = myAppEntities.UserRole.Where(a => a.Users.userid == UserID).Where(a => a.Roles.controller == controllerName).FirstOrDefault();
            httpContext.Items["Access"] = access;

            if (Access == AuthorizeUserType.View || Access == "Details")
                return access.allow_view;
            else if (Access == AuthorizeUserType.Add)
                return access.allow_add;
            else if (Access == AuthorizeUserType.Edit)
                return access.allow_edit;
            else if (Access == AuthorizeUserType.Delete)
                return access.allow_delete;
            else if (Access == AuthorizeUserType.Print)
                return access.allow_print;
            else if (Access == AuthorizeUserType.Custom)
                return access.allow_custom;
            else
                return false;
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