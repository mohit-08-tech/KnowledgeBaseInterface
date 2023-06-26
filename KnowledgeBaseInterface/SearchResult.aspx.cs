using BusinessAccessLayer;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Utilities;

namespace KnowledgeBaseInterface
{
    public partial class SearchResult : Authenticated
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                string SearchString = GetSearchString();

                if (String.IsNullOrEmpty(SearchString))
                {
                    SearchMsg.Text = "No Search Query found. Please enter any search query and try again";
                    return;
                }

                List<Post> SearchResults  = GetPosts(SearchString);
                if(SearchResults.Count == 0)
                {
                    SearchMsg.Text = "No Search Results Found!";
                    return;
                }

                Session["SearchResults"] = SearchResults;
                CreateSearchResultCards(SearchResults);

            }
        }

        private string GetSearchString()
        {
            if (Session["SearchString"] == null)
                return null;

            return Convert.ToString(Session["SearchString"]);
        }

        private List<Post> GetPosts(string SearchString)
        {
            UserPostsBAL SearchPostObj = new UserPostsBAL();
            return SearchPostObj.SearchPosts(SearchString);
        }

        private void CreateSearchResultCards(List<Post> SearchResults)
        {
            try
            {
                LogHelper.Info("Creating cards from serach results");

                foreach (var post in SearchResults)
                {
                    // Create the HTML elements dynamically
                    HtmlGenericControl containerDiv = new HtmlGenericControl("div");
                    containerDiv.Attributes["class"] = "container bg-body shadow-lg p-3 mt-4 rounded-1";

                    HtmlGenericControl titleDiv = new HtmlGenericControl("div");
                    titleDiv.Attributes["class"] = "row pb-2";

                    // Create the anchor control
                    HtmlAnchor titleLink = new HtmlAnchor();
                    titleLink.HRef = "#";
                    titleLink.Attributes["data-post-id"] = post.PostId.ToString();
                    titleLink.InnerText = post.PostTitle;
                    titleLink.Attributes["class"] = "text-decoration-underline link-info fs-2 fw-bold";

                    // Attach the click event using JavaScript
                    titleLink.Attributes["onclick"] = "titleLink_Click(this); return false;";

                    HtmlGenericControl descriptionDiv = new HtmlGenericControl("div");
                    descriptionDiv.Attributes["class"] = "row";

                    HtmlGenericControl descriptionP = new HtmlGenericControl("p");
                    descriptionP.InnerText = post.PostDescription;
                    descriptionP.Attributes["class"] = "ellipsis";

                    // Append the elements to the container hierarchy
                    titleDiv.Controls.Add(titleLink);
                    containerDiv.Controls.Add(titleDiv);
                    descriptionDiv.Controls.Add(descriptionP);
                    containerDiv.Controls.Add(descriptionDiv);

                    // Add the container to the placeholder control on the page
                    postContainer.Controls.Add(containerDiv);
                }
            }
            catch(Exception ex)
            {
                LogHelper.ErrorFormat("Error in creating search result cards. Error = {0}", ex.Message);
                throw ex;
            }
           
        }

        protected void btnTest_Click(object sender, EventArgs e)
        {
            string postId = HdnPostId.Value.ToString();
            List<Post> SearchResults = null;
            if (Session["SearchResults"] != null)
            {
               SearchResults = (List<Post>)Session["SearchResults"];
            }else
            {
                LogHelper.Error("Search Results List not found");
                return;
            }

            // Retrieve the post based on the selected post ID from the List<Post>
            Post selectedPost = SearchResults.FirstOrDefault(p => p.PostId.ToString() == postId);

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
    }
}