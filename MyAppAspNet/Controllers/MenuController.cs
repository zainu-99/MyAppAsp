using MyAppAspNet.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace MyAppAspNet.Controllers
{
    [AuthorizeUser]
    public class MenuController : Controller
    {
        private MyAppEntities db = new MyAppEntities();

        public ActionResult Index()
        {
            
            var model = db.MenuApp.Where(a => a.IDParentMenu == null).ToList();
            return View("~/Views/appdashboard/masterdata/Menu/Index.cshtml", model);
        }
        public ActionResult Create()
        {
            ViewBag.parent = db.MenuApp.Where(a => a.IDParentMenu == null).ToList();
            ViewBag.RoleID = new SelectList(db.Roles, "id", "name");
            return View("~/Views/appdashboard/masterdata/Menu/Add.cshtml");
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID,RoleID,MenuText,IDParentMenu,IconMenu,OrderSort")] MenuApp menuApp)
        {
            if (ModelState.IsValid)
            {
                db.MenuApp.Add(menuApp);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.parent = db.MenuApp.Where(a => a.IDParentMenu == null).ToList();
            ViewBag.RoleID = new SelectList(db.Roles, "id", "name", menuApp.RoleID);
            return View("~/Views/appdashboard/masterdata/Menu/Add.cshtml", menuApp);
        }
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            MenuApp menuApp = db.MenuApp.Find(id);
            if (menuApp == null)
            {
                return HttpNotFound();
            }
            ViewBag.parent = db.MenuApp.Where(a => a.IDParentMenu == null).ToList();
            ViewBag.RoleID = new SelectList(db.Roles, "id", "name", menuApp.RoleID);
            return View("~/Views/appdashboard/masterdata/Menu/Edit.cshtml", menuApp);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,RoleID,MenuText,IDParentMenu,IconMenu,OrderSort")] MenuApp menuApp)
        {
            if (ModelState.IsValid)
            {
                db.Entry(menuApp).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.parent = db.MenuApp.Where(a => a.IDParentMenu == null).ToList();
            ViewBag.RoleID = new SelectList(db.Roles, "id", "name", menuApp.RoleID);
            return View("~/Views/appdashboard/masterdata/Menu/Edit.cshtml", menuApp);
        }

        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            MenuApp menuApp = db.MenuApp.Find(id);
            if (menuApp == null)
            {
                return HttpNotFound();
            }
            return View("~/Views/appdashboard/masterdata/Menu/Delete.cshtml", menuApp);
        }

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            MenuApp menuApp = db.MenuApp.Find(id);
            db.MenuApp.Remove(menuApp);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
