<%@ Page Title="" Language="C#" MasterPageFile="~/ADMIN_/MasterPage.master" AutoEventWireup="true" CodeFile="Add_Notification.aspx.cs" Inherits="ADMIN_Add_Notification" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Concept - Bootstrap 4 Admin Dashboard Template</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="../App_Themes/Theme1/assets/vendor/bootstrap/css/bootstrap.min.css">
    <link href="../App_Themes/Theme1/assets/vendor/fonts/circular-std/style.css" rel="stylesheet">
    <link rel="stylesheet" href="../App_Themes/Theme1/assets/libs/css/style.css">
    <link rel="stylesheet" href="../App_Themes/Theme1/assets/vendor/fonts/fontawesome/css/fontawesome-all.css">
    <link rel="stylesheet" href="../App_Themes/Theme1/assets/vendor/datepicker/tempusdominus-bootstrap-4.css" />
    <link rel="stylesheet" href="../App_Themes/Theme1/assets/vendor/inputmask/css/inputmask.css" />
<script type="text/javascript">
    function HideLabel() {
        var seconds = 3;
        setTimeout(function () {
            document.getElementById("<%=lblMessage.ClientID %>").style.display = "none";
        }, seconds * 1000);
    };
    </script>
    
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style4
        {
        }
        .style5
        {
            width: 281px;
            height: 30px;
        }
        .style6
        {
            height: 30px;
        }
        .style7
        {
            width: 281px;
            height: 15px;
        }
        .style8
        {
            height: 15px;
        }
        .style9
        {
            width: 331px;
            height: 30px;
        }
        .style10
        {
            width: 331px;
            height: 15px;
        }
        .style11
        {
            width: 331px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
 <div class="page-header">
        <h2 class="pageheader-title">Add Notification </h2>
</div>
<form class="splash-container">
<div class="card">
<div class="card-body">
<div class="form-group">
    <table class="style1">
        <tr>
            <td class="style5">
                <asp:Label ID="Label2" runat="server" Text="Standard " Width="149px" 
                    Font-Size="Large"></asp:Label>
            </td>
            <td class="style9">
                <asp:Label ID="Label4" runat="server" Text="Batch " Width="100px" 
                    Font-Size="Large"></asp:Label>
            </td>
            <td class="style6">
                <asp:Label ID="Label5" runat="server" Text="Message " Width="141px" 
                    Font-Size="Large"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style7">
                <asp:DropDownList ID="DropDownList1" class="form-control form-control-sm"  
                    runat="server" AutoPostBack="True" 
                    DataSourceID="SqlDataSource1_std" DataTextField="Standard" 
                    DataValueField="Standard_Id" Height="27px" 
                         Width="150px" AppendDataBoundItems="True">
                    <asp:ListItem Value="0">--SELECT--</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="style10">
                <asp:DropDownList ID="DropDownList2" class="form-control form-control-sm" 
                    runat="server" AutoPostBack="True" 
                    DataSourceID="SqlDataSource1_batch" DataTextField="Batch_Name" 
                    DataValueField="Batch_Id" Height="27px" 
                         Width="150px" AppendDataBoundItems="True" >
                    <asp:ListItem Value="0">--SELECT--</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="style8">
                <asp:TextBox ID="TextBox1" class="form-control" runat="server" Height="45px" style="margin-top: 9px" 
                    TextMode="MultiLine" Width="400px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style4">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                        ControlToValidate="DropDownList1" ErrorMessage="Please Select." ForeColor="Red" 
                        InitialValue="0"></asp:RequiredFieldValidator>
                </td>
            <td class="style11">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ControlToValidate="DropDownList2" ErrorMessage="Please Select." ForeColor="Red" 
                        InitialValue="0" Width="135px"></asp:RequiredFieldValidator>
                </td>
            <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                        ControlToValidate="TextBox1" 
                    ErrorMessage="Please Enter the Message." ForeColor="Red" 
                        InitialValue="0" Width="248px"></asp:RequiredFieldValidator>
                </td>
        </tr>
        <tr>
            <td class="style4">
                &nbsp;</td>
            <td class="style11">
                <asp:Button ID="Button1" runat="server" class="btn btn-rounded btn-primary" 
                    Text="Submit" Height="44px" Width="130px" onclick="Button1_Click" />
                <br />
                <asp:Label ID="lblMessage" runat="server" Font-Bold="False" ForeColor="Black" 
                    style="font-weight: 700" Visible="False" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style4">
                &nbsp;</td>
            <td class="style11">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style4" colspan="2">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                     DataKeyNames="Enrollment_Id" 
                    DataSourceID="SqlDataSource1_Student" Width="490px" Height="170px"  class="table table-hover">
                    <Columns>
                        <asp:BoundField DataField="Enrollment_Id" HeaderText="Enrollment Id" 
                            InsertVisible="False" ReadOnly="True" SortExpression="Enrollment_Id" />
                        <asp:BoundField DataField="Name" HeaderText="Name" ReadOnly="True" 
                            SortExpression="Name" />
                        <asp:TemplateField HeaderText="Select">
                            <HeaderTemplate>
                                All<asp:CheckBox ID="CheckBox2" runat="server" AutoPostBack="True" 
                                    oncheckedchanged="CheckBox2_CheckedChanged" />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="CheckBox1" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                     <FooterStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Center" />
                    <HeaderStyle  Font-Bold="True" ForeColor="Black" HorizontalAlign="Center" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EEEEEE" ForeColor="Black" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#0000A9" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#000065" />
                </asp:GridView>
                </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    <br />
    <br />
    <table >
        
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                <asp:SqlDataSource ID="SqlDataSource1_std" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString_CONCEPT %>" 
                    SelectCommand="SELECT * FROM [Standard]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                <asp:SqlDataSource ID="SqlDataSource1_batch" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString_CONCEPT %>" 
                    SelectCommand="SELECT Batch_Id, Batch_Name FROM Batch WHERE (Batch_Id IN (SELECT Batch_Id FROM Enrollment WHERE (Standard_Id = @Standard_Id)))">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList1" Name="Standard_Id" 
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:SqlDataSource ID="SqlDataSource1_Student" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString_CONCEPT %>" 
                    SelectCommand="SELECT e.Enrollment_Id, dbo.GetProfilePropertyValue('Name', aspnet_Profile.PropertyNames, aspnet_Profile.PropertyValuesString) AS 'Name' FROM aspnet_Profile INNER JOIN aspnet_Users AS u ON aspnet_Profile.UserId = u.UserId INNER JOIN Student AS s ON u.UserName = s.UserName INNER JOIN Enrollment AS e ON s.Student_Id = e.Student_Id WHERE (e.Batch_Id = @Batch_Id)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList2" Name="Batch_Id" 
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
    </div>
    </div>
    </div>
    </form>
</asp:Content>

