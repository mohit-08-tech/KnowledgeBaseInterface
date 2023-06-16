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
    <form id="form1" runat="server">
         <div class="login-page">
            <div class="container">
                  <div class="col-md-4">
                    <h3>Knowledge Base Interface</h3>
                </div>
                <div class="bg-white shadow rounded p-3">
                    <div class="row">
                        <div class="col-md-7 pe-0">
                            <div class="form-left h-100 py-5 px-5">
                                <div class="col-12 p-2">
                                    <label>Username<span class="text-danger">*</span></label>
                                    <div class="input-group">
                                        <div class="input-group-text"><i class="fa fa-user" aria-hidden="true"></i></div>
                                        <input type="text" class="form-control" placeholder="Enter Username" />
                                    </div>
                                </div>
                                <div class="col-12 p-2">
                                    <label>Email<span class="text-danger">*</span></label>
                                    <div class="input-group">
                                        <div class="input-group-text"><i class="fa fa-envelope" aria-hidden="true"></i></div>
                                        <input type="text" class="form-control" placeholder="Enter Email" />
                                    </div>
                                </div>

                                <div class="col-12 p-2">
                                    <label>Password<span class="text-danger">*</span></label>
                                    <div class="input-group">
                                        <div class="input-group-text"><i class="fa fa-key" aria-hidden="true"></i></div>
                                        <input type="text" class="form-control" placeholder="Enter Password" />
                                    </div>
                                </div>
                                  <div class="col-12 p-2">
                                    <label>Confirm Your Password<span class="text-danger">*</span></label>
                                    <div class="input-group">
                                        <div class="input-group-text"><i class="fa fa-key" aria-hidden="true"></i></div>
                                        <input type="text" class="form-control" placeholder="Confirm Your Password" />
                                    </div>
                                </div>
                                <div class="col-md-12 mt-3">
                                    <button type="submit" class="btn btn-primary">Create Account</button>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-5 ps-0 d-none d-md-block">
                            <div class="form-right h-100 blue-gradient text-white text-center pt-5 rounded-5">
                                <div class="row pt-5 pb-5">
                                    <h2 class="fs-1">Let's Join The Knowledge Community</h2>
                                </div>
                                <div class="row pt-5">
                                    <a href="Login.aspx" class="text-white text-center custom-link-hover">Already have a account? Login here</a>
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
</html>
