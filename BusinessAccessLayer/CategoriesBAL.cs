using System;
using System.Collections.Generic;
using System.Text;
using Utilities;
using DataAccessLayer;
namespace BusinessAccessLayer
{
    public class CategoriesBAL
    {
        public List<Categories> GetCategories()
        {
            try
            {
                CategoriesDAL CategoriesObj = new CategoriesDAL();
                return CategoriesObj.GetCategories();
            }catch(Exception ex)
            {
                LogHelper.ErrorFormat("Error in getting categories BAL. Error = {0}", ex.Message);
                return null;
            }
        }
    }
}
