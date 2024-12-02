using System.ComponentModel.DataAnnotations;

namespace FormImplement.Models
{
    public class UserModel
    {
      
       public int? UserID { get; set; }

        [Required(ErrorMessage = "User Name is required")]
        [StringLength(100, ErrorMessage = "User Name can't be longer than 100 characters")]
        public string? UserName { get; set; }

        [Required(ErrorMessage = "Password is required")]
        [StringLength(100, MinimumLength = 6, ErrorMessage = "Password must be at least 6 characters long")]
        public string? Password { get; set; }

        [Required(ErrorMessage = "Email is required")]
        [EmailAddress(ErrorMessage = "Invalid Email Address")]
        public string? Email { get; set; }

        [Required(ErrorMessage = "Phone number is required")]
        [Phone(ErrorMessage = "Invalid Phone Number")]
        public string? MobileNo { get; set; }

        [StringLength(200, ErrorMessage = "Address can't be longer than 200 characters")]
        public string? Address { get; set; }

        public bool IsActive { get; set; }
    }
}
