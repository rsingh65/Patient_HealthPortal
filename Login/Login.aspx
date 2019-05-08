<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Germane1.Login.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="login" runat="server">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css"/>
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

        <div class="card bg-light">
            <article class="card-body mx-auto" style="max-width: 400px;">
                <h4 class="card-title mt-3 text-center">Create Account</h4>
                <p class="text-center">Get started with your free account</p>
                    <div class="form-group input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="fa fa-user"></i></span>
                        </div>
                        <input name="" class="form-control" placeholder="Full name" type="text"/>
                    </div>
                    <div class="form-group input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="fa fa-envelope"></i></span>
                        </div>
                        <input name="" class="form-control" placeholder="Email address" type="email"/>
                    </div>
                    <div class="form-group input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="fa fa-lock"></i></span>
                        </div>
                        <input class="form-control" placeholder="Create password" type="password"/>
                    </div>
                    <div class="form-group input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="fa fa-lock"></i></span>
                        </div>
                        <input class="form-control" placeholder="Repeat password" type="password"/>
                    </div>
                    <div class="form-group">
                        <button type="submit" class="btn btn-primary btn-block">Create Account  </button>
                    </div>
                    <p class="text-center">Have an account? <a href="">Log In</a> </p>
            </article>
        </div>
        <!-- card.// -->

        </div> 
        <!--container end.//-->

        <br>
        <br>
        <article class="bg-secondary mb-3">
            <div class="card-body text-center">
                <h3 class="text-white mt-3">Bootstrap 4 UI KIT</h3>
                <p class="h5 text-white">
                    Components and templates 
                    <br>
                    for Ecommerce, marketplace, booking websites 
and product landing pages
                </p>
                <br>
                <p>
                    <a class="btn btn-warning" target="_blank" href="http://bootstrap-ecommerce.com/">Bootstrap-ecommerce.com  

                        <i class="fa fa-window-restore "></i></a>
                </p>
            </div>
            <br>
            <br>
        </article>
    </form>
</body>
</html>
