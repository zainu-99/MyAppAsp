using MyAppAspNet.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Security.Claims;
namespace MyAppAspNet.Controllers
{
    [Authorize]
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            ViewBag.Message = "Dashboard";
            MyAppEntities myAppEntities = new MyAppEntities();
            var menu = myAppEntities.MenuApp.Where(a => a.IDParentMenu == null).OrderBy(a => a.OrderSort).ToList();
            Session["Menu"] = menu;
            return View("~/Views/appdashboard/Index.cshtml");
        }
    }
}