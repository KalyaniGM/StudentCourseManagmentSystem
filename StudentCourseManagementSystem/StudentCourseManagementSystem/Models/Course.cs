using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace StudentCourseManagementSystem.Models
{
    public class Course
    {
        public int CourseID { get; set; }

        [DisplayName("Course Code")]
        [Required(ErrorMessage = "Please enter Course Code.")]
        public string CourseCode { get; set; }

        [DisplayName("Course Name")]
        [Required(ErrorMessage = "Please enter Course Name.")]
        public string CourseName { get; set; }

        [DisplayName("Teacher Name")]
        public string TeacherName { get; set; }

        [DisplayName("Start Date")]
        [DisplayFormat(DataFormatString = "{0:dd MMM yyyy}")]
        [Required(ErrorMessage = "Please select start date.")]        
        public DateTime? StartDate { get; set; }

        [Display(Name = "End Date")]
        [DisplayFormat(DataFormatString = "{0:dd MMM yyyy}")]
        [Required(ErrorMessage = "Please select end date.")]       
        public DateTime? EndDate { get; set; }
    }
}