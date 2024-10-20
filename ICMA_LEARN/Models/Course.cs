using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text.RegularExpressions;

namespace ICMA_LEARN.Models
{
    [Table("Courses")]
    public class Course
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public long CourseID { get; set; }
        public long CategoryID { get; set; }
        public string? CourseDescription { get; set; }
        public decimal Price { get; set; }
        [ForeignKey("CategoryID")]
        public Category? Categories { get; set; }

    }
}
