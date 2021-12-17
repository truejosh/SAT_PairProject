﻿using SAT_Pair_Project.DATA.EF;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web.Mvc;

namespace SAT_Pair_Project.Controllers
{
    public class ScheduledClassesController : Controller
    {
        private SAT_DBEntities db = new SAT_DBEntities();

        // GET: ScheduledClasses
        [Authorize(Roles = "Admin, Scheduling")]
        public ActionResult Index()
        {
            var scheduledClasses = db.ScheduledClasses.Include(s => s.Courses).Include(s => s.ScheduledClassStatus);
            return View(scheduledClasses.ToList());
        }

        // GET: ScheduledClasses/Details/5
        [Authorize(Roles = "Admin, Scheduling")]
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ScheduledClass scheduledClass = db.ScheduledClasses.Find(id);
            if (scheduledClass == null)
            {
                return HttpNotFound();
            }
            return View(scheduledClass);
        }

        // GET: ScheduledClasses/Create
        [Authorize(Roles = "Admin, Scheduling")]
        public ActionResult Create()
        {
            ViewBag.CourseId = new SelectList(db.Courses, "Id", "CourseName");
            ViewBag.SCSID = new SelectList(db.ScheduledClassStatuses, "Id", "SCSName");
            return View();
        }

        // POST: ScheduledClasses/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,CourseId,StartDate,EndDate,InstructorName,Location,SCSID")] ScheduledClass scheduledClass)
        {
            if (ModelState.IsValid)
            {
                db.ScheduledClasses.Add(scheduledClass);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.CourseId = new SelectList(db.Courses, "Id", "CourseName", scheduledClass.CourseId);
            ViewBag.SCSID = new SelectList(db.ScheduledClassStatuses, "Id", "SCSName", scheduledClass.SCSID);
            return View(scheduledClass);
        }

        // GET: ScheduledClasses/Edit/5
        [Authorize(Roles = "Admin, Scheduling")]
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ScheduledClass scheduledClass = db.ScheduledClasses.Find(id);
            if (scheduledClass == null)
            {
                return HttpNotFound();
            }
            ViewBag.CourseId = new SelectList(db.Courses, "Id", "CourseName", scheduledClass.CourseId);
            ViewBag.SCSID = new SelectList(db.ScheduledClassStatuses, "Id", "SCSName", scheduledClass.SCSID);
            return View(scheduledClass);
        }

        // POST: ScheduledClasses/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,CourseId,StartDate,EndDate,InstructorName,Location,SCSID")] ScheduledClass scheduledClass)
        {
            if (ModelState.IsValid)
            {
                db.Entry(scheduledClass).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.CourseId = new SelectList(db.Courses, "Id", "CourseName", scheduledClass.CourseId);
            ViewBag.SCSID = new SelectList(db.ScheduledClassStatuses, "Id", "SCSName", scheduledClass.SCSID);
            return View(scheduledClass);
        }

        // GET: ScheduledClasses/Delete/5

        [Authorize(Roles = "Admin")]
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ScheduledClass scheduledClass = db.ScheduledClasses.Find(id);
            if (scheduledClass == null)
            {
                return HttpNotFound();
            }
            return View(scheduledClass);
        }

        // POST: ScheduledClasses/Delete/5
        [HttpPost, ActionName("Delete")]
        [Authorize(Roles = "Admin")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            ScheduledClass scheduledClass = db.ScheduledClasses.Find(id);
            db.ScheduledClasses.Remove(scheduledClass);
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
