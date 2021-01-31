<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Registration.aspx.cs" Inherits="Registration" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
   <!-- Required meta tags -->
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <title>Login</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="App_Themes/Theme1/assets/vendor/bootstrap/css/bootstrap.min.css" />
    <link href="App_Themes/Theme1/assets/vendor/fonts/circular-std/style.css" rel="stylesheet" />
    <link rel="stylesheet" href="App_Themes/Theme1/assets/libs/css/style.css" />
    <link rel="stylesheet" href="App_Themes/Theme1/assets/vendor/fonts/fontawesome/css/fontawesome-all.css" />
    <style>
    html,
    body {
        height: 100%;
    }

    body {
        display: -ms-flexbox;
        display: table;
       -ms-flex-align: center;
       align-items: center;
        padding-top: 100px;
        padding-bottom: 40px;
         padding-left: 30%;

    }
    
input[type="text"] {
  width: 100%;
  border: 2px solid #aaa;
  border-radius: 4px;
  margin: 8px 0;
  outline: none;
  padding: 8px;
  box-sizing: border-box;
  transition: 0.3s;
}

input[type="text"]:focus {
  border-color: dodgerBlue;
  box-shadow: 0 0 8px 0 dodgerBlue;
}

.inputWithIcon input[type="text"] {
  padding-left: 40px;
}

.inputWithIcon {
  position: relative;
}

.inputWithIcon i {
  position: absolute;
  left: 0;
  top: 12px;
  padding: 9px 8px;
  color: #aaa;
  transition: 0.3s;
}

.inputWithIcon input[type="text"]:focus + i {
  color: dodgerBlue;
}

.inputWithIcon.inputIconBg i {
  background-color: #aaa;
  color: #fff;
  padding: 9px 4px;
  border-radius: 4px 0 0 4px;
}

.inputWithIcon.inputIconBg input[type="text"]:focus + i {
  color: #fff;
  background-color: dodgerBlue;
}

    </style>
    
</head>
<body>
<form runat="server" id="form1">

    <!-- ============================================================== -->
    <!-- login page  -->
    <!-- ============================================================== -->

    
  
    <!-- ============================================================== -->
    <!-- end login page  -->
    <!-- ============================================================== -->
    <!-- Optional JavaScript -->
    <script src="App_Themes/Theme1/assets/vendor/jquery/jquery-3.3.1.min.js"></script>
    <script src="App_Themes/Theme1/assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>

  <div class="card ">
  <div class="card-header text-center">   
    <table align="center" width="100%">
        <tr>
            <td align="center">
            <br />
            <br />
                <img class="logo-img" src="App_Themes/Theme1/assets/images/logo.png" alt="logo"/><span class="splash-description">Sign in for the new account.</span>
                <br />
                <br />
            </td>
        </tr>
        <tr>
            <td>
            
                <table class="w-100">
                    <tr>
                        <td>
                             
                         <i class=" fas fa-user"></i>
                            <asp:TextBox ID="TextBox1" runat="server"  CssClass="form-control" placeholder="Username"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" 
                                placeholder="Email"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control" 
                                placeholder="Phone Number"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control" 
                                placeholder="Password"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            <asp:TextBox ID="TextBox5" runat="server" CssClass="form-control" 
                                placeholder="Confirm Password"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>

    <div class="inputWithIcon">
  <input type="text" placeholder="Your name">
  <i class="fa fa-user fa-lg fa-fw" aria-hidden="true"></i>
</div>
    </div>
    </div>
    <script src="App_Themes/Theme1/assets/vendor/jquery/jquery-3.3.1.min.js"></script>
    <script src="App_Themes/Theme1/assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
    <script src="App_Themes/Theme1/assets/vendor/slimscroll/jquery.slimscroll.js"></script>
    <script src="App_Themes/Theme1/assets/libs/js/main-js.js"></script>
    <script src="App_Themes/Theme1/assets/vendor/datepicker/moment.js"></script>
    <script src="App_Themes/Theme1/assets/vendor/datepicker/tempusdominus-bootstrap-4.js"></script>
    <script src="App_Themes/Theme1/assets/vendor/datepicker/datepicker.js"></script>
</form>
</body>
</html>

