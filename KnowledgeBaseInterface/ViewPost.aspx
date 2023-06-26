<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewPost.aspx.cs" Inherits="KnowledgeBaseInterface.ViewPost" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link href="Content/Site.css" rel="stylesheet" />
    
    <div class="d-flex shadow mt-3 p-4 rounded-2">
        <div class="container-fluid row">
            <div class="col-lg-8 border-right border-bottom-sm">
                <div class="container-fluid">
                    <div class="container p-3">
                        <h1 class="alert-heading" runat="server" id="PostTitle">This a post title</h1>
                    </div>
                    <div class="container p-3">
                        <p class="text-body-emphasis" runat="server" id="PostDescription">This is post description.
                            Lorem ipsum dolor sit amet. Et aliquid dicta non enim officia ea aperiam dignissimos. Aut consequuntur labore et animi internos sit magni iure est voluptatem cupiditate et atque quam est tenetur earum. Ut galisum dolores est voluptatibus consequatur ut iste illo. </p><p>Qui ipsam amet sed pariatur dolor vel nostrum reprehenderit et ipsum iusto. Hic soluta aliquid quo pariatur quis ut perspiciatis omnis ea nihil debitis. Aut nihil repellendus et provident doloribus vel soluta facere hic veniam deserunt vel repellat quia et vero voluptatum rem sapiente enim. Et numquam sint eos architecto magnam ut deserunt quos non galisum consequuntur! </p><p>Aut suscipit quisquam est voluptatem similique aut rerum beatae aut autem illo est architecto aliquid. Aut consequuntur obcaecati et quia consectetur ut tempore quae ut internos nobis. Qui minima animi ab quod dignissimos qui quos odit sed neque repellat aut ipsum tempora. Ex assumenda iste sit laboriosam pariatur et officia eligendi.
                        </p>
                    </div>
                    <div class="container p-3">
                        <p class="text-body-emphasis" runat="server" id="PostDate">25-June-2023</p>
                    </div>
                    <div class="container p-3">
                        <p class="text-body-emphasis" runat="server" id="PostTags">#Tag1 #Tag2 #Tag3</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 border-top-sm">
                <div class="container-fluid">
                    <div class="container p-3">
                        <p class="text-body-emphasis" runat="server" id="PostCategory">Post Category</p>
                    </div>
                    <div class="container p-3">
                        <p class="text-body-emphasis m-0" runat="server" id="PostAuthorName">Post Author</p>
                        <p class="text-body-emphasis m-0" runat="server" id="PostAuthorEmail">(abc@gmail.com)</p>
                    </div>
                    <div class="container p-3">
                        <p class="text-body-emphasis" runat="server" id="PostLikes">Post Likes</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
