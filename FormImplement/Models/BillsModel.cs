using System;
using System.ComponentModel.DataAnnotations;

namespace FormImplement.Models
{
    public class BillsModel
    {
       
        public int? BillID { get; set; }

        [Required(ErrorMessage = "Bill number is required.")]
        [StringLength(100, ErrorMessage = "Bill number cannot exceed 100 characters.")]
        public string BillNumber { get; set; }

        [Required(ErrorMessage = "Bill date is required.")]
        [DataType(DataType.Date)]
        public DateTime BillDate { get; set; }

        [Required(ErrorMessage = "Order ID is required.")]
        public int OrderID { get; set; }

        [Required(ErrorMessage = "Total amount is required.")]
        [Range(0, int.MaxValue, ErrorMessage = "Total amount must be a positive value.")]
        public int TotalAmount { get; set; }

        [Required(ErrorMessage = "Discount is required.")]
        [Range(0, int.MaxValue, ErrorMessage = "Discount must be a positive value.")]
        public int Discount { get; set; }

        [Required(ErrorMessage = "Net amount is required.")]
        [Range(0, int.MaxValue, ErrorMessage = "Net amount must be a positive value.")]
        public int NetAmount { get; set; }

        [Required(ErrorMessage = "User ID is required.")]
        public int UserID { get; set; }
    }
    public class UserDropdoenModels
    {
        public int UserID { get; set; }
        public string UserName { get; set; }
    }
}
