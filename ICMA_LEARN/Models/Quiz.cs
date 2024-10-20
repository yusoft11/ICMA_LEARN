using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ICMA_LEARN.Models
{
    [Table("Quiz")]
    public class Quiz
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public long QuizID { get; set; }
        public long UserID { get; set; }
        public long CourseID { get; set; }
        public long CategoryID { get; set; }
        public string? QuizName { get; set; }
        public DateTime QuizDate { get; set; }
        [ForeignKey("CategoryID")]
        public Category? Categories { get; set; }
        [ForeignKey("CourseID")]
        public Course? Courses { get; set; }
        [ForeignKey("UserID")]
        public User? Users { get; set; }
    }
}
