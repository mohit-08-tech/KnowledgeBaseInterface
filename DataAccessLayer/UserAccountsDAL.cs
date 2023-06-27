using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using Utilities;
using System.Data;
using System.Configuration;

namespace DataAccessLayer
{
    public class UserAccountsDAL
    {
        private string connectionString;
        private string DataSource;
        private string IntitialCatalog;
        
        public UserAccountsDAL() {
            DataSource = ConfigurationManager.AppSettings["DataSource"];
            IntitialCatalog = ConfigurationManager.AppSettings["IntitialCatalog"];
            connectionString = "Data Source=" + DataSource+ ";Initial Catalog=" + IntitialCatalog + ";Integrated Security=SSPI;Persist Security Info=False;";
        }
        
        public bool CreateAccount(string username, string email,string password, string phone, string designation)
        {
            try
            {
                LogHelper.InfoFormat("Adding New User: {0}", email);
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    using (SqlCommand command = new SqlCommand("AddNewUser", connection))
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        command.Parameters.AddWithValue("@UserId", username);
                        command.Parameters.AddWithValue("@Email", email);
                        command.Parameters.AddWithValue("@Password", password);

                        if (String.IsNullOrEmpty(phone))
                            command.Parameters.AddWithValue("@Phone", (DBNull.Value));
                        else
                            command.Parameters.AddWithValue("@Phone", (phone));

                        if (String.IsNullOrEmpty(designation))
                            command.Parameters.AddWithValue("@Designation", (DBNull.Value));
                        else
                            command.Parameters.AddWithValue("@Designation", (designation));

                        connection.Open();
                        command.ExecuteNonQuery();
                        connection.Close();
                    }
                }
                LogHelper.InfoFormat("New User: {0} Added successfully", email);
                return true;
            }
            catch(Exception ex)
            {
                LogHelper.ErrorFormat("Error in creating new user: {0}. Error = {1}", email, ex.Message);
                return false;
            }
        }

        public bool IsUserAlreadyExist(string email)
        {
            bool IsUserExist = false;
            int count = 0;
            try
            {
                LogHelper.InfoFormat("Checking is user email already exist: {0}", email);
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    using (SqlCommand command = new SqlCommand("IsUserAlreadyExist", connection))
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        command.Parameters.AddWithValue("@Email", email);
                        connection.Open();
                        count = Convert.ToInt32(command.ExecuteScalar());
                        connection.Close();
                    }
                }

                if (count > 0) { 
                    IsUserExist = true;
                }
            }
            catch (Exception ex)
            {
                LogHelper.ErrorFormat("Error in getting user: {0} count. Error = {1}", email, ex.Message);
            }
            return IsUserExist;
        }

        /// <summary>
        /// Checks if user is valid or not. If valid return username.
        /// </summary>
        /// <param name="email"></param>
        /// <param name="password"></param>
        /// <returns></returns>
        public string ValidateUserLogin(string email,string password)
        {
            string UserName = String.Empty;
            try
            {
                LogHelper.InfoFormat("Checking if user: {0} a valid user?", email);
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    using (SqlCommand command = new SqlCommand("ValidateUserLogin", connection))
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        command.Parameters.AddWithValue("@Email", email);
                        command.Parameters.AddWithValue("@Password", password);
                        connection.Open();
                        UserName = Convert.ToString(command.ExecuteScalar());
                        connection.Close();
                    }
                }
            }
            catch(Exception ex)
            {
                LogHelper.ErrorFormat("Error in validating user: {0}. Error = {1}",email,ex.Message);
            }
            return UserName;
        }


        public UserInfo GetUserInfo(string email)
        {
            try
            {
                UserInfo userInfo = null;

                LogHelper.InfoFormat("Getting User Info for: {0}", email);
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    using (SqlCommand command = new SqlCommand("GetUserInfo", connection))
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        command.Parameters.AddWithValue("@Email", email);
                        connection.Open();
                        SqlDataReader reader  = command.ExecuteReader();
                        while(reader.Read())
                        {
                            userInfo = new UserInfo
                            {
                                UserName = (string)reader["UserId"],
                                UserEmail = (string)reader["Email"],
                                IsAdmin = (string)reader["IsAdmin"],
                                UserPhone = (string)reader["Phone"],
                                UserDesignation = (string)reader["Designation"],
                                PostCount = (int)reader["PostCount"]
                            };
                        }
                        connection.Close();
                    }
                }
                return userInfo;
            }
            catch (Exception ex)
            {
                LogHelper.ErrorFormat("Error in getting user infor: {0} count. Error = {1}", email, ex.Message);
                return null;
            }
        }

        public bool UpdateUserAccount(string username, string email, string phone, string designation)
        {
            try
            {
                LogHelper.InfoFormat("Updating User: {0}", email);
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    using (SqlCommand command = new SqlCommand("UpdateUserProfile", connection))
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        command.Parameters.AddWithValue("@Email", email);
                        command.Parameters.AddWithValue("@UserId", username);

                        if (String.IsNullOrEmpty(phone))
                            command.Parameters.AddWithValue("@Phone", (DBNull.Value));
                        else
                            command.Parameters.AddWithValue("@Phone", (phone));

                        if (String.IsNullOrEmpty(designation))
                            command.Parameters.AddWithValue("@Desgination", (DBNull.Value));
                        else
                            command.Parameters.AddWithValue("@Desgination", (designation));

                        connection.Open();
                        command.ExecuteNonQuery();
                        connection.Close();
                    }
                }
                LogHelper.InfoFormat("User: {0} updated successfully", email);
                return true;
            }
            catch (Exception ex)
            {
                LogHelper.ErrorFormat("Error in updating user: {0}. Error = {1}", email, ex.Message);
                return false;
            }
        }
    }
}
