using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessAccessLayer;
using Utilities;

namespace KnowledgeBaseInterface
{
    public partial class AddNewPost : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCategories();
            }
        }

        protected void BtnCreateNewPost_Click(object sender, EventArgs e)
        {
            try
            {
                LblPostStatus.Visible = false;

                int PostCategory = 0;
                string PostTitle = string.Empty;
                string PostDescription = string.Empty;
                string PostTags = string.Empty;
                string PostAuthor = string.Empty;

                PostCategory = Convert.ToInt32(DrpdwnCategory.SelectedItem.Value);
                PostTitle = TxtPostTitle.Text.Trim();
                PostDescription = TextPostDescription.InnerText.Trim();
                PostTags = TxtPostTags.Text.Trim();
                PostAuthor = Session["UserName"] != null ? Convert.ToString(Session["UserName"]) : string.Empty;
                
                UserPostsBAL UserPostsObj = new UserPostsBAL();
                bool postCreated = UserPostsObj.CreateNewPost(PostCategory,PostTitle,PostDescription,PostTags,PostAuthor);

                if (postCreated)
                {
                    LblPostStatus.Text = "Your post has been submitted successfully";
                    LblPostStatus.CssClass = "text-info font-monospace fs-3";
                    LblPostStatus.Visible = true;
                    ClearForm();
                }
                else
                {
                    LblPostStatus.Text = "We couldn't submit your post at this moment. Please try again later";
                    LblPostStatus.CssClass = "text-danger font-monospace fs-3";
                    LblPostStatus.Visible = true;
                }

            }catch (Exception ex)
            {
                Session["ErrorMessage"] = ex.Message;
                Response.Redirect("~/ErrorPage.aspx", false);
            }
        }

        private void LoadCategories()
        {
            try
            {
                LogHelper.Info("Loading Categories list from database");

                CategoriesBAL CategoriesObj = new CategoriesBAL();
                List<Categories> LstCategories = CategoriesObj.GetCategories();
                
                if(LstCategories.Count == 0 || LstCategories == null) {
                    LogHelper.ErrorFormat("No categories found to load!!");
                    throw new NotImplementedException();
                }

                LstCategories.Insert(0, new Categories { CategoryId = 0, CategoryName = "--Select a category--" });

                DrpdwnCategory.DataTextField = "CategoryName";
                DrpdwnCategory.DataValueField = "CategoryId";
                DrpdwnCategory.DataSource = LstCategories;
                DrpdwnCategory.DataBind();

                DrpdwnCategory.SelectedIndex = 0;
                DrpdwnCategory.Items[0].Attributes["disabled"] = "disabled";

                LogHelper.Info("Categories Datasource Loaded"); 
            }
            catch (Exception ex)
            {
                Session["ErrorMessage"] = ex.Message;
                Response.Redirect("~/ErrorPage.aspx", false);
            }
        }

        private void ClearForm()
        {
            try
            {
                LogHelper.Info("Clearing AddNewPost Form");
                TxtPostTitle.Text = string.Empty;
                TextPostDescription.InnerText = string.Empty;
                TxtPostTags.Text = string.Empty;
                DrpdwnCategory.SelectedIndex = -1;
            }
            catch(Exception ex)
            {
                LogHelper.ErrorFormat("Error in cleaning AddNewPost form.Error = {0}", ex.Message);
                throw ex;
            }
        }
    }
}