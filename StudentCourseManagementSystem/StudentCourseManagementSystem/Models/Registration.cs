using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace StudentCourseManagementSystem.Models
{
    public class Registration
    {
        public int StudentID { get; set; }

        [DisplayName("Student First Name")]
        [Required(ErrorMessage = "Please enter Student First Name.")]
        public string StudentFirstName { get; set; }

        [DisplayName("Student Surname")]
        [Required(ErrorMessage = "Please enter Student Surname Name.")]
        public string StudentSurname { get; set; }

        public int CourseID { get; set; }

        public string CourseCode { get; set; }

        [DisplayName("Course Name")]
        [Required(ErrorMessage = "Please select Course Name.")]
        public string CourseName { get; set; }
    }
}