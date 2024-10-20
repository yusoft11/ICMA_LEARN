using ICMA_LEARN.Models;

namespace ICMA_LEARN.Common
{
    public class UserListSearchResponse : SearchResponse<UserListSearchDetail>
    {

    }
    public class UserListSearchDetail : SearchDetail
    {
        public long UserID { get; set; }
        public int Scores { get; set; }
        public string? Names { get; set; }
        public string? Courses { get; set; }
        public string? Categories { get; set; }
    }
}
