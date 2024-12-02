using System.ComponentModel.DataAnnotations;

namespace FormAdmin.Models
{
    public class OrderDetailModel
    {
        [Key]
        public int? OrderDetailID { get; set; }

        [Required(ErrorMessage = "Select proper Order")]
        public int OrderID { get; set; }

        [Required(ErrorMessage = "Select proper Product")]
        public int ProductID { get; set; }

        [Required(ErrorMessage = "Quantity is required")]
        [Range(1, int.MaxValue, ErrorMessage = "Quantity must be a positive integer")]
        public int Quantity { get; set; }

        [Required(ErrorMessage = "Amount is required")]
        [Range(0, double.MaxValue, ErrorMessage = "Amount must be a positive number")]
        public float Amount { get; set; }

        [Required(ErrorMessage = "Total Amount is required")]
        [Range(0, double.MaxValue, ErrorMessage = "Total Amount must be a positive number")]
        public float TotalAmount { get; set; }

        [Required(ErrorMessage = "Select Proper User")]
        public int UserID { get; set; }
    }
}
