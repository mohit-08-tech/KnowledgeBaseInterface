using BusinessAccessLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using Utilities;

namespace KnowledgeBaseInterface
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UserEmail"] != null) {
                    string email = Convert.ToString(Session["UserEmail"]);
                    UserInfo userinfo = GetUserInfo(email);
                    SetUserInfoToApplication(userinfo);

                }
                else
                {
                    NavUserName.InnerText = "Undefined";
                }
            }
        }

        private UserInfo GetUserInfo(string email)
        {
            try
            {
                UserAccountBAL UserInfoObj = new UserAccountBAL();
                return UserInfoObj.GetUserInfo(email);

            }catch(Exception ex)
            {
                LogHelper.ErrorFormat("Error in getting user info for {0}. Error = {1}", email, ex.Message);
                return null;
            }
        }

        private void SetUserInfoToApplication(UserInfo userinfo)
        {
            try
            {
                NavUserName.InnerText = userinfo.UserName;
                UserNameModal.InnerText = userinfo.UserName;
                DesignationModal.InnerText = userinfo.UserDesignation;
                UserEmailModal.InnerText = userinfo.UserEmail;
                UserPhoneModal.InnerText = userinfo.UserPhone;
                IsAdmin.InnerText = userinfo.IsAdmin == "Y" ? "Yes" : "No";
                PostCount.InnerText = userinfo.PostCount.ToString();
            }
            catch (Exception ex )
            {
                LogHelper.ErrorFormat("Error in setting user info to application. Error = {0}", ex.Message);
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
                Response.Redirect("~/Login.aspx",false);
            }
            catch (Exception ex)
            {
                Session["ErrorMessage"] = ex.Message;
                Response.Redirect("~/ErrorPage.aspx");
            }
        }
    }
}