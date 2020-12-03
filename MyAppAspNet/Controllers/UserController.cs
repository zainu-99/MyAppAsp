using MyAppAspNet.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MyAppAspNet.Controllers
{
    public class UserController : Controller
    {
        // GET: User
        public ActionResult Index()
        {
            MyAppEntities myAppEntities = new MyAppEntities();
            var model = myAppEntities.Users.ToList();
            return View("~/Views/appdashboard/adminsystem/User/Index.cshtml", model);
        }

        // GET: User/Details/5
        public ActionResult Details(int id)
        {
            MyAppEntities myAppEntities = new MyAppEntities();
            var model = myAppEntities.Users.Where(a => a.id == id).FirstOrDefault();
            return View("~/Views/appdashboard/adminsystem/User/Detail.cshtml", model);
        }

        // GET: User/Create
        public ActionResult Create()
        {
            return View("~/Views/appdashboard/adminsystem/User/Add.cshtml");
        }

        // POST: User/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                return RedirectToAction("Index","User");
            }
            catch
            {
                return View("~/Views/appdashboard/adminsystem/User/Add.cshtml");
            }
        }

        // GET: User/Edit/5
        public ActionResult Edit(int id)
        {
            MyAppEntities myAppEntities = new MyAppEntities();
            var model = myAppEntities.Users.Where(a => a.id == id).FirstOrDefault();
            return View("~/Views/appdashboard/adminsystem/User/Edit.cshtml", model);
        }

        // POST: User/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

                return RedirectToAction("Index", "User");
            }
            catch
            {
                MyAppEntities myAppEntities = new MyAppEntities();
                var model = myAppEntities.Users.Where(a => a.id == id).FirstOrDefault();
                return View("~/Views/appdashboard/adminsystem/User/Edit.cshtml", model);
            }
        }

        // GET: User/Delete/5
        public ActionResult Delete(int id)
        {
            MyAppEntities myAppEntities = new MyAppEntities();
            var model = myAppEntities.Users.Where(a => a.id == id).FirstOrDefault();
            return View("~/Views/appdashboard/adminsystem/User/Delete.cshtml",model);
        }

        // POST: User/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index", "User");
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
