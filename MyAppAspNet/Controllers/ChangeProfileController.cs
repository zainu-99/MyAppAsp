﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MyAppAspNet.Controllers
{
    [AuthorizeUser]
    public class ChangeProfileController : Controller
    {
        // GET: ChangeProfile
        public ActionResult Index()
        {
            return View();
        }

        // GET: ChangeProfile/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: ChangeProfile/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: ChangeProfile/Create
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

        // GET: ChangeProfile/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: ChangeProfile/Edit/5
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

        // GET: ChangeProfile/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: ChangeProfile/Delete/5
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
