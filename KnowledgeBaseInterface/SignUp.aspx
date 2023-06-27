<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="KnowledgeBaseInterface.SignUp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SignUp</title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/Site.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
    <form id="form1" runat="server" onsubmit="return validateForm()">
            <div class="container my-4">
                <div class="col-md-12">
                    <img src="images/logo-transparent.png" width="100" class="d-inline-block"/>
                    <h3 class="d-inline-block">Knowledge Base Interface</h3>
                </div>
                <div class="bg-white shadow rounded">
                    <div class="row">
                        <div class="col-md-7 pe-0">
                            <div class="form-left h-100 px-5">
                                <div class="col-12 p-2">
                                    <label>Username<span class="text-danger">*</span></label>
                                    <div class="input-group">
                                        <div class="input-group-text"><i class="fa fa-user" aria-hidden="true"></i></div>
                                        <asp:TextBox runat="server" ID="TxtUserName" CssClass="form-control" Placeholder="Enter Username"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-12 p-2">
                                    <label>Email<span class="text-danger">*</span></label>
                                    <div class="input-group">
                                        <div class="input-group-text"><i class="fa fa-envelope" aria-hidden="true"></i></div>
                                        <asp:TextBox runat="server" ID="TxtEmail" CssClass="form-control" Placeholder="Enter Email"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="col-12 p-2">
                                    <label>Password<span class="text-danger">*</span></label>
                                    <div class="input-group">
                                        <div class="input-group-text"><i class="fa fa-key" aria-hidden="true"></i></div>
                                        <asp:TextBox runat="server" ID="TxtPassword" TextMode="Password" CssClass="form-control" Placeholder="Enter Password"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-12 p-2">
                                    <label>Confirm Your Password<span class="text-danger">*</span></label>
                                    <div class="input-group">
                                        <div class="input-group-text"><i class="fa fa-key" aria-hidden="true"></i></div>
                                        <asp:TextBox runat="server" ID="TxtConfirmPassword" CssClass="form-control" Placeholder="Confirm Your Password"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-12 p-2">
                                    <label>Phone</label>
                                    <div class="input-group">
                                        <div class="input-group-text"><i class="fa fa-phone" aria-hidden="true"></i></div>
                                        <asp:TextBox runat="server" ID="TxtPhone" CssClass="form-control" Placeholder="Enter your phone number"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-12 p-2">
                                    <label>Designation</label>
                                    <div class="input-group">
                                        <div class="input-group-text"><i class="fa fa-briefcase" aria-hidden="true"></i></div>
                                        <asp:TextBox runat="server" ID="TxtDesignation" CssClass="form-control" Placeholder="Enter your designation"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-12 mt-3">
                                    <asp:Button runat="server" ID="BtnCreateAccount" Text="Create Account" CssClass="btn btn-primary" OnClick="BtnCreateAccount_Click" />
                                </div>
                                <div class="col-md-12 mt-3">
                                    <span runat="server" id="SignUpMessage" class="text-info"></span>
                                    <a href="Login.aspx" runat="server" id="AfterSignUpLogin" style="text-decoration: underline" visible="false">Login Now</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-5 ps-0 d-none d-md-block">
                            <div class="form-right h-100 text-white text-center">
                                <div class="blue-gradient rounded-3">
                                <div class="row pt-5">
                                    <h2 class="fs-1">Let's Join The Knowledge Community</h2>
                                </div>
                                <div class="row py-2">
                                    <a href="Login.aspx" class="text-white text-center custom-link-hover">Already have a account? Login here</a>
                                </div>
                                    </div>
                                <div class="bg-image pt-5">
                                    <img src="images/signup.svg"  width="250" />
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
        var username = $('#<%= TxtUserName.ClientID %>').val().trim();
        var email = $('#<%=TxtEmail.ClientID%>').val().trim();
        var password = $('#<%= TxtPassword.ClientID %>').val().trim();
        var confirmPassword = $('#<%= TxtConfirmPassword.ClientID %>').val().trim();

        if (username === "") {
            alert("Please enter a username.");
            return false;
        }

        if (email === "") {
            alert("Please enter email.");
            return false;
        }

        if (password === "") {
            alert("Please enter a password.");
            return false;
        }

        if (confirmPassword === "") {
            alert("Please confirm your password.");
            return false;
        }

        // Regular expression for email validation
        var emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
        if (emailRegex.test(email) === false) {
            // Email is invalid
            alert('Invalid email address. Please enter a valid email.');
            return false;
        }


        //Check if password and confirm password are same
        if (password != confirmPassword) {
            alert("cofirm password is not same. Please check your password.");
            return false;
        }

        // If all validations pass, allow form submission
        return true;
    }

    if (window.history.replaceState) {
        window.history.replaceState(null, null, window.location.href);
    }
</script>
</html>
