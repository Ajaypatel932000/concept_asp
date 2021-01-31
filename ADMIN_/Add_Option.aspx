<%@ Page Title="" Language="C#" MasterPageFile="~/ADMIN_/MasterPage.master" AutoEventWireup="true" CodeFile="Add_Option.aspx.cs" Inherits="ADMIN_Add_Option" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Concept - Bootstrap 4 Admin Dashboard Template</title>
    <link rel="stylesheet" href="../App_Themes/Theme1/assets/vendor/bootstrap/css/bootstrap.min.css">
    <link href="../App_Themes/Theme1/assets/vendor/fonts/circular-std/style.css" rel="stylesheet">
    <link rel="stylesheet" href="../App_Themes/Theme1/assets/libs/css/style.css">
    <link rel="stylesheet" href="../App_Themes/Theme1/assets/vendor/fonts/fontawesome/css/fontawesome-all.css">
    <style type="text/css">
        html, body {
        height: 100%;
        
    }

    body {
        display: -ms-flexbox;
        -ms-flex-align: center;
        align-items: center;
        padding-bottom: 40px;
    }
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 106px;
        }
        .style3
        {
            width: 225px;
        }
        .style4
        {
            height: 6px;
        }
        .style5
        {
            height: 6px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
<div class="page-header"><h2 class = "pageheader-title">Add Options</h2></div>



<div class="card">
<div class="card-body">
<div class="form-group">
<table class ="style1">
<tr>
<td colspan="2">

    <asp:Label ID="Label2" runat="server" Visible="False"></asp:Label>

    <br />

</td>
</tr>
<tr>
<td class="style2">

    <asp:Label ID="Label4" runat="server" Font-Size="Medium" Text="Question :"></asp:Label>

    </td>
<td>

    <asp:Label ID="Label3" runat="server" Font-Bold="False" Font-Size="Medium"></asp:Label>
    </td>
</tr>
</table>
<br />


<table class="style1">
<tr>
<td align="left" class="style3" valign="bottom">
    <asp:Label ID="Label1" runat="server" Font-Size="Medium" 
        Text="Enter Option : "></asp:Label>
    <br />
    <asp:TextBox ID="TextBox1" runat="server" class="form-control form-control-lg" Width="150px" placeholder="Enter Option" 
                    Height="27px"></asp:TextBox>
</td>
<td align="left" valign="bottom">

    <asp:Button ID="Button1" runat="server" 
        CausesValidation="False" Height="35px" 
        onclick="Button1_Click" Text="Add Option" Width="130px" class="btn btn-rounded btn-primary"   />
    </td>
</tr>
<tr>
<td align="left" class="style4" valign="top">
    <asp:Label ID="Label7" runat="server" Font-Size="Small" ForeColor="#FF3300" 
        Text="Enter Option" Visible="False"></asp:Label>
    <asp:Label ID="lblMessage" runat="server" Font-Bold="True" Font-Size="Small" 
        ForeColor="#FF3300" Visible="False" />

</td>
<td align="left" class="style5">
    </td>
</tr>
<tr>
<td align="left" class="style4" colspan="2" valign="bottom">
    <br />
  <br />
    <asp:GridView ID="GridView2" class="table table-hover" runat="server" AutoGenerateColumns="False" 
                    Width="700px" onrowdeleting="GridView2_RowDeleting">
        <Columns>
            <asp:TemplateField HeaderText="Select">
                <ItemTemplate>
                            <label class="custom-control custom-radio">
                            <input name="RadioButton1" type="radio" value='<%# Eval("opt") %>' class="custom-control-input" onclick="javascript.myselection(this.id)" ><span class="custom-control-label"></span>
                            </label>
                        </ItemTemplate>
                <HeaderStyle Font-Underline="False" HorizontalAlign="Center" />
                <ItemStyle HorizontalAlign="Center" Width="20px" />
            </asp:TemplateField>
            <asp:BoundField DataField="optId" HeaderText="Option Id">
            <HeaderStyle Font-Underline="False" HorizontalAlign="Center" />
            <ItemStyle HorizontalAlign="Center" Width="100px" />
            </asp:BoundField>
            <asp:BoundField DataField="opt" HeaderText="Options">
            <HeaderStyle Font-Underline="False" HorizontalAlign="Center" />
            <ItemStyle HorizontalAlign="Center" Width="200px" />
            </asp:BoundField>
            <asp:CommandField HeaderText="Operation" ShowDeleteButton="True">
            <ControlStyle ForeColor="Blue" />
            <HeaderStyle Font-Underline="False" HorizontalAlign="Center" />
            <ItemStyle HorizontalAlign="Center" Width="100px" />
            </asp:CommandField>
        </Columns>
        
        <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <HeaderStyle  Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                    <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#0000A9" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#000065" />
        
    </asp:GridView>

</td>
</tr>
<tr>
<td align="left" class="style4" colspan="2" valign="bottom">

    <br />

    <asp:Button ID="Button2" runat="server" onclick="Button2_Click" 
        Text="Insert Correct Option" Width="180px" class="btn btn-rounded btn-primary" Height="35px" />

</td>
</tr>
</table>
    <br />
    <asp:Label ID="Label5" runat="server" Visible="False"></asp:Label>
    <asp:Label ID="Label6" runat="server" Visible="False"></asp:Label>
</div>
</div>
</div>
</asp:Content>

