using System;
using System.ComponentModel.DataAnnotations;

namespace FormImplement.Models
{
    public class OrderModel
    {
        [Key]
         
        public int? OrderID { get; set; }

        [Required(ErrorMessage = "Customer ID is required")]
        public int? CustomerID { get; set; }

        [Required(ErrorMessage = "Order Date is required")]
        [DataType(DataType.Date, ErrorMessage = "Invalid date format")]
        public string OrderDate { get; set; }

        [Required(ErrorMessage = "Payment Mode is required")]
        [StringLength(50, ErrorMessage = "Payment Mode can't be longer than 50 characters")]
        public string PaymentMode { get; set; }

        [Required(ErrorMessage = "Shipping Address is required")]
        [StringLength(200, ErrorMessage = "Shipping Address can't be longer than 200 characters")]
        public string ShippingAddress { get; set; }

        [Required(ErrorMessage = "User ID is required")]
        public int? UserID { get; set; }

        [Required(ErrorMessage = "Total Amount is required")]
        [Range(0, int.MaxValue, ErrorMessage = "Total Amount must be a positive number")]
        public int TotalAmount { get; set; }
    }
    public class UserDropdownModel
    {
        public int UserID { get; set; }
        public string UserName { get; set; }
    }
  
}
