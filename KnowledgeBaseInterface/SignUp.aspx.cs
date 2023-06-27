using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessAccessLayer;
namespace KnowledgeBaseInterface
{
    public partial class SignUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnCreateAccount_Click(object sender, EventArgs e)
        {
            try {
                SignUpMessage.InnerText = string.Empty;
                string username = TxtUserName.Text.Trim();
                string password = TxtPassword.Text.Trim();
                string email = TxtEmail.Text.Trim();
                string phone = TxtPhone.Text.Trim();
                string designation = TxtDesignation.Text.Trim();

                UserAccountBAL UserAccount = new UserAccountBAL();
                bool IsUserAlreadyExist = UserAccount.IsUserAlreadyExist(email);
                if(IsUserAlreadyExist )
                {
                    SignUpMessage.InnerText = "There's already a account registered with same email";
                    AfterSignUpLogin.Visible = true;
                    return;
                }

                bool accountCreated = UserAccount.CreateAccount(username,email,password,phone, designation);
                if (accountCreated) { 
                    SignUpMessage.InnerText = "Your account has been registered successfully!!";
                    AfterSignUpLogin.Visible = true;
                    ClearForm();
                }
                else
                {
                    SignUpMessage.InnerText = "Something wen't wrong.Please try again later.";
                }
            }
            catch (Exception ex)
            {
                SignUpMessage.InnerText = ex.Message;
                AfterSignUpLogin.Visible = false;
            }
        }

        private void ClearForm()
        {
            try
            {
                TxtUserName.Text= string.Empty;
                TxtEmail.Text= string.Empty;
                TxtPassword.Text= string.Empty;
                TxtConfirmPassword.Text= string.Empty;
                TxtPhone.Text = string.Empty;
                TxtDesignation.Text = string.Empty;
            }catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}