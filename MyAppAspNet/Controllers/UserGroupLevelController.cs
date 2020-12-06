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
    public class UserGroupLevelController : Controller
    {
        private MyAppEntities db = new MyAppEntities();

        // GET: UserGroupLevels
        public ActionResult Index()
        {
            var userGroupLevel = db.UserGroupLevel.Include(u => u.GroupLevel).Include(u => u.Users);
            return View(userGroupLevel.ToList());
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,id_user,id_group_level")] UserGroupLevel userGroupLevel)
        {
            if (ModelState.IsValid)
            {
                db.Entry(userGroupLevel).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.id_group_level = new SelectList(db.GroupLevel, "id", "remark", userGroupLevel.id_group_level);
            ViewBag.id_user = new SelectList(db.Users, "id", "userid", userGroupLevel.id_user);
            return View(userGroupLevel);
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
