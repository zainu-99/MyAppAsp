using MyAppAspNet.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MyAppAspNet.Controllers
{
    public class MenuController : Controller
    {
        public ActionResult Index()
        {
            MyAppEntities myAppEntities = new MyAppEntities();
            var model = myAppEntities.MenuApp.ToList();
            return View("~/Views/appdashboard/masterdata/Menu/Index.cshtml", model);
        }

        public ActionResult Details(int id)
        {
            MyAppEntities myAppEntities = new MyAppEntities();
            var model = myAppEntities.MenuApp.Where(a => a.ID == id).FirstOrDefault();
            return View("~/Views/appdashboard/masterdata/Menu/Detail.cshtml", model);
        }
        public ActionResult Create()
        {
            MyAppEntities myAppEntities = new MyAppEntities();
            var model = myAppEntities.Roles.ToList();
            return View("~/Views/appdashboard/masterdata/Menu/Add.cshtml",model);
        }
        [HttpPost]
        public ActionResult Create(MenuApp collection)
        {
            try
            {
                TryUpdateModel(collection);
                using (var myAppEntities = new MyAppEntities())
                {
                    myAppEntities.MenuApp.Add(collection);
                    myAppEntities.SaveChanges();
                }
                return RedirectToAction("Index");
            }
            catch
            {
                return View("~/Views/appdashboard/masterdata/Menu/Add.cshtml");
            }
        }
        public ActionResult Edit(int id)
        {
            MyAppEntities myAppEntities = new MyAppEntities();
            var model = myAppEntities.MenuApp.Where(a => a.ID == id).FirstOrDefault();
            return View("~/Views/appdashboard/masterdata/Menu/Edit.cshtml", model);
        }
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                TryUpdateModel(collection);
                using (var myAppEntities = new MyAppEntities())
                {
                    var m = myAppEntities.MenuApp.Where(a => a.ID == id).FirstOrDefault();
                    TryUpdateModel(m);
                    myAppEntities.SaveChanges();
                }
                return RedirectToAction("Index");
            }
            catch
            {
                MyAppEntities myAppEntities = new MyAppEntities();
                var model = myAppEntities.MenuApp.Where(a => a.ID == id).FirstOrDefault();
                return View("~/Views/appdashboard/masterdata/Menu/Edit.cshtml", model);
            }
        }
        public ActionResult Delete(int id)
        {
            MyAppEntities myAppEntities = new MyAppEntities();
            var model = myAppEntities.MenuApp.Where(a => a.ID == id).FirstOrDefault();
            return View("~/Views/appdashboard/masterdata/Menu/Delete.cshtml", model);
        }

        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                TryUpdateModel(collection);
                using (var myAppEntities = new MyAppEntities())
                {
                    var m = myAppEntities.MenuApp.Remove(myAppEntities.MenuApp.FirstOrDefault(x => x.ID == id));
                    TryUpdateModel(m);
                    myAppEntities.SaveChanges();
                }
                return RedirectToAction("Index");
            }
            catch
            {
                MyAppEntities myAppEntities = new MyAppEntities();
                var model = myAppEntities.MenuApp.Where(a => a.ID == id).FirstOrDefault();
                return View("~/Views/appdashboard/masterdata/Menu/Delete.cshtml", model);
            }
        }
    }
}
