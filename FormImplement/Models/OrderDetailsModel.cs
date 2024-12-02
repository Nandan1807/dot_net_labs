using System.ComponentModel.DataAnnotations;

namespace FormImplement.Models
{
    public class OrderDetailsModel
    {
        
        public int? OrderDetailID { get; set; }

        [Required(ErrorMessage = "Order ID is required")]
        public int OrderID { get; set; }

        [Required(ErrorMessage = "Product ID is required")]
        public int ProductID { get; set; }

        [Required(ErrorMessage = "User ID is required")]
        public int UserID { get; set; }

        [Required(ErrorMessage = "Amount is required")]
        [Range(0, int.MaxValue, ErrorMessage = "Amount must be a positive number")]
        public int Amount { get; set; }

        [Required(ErrorMessage = "Total Amount is required")]
        [Range(0, int.MaxValue, ErrorMessage = "Total Amount must be a positive number")]
        public int TotalAmount { get; set; }

        [Required(ErrorMessage = "Quantity is required")]
        [Range(1, int.MaxValue, ErrorMessage = "Quantity must be at least 1")]
        public int Quantity { get; set; }
    }
    public class ProductDropdownModel
    {
        public int ProductID { get; set; }
        public string ProductName { get; set; }

    }
    public class OrderDropdownModel
    {
        public int OrderID { get; set; }
    }

}
