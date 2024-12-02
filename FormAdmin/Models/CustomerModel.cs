using System.ComponentModel.DataAnnotations;

namespace FormAdmin.Models
{
    public class CustomerModel
    {
        [Key]
        public int? CustomerID { get; set; }

        [Required(ErrorMessage = "Customer name is required")]
        [StringLength(100, ErrorMessage = "Customer name cannot be longer than 100 characters")]
        public string CustomerName { get; set; }

        [Required(ErrorMessage = "Home address is required")]
        [StringLength(200, ErrorMessage = "Home address cannot be longer than 200 characters")]
        public string HomeAddress { get; set; }

        [Required(ErrorMessage = "Email is required")]
        [EmailAddress(ErrorMessage = "Invalid email address")]
        public string Email { get; set; }

        [Required(ErrorMessage = "Mobile number is required")]
        [Range(1000000000, 9999999999, ErrorMessage = "Mobile number must be a valid 10-digit number")]
        public long MobileNo { get; set; }

        [Required(ErrorMessage = "GST number is required")]
        [StringLength(15, ErrorMessage = "GST number cannot be longer than 15 characters")]
        public string GST_NO { get; set; }

        [Required(ErrorMessage = "City name is required")]
        [StringLength(50, ErrorMessage = "City name cannot be longer than 50 characters")]
        public string CityName { get; set; }

        [Required(ErrorMessage = "Pin code is required")]
        [Range(100000, 999999, ErrorMessage = "Pin code must be a valid 6-digit number")]
        public int PinCode { get; set; }

        [Required(ErrorMessage = "Net amount is required")]
        [Range(0, double.MaxValue, ErrorMessage = "Net amount must be a positive number")]
        public float NetAmount { get; set; }

        [Required(ErrorMessage = "Select proper User")]
        public int UserID { get; set; }
    }
    
}
