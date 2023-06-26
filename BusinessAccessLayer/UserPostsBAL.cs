using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccessLayer;
using Utilities;

namespace BusinessAccessLayer
{
    public class UserPostsBAL
    {
        public bool CreateNewPost(int PostCategory, string PostTitle, string PostDescription, string PostTags, string PostAuthor)
        {
            try
            {
                UserPostsDAL UserPostsObj = new UserPostsDAL();
                return UserPostsObj.CreateNewPost(PostCategory,PostTitle,PostDescription,PostTags,PostAuthor);
            }
            catch(Exception ex)
            {
                LogHelper.ErrorFormat("Error in Creating New Post BAL.Error = {0}", ex.Message);
                return false;
            }
        }

        public List<Post> SearchPosts(string SearchString)
        {
            try
            {
                UserPostsDAL UserPostsObj = new UserPostsDAL();
                return UserPostsObj.SearchPosts(SearchString);
            }
            catch(Exception ex)
            {
                LogHelper.ErrorFormat("Error in getting Posts BAL. Error = {0}", ex.Message);
                return null;
            }
        }
    }
}
