using Microsoft.AspNet.Identity;
using Microsoft.Owin.Security;
using MyAppAspNet.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Web;
using System.Web.Mvc;

namespace MyAppAspNet.Controllers
{
    public class AuthorizeController : Controller
    {
        // GET: Login
        public ActionResult Login(Users user)
        {
            if(AuthenticationManager.User.Identity.IsAuthenticated) return RedirectToAction("Index", "Home");
            if (user.userid == null) return View();
            MyAppEntities myAppEntities = new MyAppEntities();
            var usr = myAppEntities.Users.Where(a => a.userid == user.userid).Where(a => a.password_noencrypt == user.password).FirstOrDefault();
            if (usr != null)
            {
                var claims = new List<Claim>();
                claims.Add(new Claim(ClaimTypes.NameIdentifier, usr.userid));
                claims.Add(new Claim(ClaimTypes.Name, usr.name));
                claims.Add(new Claim(ClaimTypes.Email, usr.email));
                claims.Add(new Claim("userState", user.ToString()));
                var identity = new ClaimsIdentity(claims, DefaultAuthenticationTypes.ApplicationCookie);
                AuthenticationManager.SignIn(new AuthenticationProperties()
                {
                    AllowRefresh = true,
                    IsPersistent = false,
                    ExpiresUtc = DateTime.UtcNow.AddDays(7)
                }, identity);
                return RedirectToAction("Index", "Home");
            }
            else
            {
                TempData["Message"] = "Login Failed, Please Check Email Or Password!";
                return View();
            }
        }
        private IAuthenticationManager AuthenticationManager
        {
            get { return HttpContext.GetOwinContext().Authentication; }
        }
        public ActionResult Logout()
        {
            AuthenticationManager.SignOut(DefaultAuthenticationTypes.ApplicationCookie,
                                    DefaultAuthenticationTypes.ExternalCookie);
            return RedirectToAction("Login", "Authorize");
        }
    }
}