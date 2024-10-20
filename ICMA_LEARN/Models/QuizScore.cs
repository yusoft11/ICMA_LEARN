using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ICMA_LEARN.Models
{
    [Table("QuizScores")]
    public class QuizScore
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public long QuizScoreID { get; set; }
        public long UserID { get; set; }
        public long CourseID { get; set; }
        public long CategoryID { get; set; }
        public long QuizID { get; set; }
        public string? Score { get; set; }
        [ForeignKey("CategoryID")]
        public Category? Categories { get; set; }
        [ForeignKey("CourseID")]
        public Course? Courses { get; set; }
        [ForeignKey("UserID")]
        public User? Users { get; set; }
        [ForeignKey("QuizID")]
        public Quiz? Quizzes { get; set; }
    }
}
