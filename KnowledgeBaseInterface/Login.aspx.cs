using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

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
            LoginStatus.InnerText = string.Empty;
           string username = TxtUserName.Text; // Get the entered username
            string password = TxtPassword.Text; // Get the entered password

            // Validate the credentials
            bool isValidUser = true;

            if (isValidUser)
            {
                // Authenticate the user and set the login status
                FormsAuthentication.SetAuthCookie(username, false);
                Session["UserName"] = username;
                // Redirect the user to the desired page after successful login
                Response.Redirect("~/Default.aspx");
            }
            else
            {
                // Display an error message for invalid credentials
                LoginStatus.InnerText = "Invalid UserName or Password!!";
            }
        }
    }
}