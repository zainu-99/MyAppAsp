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
    [AuthorizeUser]
    public class GroupLevelController : Controller
    {
        private MyAppEntities db = new MyAppEntities();

        // GET: GroupLevels
        public ActionResult Index()
        {
            var groupLevel = db.GroupLevel.Include(g => g.GroupLevel2).Include(g => g.Groups).Where(a => a.id_parent == null).ToList();
            return View("~/Views/appdashboard/adminsystem/GroupLevel/Index.cshtml", groupLevel.ToList());
        }
        // GET: GroupLevels/Create
        public ActionResult Create()
        {
            ViewBag.parent = db.GroupLevel.Include(g => g.GroupLevel2).Include(g => g.Groups).Where(a => a.id_parent == null).ToList();
            ViewBag.id_group = new SelectList(db.Groups, "id", "name");
            return View("~/Views/appdashboard/adminsystem/GroupLevel/Add.cshtml");
        }

        // POST: GroupLevels/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,id_group,id_parent,remark")] GroupLevel groupLevel)
        {
            if (ModelState.IsValid)
            {
                db.GroupLevel.Add(groupLevel);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.parent = db.GroupLevel.Include(g => g.GroupLevel2).Include(g => g.Groups).Where(a => a.id_parent == null).ToList();
            ViewBag.id_group = new SelectList(db.Groups, "id", "name", groupLevel.id_group);
            return View("~/Views/appdashboard/adminsystem/GroupLevel/Add.cshtml",groupLevel);
        }

        // GET: GroupLevels/Edit/5
        public ActionResult Edit(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            GroupLevel groupLevel = db.GroupLevel.Find(id);
            if (groupLevel == null)
            {
                return HttpNotFound();
            }
            ViewBag.parent = db.GroupLevel.Include(g => g.GroupLevel2).Include(g => g.Groups).Where(a => a.id_parent == null).ToList();
            ViewBag.id_group = new SelectList(db.Groups, "id", "name", groupLevel.id_group);
            return View("~/Views/appdashboard/adminsystem/GroupLevel/Edit.cshtml",groupLevel);
        }

        // POST: GroupLevels/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,id_group,id_parent,remark")] GroupLevel groupLevel)
        {
            if (ModelState.IsValid)
            {
                db.Entry(groupLevel).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.parent = db.GroupLevel.Include(g => g.GroupLevel2).Include(g => g.Groups).Where(a => a.id_parent == null).ToList();
            ViewBag.id_group = new SelectList(db.Groups, "id", "name", groupLevel.id_group);
            return View("~/Views/appdashboard/adminsystem/GroupLevel/Edit.cshtml",groupLevel);
        }

        // GET: GroupLevels/Delete/5
        public ActionResult Delete(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            GroupLevel groupLevel = db.GroupLevel.Find(id);
            if (groupLevel == null)
            {
                return HttpNotFound();
            }
            return View("~/Views/appdashboard/adminsystem/GroupLevel/Delete.cshtml",groupLevel);
        }

        // POST: GroupLevels/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(long id)
        {
            GroupLevel groupLevel = db.GroupLevel.Find(id);
            db.GroupLevel.Remove(groupLevel);
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
