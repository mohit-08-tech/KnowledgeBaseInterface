<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="KnowledgeBaseInterface._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="Content/Site.css" rel="stylesheet" />
    <asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server"></asp:ScriptManagerProxy>
    <div class="row bg-primary">
        <div class="container-fluid">
            <div class="row g-5">
                <div class="col-lg-4 text-center text-lg-start">
                    <img src="images/undraw_picture_re_ne03.svg" width="400">
                </div>
                <div class="col-lg-8">
                    <div class="row">
                        <h1 class="text-white mb-4 animated slideInDown">Get your queries solved here</h1>
                    </div>
                    <div class="row">
                        <div class="input-group">
                            <asp:TextBox runat="server" ID="TxtSearchBox" TextMode="Search" class="form-control" Placeholder="Search" onkeydown="handleKeyPress(event)"/>
                            <asp:Button runat="server" ID="BtnSearchPosts" CssClass="search-button" OnClientClick="return ValidateSearch(event);" OnClick="BtnSearchPosts_Click" ToolTip="Search" />
                        </div>
                        <div class="row mt-4">
                            <p class="text-white">Popular keywords</p>
                            <div class="col-lg-8">
                                <div id="toptagscontainer" runat="server">
                                </div>
                                <div class="visually-hidden">
                                    <asp:Button runat="server" ID="btnSearchFromTags" OnClick="SearchFromTopTags" />
                                </div>
                            </div>
                        </div>
                        <div class="row p-4">
                            <div class="col-lg-12">
                                <span class="text-white d-inline">Got something?</span>
                                <a href="AddNewPost.aspx" class="btn btn-success">Add New Post <i class="fa fa-location-arrow mx-lg-1" aria-hidden="true"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
   
    <div class="row bg-white">
        <div class="container-fluid p-3">
            <div class="row justify-content-center">
                <div class="row text-center m-3">
                    <h2>Recent Articles</h2>
                </div>
                <div id="PopluarArticlesContainer" class="d-flex justify-content-center flex-wrap" runat="server"></div>
            </div>
        </div>
    </div>


    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="modal fade" id="ViewPostModal" tabindex="-1" aria-labelledby="ViewPostModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-xl modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header shadow">
                            <h5 class="modal-title" runat="server" id="ViewPostModalLabel"></h5>
                            <button type="button" class="btn-close bg-danger text-white" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body" style="max-height: 80vh; overflow-y: auto;">
                            <div class="d-flex shadow p-4 rounded-2">
                                <div class="container-fluid row">
                                    <div class="col-lg-8 border-right border-bottom-sm">
                                        <div class="container-fluid">
                                            <div class="container p-1">
                                                <h1 class="alert-heading fw-bold">Title:</h1>
                                                <p class="fs-3" runat="server" id="postTitleModal"></p>
                                            </div>
                                            <hr />
                                            <div class="container p-1">
                                                <p class="fs-4 fw-bold">Description:</p>
                                                <p class="text-body-emphasis" runat="server" id="postDescriptionModal">
                                                </p>
                                            </div>
                                            <hr />
                                            <div class="container p-1">
                                                <p class="fs-5 d-inline-block">Date:  </p>
                                                <p class="text-body-emphasis d-inline-block" runat="server" id="PostDateModal"></p>
                                            </div>
                                            <div class="container p-1">
                                                <p class="fs-5 d-inline-block">Tags:  </p>
                                                <p class="text-body-emphasis d-inline-block" runat="server" id="PostTagsModal"></p>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-lg-4 border-top-sm">
                                        <div class="container-fluid">
                                            <div class="container p-1">
                                                <p class="fs-5 d-inline-block">Category:  </p>
                                                <p class="text-body-emphasis d-inline-block" runat="server" id="PostCategoryModal"></p>
                                            </div>
                                            <div class="container p-1">
                                                <p class="fs-5 d-inline-block">Author:  </p>
                                                <p class="text-body-emphasis m-0 d-inline-block" runat="server" id="PostAuthorNameModal"></p>
                                                <p class="text-body-emphasis m-0 d-inline-block" runat="server" id="PostAuthorEmailModal"></p>
                                            </div>
                                            <div class="container p-1">
                                                <p class="fs-5 d-inline-block">Likes:  </p>
                                                <p class="text-body-emphasis d-inline-block" runat="server" id="PostLikes">10</p>
                                            </div>
                                            <div class="container p-1">
                                                <img src="images/taking_notes.svg" width="350" alt="image.svg" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="visually-hidden">
                <asp:Button runat="server" ID="btnQuickSearch" OnClick="btnQuickSearch_Click" />
                <asp:HiddenField runat="server" ID="HdnPostId" />
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

    <asp:HiddenField ID="HdnValue" runat="server" />
    <script>

        function ValidateSearch(event) {
            var SearchString = $('#<%= TxtSearchBox.ClientID %>').val().trim();
            if (SearchString === "") {
                alert("Enter any keyword to search");
                return false;
            }
            return true;
        }

        if (window.history.replaceState) {
            window.history.replaceState(null, null, window.location.href);
        }

        function SearchFromTags(e) {
            document.getElementById("<%=HdnValue.ClientID %>").value = e.value;
            document.getElementById("<%=btnSearchFromTags.ClientID %>").click();
        }

        function QuickSearch(e) {
            var postId = e.id;
            document.getElementById("<%= HdnPostId.ClientID %>").value = postId;
            document.getElementById("<%=btnQuickSearch.ClientID %>").click();
        }

        function handleKeyPress(event) {
            // Check if the Enter key is pressed (key code 13)
            if (event.keyCode === 13) {
                event.preventDefault();
                document.getElementById('<%= BtnSearchPosts.ClientID %>').click();
            }
        }
    </script>
</asp:Content>
