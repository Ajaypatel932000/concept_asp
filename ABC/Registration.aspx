<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Registration.aspx.cs" Inherits="Registration" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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
        display: flex;
       -ms-flex-align: center;
       align-items: center;
        padding-top: 40px;
        padding-bottom: 40px;
        padding-left:30%;
    }
    </style>
    
</head>
<body>
<form runat="server" id="form1">

    <!-- ============================================================== -->
    <!-- login page  -->
    <!-- ============================================================== -->

      <div class="splash-container">
        <div class="card ">
            <div class="card-header text-center">
            

                <table align="center" width="100%">
                    <tr align="center">
                        <td align="center">
                        <table style="font-size:100%;width:554px;">
                            <tr>
                                <td align="center" colspan="2">
                                    <h3>
                                        Sign Up for Your New Account</h3>
                                    <br/>
                                   </td>
                            </tr>
                            <tr>
                                <td align="right" class="style16">
                                    <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName" 
                                        Font-Size="Large">User Name&nbsp;&nbsp;:&nbsp;&nbsp;   </asp:Label>
                                </td>
                                <td class="style14">
                                    <asp:TextBox ID="UserName" runat="server" Height="25px" Width="180px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" 
                                        ControlToValidate="UserName" ErrorMessage="User Name is required." 
                                        ToolTip="User Name is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" class="style16">
                                    <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password" 
                                        Font-Size="Large">Password&nbsp;&nbsp;:&nbsp;&nbsp;  </asp:Label>
                                </td>
                                <td class="style14">
                                    <asp:TextBox ID="Password" runat="server" Height="25px" TextMode="Password" 
                                        Width="180px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" 
                                        ControlToValidate="Password" ErrorMessage="Password is required." 
                                        ToolTip="Password is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" class="style17">
                                    <asp:Label ID="ConfirmPasswordLabel" runat="server" 
                                        AssociatedControlID="ConfirmPassword" Font-Size="Large">Confirm Password&nbsp;&nbsp;:&nbsp;&nbsp;</asp:Label>
                                </td>
                                <td class="style15">
                                    <asp:TextBox ID="ConfirmPassword" runat="server" Height="25px" 
                                        TextMode="Password" Width="180px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" 
                                        ControlToValidate="ConfirmPassword" 
                                        ErrorMessage="Confirm Password is required." 
                                        ToolTip="Confirm Password is required." 
                                        ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" class="style16">
                                    <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email" 
                                        Font-Size="Large">E-mail&nbsp;&nbsp;:&nbsp;&nbsp;</asp:Label>
                                </td>
                                <td class="style14">
                                    <asp:TextBox ID="Email" runat="server" Height="25px" Width="180px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="EmailRequired" runat="server" 
                                        ControlToValidate="Email" ErrorMessage="E-mail is required." 
                                        ToolTip="E-mail is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" class="style16">
                                    <asp:Label ID="QuestionLabel" runat="server" AssociatedControlID="Question" 
                                        Font-Size="Large">Security Question&nbsp;&nbsp;:&nbsp;&nbsp;</asp:Label>
                                </td>
                                <td class="style14">
                                    <asp:TextBox ID="Question" runat="server" Height="25px" Width="180px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="QuestionRequired" runat="server" 
                                        ControlToValidate="Question" ErrorMessage="Security question is required." 
                                        ToolTip="Security question is required." 
                                        ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" class="style16">
                                    <asp:Label ID="AnswerLabel" runat="server" AssociatedControlID="Answer" 
                                        Font-Size="Large">Security Answer&nbsp;&nbsp;:&nbsp;&nbsp;</asp:Label>
                                </td>
                                <td class="style14">
                                    <asp:TextBox ID="Answer" runat="server" Height="25px" Width="180px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="AnswerRequired" runat="server" 
                                        ControlToValidate="Answer" ErrorMessage="Security answer is required." 
                                        ToolTip="Security answer is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" class="style21" colspan="2">
                                    <asp:CompareValidator ID="PasswordCompare" runat="server" 
                                        ControlToCompare="Password" ControlToValidate="ConfirmPassword" 
                                        Display="Dynamic" 
                                        ErrorMessage="The Password and Confirmation Password must match." 
                                        Font-Size="Medium" ValidationGroup="CreateUserWizard1"></asp:CompareValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" class="style20" colspan="2" style="color:Red;">
                                    <asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False"></asp:Literal>
                                </td>
                            </tr>
                        </table>
                           </td>
                    </tr>
                </table>

            </div>
            </div>
          
    <!-- ============================================================== -->
    <!-- end login page  -->
    <!-- ============================================================== -->
    <!-- Optional JavaScript -->
    <script src="assets/vendor/jquery/jquery-3.3.1.min.js"></script>
    <script src="assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>

</form>
</body>
</html>
