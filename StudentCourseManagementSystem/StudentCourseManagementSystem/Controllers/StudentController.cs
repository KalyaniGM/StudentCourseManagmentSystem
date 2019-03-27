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
    public class StudentController : Controller
    {
        string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["SQLConnection"].ConnectionString;
       
        [HttpGet]
        public ActionResult Student()
        {
            List<Student> listStudent = new List<Student>();
            using (SqlConnection sqlConnetion = new SqlConnection(connectionString))
            {
                sqlConnetion.Open();
                SqlCommand sqlCommand = new SqlCommand("SELECT StudentID,FirstName,Surname,Gender,DateOfBirth,Address1,Address2,Address3 FROM tbl_Student", sqlConnetion);
                SqlDataReader reader = sqlCommand.ExecuteReader();
                while (reader.Read())
                {
                    Student objStudent = new Student();
                    objStudent.StudentID = Convert.ToInt32(reader["StudentID"].ToString());
                    objStudent.StudentFirstName = reader["FirstName"].ToString();
                    objStudent.StudentSurname = reader["Surname"].ToString();
                    objStudent.StudentGender = reader["Gender"].ToString();
                    objStudent.StudentDOB = Convert.ToDateTime(reader["DateOfBirth"].ToString());
                    objStudent.StudentAddress1 = reader["Address1"].ToString();
                    objStudent.StudentAddress2 = reader["Address2"].ToString();
                    objStudent.StudentAddress3 = reader["Address3"].ToString();
                    listStudent.Add(objStudent);
                }
            }
            return View(listStudent);
        }


        [HttpGet]
        public ActionResult AddStudent()
        {
            return View(new Student());
        }

      
        [HttpPost]
        public ActionResult AddStudent(Student objStudent)
        {
            try
            {
                using (SqlConnection sqlConnetion = new SqlConnection(connectionString))
                {
                    sqlConnetion.Open();
                    String Query = "INSERT INTO tbl_Student VALUES(@FirstName,@Surname,@Gender,@DateOfBirth,@Address1,@Address2,@Address3)";
                    SqlCommand sqlCmd = new SqlCommand(Query, sqlConnetion);
                    sqlCmd.Parameters.AddWithValue("@FirstName", objStudent.StudentFirstName);
                    sqlCmd.Parameters.AddWithValue("@Surname", objStudent.StudentSurname);
                    sqlCmd.Parameters.AddWithValue("@Gender", objStudent.StudentGender);
                    sqlCmd.Parameters.AddWithValue("@DateOfBirth", objStudent.StudentDOB);
                    sqlCmd.Parameters.AddWithValue("@Address1", objStudent.StudentAddress1);
                    sqlCmd.Parameters.AddWithValue("@Address2", objStudent.StudentAddress2);
                    sqlCmd.Parameters.AddWithValue("@Address3", objStudent.StudentAddress3);
                    sqlCmd.ExecuteNonQuery();
                }

                return RedirectToAction("Student");
            }
            catch (Exception ex)
            {
                return View();
            }
        }
  
        [HttpGet]
        public ActionResult EditStudent(int id)
        {
            Student objStudent = new Student();
            DataTable dtStudent = new DataTable();

            using (SqlConnection sqlConnetion = new SqlConnection(connectionString))
            {
                sqlConnetion.Open();
                SqlDataAdapter daStudent = new SqlDataAdapter("SELECT FirstName,Surname,Gender,DateOfBirth,Address1,Address2,Address3 from tbl_Student WHERE StudentID=@StudentID", sqlConnetion);
                daStudent.SelectCommand.Parameters.AddWithValue("@StudentID", id);
                daStudent.Fill(dtStudent);
            }
            if (dtStudent.Rows.Count == 1)
            {
                objStudent.StudentFirstName = dtStudent.Rows[0][0].ToString();
                objStudent.StudentSurname = dtStudent.Rows[0][1].ToString();
                objStudent.StudentGender = dtStudent.Rows[0][2].ToString();
                objStudent.StudentDOB = Convert.ToDateTime(dtStudent.Rows[0][3].ToString());
                objStudent.StudentAddress1 = dtStudent.Rows[0][4].ToString();
                objStudent.StudentAddress2 = dtStudent.Rows[0][5].ToString();
                objStudent.StudentAddress3 = dtStudent.Rows[0][6].ToString();
                return View(objStudent);
            }
            else
                return RedirectToAction("Student");
        }

        [HttpPost]
        public ActionResult EditStudent(Student objStudent, int id)
        {
            try
            {
                using (SqlConnection sqlConnetion = new SqlConnection(connectionString))
                {
                    sqlConnetion.Open();
                    String Query = "UPDATE tbl_Student SET FirstName=@FirstName,Surname=@Surname,Gender=@Gender,DateOfBirth=@DateOfBirth,Address1=@Address1,Address2=@Address2,Address3=@Address3 WHERE StudentID=" + id;
                    SqlCommand sqlCmd = new SqlCommand(Query, sqlConnetion);
                    sqlCmd.Parameters.AddWithValue("@FirstName", objStudent.StudentFirstName);
                    sqlCmd.Parameters.AddWithValue("@Surname", objStudent.StudentSurname);
                    sqlCmd.Parameters.AddWithValue("@Gender", objStudent.StudentGender);
                    sqlCmd.Parameters.AddWithValue("@DateOfBirth", objStudent.StudentDOB);
                    sqlCmd.Parameters.AddWithValue("@Address1", objStudent.StudentAddress1);
                    sqlCmd.Parameters.AddWithValue("@Address2", objStudent.StudentAddress2);
                    sqlCmd.Parameters.AddWithValue("@Address3", objStudent.StudentAddress3);
                    sqlCmd.ExecuteNonQuery();
                }
                return RedirectToAction("Student");
            }
            catch
            {
                return View();
            }
        }
  
        [HttpGet]
        public ActionResult Delete(int id)
        {
            using (SqlConnection sqlConnetion = new SqlConnection(connectionString))
            {
                sqlConnetion.Open();
                String Query = "DELETE FROM tbl_Student WHERE StudentID=" + id;
                SqlCommand sqlCmd = new SqlCommand(Query, sqlConnetion);
                sqlCmd.Parameters.AddWithValue("@StudentID", id);
                sqlCmd.ExecuteNonQuery();
            }
            return RedirectToAction("Student");
        }

    }
}
