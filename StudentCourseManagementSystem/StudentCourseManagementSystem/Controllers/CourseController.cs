using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data;
using System.Data.SqlClient;
using StudentCourseManagementSystem.Models;

namespace CourseReservationSystem.Controllers
{
    public class CourseController : Controller
    {
        string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["SQLConnection"].ConnectionString;

        // GET: /Course/
        [HttpGet]
        public ActionResult Course()
        {
            List<Course> listCourse = new List<Course>();
            using (SqlConnection sqlConnetion = new SqlConnection(connectionString))
            {
                sqlConnetion.Open();
                SqlCommand sqlCommand = new SqlCommand("SELECT CourseID,CourseCode,CourseName,TeacherName,StartDate,EndDate FROM tbl_Course", sqlConnetion);
                SqlDataReader reader = sqlCommand.ExecuteReader();
                while (reader.Read())
                {
                    Course objCourse = new Course();
                    objCourse.CourseID = Convert.ToInt32(reader["CourseID"].ToString());
                    objCourse.CourseCode = reader["CourseCode"].ToString();
                    objCourse.CourseName = reader["CourseName"].ToString();
                    objCourse.TeacherName = reader["TeacherName"].ToString();
                    objCourse.StartDate = Convert.ToDateTime(reader["StartDate"].ToString());
                    objCourse.EndDate = Convert.ToDateTime(reader["EndDate"].ToString());
                    listCourse.Add(objCourse);
                }
            }
            return View(listCourse);
        }

        // GET: /Course/Create
        [HttpGet]
        public ActionResult AddCourse()
        {
            return View(new Course());
        }


        // POST: /Course/Create
        [HttpPost]
        public ActionResult AddCourse(Course objCourse)
        {
            try
            {
                using (SqlConnection sqlConnetion = new SqlConnection(connectionString))
                {
                    sqlConnetion.Open();
                    String Query = "INSERT INTO tbl_Course VALUES(@CourseCode,@CourseName,@TeacherName,@StartDate,@EndDate)";
                    SqlCommand sqlCmd = new SqlCommand(Query, sqlConnetion);
                    sqlCmd.Parameters.AddWithValue("@CourseCode", objCourse.CourseCode);
                    sqlCmd.Parameters.AddWithValue("@CourseName", objCourse.CourseName);
                    sqlCmd.Parameters.AddWithValue("@TeacherName", objCourse.TeacherName);
                    sqlCmd.Parameters.AddWithValue("@StartDate", objCourse.StartDate);
                    sqlCmd.Parameters.AddWithValue("@EndDate", objCourse.EndDate);
                    sqlCmd.ExecuteNonQuery();
                }

                return RedirectToAction("Course");
            }
            catch (Exception ex)
            {
                return View();
            }
        }

        //
        // GET: /Course/Edit/5
        [HttpGet]
        public ActionResult EditCourse(int id)
        {
            Course objCourse = new Course();
            DataTable dtCourse = new DataTable();

            using (SqlConnection sqlConnetion = new SqlConnection(connectionString))
            {
                sqlConnetion.Open();
                SqlDataAdapter daCourse = new SqlDataAdapter("SELECT CourseCode,CourseName,TeacherName,StartDate,EndDate from tbl_Course WHERE CourseID=@CourseID", sqlConnetion);
                daCourse.SelectCommand.Parameters.AddWithValue("@CourseID", id);
                daCourse.Fill(dtCourse);
            }
            if (dtCourse.Rows.Count == 1)
            {
                objCourse.CourseCode = dtCourse.Rows[0][0].ToString();
                objCourse.CourseName = dtCourse.Rows[0][1].ToString();
                objCourse.TeacherName = dtCourse.Rows[0][2].ToString();
                objCourse.StartDate = Convert.ToDateTime(dtCourse.Rows[0][3].ToString());
                objCourse.EndDate = Convert.ToDateTime(dtCourse.Rows[0][4].ToString());
                return View(objCourse);
            }
            else
                return RedirectToAction("Course");
        }

        //
        // POST: /Course/Edit/5
        [HttpPost]
        public ActionResult EditCourse(Course objCourse, int id)
        {
            try
            {
                using (SqlConnection sqlConnetion = new SqlConnection(connectionString))
                {
                    sqlConnetion.Open();
                    String Query = "UPDATE tbl_Course SET CourseCode=@CourseCode,CourseName=@CourseName,TeacherName=@TeacherName,StartDate=@StartDate,EndDate=@EndDate WHERE CourseID=" + id;
                    SqlCommand sqlCmd = new SqlCommand(Query, sqlConnetion);
                    sqlCmd.Parameters.AddWithValue("@CourseCode", objCourse.CourseCode);
                    sqlCmd.Parameters.AddWithValue("@CourseName", objCourse.CourseName);
                    sqlCmd.Parameters.AddWithValue("@TeacherName", objCourse.TeacherName);
                    sqlCmd.Parameters.AddWithValue("@StartDate", objCourse.StartDate);
                    sqlCmd.Parameters.AddWithValue("@EndDate", objCourse.EndDate);
                    sqlCmd.ExecuteNonQuery();
                }
                return RedirectToAction("Course");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /Course/Delete/5
        [HttpGet]
        public ActionResult Delete(int id)
        {
            using (SqlConnection sqlConnetion = new SqlConnection(connectionString))
            {
                sqlConnetion.Open();
                String Query = "DELETE FROM tbl_Course WHERE CourseID=" + id;
                SqlCommand sqlCmd = new SqlCommand(Query, sqlConnetion);
                sqlCmd.Parameters.AddWithValue("@CourseCode", id);
                sqlCmd.ExecuteNonQuery();
            }
            return RedirectToAction("Course");
        }

       
    }
}
