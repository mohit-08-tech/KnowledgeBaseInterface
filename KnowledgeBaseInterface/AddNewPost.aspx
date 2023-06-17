<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddNewPost.aspx.cs" Inherits="KnowledgeBaseInterface.AddNewPost" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
        .vector-image{
           background: #2193b0;  /* fallback for old browsers */
            background: -webkit-linear-gradient(to right, #6dd5ed, #2193b0);  /* Chrome 10-25, Safari 5.1-6 */
            background: linear-gradient(to right, #6dd5ed, #2193b0); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
        }
    </style>
    <div class="vector-image">
        <div class="container bg-body shadow mt-5 rounded">
            <div class="row d-flex justify-content-center p-4">
                <div class="col-md-8 col-md-offset-2">
                    <h1 class="card-title">Create post</h1>
                    <div class="">
                        <div class="form-group has-error">
                            <label for="slug">Slug <span class="require text-dark">*</span></label>
                            <input type="text" class="form-control" name="slug" />
                            <span class="help-block">Field not entered!</span>
                        </div>

                        <div class="form-group">
                            <label for="title">Title <span class="require">*</span></label>
                            <input type="text" class="form-control" name="title" />
                        </div>

                        <div class="form-group">
                            <label for="description">Description</label>
                            <textarea rows="5" class="form-control" name="description"></textarea>
                        </div>

                        <div class="form-group">
                            <p><span class="require">*</span> - required fields</p>
                        </div>

                        <div class="form-group">
                            <button type="submit" class="btn btn-primary">
                                Create
    		       
                            </button>
                            <button class="btn btn-default">
                                Cancel
    		       
                            </button>
                        </div>

                    </div>
                </div>

            </div>
        </div>
    </div>
</asp:Content>
