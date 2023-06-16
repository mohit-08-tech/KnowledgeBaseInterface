using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KnowledgeBaseInterface
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UserName"] != null) { 
                    NavUserName.InnerText = Convert.ToString(Session["UserName"]);
                }
                else
                {
                    NavUserName.InnerText = "Undefined";
                }
            }
        }

        protected void BtnLogOut_Click(object sender, EventArgs e)
        {
            try
            {
                // Perform logout logic
                FormsAuthentication.SignOut();

                // Clear any existing session
                Session.Abandon();

                // Redirect to the login page or any other desired page
                Response.Redirect("~/Login.aspx");
            }
            catch (Exception ex)
            {
                Session["ErrorMessage"] = ex.Message;
                Response.Redirect("~/ErrorPage.aspx");
            }
        }
    }
}