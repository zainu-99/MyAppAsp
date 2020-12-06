using MyAppAspNet.Helper;
using MyAppAspNet.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Web;
using System.Web.Mvc;

namespace MyAppAspNet.Controllers
{
    [AuthorizeUser]
    public class UserController : Controller
    {
        public ActionResult Index()
        {
            MyAppEntities myAppEntities = new MyAppEntities();
            var model = myAppEntities.Users.ToList();
            return View("~/Views/appdashboard/adminsystem/User/Index.cshtml", model);
        }
        public ActionResult Details(int id)
        {
            MyAppEntities myAppEntities = new MyAppEntities();
            var model = myAppEntities.Users.Where(a => a.id == id).FirstOrDefault();
            return View("~/Views/appdashboard/adminsystem/User/Details.cshtml", model);
        }
        public ActionResult Create()
        {
            return View("~/Views/appdashboard/adminsystem/User/Add.cshtml");
        }
        [HttpPost]
        public ActionResult Create(Users collection)
        {
            try
            {
                TryUpdateModel(collection);
                using (var myAppEntities = new MyAppEntities())
                {
                    myAppEntities.Users.Add(collection);
                    myAppEntities.SaveChanges();
                }
                return RedirectToAction("Index");
            }
            catch
            {
                return View("~/Views/appdashboard/adminsystem/User/Add.cshtml");
            }
        }
        public ActionResult Edit(int id)
        {
            MyAppEntities myAppEntities = new MyAppEntities();
            var model = myAppEntities.Users.Where(a => a.id == id).FirstOrDefault();
            return View("~/Views/appdashboard/adminsystem/User/Edit.cshtml", model);
        }
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                TryUpdateModel(collection);
                using (var myAppEntities = new MyAppEntities())
                {
                    var m = myAppEntities.Users.Where(a => a.id == id).FirstOrDefault();
                    TryUpdateModel(m);
                    myAppEntities.SaveChanges();
                }
                return RedirectToAction("Index");
            }
            catch
            {
                MyAppEntities myAppEntities = new MyAppEntities();
                var model = myAppEntities.Users.Where(a => a.id == id).FirstOrDefault();
                return View("~/Views/appdashboard/adminsystem/User/Edit.cshtml", model);
            }
        }
        public ActionResult Delete(int id)
        {
            MyAppEntities myAppEntities = new MyAppEntities();
            var model = myAppEntities.Users.Where(a => a.id == id).FirstOrDefault();
            return View("~/Views/appdashboard/adminsystem/User/Delete.cshtml", model);
        }

        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                TryUpdateModel(collection);
                using (var myAppEntities = new MyAppEntities())
                {
                    var m = myAppEntities.Users.Remove(myAppEntities.Users.FirstOrDefault(a => a.id == id));
                    TryUpdateModel(m);
                    myAppEntities.SaveChanges();
                }
                return RedirectToAction("Index");
            }
            catch
            {
                MyAppEntities myAppEntities = new MyAppEntities();
                var model = myAppEntities.Users.Where(a => a.id == id).FirstOrDefault();
                return View("~/Views/appdashboard/adminsystem/User/Delete.cshtml", model);
            }
        }
    }
}
