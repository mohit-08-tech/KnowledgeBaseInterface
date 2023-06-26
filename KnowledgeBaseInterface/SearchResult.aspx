<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SearchResult.aspx.cs" Inherits="KnowledgeBaseInterface.SearchResult" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="Content/Site.css" rel="stylesheet" />
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <div class="d-flex justify-content-center pt-5">
        <div class="container-fluid mint shadow rounded p-4">
            <div class="container p-2 text-center">
                <asp:Label runat="server" ID="SearchMsg" CssClass="fs-3 text-white fw-bold"></asp:Label>
            </div>
            <div class="container p-2 text-center">
                <span class="fs-3 bg-white rounded-5 px-4 py-2">Search Results</span>
            </div>

            <div runat="server" id="postContainer">
            </div>

            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div class="modal fade" id="ViewPostModal" tabindex="-1" aria-labelledby="ViewPostModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-xl modal-dialog-centered">
                            <div class="modal-content">
                                <div class="modal-header shadow">
                                    <h5 class="modal-title" runat="server" id="ViewPostModalLabel"> </h5>
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
                                                        <img src="images/taking_notes.svg" width="350" alt="image.svg"/>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="container p-3 mt-4 card-footer rasp text-center fw-bold text-white rounded-5">
                        <span ></span>
                    </div>

                    <div class="visually-hidden">
                        <asp:Button runat="server" ID="btnTest" OnClick="btnTest_Click" Text="Test 1251251251" />
                        <asp:HiddenField runat="server" ID="HdnPostId" />
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>

    <script src="Scripts/WebForms/WebForms.js" type="text/javascript"></script>
    <script type="text/javascript">

        function titleLink_Click(element) {
            var postId = element.getAttribute("data-post-id");
            console.log(postId);
            document.getElementById("<%= HdnPostId.ClientID %>").value = postId;
            document.getElementById("<%=btnTest.ClientID %>").click();
        }
    </script>
</asp:Content>
