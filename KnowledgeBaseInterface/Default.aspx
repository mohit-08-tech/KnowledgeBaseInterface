<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="KnowledgeBaseInterface._Default" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <div class="body-content bg-primary" style="height: 100%">
        <div class="container">
            <div class="row g-5">
                <div class="col-lg-4 text-center text-lg-start">
                    <img src="images/undraw_picture_re_ne03.svg" width="400" height="auto">
                </div>
                <div class="col-lg-8">
                    <div class="row">
                        <h1 class="text-white mb-4 animated slideInDown">Get your queries solve here</h1>
                    </div>
                    <div class="row">
                        <div class="input-group">
                            <input type="search" class="form-control" placeholder="Search" />
                            <button class="btn btn-success" type="submit">
                                <i class="fa-solid fa-magnifying-glass"></i>
                            </button>
                        </div>
                        <div class="row mt-4">
                            <p class="text-white">Popular keywords</p>
                            <div class="col-lg-8">
                                <button class="transparent-button rounded">Dummy 1</button>
                                <button class="transparent-button rounded">Dummy 2</button>
                                <button class="transparent-button rounded">Dummy 3</button>
                                <button class="transparent-button rounded">Dummy 4</button>
                                <button class="transparent-button rounded">Dummy 5</button>
                                <button class="transparent-button rounded">Dummy 6</button>
                                <button class="transparent-button rounded">Dummy 7</button>
                                <button class="transparent-button rounded">Dummy 8</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="body-content bg-success p-lg-5" style="height: 100%">
        <div class="row justify-content-center">
            <div class="card card-dimensions">
                <div class="card-header">
                    <h4 class="card-title">Card title</h4>
                </div>
                <div class="card-body">
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                </div>
                <div class="card-footer bg-white">
                   <button class="btn btn-primary rounded">Button 1</button>
                </div>
            </div>

             <div class="card card-dimensions">
                <div class="card-header">
                    <h4 class="card-title">Card title</h4>
                </div>
                <div class="card-body">
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                </div>
                <div class="card-footer bg-white">
                   <button class="btn btn-primary rounded">Button 2</button>
                </div>
            </div>

             <div class="card card-dimensions">
                <div class="card-header">
                    <h4 class="card-title">Card title</h4>
                </div>
                <div class="card-body">
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                </div>
                <div class="card-footer bg-white">
                    <button class="btn btn-primary rounded">Button 3</button>
                </div>
            </div>

             <div class="card card-dimensions">
                <div class="card-header">
                    <h4 class="card-title">Card title</h4>
                </div>
                <div class="card-body">
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                </div>
                <div class="card-footer bg-white">
                    <button class="btn btn-primary rounded">Button 4</button>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
