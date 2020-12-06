using MyAppAspNet.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MyAppAspNet.Controllers
{
    [AuthorizeUser]
    public class GroupController : Controller
    {
        public ActionResult Index()
        {
            MyAppEntities myAppEntities = new MyAppEntities();
            var model = myAppEntities.Groups.ToList();
            return View("~/Views/appdashboard/masterdata/Group/Index.cshtml", model);
        }
        public ActionResult Create()
        {
            return View("~/Views/appdashboard/masterdata/Group/Add.cshtml");
        }
        [HttpPost]
        public ActionResult Create(Groups collection)
        {
            try
            {
                TryUpdateModel(collection);
                using (var myAppEntities = new MyAppEntities())
                {
                    myAppEntities.Groups.Add(collection);
                    myAppEntities.SaveChanges();
                }
                return RedirectToAction("Index");
            }
            catch
            {
                return View("~/Views/appdashboard/masterdata/Group/Add.cshtml");
            }
        }
        public ActionResult Edit(int id)
        {
            MyAppEntities myAppEntities = new MyAppEntities();
            var model = myAppEntities.Groups.Where(a => a.id == id).FirstOrDefault();
            return View("~/Views/appdashboard/masterdata/Group/Edit.cshtml", model);
        }
        [HttpPost]
        public ActionResult Edit(int id, Groups collection)
        {
            try
            {
                TryUpdateModel(collection);
                using (var myAppEntities = new MyAppEntities())
                {
                    var m = myAppEntities.Groups.Where(a => a.id == id).FirstOrDefault();
                    TryUpdateModel(m);
                    myAppEntities.SaveChanges();
                }
                return RedirectToAction("Index");
            }
            catch
            {
                MyAppEntities myAppEntities = new MyAppEntities();
                var model = myAppEntities.Groups.Where(a => a.id == id).FirstOrDefault();
                return View("~/Views/appdashboard/masterdata/Group/Edit.cshtml", model);
            }
        }
        public ActionResult Delete(int id)
        {
            MyAppEntities myAppEntities = new MyAppEntities();
            var model = myAppEntities.Groups.Where(a => a.id == id).FirstOrDefault();
            return View("~/Views/appdashboard/masterdata/Group/Delete.cshtml", model);
        }
        
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                TryUpdateModel(collection);
                using (var myAppEntities = new MyAppEntities())
                {
                    var m = myAppEntities.Groups.Remove(myAppEntities.Groups.FirstOrDefault(x => x.id == id));
                    TryUpdateModel(m);
                    myAppEntities.SaveChanges();
                }
                return RedirectToAction("Index");
            }
            catch
            {
                MyAppEntities myAppEntities = new MyAppEntities();
                var model = myAppEntities.Groups.Where(a => a.id == id).FirstOrDefault();
                return View("~/Views/appdashboard/masterdata/Group/Delete.cshtml", model);
            }
        }
    }
}
