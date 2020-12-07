using MyAppAspNet.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MyAppAspNet.Controllers
{
    [AuthorizeUser]
    public class RoleController : Controller
    {
        public ActionResult Index()
        {
            MyAppEntities myAppEntities = new MyAppEntities();
            var model = myAppEntities.Roles.OrderBy(a => a.url).ToList();
            return View("~/Views/appdashboard/masterdata/Role/Index.cshtml", model);
        }
        public ActionResult Create()
        {
            return View("~/Views/appdashboard/masterdata/Role/Add.cshtml");
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
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
        [ValidateAntiForgeryToken]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                TryUpdateModel(collection);
                using (var myAppEntities = new MyAppEntities())
                {
                    if (collection.AllKeys.Contains("key"))
                    {
                        var key = collection.GetValue("key").AttemptedValue;
                        var val = collection.GetValue("val").AttemptedValue;
                        string query = "update Roles set " + key + " = '" + val + "' where id = '" + id + "'";
                        myAppEntities.UserRole.SqlQuery(query).FirstOrDefault();
                    }
                    else
                    {
                        var m = myAppEntities.Roles.Where(a => a.id == id).FirstOrDefault();
                        TryUpdateModel(m);
                        myAppEntities.SaveChanges();
                    }
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
