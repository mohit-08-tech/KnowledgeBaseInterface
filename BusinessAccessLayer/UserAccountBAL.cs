using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccessLayer;
using Utilities;
namespace BusinessAccessLayer
{
    public class UserAccountBAL
    {
        /// <summary>
        /// Add New user to database
        /// </summary>
        /// <param name="username"></param>
        /// <param name="email"></param>
        /// <param name="password"></param>
        /// <returns></returns>
        public bool CreateAccount(string username, string email, string password, string phone, string designation)
        {
            UserAccountsDAL CreateAccountObj = new UserAccountsDAL();
            return CreateAccountObj.CreateAccount(username, email, password, phone, designation);
        }

        public bool IsUserAlreadyExist(string email)
        {
            UserAccountsDAL CheckAccountObj = new UserAccountsDAL();
            return CheckAccountObj.IsUserAlreadyExist(email);
        }

        public string ValidateUserLogin(string email, string password)
        {
            UserAccountsDAL ValidateUserObj = new UserAccountsDAL();
            return ValidateUserObj.ValidateUserLogin(email, password);
        }

        public UserInfo GetUserInfo(string email)
        {
            UserAccountsDAL GetUserInfoObj = new UserAccountsDAL();
            return GetUserInfoObj.GetUserInfo(email);
        }

        public bool UpdateUserAccount(string username, string email, string phone, string designation)
        {
            UserAccountsDAL UpdateAccountObj = new UserAccountsDAL();
            return UpdateAccountObj.UpdateUserAccount(username, email, phone, designation);
        }
    }
}
