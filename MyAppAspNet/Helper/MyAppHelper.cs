using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Principal;
using System.Web;

namespace MyAppAspNet.Helper
{
    public class MyAppHelper
    {
        public static string GetUserIdentityValue(IPrincipal user,string type)
        {
            var claimsIdentity = user.Identity as System.Security.Claims.ClaimsIdentity;
            var idusr = claimsIdentity.FindFirst(type).Value;
            return idusr;
        }
    }
}