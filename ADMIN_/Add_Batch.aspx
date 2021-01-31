<%@ Page Title="" Language="C#" MasterPageFile="~/ADMIN_/MasterPage.master" AutoEventWireup="true" CodeFile="Add_Batch.aspx.cs" Inherits="ADMIN_Add_Batch" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Concept - Bootstrap 4 Admin Dashboard Template</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="../App_Themes/Theme1/assets/vendor/bootstrap/css/bootstrap.min.css"/>
    <link href="../App_Themes/Theme1/assets/vendor/fonts/circular-std/style.css" rel="stylesheet"/>
    <link rel="stylesheet" href="../App_Themes/Theme1/assets/libs/css/style.css"/>
    <link rel="stylesheet" href="../App_Themes/Theme1/assets/vendor/fonts/fontawesome/css/fontawesome-all.css"/>
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
       
        .style13
        {
            height: 39px;
            width: 185px;
        }
       
        .style15
        {
            width: 78%;
            height: 591px;
        }
        .style16
        {
        }
               
        .style23
        {
        }
       
        .style33
        {
            height: 39px;
            width: 384px;
        }
        .style36
        {
            height: 39px;
            width: 406px;
        }
        .style37
        {
            height: 35px;
            width: 406px;
        }
        .style38
        {
            height: 35px;
            width: 384px;
        }
        .style39
        {
            height: 35px;
            width: 185px;
        }
        .style40
        {
            height: 36px;
            width: 406px;
        }
        .style41
        {
            height: 36px;
            width: 384px;
        }
        .style42
        {
            height: 36px;
            width: 185px;
        }
       
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
<div class="page-header">
        <h2 class="pageheader-title">Add Batch </h2>
</div>
<form class="splash-container">
<div class="card">
<div class="card-body">
<div class="form-group">  
   
    <table class="style15">
        <tr>
            <td class="style37">
                <asp:Label ID="Label2" runat="server" Font-Bold="False" Font-Size="Large" 
                    Text="Standard " Width="100px"></asp:Label>
            </td>
            <td class="style38">
                <asp:Label ID="Label3" runat="server" Text="Subject " Font-Size="Large"></asp:Label>
            </td>
            <td class="style39">
                <asp:Label ID="Label1" runat="server" Font-Size="Large" 
                    Text="Batch Name" Width="171px"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style40">
                <asp:DropDownList ID="DropDownList1" runat="server" AppendDataBoundItems="True" 
                    AutoPostBack="True" DataSourceID="SqlDataSource1_Std"  DataTextField="Standard" 
                    DataValueField="Standard_Id" class="form-control form-control-sm" Height="27px" Width="150px">
                    <asp:ListItem Value="0">--SELECT--</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="style41">
                <br />
                <asp:CheckBoxList ID="CheckBoxList1" runat="server" AutoPostBack="True" 
                    DataSourceID="SqlDataSource1_subject" DataTextField="Subject_Name" 
                    DataValueField="Subject_Id" Width="414px">
                </asp:CheckBoxList>
            </td>
            <td class="style42">
                <asp:TextBox ID="TextBox1" runat="server" class="form-control form-control-lg" 
                    Height="27px" Width="150px" placeholder="Batch Name"  ></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style36">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="DropDownList1" ErrorMessage="Please Select." ForeColor="Red" 
                    Height="16px" InitialValue="0" Width="118px"></asp:RequiredFieldValidator>
            </td>
            <td class="style33">
                &nbsp;</td>
            <td class="style13">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style36">
                &nbsp;</td>
            <td class="style33">
                <asp:Button ID="Button1" class="btn btn-rounded btn-primary" runat="server" 
                    Text="Submit" Height="44px" onclick="Button1_Click" Width="130px" />
                <br />
                <asp:Label ID="lblMessage" runat="server" Font-Bold="False" ForeColor="Black" 
                    style="font-weight: 700" Visible="False" />
                </td>
            <td class="style13">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style23" colspan="2">
                <br />
                <asp:GridView ID="GridView1" runat="server" align="center" AllowSorting="True" 
                    AutoGenerateColumns="False"  DataKeyNames="Batch_Id" DataSourceID="SqlDataSource1_batch" 
                     Width="419px" class="table table-hover" Height="105px">
                    <Columns>
                        <asp:BoundField DataField="Batch_Name" HeaderText="Batch Name" 
                            SortExpression="Batch_Name" >
                        <HeaderStyle ForeColor="Black" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Batch_Id" HeaderText="Batch_Id" 
                            InsertVisible="False" ReadOnly="True" SortExpression="Batch_Id" 
                            Visible="False" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButton1" runat="server" CommandName="Edit" 
                                    Height="20px" ImageUrl="~/App_Themes/Theme1/documentation/img/edit.png" ToolTip="Edit" 
                                    Width="20px" />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:ImageButton ID="ImageButton3" runat="server" CommandName="Update" 
                                    Height="20px" ImageUrl="~/App_Themes/Theme1/documentation/img/save.png" ToolTip="Update" 
                                    Width="20px" />
                                <asp:ImageButton ID="ImageButton2" runat="server" CommandName="Cancel" 
                                    Height="20px" ImageUrl="~/App_Themes/Theme1/documentation/img/cancel.png" ToolTip="Cancel" 
                                    Width="20px" />
                            </EditItemTemplate>
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
        </tr>
        <tr>
            <td class="style16" colspan="3">
                <asp:SqlDataSource ID="SqlDataSource1_subject" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString_CONCEPT %>" 
                    SelectCommand="SELECT [Subject_Id], [Subject_Name] FROM [Subject] WHERE ([Standard_Id] = @Standard_Id)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList1" Name="Standard_Id" 
                            PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource1_batch" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString_CONCEPT %>" 
                    DeleteCommand="DELETE FROM [Batch] WHERE [Batch_Id] = @Batch_Id" 
                    InsertCommand="INSERT INTO [Batch] ([Batch_Name]) VALUES (@Batch_Name)" 
                    SelectCommand="SELECT [Batch_Name], [Batch_Id] FROM [Batch] WHERE ([Standard_Id] = @Standard_Id)" 
                    UpdateCommand="UPDATE [Batch] SET [Batch_Name] = @Batch_Name WHERE [Batch_Id] = @Batch_Id">
                    <DeleteParameters>
                        <asp:Parameter Name="Batch_Id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Batch_Name" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList1" Name="Standard_Id" 
                            PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Batch_Name" Type="String" />
                        <asp:Parameter Name="Batch_Id" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource1_Std" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString_CONCEPT %>" 
                    SelectCommand="SELECT * FROM [Standard]"></asp:SqlDataSource>
            </td>
        </tr>
    </table>
</div>
</div>
</div>
</form>
    <br />
    <br />
    

</asp:Content>

