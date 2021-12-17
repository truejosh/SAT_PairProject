using System.ComponentModel.DataAnnotations;

namespace SAT_Pair_Project.DATA.EF//.Metadata
{
    public class ScheduledClassMetadata
    {

        //public int Id { get; set; }


        //public int CourseId { get; set; }

        [Required(ErrorMessage = "A StartDate is required")]
        [DisplayFormat(DataFormatString = "{0:d}", ApplyFormatInEditMode = true)]
        public System.DateTime StartDate { get; set; }

        [Required(ErrorMessage = "The EndDate is required")]
        [DisplayFormat(DataFormatString = "{0:d}", ApplyFormatInEditMode = true)]
        public System.DateTime EndDate { get; set; }

        [StringLength(50, ErrorMessage = "Can not be more than 50 characters")]
        [Display(Name = "Instructor")]
        [Required(ErrorMessage = "The Instructor is required")]
        public string InstructorName { get; set; }

        [StringLength(50, ErrorMessage = "Can not be more than 50 characters")]
        [Required(ErrorMessage = "The Location is required")]
        public string Location { get; set; }

        [Display(Name = "Status")]
        public int SCSID { get; set; }


    }

    [MetadataType(typeof(ScheduledClassMetadata))]
    public partial class ScheduledClass
    {
        public string Semester
        {
            get { return $"{StartDate:d} - {EndDate:d}";}

        }
    }
}
