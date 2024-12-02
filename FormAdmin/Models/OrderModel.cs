using System;
using System.ComponentModel.DataAnnotations;

namespace FormAdmin.Models
{
    public class OrderModel
    {
        [Key]
        public int? OrderID { get; set; }

        [Required(ErrorMessage = "Order Date is required")]
        [DataType(DataType.Date)]
        public DateTime OrderDate { get; set; }

        [Required(ErrorMessage = "Select proper customer")]
        public int CustomerID { get; set; }

        [Required(ErrorMessage = "Payment Mode is required")]
        [StringLength(50, ErrorMessage = "Payment Mode cannot exceed 50 characters")]
        public string PaymentMode { get; set; }

        [Required(ErrorMessage = "Total Amount is required")]
        [Range(0, double.MaxValue, ErrorMessage = "Total Amount must be a positive number")]
        public float TotalAmount { get; set; }

        [Required(ErrorMessage = "Shipping Address is required")]
        [StringLength(255, ErrorMessage = "Shipping Address cannot exceed 255 characters")]
        public string ShippingAddress { get; set; }

        [Required(ErrorMessage = "Select proper User")]
        public int UserID { get; set; }
    }
    public class CustomerDropDownModel
    {
        public int CustomerID { get; set; }
        public string CustomerName { get; set; }
    }
    public class OrderDropDownModel
    {
        public int OrderID { get; set; }
    }
}
