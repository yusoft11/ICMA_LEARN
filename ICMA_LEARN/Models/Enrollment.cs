using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ICMA_LEARN.Models
{
    [Table("Enrollment")]
    public class Enrollment
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public long EnrollmentID { get; set; }
        public long UserID { get; set; }
        public long CourseID { get; set; }
        public long CategoryID { get; set; }
        public DateTime EnrollemntDate { get; set; }
        [ForeignKey("CategoryID")]
        public Category? Categories { get; set; }
        [ForeignKey("CourseID")]
        public Course? Courses { get; set; }
        [ForeignKey("UserID")]
        public User? Users { get; set; }
    }
}
