using System;

namespace KnowledgeBaseInterface
{
    public partial class Authenticated : System.Web.UI.Page
    {
        protected override void OnLoad(EventArgs e)
        {
          
                base.OnLoad(e);

                // Check if the user is logged in
                if (!User.Identity.IsAuthenticated)
                {
                    // Redirect the user to the login page or display an error message
                    Response.Redirect("~/Login.aspx");
                }
        }
    }
}