using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KnowledgeBaseInterface
{
    public partial class ErrorPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                string ErrorMessage = string.Empty;
                if (Session["ErrorMessage"] != null)
                {
                    ErrorMessage = Convert.ToString(Session["ErrorMessage"]);
                    TxtErrorMessage.InnerText= ErrorMessage;
                }
                else
                {
                    TxtErrorMessage.InnerText = "Please try again later.";
                }
              
            }
        }
    }
}