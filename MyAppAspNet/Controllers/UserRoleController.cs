using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using MyAppAspNet.Models;

namespace MyAppAspNet.Controllers
{
    public class UserRoleController : Controller
    {
        private MyAppEntities db = new MyAppEntities();

        [HttpPost]
        public ActionResult Index()
        {
            var userRole = db.UserRole.Include(u => u.Roles).Include(u => u.Users);
            return View(userRole.ToList());
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,id_user,id_role,allow_view,allow_add,allow_edit,allow_delete,allow_print,allow_custom")] UserRole userRole)
        {
            if (ModelState.IsValid)
            {
                db.Entry(userRole).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.id_role = new SelectList(db.Roles, "id", "name", userRole.id_role);
            ViewBag.id_user = new SelectList(db.Users, "id", "userid", userRole.id_user);
            return View(userRole);
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
