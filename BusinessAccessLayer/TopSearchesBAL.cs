using DataAccessLayer;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utilities;

namespace BusinessAccessLayer
{
    public class TopSearchesBAL
    {
        public List<TopTags> GetTopTags()
        {
            try
            {
                TopSearchesDAL TopTagsObj = new TopSearchesDAL();
                return TopTagsObj.GetTopTags();
            }
            catch (Exception ex)
            {
                LogHelper.ErrorFormat("Error in getting top tags BAL. Error = {0}", ex.Message);
                return null;
            }
        }
    }
}
