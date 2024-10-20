using ICMA_LEARN.Common;
using ICMA_LEARN.Models;
using ICMA_LEARN.ViewModel;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Diagnostics;
using static System.Net.Mime.MediaTypeNames;

namespace ICMA_LEARN.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private readonly MyDbContext _context;
        private readonly IWebHostEnvironment _Environment;
        private readonly IUserSearchHelper _Service;

        public HomeController(ILogger<HomeController> logger, MyDbContext context, IWebHostEnvironment environment, IUserSearchHelper Service)
        {
            _logger = logger;
            _context = context;
            _Environment = environment;
            _Service = Service;
        }

        public IActionResult Index()
        {
            return View();
        }

        public IActionResult Course()
        {
            CourseViewModel model = new CourseViewModel { CourseItems = new List<CourseItem>()};
            try
            {
                model.CourseItems = _context.Categories.Select(c => new CourseItem
                {
                    CategoryId = c.CategoryID,
                    CategoryDescription = c.CategoryDescription

                }).OrderBy(a => a.CategoryId).ToList();

            }
            catch (Exception ex)
            {
                _logger.LogError(ex, ex.Message);
                 model.ErrorMessage = "Error Occurred.";
            }
            return View(model);
        }
        [HttpPost]
        public async Task<IActionResult> CreateCourse(CreateCourseRequest Req)
        {
            ResponseModel response = new ResponseModel();
            try
            {
                if (Request.Form.Files.Count != 0)
                {
                    var file = Request.Form.Files[0];
                    var fileName = $"{Guid.NewGuid()}-{Path.GetFileName(file.FileName)}";
                    var filePath = Path.Combine(_Environment.WebRootPath, "images", fileName);
                    using (var stream = new FileStream(filePath, FileMode.Create))
                    {
                        await file.CopyToAsync(stream);
                    }
                    var courseEntiry = new Course
                    {
                        CategoryID = Req.CategoryID,
                        CourseDescription = Req.CourseName,
                        Price = Req.Price
                    };
                    _context.Courses.Add(courseEntiry);
                    await _context.SaveChangesAsync();
                }
                else
                {
                    response.Errors.Add(new ValidationError("The uploaded file is empty."));
                }
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, ex.Message);
                response.Errors.Add(new ValidationError("Error Occurred."));
            }
            return Json(response);
        }

        public IActionResult UserList()
        {
            return View();
        }

        [HttpPost]
        public IActionResult GetUserList(SearchRequest request)
        {
            UserListSearchResponse response = new UserListSearchResponse();
            try
            {
                var _items = _Service.GetUserList();
                response = new UserListSearchResponse
                {
                    data = SearchUtil.PageResults(_items, request),
                    draw = request.Draw,
                    recordsFiltered = _items.Count(),
                    recordsTotal = _items.Count()
                };
            }
            catch (Exception ex)
            {
                _logger.LogError(ex.Source, ex);
                response.error = "Error Occurred";
            }
            return Json(response);
        }
        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
