using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utilities;
using System.Configuration;

namespace DataAccessLayer
{
    public class CategoriesDAL
    {
        private string connectionString;
        private string DataSource;
        private string IntitialCatalog;

        public CategoriesDAL()
        {
            DataSource = ConfigurationManager.AppSettings["DataSource"];
            IntitialCatalog = ConfigurationManager.AppSettings["IntitialCatalog"];
            connectionString = "Data Source=" + DataSource + ";Initial Catalog=" + IntitialCatalog + ";Integrated Security=SSPI;Persist Security Info=False;";
        }

        public List<Categories> GetCategories()
        {
            try
            {
                LogHelper.Info("Getting Categories list from database");

                List<Categories> lstCategories = new List<Categories>();
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    using (SqlCommand command = new SqlCommand("GetCategories", connection))
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        connection.Open();
                        SqlDataReader reader = command.ExecuteReader();

                        while (reader.Read())
                        {
                            Categories category = new Categories();
                            category.CategoryId = Convert.ToInt32(reader["Id"]);
                            category.CategoryName = reader["Name"].ToString();
                            lstCategories.Add(category);
                        }

                        reader.Close();
                        connection.Close();
                    }
                }

                return lstCategories;
            }
            catch (Exception ex)
            {
                LogHelper.ErrorFormat("Error in getting categories DAL. Error = {0}", ex.Message);
                return null;
            }
        }

    }
}
