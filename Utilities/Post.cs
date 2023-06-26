using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Utilities
{
    public class Post
    {
        public Guid PostId { get; set; }
        public string PostTitle { get; set; }
        public string PostDescription { get; set; }
        public long PostCategory { get; set; }
        public string PostCategoryName { get; set; }
        public string PostTags { get; set; }
        public string PostAuthorName { get; set; }
        public string PostAuthorEmail{ get; set; }

        public DateTime PostDate { get; set; }
    }
}
