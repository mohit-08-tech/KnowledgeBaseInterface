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
            try
            {
                if (!IsPostBack)
                {

                    List<TopTags> TopTags = GetTopTags();
                    CreateTopTagsCard(TopTags);

                    List<Post> TopArticles = GetTopArtciles();
                    Session["TopArticles"] = TopArticles;
                    CreatePopularArticlesCards(TopArticles);
                }
            }
            catch (Exception ex)
            {
                Session["ErrorMessage"] = ex.Message;
                Response.Redirect("~/ErrorPage.aspx", false);
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
            catch (Exception ex)
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
            }
            catch (Exception ex)
            {
                LogHelper.ErrorFormat("Error in getting top tags. Error = {0}", ex.Message);
                return null;
            }
        }

        private void CreateTopTagsCard(List<TopTags> TopTags)
        {
            try
            {
                foreach (var Tag in TopTags)
                {
                    if (!String.IsNullOrEmpty(Tag.TagName))
                    {
                        HtmlButton button = new HtmlButton();
                        button.Attributes["class"] = "transparent-button rounded p-1";
                        button.Attributes["value"] = Tag.TagName;
                        button.InnerText = Tag.TagName;
                        button.Attributes["onclick"] = "SearchFromTags(this); return false;";
                        toptagscontainer.Controls.Add(button);
                    }
                }
            }
            catch (Exception ex)
            {
                LogHelper.ErrorFormat("Error in creating top tags card.Error = {0}", ex.Message);
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


        private List<Post> GetTopArtciles()
        {
            try
            {
                TopSearchesBAL TopSearchesObj = new TopSearchesBAL();
                return TopSearchesObj.GetTopArticles();
            }
            catch (Exception ex)
            {
                LogHelper.ErrorFormat("Error in getting top articles. Error = {0}", ex.Message);
                return null;
            }
        }

        private void CreatePopularArticlesCards(List<Post> TopArticles)
        {
            try
            {
                LogHelper.InfoFormat("Creating Poplular articles cards");
               
                foreach(var Article in TopArticles) { 

                    // Create the card container div
                    var cardDiv = new HtmlGenericControl("div");
                    cardDiv.Attributes["class"] = "card card-dimensions shadow-sm bg-body";

                    // Create the card header div
                    var cardHeaderDiv = new HtmlGenericControl("div");
                    cardHeaderDiv.Attributes["class"] = "card-header bg-white";

                    // Create the card title
                    var cardTitle = new HtmlGenericControl("h4");
                    cardTitle.Attributes["class"] = "card-title";
                    cardTitle.Attributes["id"] = Article.PostId.ToString();
                    cardTitle.InnerText = Article.PostTitle.ToString();

                    // Add the card title to the card header
                    cardHeaderDiv.Controls.Add(cardTitle);

                    // Create the card body div
                    var cardBodyDiv = new HtmlGenericControl("div");
                    cardBodyDiv.Attributes["class"] = "card-body";

                    // Create the card text
                    var cardText = new HtmlGenericControl("p");
                    cardText.Attributes["class"] = "card-text ellipsis";
                    cardText.InnerText = Article.PostDescription;

                    // Add the card text to the card body
                    cardBodyDiv.Controls.Add(cardText);

                    // Create the card footer div
                    var cardFooterDiv = new HtmlGenericControl("div");
                    cardFooterDiv.Attributes["class"] = "card-footer bg-white";

                    // Create the button
                    var button = new Button();
                    button.Attributes["class"] = "btn btn-primary rounded";
                    button.Attributes["id"] = Article.PostId.ToString();
                    button.Attributes["onclick"] = "QuickSearch(this); return false;";
                    button.Text = "Read Full Article";

                    // Add the button to the card footer
                    cardFooterDiv.Controls.Add(button);

                    // Add the card header, body, and footer to the card container
                    cardDiv.Controls.Add(cardHeaderDiv);
                    cardDiv.Controls.Add(cardBodyDiv);
                    cardDiv.Controls.Add(cardFooterDiv);

                    PopluarArticlesContainer.Controls.Add(cardDiv);
                }
            }
            catch (Exception ex)
            {
                LogHelper.ErrorFormat("Error in creating popular articles cards. Error = {0}", ex.Message);
                throw ex;
            }
        }

        protected void btnQuickSearch_Click(object sender, EventArgs e)
        {
            try
            {
                string postId = HdnPostId.Value.ToString();
                List<Post> TopArticles = null;
                if (Session["TopArticles"] != null)
                {
                    TopArticles = (List<Post>)Session["TopArticles"];
                }
                else
                {
                    LogHelper.Error("Search Results List not found");
                    return;
                }

                // Retrieve the post based on the selected post ID from the List<Post>
                Post selectedPost = TopArticles.
                                    FirstOrDefault(
                                        p => p.PostId.ToString() == postId
                                    );

                if (selectedPost != null)
                {
                    ViewPostModalLabel.InnerText = "Viewing Post - " + selectedPost.PostTitle;
                    postTitleModal.InnerText = selectedPost.PostTitle;
                    postDescriptionModal.InnerText = selectedPost.PostDescription;
                    PostDateModal.InnerText = selectedPost.PostDate.ToString();
                    PostTagsModal.InnerText = selectedPost.PostTags;
                    PostCategoryModal.InnerText = selectedPost.PostCategoryName;
                    PostAuthorNameModal.InnerText = selectedPost.PostAuthorName;
                    PostAuthorEmailModal.InnerText = "(" + selectedPost.PostAuthorEmail + ")";

                    // Open the modal
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "ViewPostModalScript", "$('#ViewPostModal').modal('show');", true);
                }
            }
            catch (Exception ex)
            {
                LogHelper.ErrorFormat("Error in getting quick search. Error = {0}", ex.Message);
            }
        }
    }
}