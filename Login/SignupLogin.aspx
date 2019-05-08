<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignupLogin.aspx.cs" Inherits="Germane1.Login.Signup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet"/>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="vendor/jquery-validation/dist/jquery.validate.min.js"></script>
    
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css"/>
</head>
<body>
    <form id="formLogin" runat="server">
        <div id="alerts">
        </div>
        <div class="form-inline">
            <div class="form-group">
                <asp:Image ImageUrl="~/images/germanelogo.JPG" runat="server" Style="height: 40px;" />
            </div>
            <div id="login" class="form-group" style="">
                <div class="form-group input-group" style="margin-left: 650px;">
                    <asp:Label ID="lblUsernamelogin" runat="server" Text="Username"></asp:Label>
                    <asp:TextBox ID="txtUsernamelogin" runat="server" class="form-control" style="margin-left:10px;"></asp:TextBox>
                </div>
                <div class="form-group" style="margin-left:30px;">
                    <asp:Label ID="lblPasswordlogin" runat="server" Text="Password"></asp:Label>
                    <asp:TextBox ID="txtPasswordlogin" runat="server" class="form-control" TextMode="Password" style="margin-left:10px;"></asp:TextBox>
                </div>
                <asp:Button ID="btnLogin" CssClass="btn btn-primary" runat="server" Text="Log In" OnClick="btnLogin_Click" style="margin-left:30px;"/>
            </div>
        </div>
        <div class="card bg-light">
            <article class="card-body mx-auto" style="max-width: 400px;">
                <h4 class="card-title mt-3 text-center">Create Account</h4>
                    <div class="form-group input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="fa fa-user"></i></span>
                        </div>
                        <input id="txtFullname" name="" class="form-control" placeholder="Full name" type="text"/>
                    </div>
                    <!-- form-group// -->
                    <div class="form-group input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="fa fa-envelope"></i></span>
                        </div>
                        <input id="txtUsername" name="" class="form-control" placeholder="Username"/>
                    </div>
                    <!-- form-group// -->
                    <div class="form-group input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="fa fa-lock"></i></span>
                        </div>
                        <input id="txtPassword" class="form-control" placeholder="Create password" type="password"/>
                    </div>
                    <!-- form-group// -->
                    <div class="form-group input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="fa fa-lock"></i></span>
                        </div>
                        <input class="form-control" placeholder="Repeat password" type="password"/>
                    </div>
                    <div class="form-group">
                        <button type="submit" class="btn btn-primary btn-block" onclick="createUser()">Create Account  </button>
                    </div>
            </article>
        </div>

        <br />
        <div id="dvShow">
        </div>
    </form>
</body>
<script>
    function createUser() {
        let fullname = document.getElementById("txtFullname").value.trim();
        let username = document.getElementById("txtUsername").value.trim();
        let password = document.getElementById("txtPassword").value.trim();

        //dirty programming
        if (fullname == "") {
            $("#alerts").html("Full name can't be empty");
            $("#alerts").addClass("alert alert-warning");
            $("#alerts").show();
            return 0;
        }
        if (username == "") {
            $("#alerts").html("Account Created");
            $("#alerts").addClass("alert alert-warning");
            $("#alerts").show();
            return 0;
        }
        if (fullname == "") {
            $("#alerts").html("Account Created");
            $("#alerts").addClass("alert alert-warning");
            $("#alerts").show();
            return 0;
        }

        let url = "loginSingupOperations.aspx?usnm=" + username + "&flnm=" + fullname + "&ps=" + password

        var data = { username: 'example' };

        fetch(url).then(function (response) {
            response.text().then(function (text) {
                $("#alerts").html('<div class="alert alert-success"><button type="button" class="close">×</button>User Created</div>');

                window.setTimeout(function () {
                    $(".alert").fadeTo(500, 0).slideUp(500, function () {
                        $(this).remove();
                    });
                }, 3000);

                $('.alert .close').on("click", function (e) {
                    $(this).parent().fadeTo(500, 0).slideUp(500);
                });
            });
        })
    }
</script>
</html>
