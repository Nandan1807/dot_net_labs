using FormAdmin.Models;
using Microsoft.AspNetCore.Mvc;

namespace FormAdmin.Controllers
{
    public class FormController : Controller
    {
        
        public IActionResult Employee()
        {
            return View();
        }
        public IActionResult Department()
        {
            return View();
        }
        public IActionResult Project()
        {
            return View();
        }
        public IActionResult Employee_Project()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Product(ProductModel productModel) {
            if (ModelState.IsValid) { 
            return RedirectToAction("Product");
            }
            return View("Product",productModel);
        }
    }
}
