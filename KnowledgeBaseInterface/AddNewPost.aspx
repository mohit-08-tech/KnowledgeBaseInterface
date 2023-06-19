<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddNewPost.aspx.cs" Inherits="KnowledgeBaseInterface.AddNewPost" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <div class="d-flex p-4">
        <div class="container bg-body shadow rounded">
            <div class="row p-4">
                <div class="flex-column col-md-8">
                    <div class="row pb-3">
                        <h1 class="display-4">Create a new post</h1>
                            <asp:Label runat="server" ID="LblPostStatus" Visible="false" CssClass="text-info font-monospace fs-3"></asp:Label>
                    </div>
                    <div class="row">
                        <div class="form-group pb-3">
                            <asp:Label runat="server" ID="LblDrpdwnCategory" Text="Category*" AssociatedControlID="DrpdwnCategory" CssClass="require text-dark"></asp:Label>
                            <asp:DropDownList runat="server" ID="DrpdwnCategory" CssClass="form-control dropdown dropdown-toggle"></asp:DropDownList>
                        </div>

                        <div class="form-group pb-3">
                            <asp:Label runat="server" ID="LblPostTitle" Text="Title*" AssociatedControlID="TxtPostTitle" CssClass="require text-dark"></asp:Label>
                            <asp:TextBox runat="server" ID="TxtPostTitle" Placeholder="Enter a title for post" CssClass="form-control"></asp:TextBox>
                        </div>

                        <div class="form-group pb-3">
                            <asp:Label runat="server" ID="LblPostDescription" Text="Description*" AssociatedControlID="TextPostDescription" CssClass="require text-dark"></asp:Label>
                            <textarea runat="server" id="TextPostDescription" rows="5" class="form-control" name="description" placeholder="Enter a description"></textarea>
                        </div>

                        <div class="form-group pb-4">
                            <asp:Label runat="server" ID="LblPostTags" Text="Tags" AssociatedControlID="TextPostDescription" CssClass="text-dark"></asp:Label>
                            <asp:TextBox runat="server" ID="TxtPostTags" CssClass="form-control" Placeholder="Enter any tags for your post followed by #"></asp:TextBox>
                        </div>

                        <div class="form-group pb-3">
                            <asp:Button runat="server" ID="BtnCreateNewPost" CssClass="btn btn-primary" OnClientClick="return validateForm(event);" Text="Add new post" OnClick="BtnCreateNewPost_Click" />
                            <a class="btn btn-danger" href="#" data-bs-toggle="modal" data-bs-target="#CancelPostModal">Cancel</a>
                        </div>

                      
                    </div>
                </div>
                <div class="flex-column col-md-4">
                    <img src="images/AddNewPost.svg" alt="addnewpost.svg" width="400" height="100%"/>
                </div>
            </div>
            <%-- Cancel confirmation --%>
            <div class="modal fade" id="CancelPostModal" tabindex="-1" aria-labelledby="CancelPostModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="CancelPostModalLabel">Cancel Post Confirmation</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <p>Are you sure not to share this post?</p>
                        </div>
                        <div class="modal-footer">
                            <a href="Default.aspx" class="btn btn-danger">Yes</a>
                            <button type="button" class="btn btn-primary" data-bs-dismiss="modal">No</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        function validateForm(event) {
            var postCategory = $('#<%= DrpdwnCategory.ClientID %>').val();
            var postTitle = $('#<%= TxtPostTitle.ClientID %>').val().trim();
            var postDescription = $('#<%= TextPostDescription.ClientID %>').val().trim();

            if (postCategory === "" || postCategory === null) {
                alert("Please select a category.");
                return false;
            }

            if (postTitle === "") {
                alert("Please enter a title.");
                return false;
            }

            if (postDescription === "") {
                alert("Please enter a description.");
                return false;
            }

            //if every field is entered then allow
            return true;
        }

        if (window.history.replaceState) {
            window.history.replaceState(null, null, window.location.href);
        }

    </script>

</asp:Content>
