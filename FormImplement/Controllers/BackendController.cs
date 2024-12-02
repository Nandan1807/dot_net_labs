using Microsoft.AspNetCore.Mvc;

namespace BackendTheme.Controllers
{
    public class BackendController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
