namespace ICMA_LEARN.ViewModel
{
    public class CourseViewModel
    {
       public List<CourseItem> CourseItems { get; set; } = new List<CourseItem>();
       public string? ErrorMessage { get; set; }
    }
    public class CourseItem
    {
        public long CategoryId { get; set; }
        public string? CategoryDescription { get; set; }
    }

    public class CreateCourseRequest
    {
        public long CategoryID { get; set; }
        public string? CourseName { get; set; }
        public int Price { get; set; }
    }
}
