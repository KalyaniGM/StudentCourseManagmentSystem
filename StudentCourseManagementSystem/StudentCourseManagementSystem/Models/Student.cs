using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace StudentCourseManagementSystem.Models
{
    public class Student
    {
        public int StudentID { get; set; }

        [DisplayName("Student First Name")]
        [Required(ErrorMessage = "Please enter Student First Name.")]
        public string StudentFirstName { get; set; }

        [DisplayName("Student Surname")]
        [Required(ErrorMessage = "Please enter Student Surname Name.")]
        public string StudentSurname { get; set; }

        [DisplayName("Gender")]
        [Required(ErrorMessage = "Please select Student Gender.")]
        public string StudentGender { get; set; }

        [DisplayName("Date of Borth")]
        [DisplayFormat(DataFormatString = "{0:dd MMM yyyy}")]
        [Required(ErrorMessage = "Please select date of birth.")]        
        public DateTime StudentDOB { get; set; }

        [DisplayName("Address1")]
        [Required(ErrorMessage = "Please enter Student Address.")]
        public string StudentAddress1 { get; set; }

        [DisplayName("Address2")]
        public string StudentAddress2 { get; set; }

        [DisplayName("Address3")]
        public string StudentAddress3 { get; set; }
    }

    public enum Gender
    {
        Male,
        Female
    }
    
}