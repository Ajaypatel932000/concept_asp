<%@ Page Title="" Language="C#" MasterPageFile="~/ADMIN_/MasterPage.master" AutoEventWireup="true" CodeFile="Add_Subject_.aspx.cs" Inherits="Add_Subject_" %>

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
            width: 1129px;
        }
        .style2
        {
        }
        .style3
        {
            width: 518px;
            text-align: left;
        }
        .style4
        {
            width: 518px;
            text-align: left;
            height: 29px;
        }
        .style5
        {
            width: 1129px;
            height: 29px;
        }
        .style6
        {
            height: 29px;
        }
        .style7
        {
            width: 962px;
        }
        .style8
        {
            width: 962px;
            height: 29px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
   <div class="page-header">
        <h2 class="pageheader-title">Add Subject</h2>
</div>
<form class="splash-container">
<div class="card">
<div class="card-body">
<div class="form-group">  
   
    <table >
        <tr>
            <td class="style3">
                <asp:Label ID="Label1" runat="server" Font-Size="Large" Text="Standard " 
                    Width="100px"></asp:Label>
            </td>
            <td class="style1">
                <asp:Label ID="Label2" runat="server" Font-Size="Large" Text="Subject Name " 
                    Width="219px"></asp:Label>
            </td>
            <td class="style7">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style4">
                <asp:DropDownList ID="DropDownList1" runat="server" AppendDataBoundItems="True" 
                    AutoPostBack="True" DataSourceID="SqlDataSource1_std" DataTextField="Standard" 
                    DataValueField="Standard_Id" Height="27px" 
                    onselectedindexchanged="DropDownList1_SelectedIndexChanged" Width="150px" class="form-control form-control-sm">
                    <asp:ListItem Value="0">--SELECT--</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="style5">
                <asp:TextBox ID="TextBox1" runat="server" class="form-control form-control-lg" 
                    Height="27px" Width="150px" placeholder="Subject Name"></asp:TextBox>
            </td>
            <td class="style8">
                </td>
            <td class="style6">
                </td>
        </tr>
        <tr>
            <td class="style3">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="DropDownList1" ErrorMessage="Please Select." ForeColor="Red" 
                    InitialValue="0"></asp:RequiredFieldValidator>
            </td>
            <td class="style1" colspan="2">
                <br />
                <asp:Button ID="Button1" runat="server" Text="Submit" 
                    class="btn btn-rounded btn-primary" Height="44px" Width="130px" 
                    onclick="Button1_Click"/>
                  <br />
                <asp:Label ID="lblMessage" runat="server" Font-Bold="True" ForeColor="Black" 
                    Visible="False" />
                <br />
            </td>
            <td>
                <asp:SqlDataSource ID="SqlDataSource1_std" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString_CONCEPT %>" 
                    SelectCommand="SELECT * FROM [Standard]"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource1_subject" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString_CONCEPT %>" 
                    DeleteCommand="DELETE FROM [Subject] WHERE [Subject_Id] = @Subject_Id" 
                    InsertCommand="INSERT INTO [Subject] ([Subject_Name], [Standard_Id]) VALUES (@Subject_Name, @Standard_Id)" 
                    SelectCommand="SELECT [Subject_Id], [Subject_Name], [Standard_Id] FROM [Subject] WHERE ([Standard_Id] = @Standard_Id)" 
                    UpdateCommand="UPDATE [Subject] SET [Subject_Name] = @Subject_Name WHERE [Subject_Id] = @Subject_Id">
                    <DeleteParameters>
                        <asp:Parameter Name="Subject_Id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Subject_Name" Type="String" />
                        <asp:Parameter Name="Standard_Id" Type="Int32" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList1" Name="Standard_Id" 
                            PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Subject_Name" Type="String" />
                        <asp:Parameter Name="Standard_Id" Type="Int32" />
                        <asp:Parameter Name="Subject_Id" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="style2" colspan="3" align="left">
                <br />
                <asp:GridView ID="GridView1" runat="server" align="center" 
                    AutoGenerateColumns="False" class="table table-hover"
                    DataKeyNames="Subject_Id" DataSourceID="SqlDataSource1_subject" 
                    AllowSorting="True" Width="288px">
                    <Columns>
                        <asp:BoundField DataField="Subject_Id" HeaderText="Subject_Id" 
                            InsertVisible="False" ReadOnly="True" SortExpression="Subject_Id" 
                            Visible="False" />
                        <asp:BoundField DataField="Subject_Name" HeaderText="Subject Name" 
                            SortExpression="Subject_Name">
                        <HeaderStyle ForeColor="Black" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Standard_Id" HeaderText="Standard_Id" 
                            SortExpression="Standard_Id" Visible="False" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButton4" runat="server" CommandName="Edit" 
                                    Height="20px" ImageUrl="~/App_Themes/Theme1/documentation/img/edit.png" ToolTip="Edit" 
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
    </div>
    </div>
    </div>
    </form>
  
</asp:Content>

