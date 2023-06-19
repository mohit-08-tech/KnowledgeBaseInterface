using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utilities;

namespace DataAccessLayer
{
    public class UserPostsDAL
    {
        private string connectionString;
        private string DataSource;
        private string IntitialCatalog;

        public UserPostsDAL()
        {
            DataSource = ConfigurationManager.AppSettings["DataSource"];
            IntitialCatalog = ConfigurationManager.AppSettings["IntitialCatalog"];
            connectionString = "Data Source=" + DataSource + ";Initial Catalog=" + IntitialCatalog + ";Integrated Security=SSPI;Persist Security Info=False;";
        }

        public bool CreateNewPost(int PostCategory,string PostTitle,string PostDescription,string PostTags,string PostAuthor)
        {
            try
            {
                LogHelper.InfoFormat("Creating New Post");
                LogHelper.InfoFormat("DEBUG: PostCategory:{0},PostTitle:{1},PostDescription:{2},PostTags:{3},PostAuthor:{4}",PostCategory,PostTitle, PostTags,PostDescription,PostAuthor);
               
                if(PostCategory < 0)
                {
                    LogHelper.ErrorFormat("Invalid PostCategory: {0}",PostCategory);
                    throw new NotSupportedException();
                }

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    using (SqlCommand command = new SqlCommand("CreateNewPost", connection))
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        command.Parameters.AddWithValue("@PostCateogry", PostCategory);
                        command.Parameters.AddWithValue("@PostTitle", PostTitle);
                        command.Parameters.AddWithValue("@PostDescription", PostDescription);

                        if (String.IsNullOrEmpty(PostTags))
                            command.Parameters.AddWithValue("@PostTags",(DBNull.Value));
                        else
                            command.Parameters.AddWithValue("@PostTags",(PostTags));

                        if (String.IsNullOrEmpty(PostAuthor))
                            command.Parameters.AddWithValue("@PostAuthor", (DBNull.Value));
                        else
                            command.Parameters.AddWithValue("@PostAuthor", (PostAuthor));

                        connection.Open();
                        command.ExecuteNonQuery();
                        connection.Close();
                    }
                }

                LogHelper.Info("New Post Created Successfully");
                return true;
            } 
            catch(Exception ex) 
            {
                LogHelper.ErrorFormat("Error in creating UserPosts DAL. Error = {0}", ex.Message);
                return false;
            }
        }
    }
}
