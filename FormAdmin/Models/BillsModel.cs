using System;
using System.ComponentModel.DataAnnotations;

namespace FormAdmin.Models
{
    public class BillsModel
    {
        [Key]
        public int? BillID { get; set; }

        [Required(ErrorMessage = "Bill number is required")]
        [StringLength(50, ErrorMessage = "Bill number cannot be longer than 50 characters")]
        public string BillNumber { get; set; }

        [Required(ErrorMessage = "Bill date is required")]
        public DateTime BillDate { get; set; }

        [Required(ErrorMessage = "Select Appropriate Order")]
        public int OrderID { get; set; }

        [Required(ErrorMessage = "Total amount is required")]
        [Range(0, double.MaxValue, ErrorMessage = "Total amount must be a positive number")]
        public float TotalAmount { get; set; }

        [Range(0, 100, ErrorMessage = "Discount must be between 0 and 100")]
        public float Discount { get; set; }

        [Required(ErrorMessage = "Net amount is required")]
        [Range(0, double.MaxValue, ErrorMessage = "Net amount must be a positive number")]
        public float NetAmount { get; set; }

        [Required(ErrorMessage = "Select Appropriate User")]
        public int UserID { get; set; }
    }
}
