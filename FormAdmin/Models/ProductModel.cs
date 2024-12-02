using System.ComponentModel.DataAnnotations;

namespace FormAdmin.Models
{
    public class ProductModel
    {
        public int? ProductID { get; set; }

        [Required(ErrorMessage = "Product Name is required.")]
        [StringLength(100, ErrorMessage = "Product Name cannot be longer than 100 characters.")]
        public string ProductName { get; set; }

        [Required(ErrorMessage = "Product Price is required.")]
        [Range(0.01, double.MaxValue, ErrorMessage = "Product Price must be a positive value.")]
        public double ProductPrice { get; set; }

        [Required(ErrorMessage = "Product Code is required.")]
        [StringLength(50, ErrorMessage = "Product Code cannot be longer than 50 characters.")]
        public string ProductCode { get; set; }

        [StringLength(500, ErrorMessage = "Description cannot be longer than 500 characters.")]
        public string Description { get; set; }

        [Required(ErrorMessage = "Select proper User.")]
        public int UserID { get; set; }

    }
    public class ProductDropDownModel
    {
        public int ProductID { get; set; }
        public string ProductName { get; set; }
    }
}
