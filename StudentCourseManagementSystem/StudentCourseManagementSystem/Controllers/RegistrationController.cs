using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data;
using System.Data.SqlClient;
using StudentCourseManagementSystem.Models;

namespace StudentCourseManagementSystem.Controllers
{
    public class RegistrationController : Controller
    {
        string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["SQLConnection"].ConnectionString;

        //Getting courses list
        public List<Course> GetCourseList()
        {
            List<Course> listCourse = new List<Course>();
            using (SqlConnection sqlConnetion = new SqlConnection(connectionString))
            {
                sqlConnetion.Open();
                SqlCommand sqlCommand = new SqlCommand("SELECT CourseID,CourseName FROM tbl_Course", sqlConnetion);
                SqlDataReader reader = sqlCommand.ExecuteReader();
                while (reader.Read())
                {
                    Course objCourse = new Course();
                    objCourse.CourseID = Convert.ToInt32(reader["CourseID"].ToString());
                    objCourse.CourseName = reader["CourseName"].ToString();
                    listCourse.Add(objCourse);
                }
            }
            return listCourse;
        }

        //Getting students list
        public List<Student> GetStudentList()
        {
            List<Student> listStudent = new List<Student>();
            using (SqlConnection sqlConnetion = new SqlConnection(connectionString))
            {
                sqlConnetion.Open();
                SqlCommand sqlCommand = new SqlCommand("SELECT StudentID,FirstName,Surname FROM tbl_Student", sqlConnetion);
                SqlDataReader reader = sqlCommand.ExecuteReader();
                while (reader.Read())
                {
                    Student objStudent = new Student();
                    objStudent.StudentID = Convert.ToInt32(reader["StudentID"].ToString());
                    objStudent.StudentFirstName = reader["FirstName"].ToString() + " " + reader["Surname"].ToString();
                    listStudent.Add(objStudent);
                }
            }
            return listStudent;
        }
       
        [HttpGet]
        public ActionResult Registration()
        {
            var Courses = GetCourseList();
            var Students = GetStudentList();

            SelectList CourseList = new SelectList(Courses, "CourseID", "CourseName");
            ViewBag.CourseListNames = CourseList;

            SelectList StudentList = new SelectList(Students, "StudentID", "StudentFirstName");
            ViewBag.StudentListNames = StudentList;

            return View();
        }

        [HttpPost]
        public ActionResult Registration(Registration objRegistration)
        {
            try
            {
                using (SqlConnection sqlConnetion = new SqlConnection(connectionString))
                {
                    sqlConnetion.Open();
                    String Query = "INSERT INTO tbl_CourseRegistration VALUES(@CourseID,@StudentID)";
                    SqlCommand sqlCmd = new SqlCommand(Query, sqlConnetion);
                    sqlCmd.Parameters.AddWithValue("@CourseID", objRegistration.CourseID);
                    sqlCmd.Parameters.AddWithValue("@StudentID", objRegistration.StudentID);
                    sqlCmd.Parameters.AddWithValue("@StudentFirstName", objRegistration.StudentFirstName);
                    sqlCmd.Parameters.AddWithValue("@StudentSurname", objRegistration.StudentSurname);
                    sqlCmd.Parameters.AddWithValue("@CourseName", objRegistration.CourseName);  
                    sqlCmd.ExecuteNonQuery();
                }

                return RedirectToAction("Rgistration");
            }
            catch (Exception ex)
            {
                return View();
            }
        }

    }
}
