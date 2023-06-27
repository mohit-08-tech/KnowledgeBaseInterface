using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utilities;

namespace DataAccessLayer
{
    public class TopSearchesDAL
    {
        private string connectionString;
        private string DataSource;
        private string IntitialCatalog;

        public TopSearchesDAL()
        {
            DataSource = ConfigurationManager.AppSettings["DataSource"];
            IntitialCatalog = ConfigurationManager.AppSettings["IntitialCatalog"];
            connectionString = "Data Source=" + DataSource + ";Initial Catalog=" + IntitialCatalog + ";Integrated Security=SSPI;Persist Security Info=False;";
        }

        public List<TopTags> GetTopTags()
        {
            List<TopTags> TopTags = new List<TopTags>();
            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    using (SqlCommand command = new SqlCommand("GetTopTags", connection))
                    {
                        command.CommandType = CommandType.StoredProcedure;

                        connection.Open();
                        SqlDataReader reader = command.ExecuteReader();

                        while (reader.Read())
                        {
                            TopTags.Add(new TopTags()
                            {
                                TagName = (string)reader["PostTags"]
                            });
                        }
                    }
                }
                return TopTags;
            }
            catch (Exception ex)
            {
                LogHelper.ErrorFormat("Error in getting top tags DAL. Error = {0}", ex.Message);
                return null;
            }
        }

        public List<Post> GetTopArticles()
        {
            List<Post> ResultPosts = new List<Post>();
            try
            {
                LogHelper.Info("Searching top articles in database");

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    using (SqlCommand command = new SqlCommand("GetTopArticles", connection))
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        connection.Open();
                        SqlDataReader reader = command.ExecuteReader();

                        while (reader.Read())
                        {
                            Post post = new Post
                            {
                                PostId = (Guid)reader["PostId"],
                                PostTitle = (string)reader["PostTitle"],
                                PostDescription = (string)reader["PostDescription"],
                                PostCategory = Convert.ToInt64(reader["PostCategoryId"]),
                                PostCategoryName = (string)reader["PostCategoryName"],
                                PostTags = (string)reader["PostTags"],
                                PostAuthorName = (string)reader["PostAuthorName"],
                                PostAuthorEmail = (string)reader["PostAuthorEmail"],
                                PostDate = (DateTime)reader["PostDate"]
                            };

                            ResultPosts.Add(post);
                        }
                    }
                }

                return ResultPosts;
            }
            catch (Exception ex)
            {
                LogHelper.ErrorFormat("Error in getting top artciles DAL. Error = {0}", ex.Message);
                return null;
            }
        }
    }
}
