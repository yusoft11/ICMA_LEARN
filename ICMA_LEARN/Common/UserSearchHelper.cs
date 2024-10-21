using ICMA_LEARN.Controllers;
using ICMA_LEARN.Models;
using Microsoft.EntityFrameworkCore;

namespace ICMA_LEARN.Common
{

    public interface IUserSearchHelper
    {
        List<UserListSearchDetail> GetUserList();
    }
    public class UserSearchHelper : IUserSearchHelper
    {
        private readonly ILogger<UserSearchHelper> _logger;
        private readonly MyDbContext _context;
        public UserSearchHelper(ILogger<UserSearchHelper> logger, MyDbContext context) 
        { 
            _logger = logger;
            _context = context;
        }
        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }

        protected virtual void Dispose(bool disposing)
        {
            // Cleanup
            if (disposing && _context != null)
            {
                _context.Dispose();
            }
        }
        public List<UserListSearchDetail> GetUserList()
        {
            List<UserListSearchDetail> Inst = new List<UserListSearchDetail>();

            string sql = "select d.UserID, d.Score [Scores], a.FullName [Names], b.CourseDescription [Courses], c.CategoryDescription [Categories] from Users a," +
                "Courses b, Categories c, QuizScores d where d.UserID = a.UserID and d.CourseID = b.CourseID and b.CategoryID = c.CategoryID order by [Scores] desc";
            Inst = _context.UserListDetails.FromSqlRaw<UserListSearchDetail>(sql).ToList();
            return Inst;
        }
    }
}
