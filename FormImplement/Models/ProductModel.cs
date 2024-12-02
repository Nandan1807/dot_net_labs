using System.ComponentModel.DataAnnotations;

namespace FormImplement.Models
{
    public class ProductModel
    {
        
        public int? ProductID { get; set; }

        [Required(ErrorMessage = "Product Name is required")]
        [StringLength(100, ErrorMessage = "Product Name can't be longer than 100 characters")]
        public string ProductName { get; set; }

        [Required(ErrorMessage = "Product Price is required")]
        [Range(0, int.MaxValue, ErrorMessage = "Product Price must be a positive number")]
        public int ProductPrice { get; set; }

        [Required(ErrorMessage = "Product Code is required")]
        [StringLength(50, ErrorMessage = "Product Code can't be longer than 50 characters")]
        public string ProductCode { get; set; }

        [StringLength(500, ErrorMessage = "Description can't be longer than 500 characters")]
        public string Description { get; set; }

        [Required(ErrorMessage = "User ID is Selected")]
        public int UserID { get; set; }
    }

    public class UserDropDownModel
    {
        public int UserID { get; set; }
        public string UserName { get; set; }
        
    }
}
