using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

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
                //TODO: Create Account logic

                SignUpMessage.InnerText = string.Empty;
                bool accountCreated = true;
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
            }catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}