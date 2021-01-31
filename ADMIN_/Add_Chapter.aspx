<%@ Page Title="" Language="C#" MasterPageFile="~/ADMIN_/MasterPage.master" AutoEventWireup="true" CodeFile="Add_Chapter.aspx.cs" Inherits="Admin_Add_Chapter" %>

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
            width: 281px;
            height: 32px;
        }
        .style6
        {
            width: 281px;
        }
        .style10
        {
            height: 37px;
        }
        .style11
        {
            width: 281px;
            height: 37px;
        }
        .style12
        {
            width: 281px;
            height: 34px;
        }
        .style13
        {
            height: 34px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
   <div class="page-header">
        <h2 class="pageheader-title">Add Chapter </h2>
</div>
<form class="splash-container">
<div class="card">
<div class="card-body">
<div class="form-group">  
        <table class="style1">
            <tr>
                <td class="style12">
                    <asp:Label ID="Label1" runat="server" Font-Size="Large" 
                        style="text-align: left" Text="Standard" Width="100px"></asp:Label>
                </td>
                <td class="style12">
                    <asp:Label ID="Label2" runat="server" CssClass="style17" Font-Size="Large" 
                        Text="Subject " Width="100px"></asp:Label>
                </td>
                <td class="style13">
                    <asp:Label ID="Label3" runat="server" CssClass="style17" Font-Size="Large" 
                        Text="Chapter Name " Width="198px"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style11">
                    <asp:DropDownList ID="DropDownList1" class="form-control form-control-sm" runat="server" AppendDataBoundItems="True" 
                        AutoPostBack="True" DataSourceID="SqlDataSource1_std" DataTextField="Standard" 
                        DataValueField="Standard_Id" Height="27px" 
                         Width="150px">
                        <asp:ListItem Value="0">--SELECT--</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="style11">
                    <asp:DropDownList ID="DropDownList2" class="form-control form-control-sm" runat="server" AppendDataBoundItems="True" 
                        AutoPostBack="True" DataSourceID="SqlDataSource1_sub" 
                        DataTextField="Subject_Name" DataValueField="Subject_Id" Height="27px" 
                        onselectedindexchanged="DropDownList2_SelectedIndexChanged" Width="150px">
                        <asp:ListItem Value="0">--SELECT--</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="style10">
                    <asp:TextBox ID="TextBox1" class="form-control form-control-lg" runat="server" Height="27px" Width="150px" placeholder="Chapter Name"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style3">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ControlToValidate="DropDownList1" ErrorMessage="Please Select." ForeColor="Red" 
                        InitialValue="0" Width="135px"></asp:RequiredFieldValidator>
                </td>
                <td class="style3">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="DropDownList2" ErrorMessage="Please Select." ForeColor="Red" 
                        InitialValue="0"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:Label ID="Label4" runat="server" ForeColor="Red" Text="Enter Chapter Name"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style6">
                    &nbsp;</td>
                <td class="style6">
                    <asp:Button ID="Button1" runat="server" class="btn btn-rounded btn-primary" 
                        Text="Submit" Height="44px" Width="130px" onclick="Button1_Click" 
                        onclientclick="HideLabel()" />
              
                    <br />
                    <asp:Label ID="lblMessage" runat="server" Font-Bold="True" ForeColor="Black" 
                        Visible="False" />
                    </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2" colspan="2">
                    <br />
                    <asp:GridView ID="GridView1" runat="server" align="center" 
                        AutoGenerateColumns="False"  DataKeyNames="Chapter_Id,Subject_Id" 
                        DataSourceID="SqlDataSource1_ch"  
                        class="table table-hover" Height="105px" Width="459px">
                        <Columns>
                            <asp:BoundField DataField="Chapter_Id" HeaderText="Chapter_Id" ReadOnly="True" 
                                SortExpression="Chapter_Id" Visible="False" />
                            <asp:BoundField DataField="Chapter_Name" HeaderText="Chapter Name" 
                                SortExpression="Chapter_Name">
                            <ControlStyle Font-Size="Large" Font-Underline="True" ForeColor="White" />
                            <HeaderStyle Font-Size="Medium" Font-Underline="False" ForeColor="Black" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Subject_Id" HeaderText="Subject_Id" ReadOnly="True" 
                                SortExpression="Subject_Id" Visible="False" />
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
                    <asp:SqlDataSource ID="SqlDataSource1_ch" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionString_CONCEPT %>" 
                        DeleteCommand="DELETE FROM [Chapter] WHERE [Chapter_Id] = @Chapter_Id AND [Subject_Id] = @Subject_Id" 
                        InsertCommand="INSERT INTO [Chapter] ([Chapter_Id], [Chapter_Name], [Subject_Id]) VALUES (@Chapter_Id, @Chapter_Name, @Subject_Id)" 
                        SelectCommand="SELECT * FROM [Chapter] WHERE ([Subject_Id] = @Subject_Id)" 
                        
                        UpdateCommand="UPDATE [Chapter] SET [Chapter_Name] = @Chapter_Name WHERE [Chapter_Id] = @Chapter_Id AND [Subject_Id] = @Subject_Id" 
                        >
                        <DeleteParameters>
                            <asp:Parameter Name="Chapter_Id" Type="Int32" />
                            <asp:Parameter Name="Subject_Id" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="Chapter_Id" Type="Int32" />
                            <asp:Parameter Name="Chapter_Name" Type="String" />
                            <asp:Parameter Name="Subject_Id" Type="Int32" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownList2" Name="Subject_Id" 
                                PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="Chapter_Name" Type="String" />
                            <asp:Parameter Name="Chapter_Id" Type="Int32" />
                            <asp:Parameter Name="Subject_Id" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSource1_std" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionString_CONCEPT %>" 
                        SelectCommand="SELECT * FROM [Standard]"></asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSource1_sub" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionString_CONCEPT %>" 
                        SelectCommand="SELECT * FROM [Subject] WHERE ([Standard_Id] = @Standard_Id)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownList1" Name="Standard_Id" 
                                PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    </td>
            </tr>
        </table>
        
        <br />
</div>
</div>
</div>
</form>
    
</asp:Content>

