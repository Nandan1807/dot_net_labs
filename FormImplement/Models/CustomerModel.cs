using System.ComponentModel.DataAnnotations;

namespace FormImplement.Models
{
    public class CustomerModel
    {
     
        public int? CustomerID { get; set; }

        [Required(ErrorMessage = "Customer Name is required")]
        [StringLength(100, ErrorMessage = "Customer Name can't be longer than 100 characters")]
        public string CustomerName { get; set; }

        [Required(ErrorMessage = "Home Address is required")]
        [StringLength(200, ErrorMessage = "Home Address can't be longer than 200 characters")]
        public string HomeAddress { get; set; }

        [Required(ErrorMessage = "Email is required")]
        [EmailAddress(ErrorMessage = "Invalid Email Address")]
        public string Email { get; set; }

        [Required(ErrorMessage = "Mobile Number is required")]
        [Phone(ErrorMessage = "Invalid Mobile Number")]
        [StringLength(15, ErrorMessage = "Mobile Number can't be longer than 15 characters")]
        public string MobileNo { get; set; }

        [Required(ErrorMessage = "GST Number is required")]
        [StringLength(15, ErrorMessage = "GST Number can't be longer than 15 characters")]
        public string GST_NO { get; set; }

        [Required(ErrorMessage = "City Name is required")]
        [StringLength(50, ErrorMessage = "City Name can't be longer than 50 characters")]
        public string CityName { get; set; }

        [Required(ErrorMessage = "Pin Code is required")]
        [StringLength(10, ErrorMessage = "Pin Code can't be longer than 10 characters")]
        public string PinCode { get; set; }

        [Required(ErrorMessage = "Net Amount is required")]
        [Range(0, int.MaxValue, ErrorMessage = "Net Amount must be a positive number")]
        public int NetAmount { get; set; }

        [Required(ErrorMessage = "User ID is required")]
        public int UserID { get; set; }
    }
    public class CustomerDropDownModel
    {
        public int CustomerID { get; set; }
        public string CustomerName { get; set; }
    }
}
