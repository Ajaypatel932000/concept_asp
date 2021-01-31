<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Sample.aspx.cs" Inherits="Sample" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<link rel="stylesheet" href="../App_Themes/Theme1/assets/vendor/bootstrap/css/bootstrap.min.css" />
    <link href="../App_Themes/Theme1/assets/vendor/fonts/circular-std/style.css" rel="stylesheet" />
    <link rel="stylesheet" href="../App_Themes/Theme1/assets/libs/css/style.css" />
    <link rel="stylesheet" href="../App_Themes/Theme1/assets/vendor/fonts/fontawesome/css/fontawesome-all.css" />
    <link rel="stylesheet" href="../App_Themes/Theme1/assets/vendor/datepicker/tempusdominus-bootstrap-4.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <asp:RadioButtonList ID="RadioButtonList1" runat="server" class="custom-control-inline">
        <asp:ListItem>aayesha</asp:ListItem>
        <asp:ListItem>mansi</asp:ListItem>
        <asp:ListItem>ajay</asp:ListItem>
    </asp:RadioButtonList>
    <asp:CheckBoxList ID="CheckBoxList1" runat="server">
        <asp:ListItem>aayesha</asp:ListItem>
        <asp:ListItem>mansi</asp:ListItem>
    </asp:CheckBoxList>
  
                                        <div>
                                            <label class="custom-control custom-radio">
                                                <input type="radio" name="radio-stacked" checked="" class="custom-control-input" onclick="getValue(this)" value="Cash"><span class="custom-control-label">AJAY</span>
                                            </label>
                                             <label class="custom-control custom-radio">
                                                <input type="radio" name="radio-stacked" class="custom-control-input" value="Cheque" onclick="getValue(this)"><span class="custom-control-label">Fuzel</span>
                                            </label>
                                        </div>
                                            

 



    <br />
    <br />
      <label class="custom-control custom-radio">
    <asp:RadioButton ID="RadioButton1" runat="server" class="custom-control-input" 
        Text="AAYESHA" checked="true" /><span class="custom-control-label">AAYESHA</span>
    </label>
    <br />
    <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
   


 <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
    Text="Button" />
   

                                             <div class="form-group">
                                        <div class="input-group date" id="datetimepicker4" data-target-input="nearest">
                                            <input type="text" class="form-control datetimepicker-input" data-target="#datetimepicker4" />
                                            <div class="input-group-append" data-target="#datetimepicker4" data-toggle="datetimepicker">
                                                <div class="input-group-text"><i class="far fa-calendar-alt"></i></div>
                                            </div>
                                        </div>
                                    </div>
 <div>

 </div>

 <div class="card-body border-top">
                                    <h5>Date Only</h5>
                                    <div class="form-group">
                                        <div class="input-group date" id="Div1" data-target-input="nearest">
                                            <input type="text" class="form-control datetimepicker-input" data-target="#datetimepicker4" />
                                            <div class="input-group-append" data-target="#datetimepicker4" data-toggle="datetimepicker">
                                                <div class="input-group-text"><i class="far fa-calendar-alt"></i></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                              
</asp:Content>

