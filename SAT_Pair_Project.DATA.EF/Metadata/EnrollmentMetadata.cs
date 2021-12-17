using System.ComponentModel.DataAnnotations;

namespace SAT_Pair_Project.DATA.EF//.Metadata
{
    class EnrollmentMetadata
    {
        [Display(Name = "Enrollment Date")]
        [DisplayFormat(DataFormatString = "{0:d}", ApplyFormatInEditMode = true)]
        public System.DateTime EnrollmentDate { get; set; }
    }
    [MetadataType(typeof(EnrollmentMetadata))]
    public partial class Enrollment { }
}
