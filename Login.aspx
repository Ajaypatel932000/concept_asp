<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!doctype html>
<html lang="en">
 
<head>
    <!-- Required meta tags -->
    <meta content="" charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <title>Login</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="App_Themes/Theme1/assets/vendor/bootstrap/css/bootstrap.min.css" />
    <link href="App_Themes/Theme1/assets/vendor/fonts/circular-std/style.css" rel="stylesheet" />
    <link rel="stylesheet" href="App_Themes/Theme1/assets/libs/css/style.css" />
    <link rel="stylesheet" href="App_Themes/Theme1/assets/vendor/fonts/fontawesome/css/fontawesome-all.css" />
    <style type="text/css">
    html,
    body {
        height: 100%;
         
    }

    body {
       
        display:table;
        -ms-flex-align: center;
      
        padding-top:40px;
        
        padding-bottom: 40px;
        padding-left:500px;
    }
       
    </style>
</head>
<script type="text/javascript" src="App_Themes/Theme1/assets/vendor/jquery/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="App_Themes/Theme1/assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
   
<body>

<form runat="server" id="form1">
    <table>
        <tr align="center">
            <td>
                <div class="card ">
            <div class="card-header text-center"><img class="logo-img" src="App_Themes/Theme1/assets/images/logo.png" alt="logo"/><span class="splash-description">Please enter your user information.</span></div>
            <div class="card-body">
            <table>
                <tr align="center">  
    <td class="style1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Login ID="Login1" runat="server" Height="229px" Width="332px" 
            onloggedin="Login_LoggedIn">
        <LayoutTemplate>
            <table cellpadding="1" cellspacing="0" style="border-collapse:collapse; ">
                <tr>
                    <td>
                        <table cellpadding="0" style="height:282px; width:517px;">
                            <tr>
                                <td align="center" colspan="2">
                                    <asp:Label ID="Label1" runat="server" Font-Size="X-Large" Text="Login " 
                                        style="font-weight: 700;"></asp:Label>
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td align="right" class="style2">
                                    <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName" 
                                        Font-Size="Large">User Name&nbsp;:&nbsp;&nbsp;    </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="UserName" runat="server" Height="25px" Width="180px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" 
                                        ControlToValidate="UserName" ErrorMessage="User Name is required." 
                                        ToolTip="User Name is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" class="style2">
                                    <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password" 
                                        Font-Size="Large">Password&nbsp;:&nbsp;&nbsp; </asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="Password" runat="server" Height="25px" TextMode="Password" 
                                        Width="180px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" 
                                        ControlToValidate="Password" ErrorMessage="Password is required." 
                                        ToolTip="Password is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    &nbsp;<asp:CheckBox ID="RememberMe" runat="server" Font-Size="Large" 
                                        Text="Remember me next time." />
                                </td>
                            </tr>
                            <tr>
                                <td align="center" colspan="2" style="color:Red;">
                                    <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" colspan="2">
                                    <asp:Button ID="LoginButton" runat="server" CommandName="Login" Height="30px" 
                                        Text="Log In" ValidationGroup="Login1" Width="150px" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
       
        </asp:Login>
        <br />
       </td>
   </tr>
   
   </table>
            </div>
            <div class="card-footer bg-white p-0  ">
                <div class="card-footer-item card-footer-item-bordered">
                    <asp:LinkButton ID="LinkButton1" class="footer-link" runat="server" 
                        PostBackUrl="~/Registration.aspx">Create An Account</asp:LinkButton>
                   <!-- <a href="#" class="footer-link">Create An Account</a></div>-->
                <div class="card-footer-item card-footer-item-bordered">
                    <asp:LinkButton ID="LinkButton3" class="footer-link" runat="server" 
                        PostBackUrl="~/Forgot_Password.aspx">Forgot Password</asp:LinkButton>
                    
                    <!--<a href="#" class="footer-link">Forgot Password</a>-->
                </div>
            </div>
        </div>
        </div>
 </td>
        </tr>
    </table>
</form>
 
</body>
 
</html>
