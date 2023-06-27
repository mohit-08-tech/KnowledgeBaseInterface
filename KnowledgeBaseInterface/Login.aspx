<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="KnowledgeBaseInterface.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/Site.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
    <form id="form1" runat="server" onsubmit="return validateForm()">
        <div class="login-page">
            <div class="container">
                <div class="col-md-12">
                    <img src="images/logo-transparent.png" width="100" class="d-inline-block"/>
                    <h3 class="d-inline-block">Knowledge Base Interface</h3>
                </div>
                <div class="bg-white shadow rounded p-3">
                    <div class="row">
                        <div class="col-md-7 pe-0">
                            <div class="form-left h-100 py-5 px-5">
                                <div class="col-12 p-2">
                                    <label>Email<span class="text-danger">*</span></label>
                                    <div class="input-group">
                                        <div class="input-group-text"><i class="fa fa-user" aria-hidden="true"></i></div>
                                        <asp:TextBox runat="server" ID="TxtUserEmail" CssClass="form-control" Placeholder="Enter Email"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="col-12 p-2">
                                    <label>Password<span class="text-danger">*</span></label>
                                    <div class="input-group">
                                        <div class="input-group-text"><i class="fa fa-key" aria-hidden="true"></i></div>
                                        <asp:TextBox runat="server" ID="TxtPassword" TextMode="Password" CssClass="form-control" Placeholder="Enter Username or email"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="row p-2">
                                    <div class="col-sm-6">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" id="inlineFormCheck" />
                                            <label class="form-check-label" for="inlineFormCheck">Remember me</label>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <a href="#" class="float-end text-primary">Forgot Password?</a>
                                    </div>
                                </div>
                                <div class="col-md-12 mt-3">
                                    <asp:Button runat="server" ID="BtnLogin" Text="Login" CssClass="btn btn-primary" OnClick="BtnLogin_Click" />
                                </div>
                                <div class="col-md-12 mt-3">
                                    <span class="text-danger fw-bold" runat="server" id="LoginStatus"></span>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-5 ps-0 d-none d-md-block">
                            <div class="form-right h-100  text-white text-center ">
                                <div class="blue-gradient rounded-3">
                                    <div class="row pt-4">
                                        <h2 class="fs-1">Welcome Back!!!</h2>
                                    </div>
                                    <div class="row py-2">
                                        <a href="SignUp.aspx" class="text-white text-center custom-link-hover">Not have a account? SignUp here</a>
                                    </div>
                                </div>
                                <div class="bg-image pt-5">
                                    <img src="images/login.svg" width="200" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </form>
</body>
<script src="Scripts/jquery-3.7.0.min.js"></script>
<script src="Scripts/bootstrap.min.js"></script>
<script>
    function validateForm() {
        var username = $('#<%= TxtUserEmail.ClientID %>').val().trim();
        var password = $('#<%= TxtPassword.ClientID %>').val().trim();

        if (username === "") {
            alert("Please enter a username.");
            return false;
        }

        if (password === "") {
            alert("Please enter a password.");
            return false;
        }

        // If all validations pass, allow form submission
        return true;
    }
</script>
</html>
