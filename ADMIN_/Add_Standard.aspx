<%@ Page Title="" Language="C#" MasterPageFile="~/ADMIN_/MasterPage.master" AutoEventWireup="true" CodeFile="Add_Standard.aspx.cs" Inherits="Admin_Add_Standard" %>

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
        .style2
        {
        }
        .style3
        {
            width: 243px;
        }
        .style4
        {
            width: 243px;
            height: 48px;
        }
        .style5
        {
            height: 48px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
 <div class="page-header">
        <h2 class="pageheader-title">Add Standard </h2>
</div>
<form class="splash-container">
<div class="card">
<div class="card-body">
<div class="form-group">
    <table class="style1">
        <tr>
            <td class="style4">
                <asp:Label ID="Label1" runat="server" Font-Size="Large" Height="26px" 
                    Text="Standard Name" Width="209px"></asp:Label>
            </td>
            <td class="style5">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
                <asp:TextBox ID="TextBox1" runat="server" class="form-control form-control-lg" 
                    Height="27px" Width="150px" placeholder="Standard Name" ></asp:TextBox>
                <asp:Label ID="Label2" runat="server" ForeColor="Red" Text="Enter Standard" 
                    Visible="False" Width="109px"></asp:Label>
            </td>
            <td>
                <asp:Button ID="Button1" runat="server" Text="Button" class="btn btn-rounded btn-primary" Height="44px" Width="130px" onclick="Button1_Click" />
               
                </td>
        </tr>
        <tr>
            <td class="style3">
                <asp:RangeValidator ID="RangeValidator1" runat="server" 
                    ControlToValidate="TextBox1" ErrorMessage="Enter numbers between 1 to 12" 
                    ForeColor="Red" MaximumValue="12" MinimumValue="1" Type="Integer"></asp:RangeValidator>
                <br />
               
                <br />
                <asp:Label ID="lblMessage" runat="server" Font-Bold="True" ForeColor="Black" 
                    Visible="False" />
            </td>
            <td>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString_CONCEPT %>" 
                    DeleteCommand="DELETE FROM [Standard] WHERE [Standard_Id] = @Standard_Id" 
                    InsertCommand="INSERT INTO [Standard] ([Standard]) VALUES (@Standard)" 
                    SelectCommand="SELECT [Standard], [Standard_Id] FROM [Standard]" 
                    UpdateCommand="UPDATE [Standard] SET [Standard] = @Standard WHERE [Standard_Id] = @Standard_Id">
                    <DeleteParameters>
                        <asp:Parameter Name="Standard_Id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Standard" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Standard" Type="String" />
                        <asp:Parameter Name="Standard_Id" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="style2" colspan="2">
                <br />
                <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
                   AutoGenerateColumns="False"  class="table table-hover"
                    DataKeyNames="Standard_Id" DataSourceID="SqlDataSource1" Height="63px" 
                      Width="257px">
                    <AlternatingRowStyle />
                    <Columns>
                        <asp:BoundField DataField="Standard" HeaderText="Standard" 
                            SortExpression="Standard">
                        <ControlStyle ForeColor="#0066FF" />
                        <HeaderStyle Font-Size="Medium" Font-Underline="False" ForeColor="Black" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Standard_Id" HeaderText="Standard_Id" 
                            InsertVisible="False" ReadOnly="True" SortExpression="Standard_Id" 
                            Visible="False" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButton4" runat="server" CommandName="Edit" 
                                    Height="20px" ImageUrl="~/App_Themes/Theme1/documentation/img/edit.png" ToolTip="Edit" 
                                    Width="20px" />
                                <asp:ImageButton ID="ImageButton3" runat="server" CommandName="Delete" 
                                    Height="20px" ImageUrl="~/App_Themes/Theme1/documentation/img/delete.png" ToolTip="Delete" 
                                    Width="20px" />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:ImageButton ID="ImageButton5" runat="server" CommandName="Update" 
                                    Height="20px" ImageUrl="~/App_Themes/Theme1/documentation/img/save.png" ToolTip="Update" 
                                    Width="20px" />
                                <asp:ImageButton ID="ImageButton2" runat="server" CommandName="Cancel" 
                                    Height="20px" ImageUrl="~/App_Themes/Theme1/documentation/img/cancel.png" ToolTip="Cancel" 
                                    Width="20px" />
                            </EditItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <PagerStyle />
                   
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
        </tr>
    </table>
    </div>
    </div>
    </div>
    </form>
</asp:Content>

