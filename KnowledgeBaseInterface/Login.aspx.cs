using BusinessAccessLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Security;
using Utilities;
namespace KnowledgeBaseInterface
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }

        protected void BtnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                LogHelper.Info("Logging in");
                LoginStatus.InnerText = string.Empty;
                string useremail = TxtUserEmail.Text; // Get the entered username
                string password = TxtPassword.Text; // Get the entered password

                LogHelper.InfoFormat("Checking if user: {0} is valid",useremail);
                UserAccountBAL ValidateUserObj = new UserAccountBAL();
              
                // Validate the credentials
                string ValidUserName = ValidateUserObj.ValidateUserLogin(useremail,password);

                if (!String.IsNullOrEmpty(ValidUserName))
                {
                    // Authenticate the user and set the login status
                    FormsAuthentication.SetAuthCookie(ValidUserName, false);
                    Session["UserName"] = ValidUserName;
                    Session["UserEmail"] = useremail;
                    LogHelper.Info("Valid User. Navigating to Home page.");
                    // Redirect the user to the desired page after successful login
                    Response.Redirect("~/Default.aspx",false);
                }
                else
                {
                    LogHelper.ErrorFormat("Invalid User: {0}",useremail);
                    // Display an error message for invalid credentials
                    LoginStatus.InnerText = "Invalid UserName or Password!!";
                }
            }
            catch (Exception ex)
            {
                LogHelper.ErrorFormat("Error in Login. Error = {0}",ex.Message);
                Session["ErrorMessage"] = ex.Message;
                Response.Redirect("~/ErrorPage.aspx", false);
            }
        }
    }
}