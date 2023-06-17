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
        public bool CreateAccount(string username, string email, string password) { 
            UserAccountsDAL CreateAccountObj = new UserAccountsDAL();
            return CreateAccountObj.CreateAccount(username, email,password);
        }

        public bool IsUserAlreadyExist(string email)
        {
            UserAccountsDAL CheckAccountObj = new UserAccountsDAL();
            return CheckAccountObj.IsUserAlreadyExist(email);
        }

        public string ValidateUserLogin(string email, string password)
        {
            UserAccountsDAL ValidateUserObj = new UserAccountsDAL();
            return ValidateUserObj.ValidateUserLogin(email,password);
        }
    }
}
