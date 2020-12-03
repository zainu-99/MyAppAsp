using MyAppAspNet.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MyAppAspNet.Controllers
{
    public class RoleController : Controller
    {
        public ActionResult Index()
        {
            MyAppEntities myAppEntities = new MyAppEntities();
            var model = myAppEntities.Roles.ToList();
            return View("~/Views/appdashboard/masterdata/Role/Index.cshtml", model);
        }

        public ActionResult Details(int id)
        {
            MyAppEntities myAppEntities = new MyAppEntities();
            var model = myAppEntities.Roles.Where(a => a.id == id).FirstOrDefault();
            return View("~/Views/appdashboard/masterdata/Role/Detail.cshtml", model);
        }
        public ActionResult Create()
        {
            return View("~/Views/appdashboard/masterdata/Role/Add.cshtml");
        }
        [HttpPost]
        public ActionResult Create(Roles collection)
        {
            try
            {
                TryUpdateModel(collection);
                using (var myAppEntities = new MyAppEntities())
                {
                    myAppEntities.Roles.Add(collection);
                    myAppEntities.SaveChanges();
                }
                return RedirectToAction("Index");
            }
            catch
            {
                return View("~/Views/appdashboard/masterdata/Role/Add.cshtml");
            }
        }
        public ActionResult Edit(int id)
        {
            MyAppEntities myAppEntities = new MyAppEntities();
            var model = myAppEntities.Roles.Where(a => a.id == id).FirstOrDefault();
            return View("~/Views/appdashboard/masterdata/Role/Edit.cshtml", model);
        }
        [HttpPost]
        public ActionResult Edit(int id, Roles collection)
        {
            try
            {
                TryUpdateModel(collection);
                using (var myAppEntities = new MyAppEntities())
                {
                    var m = myAppEntities.Roles.Where(a => a.id == id).FirstOrDefault();
                    TryUpdateModel(m);
                    myAppEntities.SaveChanges();
                }
                return RedirectToAction("Index");
            }
            catch
            {
                MyAppEntities myAppEntities = new MyAppEntities();
                var model = myAppEntities.Roles.Where(a => a.id == id).FirstOrDefault();
                return View("~/Views/appdashboard/masterdata/Role/Edit.cshtml", model);
            }
        }
        public ActionResult Delete(int id)
        {
            MyAppEntities myAppEntities = new MyAppEntities();
            var model = myAppEntities.Roles.Where(a => a.id == id).FirstOrDefault();
            return View("~/Views/appdashboard/masterdata/Role/Delete.cshtml", model);
        }

        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                TryUpdateModel(collection);
                using (var myAppEntities = new MyAppEntities())
                {
                    var m = myAppEntities.Roles.Remove(myAppEntities.Roles.FirstOrDefault(x => x.id == id));
                    TryUpdateModel(m);
                    myAppEntities.SaveChanges();
                }
                return RedirectToAction("Index");
            }
            catch
            {
                MyAppEntities myAppEntities = new MyAppEntities();
                var model = myAppEntities.Roles.Where(a => a.id == id).FirstOrDefault();
                return View("~/Views/appdashboard/masterdata/Role/Delete.cshtml", model);
            }
        }
    }
}
