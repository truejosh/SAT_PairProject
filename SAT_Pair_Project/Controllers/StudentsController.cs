using SAT_Pair_Project.DATA.EF;
using SAT_Pair_Project.Utilities;//Access to the ImageUtility
using System;
using System.Data.Entity;
using System.Drawing;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using System.Collections.Generic;
using System.Data;

namespace SAT_Pair_Project.Controllers
{
    public class StudentsController : Controller
    {
        private SAT_DBEntities db = new SAT_DBEntities();

        [Authorize(Roles = "Admin, Scheduling")]
        // GET: Students
        public ActionResult Index()
        {
            var students = db.Students.Include(s => s.StudentStatus);
            return View(students.ToList());
        }

        [Authorize(Roles = "Admin, Scheduling")]
        //Below we create an action that will return a grid layout
        public ActionResult StudentsGrid()
        {
            //var student = db.Students.Include(s => s.FullName).Include(b => b.StudentStatus).Include(b => b.Major);
            var student = db.Students.Include(s => s.StudentStatus);
            return View(student.ToList());
        }

        // GET: Students/Details/5
        [Authorize(Roles = "Admin, Scheduling")]
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Student student = db.Students.Find(id);
            if (student == null)
            {
                return HttpNotFound();
            }
            return View(student);
        }

        // GET: Students/Create
        [Authorize(Roles = "Admin")]
        public ActionResult Create()
        {
            ViewBag.SSID = new SelectList(db.StudentStatuses, "Id", "SSName");
            return View();
        }

        // POST: Students/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [Authorize(Roles = "Admin")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,FirstName,LastName,Major,Address,City,State,ZipCode,Phone,Email,PhotoUrl,SSID")] Student student, HttpPostedFileBase studentImg)
        {
            if (ModelState.IsValid)
            {
                #region File Upload
                string file = "NoImage.png";

                if (studentImg != null)
                {
                    file = studentImg.FileName;

                    //checking extension of file
                    string ext = file.Substring(file.LastIndexOf("."));

                    //list of good extensions
                    string[] goodExts = { ".jpeg", ".jpg", ".png", ".gif" };

                    //check the extension against the list
                    if (goodExts.Contains(ext.ToLower()) && studentImg.ContentLength <= 4194304)
                    {
                        //Create a new file name
                        file = Guid.NewGuid() + ext;

                        #region Resize Image and Save to server
                        string savePath = Server.MapPath("~/Content/assets/students/");

                        //Below we actually pass the data from the image to our program - Image Service that will find its dimensions and resize the image
                        Image convertedImage = Image.FromStream(studentImg.InputStream);

                        //set the max size of our image here
                        int maxImageSize = 500;

                        //set the thumbnail
                        int maxThumbSize = 100;

                        ImageUtility.ResizeImage(savePath, file, convertedImage, maxImageSize, maxThumbSize);
                        #endregion
                    }

                    //No matter what we will update the photo URL with the value of the file variable
                    student.PhotoUrl = file;
                }
                #endregion
                db.Students.Add(student);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.SSID = new SelectList(db.StudentStatuses, "Id", "SSName", student.SSID);
            return View(student);
        }

        // GET: Students/Edit/5
        [Authorize(Roles = "Admin")]
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Student student = db.Students.Find(id);
            if (student == null)
            {
                return HttpNotFound();
            }
            ViewBag.SSID = new SelectList(db.StudentStatuses, "Id", "SSName", student.SSID);
            return View(student);
        }

        // POST: Students/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [Authorize(Roles = "Admin")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,FirstName,LastName,Major,Address,City,State,ZipCode,Phone,Email,PhotoUrl,SSID")] Student student, HttpPostedFileBase studentImg)
        {
            if (ModelState.IsValid)
            {
                #region Image Upload
                //check to see if a new file has been uploaded, if not HiddenFor() in the edit view will maintain the original value
                string file = "NoImage.png";

                if (studentImg != null)
                {
                    //get the name
                    file = studentImg.FileName;

                    string ext = file.Substring(file.LastIndexOf("."));

                    string[] goodExts = { ".jpeg", ".jpg", ".png", ".gif" };

                    //Check the ext and file size < 4mb
                    if (goodExts.Contains(ext.ToLower()) && studentImg.ContentLength <= 4194304)
                    {
                        file = Guid.NewGuid() + ext;

                        //resizing image
                        string savePath = Server.MapPath("~/Content/assets/students/");

                        Image convertedImage = Image.FromStream(studentImg.InputStream);

                        int maxImageSize = 500;

                        int maxThumbSize = 100;

                        ImageUtility.ResizeImage(savePath, file, convertedImage, maxImageSize, maxThumbSize);

                        //dispose of the old image IF it is not null and it is not 'noimage.png'
                        if (student.PhotoUrl != null && student.PhotoUrl != "NoImage.png")
                        {
                            string path = Server.MapPath("~/Content/assets/students/");
                            ImageUtility.Delete(path, student.PhotoUrl);
                        }

                        //update the property of the object
                        student.PhotoUrl = file;
                    }
                }
                #endregion
                db.Entry(student).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            else
            {
                ViewBag.SSID = new SelectList(db.StudentStatuses, "Id", "SSName", student.SSID);
                return View(student);
            }
        }

        // GET: Students/Delete/5
        [Authorize(Roles = "Admin")]
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Student student = db.Students.Find(id);
            if (student == null)
            {
                return HttpNotFound();
            }
            return View(student);
        }

        // POST: Students/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Student student = db.Students.Find(id);//This code finds the book by its id in the Books table in the db

            //Once we find the student,  we can delete any associated image with that book
            string path = Server.MapPath("~/Content/assets/students/");
            ImageUtility.Delete(path, student.PhotoUrl);



            db.Students.Remove(student);
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
