using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MyAppAspNet.Controllers
{
    public class UserGroupLevelController : Controller
    {
        // GET: UserGroupLevel
        public ActionResult Index()
        {
            return View();
        }

        // GET: UserGroupLevel/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: UserGroupLevel/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: UserGroupLevel/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: UserGroupLevel/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: UserGroupLevel/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: UserGroupLevel/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: UserGroupLevel/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
