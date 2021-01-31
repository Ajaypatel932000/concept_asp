<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SampleRegistration.aspx.cs" Inherits="SampleRegistration" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <title></title>
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
        padding-top: 0px;
        padding-bottom: 40px;
         padding-left: 30%;

    }
    
input[type="text"], input[type="date"] , textarea, .textbox{
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

textarea:focus {
  border-color: dodgerBlue;
  box-shadow: 0 0 8px 0 dodgerBlue;
}

input[type="date"]:focus {
  border-color: dodgerBlue;
  box-shadow: 0 0 8px 0 dodgerBlue;
}

.inputWithIcon input[type="text"] {
  padding-left: 40px;
}

.inputWithIcon textarea {
  padding-left: 40px;
}

.inputWithIcon {
  position: relative;
}

.inputWithIcon i {
  position: absolute;
  left: 5px;
  top: 20px;
  padding: 9px 8px;
  color: #aaa;
  transition: 0.3s;
 
}

.inputWithIcon input[type="text"]:focus + i {
  color: dodgerBlue;
}

.inputWithIcon input[type="date"]:focus + i {
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
.inputWithIcon.inputIconBg input[type="date"]:focus + i {
  color: #fff;
  background-color: dodgerBlue;
}


.rotateimg180 {
  -webkit-transform:rotate(90deg);
  -moz-transform: rotate(90deg);
  -ms-transform: rotate(90deg);
  -o-transform: rotate(90deg);
  transform: rotate(90deg);
  }
  .body 
  {
      margin-top:0pxs;
      }
  


    </style>
    <link rel="stylesheet" href="StyleSheetRadio.css" />
</head>
<body>
    <form id="form1" runat="server">

    <table class="w-100" align="center" bgcolor="White" frame="border"
        title="Registration Form" width="100%" cellpadding="10%">
        <tr>
            <td>
               <div class="inputWithIcon">
                   <asp:TextBox ID="TextBox1" runat="server" placeholder="Username" 
                       Font-Size="Medium" Height="60px"></asp:TextBox>

                 <i class=" fas fa-user fa-lg fa-fw" aria-hidden="true"></i>
                </div>
            </td>
            <td>
               <div class="inputWithIcon">
                      <asp:TextBox ID="TextBox2" runat="server" placeholder="Phone Number"  Font-Size="Medium" Height="60px"></asp:TextBox>
                       <i class="fas fa-phone fa-lg fa-fw  rotateimg180" aria-hidden="true"></i>
                </div>
                
            </td>
            <td>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                          ErrorMessage="Enter 10 digit mobile no." ControlToValidate="TextBox2" 
                          ValidationExpression="\d{10}">*</asp:RegularExpressionValidator></td>
        </tr>
        <tr>
            <td>
               <div class="inputWithIcon">
                   <asp:TextBox ID="TextBox3" runat="server" placeholder="Full Name" Font-Size="Medium" Height="60px"></asp:TextBox>
                 <i class="fas fa-pencil-alt fa-lg fa-fw" aria-hidden="true"></i>
                </div>
            </td>
            <td>
               <div class="inputWithIcon">
                  <asp:TextBox ID="TextBox4" runat="server" placeholder="Father Mob.Number" Font-Size="Medium" Height="60px"></asp:TextBox>
                       <i class="fas fa-phone fa-lg fa-fw  rotateimg180" aria-hidden="true"></i>
                </div>
            </td>
            <td>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                                    ControlToValidate="TextBox3" ErrorMessage="Name is required." 
                                    ValidationExpression="^[a-zA-Z'.\s]{1,50}">*</asp:RegularExpressionValidator> 
             <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" 
                                    ControlToValidate="TextBox4" ErrorMessage="Enter 10 digit mobile no." 
                                    ValidationExpression="\d{10}">*</asp:RegularExpressionValidator>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                                    ControlToValidate="TextBox4" ErrorMessage="Phone No. is required." 
                                    ToolTip="Field is required.">*</asp:RequiredFieldValidator>   
            </td>
        </tr>
        <tr>
            <td>
                <div class="inputWithIcon">
                <asp:TextBox ID="TextBox5" runat="server" placeholder="Email" Font-Size="Medium" 
                        Height="60px"></asp:TextBox>
                 <i class="fa fa-envelope fa-lg fa-fw" aria-hidden="true"></i>
                </div>
            </td>
            <td>
              <div class="inputWithIcon">
                      <asp:TextBox ID="TextBox6" runat="server" placeholder="Mother Mob.Number" Font-Size="Medium" Height="60px"></asp:TextBox>
                       <i class="fas fa-phone fa-lg fa-fw  rotateimg180" aria-hidden="true"></i>
                </div>
            </td>
            <td>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                    ControlToValidate="TextBox5" ErrorMessage="Phone No. is required." 
                                    ToolTip="Field is required.">*</asp:RequiredFieldValidator>   </td>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                                    ControlToValidate="TextBox6" ErrorMessage="Enter 10 digit mobile no." 
                                    ValidationExpression="\d{10}">*</asp:RegularExpressionValidator>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                    ControlToValidate="TextBox6" ErrorMessage="Phone No. is required." 
                                    ToolTip="Field is required.">*</asp:RequiredFieldValidator>   </td>
        </tr>
        <tr>
            <td>

          <%--   <label class="custom-control custom-radio">
             <input type="radio" name="gender" checked="" class="custom-control-input"><span class="custom-control-label">Male</span>
             </label>
             <label class="custom-control custom-radio custom-control-inline">
             <input type="radio" name="gender" class="custom-control-input"><span class="custom-control-label">Female</span>
             </label>--%>
              <div class="radio-container">
      <input type="radio" value="male" name="Gender" id="male"/>
      <label for="male">Male</label>

      <input type="radio" value="female" name="Gender" id="female"/>
      <label for="female">Female</label>
    </div>
            </td>
            <td>
               <div class="inputWithIcon">
                  <asp:TextBox ID="TextBox7" runat="server" placeholder="Password"></asp:TextBox>
                 <i class="fas fa-lock fa-lg fa-fw" aria-hidden="true"></i>
                </div>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
               <div class="inputWithIcon">
               <input type="date" name="date1" id="date1" class="form-control"  />
                 
                </div>
            </td>
            <td>
              <div class="inputWithIcon">
                  <asp:TextBox ID="TextBox8" runat="server" placeholder="Confirm Password"></asp:TextBox>
                 <i class="fas fa-lock fa-lg fa-fw" aria-hidden="true"></i>
                </div>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <div class="inputWithIcon">
                    <asp:TextBox ID="TextBox9" runat="server" placeholder="Address"></asp:TextBox>
                 <i class="fas fa-address-card fa-lg fa-fw" aria-hidden="true"></i>
              </div>
           </td>
            <td align="center">
                 <%--<a href="#" class="btn btn-rounded btn-light">Light</a>--%>
                <asp:Button ID="Button1" runat="server" Text="Register" BackColor="#999999" 
                     BorderColor="#999999" BorderStyle="Solid" CssClass="btn" Font-Size="Medium" 
                     ForeColor="Black" Height="30%" Width="80%" onclick="Button1_Click" />
            </td>
            <td align="center">
                 &nbsp;</td>
        </tr>
        
    </table>

   
    </form>
</body>
</html>
