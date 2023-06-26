using BusinessAccessLayer;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Utilities;

namespace KnowledgeBaseInterface
{
    public partial class _Default : Authenticated
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                List<TopTags> TopTags = GetTopTags();
                CreateTopTagsCard(TopTags);


            }
        }

        protected void BtnSearchPosts_Click(object sender, EventArgs e)
        {
            try
            {
                LogHelper.Info("Calling Search Page");
                
                Session["SearchString"] = TxtSearchBox.Text.Trim();
                Response.Redirect("SearchResult.aspx", false);
            }
            catch(Exception ex)
            {
                LogHelper.ErrorFormat("Error in Calling Search Page. Error = {0}", ex.Message);
                Session["ErrorMessage"] = ex.Message;
                Response.Redirect("~/ErrorPage.aspx", false);
            }
          
        }

        private List<TopTags> GetTopTags()
        {
            try
            {
                TopSearchesBAL TopSearchesObj = new TopSearchesBAL();
                return TopSearchesObj.GetTopTags();
            }catch(Exception ex)
            {
                return null;
            }
        }

        private void CreateTopTagsCard(List<TopTags> TopTags)
        {
            try
            {
                foreach (var Tag in TopTags)
                {
                    HtmlButton button = new HtmlButton();
                    button.Attributes["class"] = "transparent-button rounded p-1";
                    button.Attributes["value"] = Tag.TagName;
                    button.InnerText = Tag.TagName;
                    button.Attributes["onclick"] = "SearchFromTags(this); return false;";
                    toptagscontainer.Controls.Add(button);
                }
            }catch(Exception ex)
            {
                LogHelper.ErrorFormat("Error in creating top tags card.Error = {0}",ex.Message);
            }
        }

        protected void SearchFromTopTags(object sender, EventArgs e)
        {
            try
            {
                if (String.IsNullOrEmpty(HdnValue.Value))
                {
                    LogHelper.Error("No value found from top tags");
                    throw new KeyNotFoundException();
                }

                Session["SearchString"] = HdnValue.Value.ToString();
                Response.Redirect("SearchResult.aspx", false);
            }
            catch (Exception ex)
            {
                LogHelper.ErrorFormat("Error in SearchFromTopTags. Error = {0}", ex.Message);
                Session["ErrorMessage"] = ex.Message;
                Response.Redirect("~/ErrorPage.aspx", false);
            }
        }

    }
}