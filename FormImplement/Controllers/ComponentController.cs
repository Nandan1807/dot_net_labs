using Microsoft.AspNetCore.Mvc;

namespace BackendTheme.Controllers
{
    public class ComponentController : Controller
    {
        [Route("/Component/Alert")]
        public IActionResult Alert()
        {
            return View();
        }

        [Route("/Component/Accordion")]
        public IActionResult Accordion()
        {
            return View();
        }
        [Route("/Component/Badges")]
        public IActionResult Badges()
        {
            return View();
        }
        [Route("/Component/Breadcrumbs")]
        public IActionResult Breadcrumbs()
        {
            return View();
        }
        [Route("/Component/Buttons")]
        public IActionResult Buttons()
        {
            return View();
        }
        [Route("/Component/Cards")]
        public IActionResult Cards()
        {
            return View();
        }
        [Route("/Component/Carousel")]
        public IActionResult Carousel()
        {
            return View();
        }
        [Route("/Component/ListGroup")]
        public IActionResult ListGroup()
        {
            return View();
        }
        [Route("/Component/Model")]
        public IActionResult Model()
        {
            return View();
        }
        [Route("/Component/Tabs")]
        public IActionResult Tabs()
        {
            return View();
        }
        public IActionResult Pagination()
        {
            return View();
        }
        public IActionResult Progress()
        {
            return View();
        }
        public IActionResult Spinners()
        {
            return View();
        }
        public IActionResult Tooltips()
        {
            return View();
        }
    }
}
