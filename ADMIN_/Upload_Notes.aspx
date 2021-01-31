<%@ Page Title="" Language="C#" MasterPageFile="~/ADMIN_/MasterPage.master" AutoEventWireup="true" CodeFile="Upload_Notes.aspx.cs" Inherits="ADMIN_Upload_Notes" %>

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
        .style2
        {
            width: 117%;
        }
        .style3
        {
        }
        .style4
        {
            width: 476px;
        }
        .style5
        {
            width: 376px;
        }
        .style6
        {
            width: 492px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
<div class="page-header">
        <h2 class="pageheader-title">Upload Note</h2>
</div>
<form class="splash-container">
<div class="card">
<div class="card-body">
<div class="form-group">  
   
        <table class="style2">
            <tr>
                <td class="style5">
                <asp:Label ID="Label2" runat="server" Font-Size="Large" Text="Standard " 
                    Width="100px"></asp:Label>
                </td>
                <td class="style4">
                <asp:Label ID="Label3" runat="server" Font-Size="Large" Text="Subject " 
                    Width="100px"></asp:Label>
                </td>
                <td class="style6">
                <asp:Label ID="Label4" runat="server" Font-Size="Large" Text="Chapter " 
                    Width="100px"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style5">
                <asp:DropDownList ID="DropDownList1" class="form-control form-control-sm" runat="server" AppendDataBoundItems="True" 
                    AutoPostBack="True" DataSourceID="SqlDataSource1_std" DataTextField="Standard" 
                    DataValueField="Standard_Id" 
                    onselectedindexchanged="DropDownList1_SelectedIndexChanged" Height="27px" Width="150px">
                    <asp:ListItem Value="0">--SELECT--</asp:ListItem>
                </asp:DropDownList>
                </td>
                <td class="style4">
                <asp:DropDownList ID="DropDownList2" class="form-control form-control-sm" runat="server" AppendDataBoundItems="True" 
                    AutoPostBack="True" DataSourceID="SqlDataSource1_sub" 
                    DataTextField="Subject_Name" DataValueField="Subject_Id" 
                    onselectedindexchanged="DropDownList2_SelectedIndexChanged" Height="27px" Width="150px">
                    <asp:ListItem Value="0">--SELECT--</asp:ListItem>
                </asp:DropDownList>
                </td>
                <td class="style6">
                <asp:DropDownList ID="DropDownList3" class="form-control form-control-sm" runat="server" AppendDataBoundItems="True" 
                    AutoPostBack="True" DataSourceID="SqlDataSource1_ch" 
                    DataTextField="Chapter_Name" DataValueField="Chapter_Id" Height="27px" Width="150px">
                    <asp:ListItem Value="0">--SELECT--</asp:ListItem>
                </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="style5">
                    &nbsp;</td>
                <td class="style4">
                    &nbsp;</td>
                <td class="style6">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style5">
                <asp:Label ID="Label6" runat="server" Text="Batch Name" Font-Size="Large"></asp:Label>
                </td>
                <td class="style4">
                <asp:Label ID="Label1" runat="server" Font-Size="Large" Text="Choose Notes " 
                    Width="150px"></asp:Label>
                </td>
                <td class="style6">
                <asp:Label ID="Label5" runat="server" Font-Size="Large" Height="30px" 
                    Text="Note Name " Width="230px"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style5">
                <asp:DropDownList ID="DropDownList4" class="form-control form-control-sm" runat="server" AutoPostBack="True" 
                    DataSourceID="SqlDataSource1_batch" DataTextField="Batch_Name" 
                    DataValueField="Batch_Id" AppendDataBoundItems="True"  Height="27px" Width="150px">
                      <asp:ListItem Value="0">--SELECT--</asp:ListItem>
                </asp:DropDownList>
                </td>
                <td class="style4">
                <asp:FileUpload ID="FileUpload1" runat="server"  />
                </td>
                <td class="style6">
                <asp:TextBox ID="TextBox1" runat="server" class="form-control form-control-lg" placeholder="Note Name" Height="27px" Width="150px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style5">
                <asp:SqlDataSource ID="SqlDataSource1_ch" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString_CONCEPT %>" 
                    SelectCommand="SELECT [Chapter_Id], [Chapter_Name] FROM [Chapter] WHERE ([Subject_Id] = @Subject_Id)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList2" Name="Subject_Id" 
                            PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                </td>
                <td class="style4">
                    <br />
                <asp:Button ID="Button1" runat="server" Text="Upload"  class="btn btn-rounded btn-primary"
            onclick="Button1_Click"  Height="44px" Width="130px" />
                    <br />
                <asp:Label ID="lblMessage" runat="server" Font-Bold="True" ForeColor="Black" 
                    Visible="False" />
                </td>
                <td class="style6">
                <asp:SqlDataSource ID="SqlDataSource1_batch" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString_CONCEPT %>" 
                    SelectCommand="SELECT [Batch_Id], [Batch_Name] FROM [Batch] WHERE ([Standard_Id] = @Standard_Id)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList1" Name="Standard_Id" 
                            PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="style3" colspan="2">
                    
                    <br />
                    <br />
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                      DataSourceID="SqlDataSource1_SHOW" class="table table-hover" >
                    <Columns>
                        <asp:BoundField DataField="Note_Details" HeaderText="Note Details" 
                            SortExpression="Note_Details">
                        <HeaderStyle Font-Size="Medium" Font-Underline="False" ForeColor="Black" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Path" HeaderText="Path" SortExpression="Path">
                        <HeaderStyle Font-Size="Medium" Font-Underline="False" ForeColor="Black" />
                        </asp:BoundField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("Path") %>'>View</asp:HyperLink>
                            </ItemTemplate>
                            <ControlStyle ForeColor="#0066FF" />
                        </asp:TemplateField>
                    </Columns>
                   <EmptyDataRowStyle HorizontalAlign="Center" />
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
                <td class="style6">
                <asp:SqlDataSource ID="SqlDataSource1_sub" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString_CONCEPT %>" 
                    SelectCommand="SELECT * FROM [Subject] WHERE ([Standard_Id] = @Standard_Id)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList1" Name="Standard_Id" 
                            PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource1_std" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString_CONCEPT %>" 
                    SelectCommand="SELECT * FROM [Standard]"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource1_SHOW" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString_CONCEPT %>" 
                    SelectCommand="SELECT [Note_Details], [Path] FROM [Notes] WHERE (([Chapter_Id] = @Chapter_Id) AND ([Subject_Id] = @Subject_Id))">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList3" Name="Chapter_Id" 
                            PropertyName="SelectedValue" Type="Int32" />
                        <asp:ControlParameter ControlID="DropDownList2" Name="Subject_Id" 
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

