using System.ComponentModel.DataAnnotations;

namespace SAT_Pair_Project.DATA.EF//.Metadata
{
    class StudentStatusMetadata
    {
        [Required(ErrorMessage = "Student Status")]
        [StringLength(50, ErrorMessage = "*Must be 50 characters or less")]
        public string SSName { get; set; }

        [UIHint("MultilineText")]
        [DisplayFormat(NullDisplayText = "N/A")]
        public string SSDescription { get; set; }
    }
    [MetadataType(typeof(StudentStatusMetadata))]
    public partial class StudentStatus { }
}
