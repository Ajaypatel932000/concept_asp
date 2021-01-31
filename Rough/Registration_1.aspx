<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Registration_1.aspx.cs" Inherits="Registration" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Login</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="~/App_Themes/Theme1/assets/vendor/bootstrap/css/bootstrap.min.css">
    <link href="~/App_Themes/Theme1/assets/vendor/fonts/circular-std/style.css" rel="stylesheet">
    <link rel="stylesheet" href="~/App_Themes/Theme1/assets/libs/css/style.css">
    <link rel="stylesheet" href="~/App_Themes/Theme1/assets/vendor/fonts/fontawesome/css/fontawesome-all.css">
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
        .style1
        {
            height: 43px;
        }
    </style>
     <script type="text/javascript">
         function HideLabel() {
             var seconds = 3;
             setTimeout(function () {
                 document.getElementById("<%=lblMessage.ClientID %>").style.display = "none";
             }, seconds * 1000);
         };
    </script>
</head>
<body>
<form runat="server" id="form1">

    <!-- ============================================================== -->
    <!-- login page  -->
    <!-- ============================================================== -->
    <div class="splash-container">
        <div class="card ">
            <div class="card-header text-center"><img class="logo-img" src="App_Themes/Theme1/assets/images/logo.png" alt="logo"/><span class="splash-description">Sign in for the new account.</span></div>
        </div>
    </div>
    <div class="card-body">
        &nbsp;<asp:CreateUserWizard 
            ID="CreateUserWizard1" runat="server" align="center" 
            oncreateduser="CreateUserWizard1_CreatedUser" 
            onfinishbuttonclick="CreateUserWizard1_FinishButtonClick" Width="554px" 
            ActiveStepIndex="1">
            <WizardSteps>
                <asp:CreateUserWizardStep ID="CreateUserWizardStep1" runat="server">
                    <ContentTemplate>
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
                                        ToolTip="Confirm Password is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
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
                                        ToolTip="Security question is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
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
                    </ContentTemplate>
                </asp:CreateUserWizardStep>
                <asp:WizardStep runat="server" Title="StudentProfile">
                    <table align="center" cellpadding="5" cellspacing="5" class="style1" 
                        style="border-collapse:separate; border-spacing:0 15px; margin-top:-15px; margin-left: 80px; font-size:100%;width:653px;">
                        <tr>
                            <td align="center" class="style3" style="font-size: large">
                                <asp:Label ID="Label16" runat="server" Text="Standard"></asp:Label>
                            </td>
                            <td class="style23">
                                <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" 
                                    DataSourceID="SqlDataSource1_std" DataTextField="Standard" 
                                    DataValueField="Standard_Id">
                                    <asp:ListItem Value="0">SELECT</asp:ListItem>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource1_std" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:ConnectionString_CONCEPT %>" 
                                    SelectCommand="SELECT * FROM [Standard]"></asp:SqlDataSource>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td align="center" class="style3" style="font-size: large">
                                <asp:Label ID="Label17" runat="server" Text="Subject : "></asp:Label>
                            </td>
                            <td align="left" class="style23">
                                <asp:CheckBoxList ID="CheckBoxList1" runat="server" 
                                    DataSourceID="SqlDataSource1Subjects" DataTextField="Subject_Name" 
                                    DataValueField="Subject_Id">
                                </asp:CheckBoxList>
                                <br />
                                <asp:Label ID="lblMessage" runat="server" Font-Bold="False" ForeColor="Black" 
                                    style="font-weight: 700" Visible="False"></asp:Label>
                                <asp:SqlDataSource ID="SqlDataSource1Subjects" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:ConnectionString_CONCEPT %>" 
                                    SelectCommand="SELECT * FROM [Subject] WHERE ([Standard_Id] = @Standard_Id)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="DropDownList2" Name="Standard_Id" 
                                            PropertyName="SelectedValue" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </td>
                            <td>
                                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" 
                                    Text="Show Batches" />
                            </td>
                        </tr>
                        <tr>
                            <td align="center" class="style1" style="font-size: large">
                                <asp:Label ID="Label14" runat="server" Text="Batch"></asp:Label>
                            </td>
                            <td class="style1">
                                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" >
                                    <asp:ListItem Value="0">SELECT</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td class="style1">
                                </td>
                        </tr>
                        <tr>
                            <td align="center" class="style3" style="font-size: large">
                                <asp:Label ID="Label15" runat="server" Text="Toatal Fees"></asp:Label>
                            </td>
                            <td class="style23">
                                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                               
                                <asp:ImageButton ID="ImageButton1" runat="server" 
                                    ImageUrl="~/App_Themes/Theme1/documentation/img/Calendar.jpg" 
                                    Width="35px" />
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td align="center" class="style3" style="font-size: large">
                                &nbsp;<asp:Label ID="ProfilePicLabel" runat="server" align="right" 
                                    AssociatedControlID="FileUpload1" Font-Size="Large">Profile Pic &nbsp;&nbsp;:&nbsp;&nbsp;</asp:Label>
                            </td>
                            <td class="style23">
                                <asp:FileUpload ID="FileUpload1" runat="server" Height="25px" Width="237px" />
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td class="style3" style="font-size: large">
                                &nbsp;<asp:Label ID="Name" runat="server" align="right" 
                                    AssociatedControlID="TextBox_Name1" Font-Size="Large">Name&nbsp;&nbsp;:&nbsp;&nbsp;</asp:Label>
                            </td>
                            <td class="style23">
                                <asp:TextBox ID="TextBox_Name1" runat="server" Height="25px" Width="180px"></asp:TextBox>
                            </td>
                            <td class="style10">
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                                    ControlToValidate="TextBox_Name1" ErrorMessage="Name is required." 
                                    ValidationExpression="^[a-zA-Z'.\s]{1,50}">*</asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="style3" style="font-size: large">
                                <asp:Label ID="Gender" runat="server" 
                                    AssociatedControlID="RadioButtonList_Gender1" Font-Size="Large">Gender&nbsp;&nbsp;:&nbsp;&nbsp;</asp:Label>
                            </td>
                            <td class="style23">
                                <asp:RadioButtonList ID="RadioButtonList_Gender1" runat="server" 
                                    Font-Size="Large" Height="25px" RepeatDirection="Horizontal" Width="185px">
                                    <asp:ListItem>Male</asp:ListItem>
                                    <asp:ListItem>Female</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                            <td class="style10">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                    ControlToValidate="RadioButtonList_Gender1" ErrorMessage="Gender is required." 
                                    ToolTip="Field is required.">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="style3" style="font-size: large">
                                <asp:Label ID="BirthDate_label" runat="server" 
                                    AssociatedControlID="TextBox_Birthdate1" Font-Size="Large">Birth-Date&nbsp;&nbsp;:&nbsp;&nbsp;</asp:Label>
                            </td>
                            <td class="style23">
                                <asp:TextBox ID="TextBox_Birthdate1" runat="server" Height="25px" Width="180px"></asp:TextBox>
                            </td>
                            <td class="style10">
                              
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="style3" style="font-size: large">
                                &nbsp;<asp:Label ID="Mobile_no" runat="server" AssociatedControlID="TextBox_Mobile1" 
                                    Font-Size="Large">Mobile No.&nbsp;&nbsp;:&nbsp;&nbsp;</asp:Label>
                            </td>
                            <td class="style23">
                                <asp:TextBox ID="TextBox_Mobile1" runat="server" Height="25px" MaxLength="10" 
                                    Width="180px"></asp:TextBox>
                            </td>
                            <td class="style10">
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                    ControlToValidate="TextBox_Mobile1" ErrorMessage="Enter 10 digit mobile no." 
                                    ValidationExpression="\d{10}">*</asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="style3" style="font-size: large">
                                <asp:Label ID="Label9" runat="server" AssociatedControlID="TextBox_Father1" 
                                    Font-Size="Large">Father&nbsp;&nbsp;:&nbsp;&nbsp;</asp:Label>
                            </td>
                            <td class="style23">
                                <asp:TextBox ID="TextBox_Father1" runat="server" Height="25px" Width="180px"></asp:TextBox>
                            </td>
                            <td class="style10">
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" 
                                    ControlToValidate="TextBox_Father1" ErrorMessage="Enter 10 digit mobile no." 
                                    ValidationExpression="\d{10}">*</asp:RegularExpressionValidator>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                                    ControlToValidate="TextBox_Father1" ErrorMessage="Father No. is required." 
                                    ToolTip="Field is required.">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="style3" style="font-size: large">
                                <asp:Label ID="Label10" runat="server" AssociatedControlID="TextBox_Mother1" 
                                    Font-Size="Large">Mother&nbsp;&nbsp;:&nbsp;&nbsp;</asp:Label>
                            </td>
                            <td class="style23">
                                <asp:TextBox ID="TextBox_Mother1" runat="server" Height="25px" Width="180px"></asp:TextBox>
                            </td>
                            <td class="style10">
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" 
                                    ControlToValidate="TextBox_Mother1" ErrorMessage="Enter 10 digit mobile no." 
                                    ValidationExpression="\d{10}">*</asp:RegularExpressionValidator>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                                    ControlToValidate="TextBox_Mother1" ErrorMessage="Mother No. is required." 
                                    ToolTip="Field is required.">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="style3" style="font-size: large">
                                &nbsp;<asp:Label ID="Address" runat="server" AssociatedControlID="TextBox_Address1" 
                                    Font-Size="Large">Address &nbsp;&nbsp;:&nbsp;&nbsp;</asp:Label>
                            </td>
                            <td class="style23">
                                <asp:TextBox ID="TextBox_Address1" runat="server" Height="25px" 
                                    TextMode="MultiLine" Width="180px"></asp:TextBox>
                            </td>
                            <td class="style10">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                    ControlToValidate="TextBox_Address1" ErrorMessage="Address is requied." 
                                    ToolTip="Address is required.">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                    </table>
                    <asp:ScriptManager ID="ScriptManager1" runat="server">
                    </asp:ScriptManager>
                </asp:WizardStep>
                <asp:CompleteWizardStep ID="CompleteWizardStep1" runat="server">
                    <ContentTemplate>
                        <table style= "font-size:100% ; width:554px ; align:center;">
                            <tr>
                                <td align="center">
                                    <h3>
                                        Complete</h3>
                                </td>
                            </tr>
                            <caption>
                                       <br />
                                       <tr>
                                           <td style="font-size: large">
                                               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Your account has been successfully created.<br />
                                               <br />
                                           </td>
                                </tr>
                            </caption>
                            </tr>
                            <tr>
                                <td align="center">
                                    <asp:Button ID="ContinueButton" runat="server" CausesValidation="False" 
                                        CommandName="Continue" Font-Bold="False" Font-Size="Medium" Height="30px" 
                                        Text="Continue" ValidationGroup="CreateUserWizard1" Width="140px" />
                                </td>
                            </tr>
                        </table>
                    </ContentTemplate>
                </asp:CompleteWizardStep>
            </WizardSteps>
            <FinishNavigationTemplate>
                <asp:Button ID="FinishPreviousButton" runat="server" CausesValidation="False" 
                    CommandName="MovePrevious" Text="Previous" />
                <asp:Button ID="FinishButton" runat="server" CommandName="MoveComplete" 
                    Text="Finish" />
            </FinishNavigationTemplate>
        </asp:CreateUserWizard>
        <br />
        <br />
        <div>
            <asp:Label ID="Label11" runat="server" Visible="False"></asp:Label>
            <br />
            <asp:Label ID="Label12" runat="server" Visible="False"></asp:Label>
            <br />
            <asp:Label ID="Label13" runat="server" Visible="False"></asp:Label>
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
