using Microsoft.AspNetCore.Mvc;

namespace BackendTheme.Controllers
{
    public class FormController : Controller
    {
        public IActionResult Elements()
        {
            return View();
        }
        public IActionResult Layouts()
        {
            return View();

        }
        public IActionResult Editors()
        {
            return View();
        }
        public IActionResult Validator()
        {
            return View();
        }
    }
}
