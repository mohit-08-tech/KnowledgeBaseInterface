<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ErrorPage.aspx.cs" Inherits="KnowledgeBaseInterface.ErrorPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Error! Something wen't wrong.</title>
     <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/Site.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
    <div class="container d-flex justify-content-center align-items-center vh-100">
    <div class="row">
        <div class="col-md-12">
            <div class="error-template text-center">
                <h1>Oops!</h1>
                <h2>Something wen't wrong!!</h2>
                <div class="error-details">
                    <span runat="server" id="TxtErrorMessage"></span>
                </div>
                <div class="error-actions mt-4">
                    <a href="Default.aspx" class="btn btn-primary btn-lg"><span class="fas fa-home"></span> Take Me Home</a>
                    <a href="mailto:202017B3723@wilp.bits-pilani.ac.in" class="btn btn-default btn-lg"><span class="fas fa-envelope"></span> Contact Support</a>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
    <script src="Scripts/jquery-3.7.0.min.js"></script>
<script src="Scripts/bootstrap.min.js"></script>
</html>
