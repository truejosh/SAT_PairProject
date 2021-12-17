using System.ComponentModel.DataAnnotations;

namespace SAT_Pair_Project.DATA.EF//.Metadata
{
    public class StudentMetadata
    {
        //public int Id { get; set; }

        [Required(ErrorMessage = "You must enter a Firstname")]
        [StringLength(50, ErrorMessage = "Can not be more than 50 characters")]
        [Display(Name = "First Name")]
        public string FirstName { get; set; }

        [Required(ErrorMessage = "You must enter a Lastname")]
        [StringLength(50, ErrorMessage = "Can not be more than 50 characters")]
        [Display(Name = "Last Name")]
        public string LastName { get; set; }

        [DisplayFormat(NullDisplayText = "[N/A]")]
        [StringLength(50, ErrorMessage = "Can not be more than 50 characters")]
        public string Major { get; set; }

        [Required(ErrorMessage = "You must enter a Address")]
        [StringLength(50, ErrorMessage = "Can not be more than 50 characters")]
        public string Address { get; set; }

        [Required(ErrorMessage = "You must enter a City")]
        [StringLength(50, ErrorMessage = "Can not be more than 50 characters")]
        public string City { get; set; }

        [DisplayFormat(NullDisplayText = "[N/A]")]
        [StringLength(2, ErrorMessage = "Can not be more than 2 characters")]
        public string State { get; set; }

        [DisplayFormat(NullDisplayText = "[N/A]")]
        [StringLength(10, ErrorMessage = "Can not be more than 10 characters")]
        public string ZipCode { get; set; }

        [DisplayFormat(NullDisplayText = "[N/A]")]
        [StringLength(12, ErrorMessage = "Can not be more than 12 characters")]
        public string Phone { get; set; }

        [Required(ErrorMessage = "You must enter a Email")]
        [StringLength(50, ErrorMessage = "Can not be more than 50 characters")]
        public string Email { get; set; }

        [Display(Name = "Photo")]
        [DisplayFormat(NullDisplayText = "[N/A]")]
        [StringLength(100, ErrorMessage = "Can not be more than 100 characters")]
        public string PhotoUrl { get; set; }

        //public int SSID { get; set; }
    }
    [MetadataType(typeof(StudentMetadata))]
    public partial class Student
    {
        [Display(Name = "Full Name")]
        public string FullName =>
            FirstName + " " + LastName;
        
        public string Display=>
             FullName + " " + " " + " - " + " "+ " " + Email; 
    }
}
