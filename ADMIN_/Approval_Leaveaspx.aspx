<%@ Page Title="" Language="C#" MasterPageFile="~/ADMIN_/MasterPage.master" AutoEventWireup="true" CodeFile="Approval_Leaveaspx.aspx.cs" Inherits="Admin_Approval_Leaveaspx" %>

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
        .style3
        {
            height: 27px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
<div class="page-header">
        <h2 class="pageheader-title">Approve Leave </h2>
</div>
<form class="splash-container">
<div class="card">
<div class="card-body">
<div class="form-group">  
   
        <table class="style1">
            <tr>
                <td colspan="2">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    class="table table-hover" DataSourceID="SqlDataSource1" 
                     Width="861px">
                    <Columns>
                        <asp:BoundField DataField="Leave_Id" HeaderText="Leave Id" 
                            InsertVisible="False" ReadOnly="True" SortExpression="Leave_Id">
                        <HeaderStyle Font-Size="Medium" Font-Underline="False" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Standard" HeaderText="Standard" 
                            SortExpression="Standard">
                        <HeaderStyle Font-Size="Medium" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Batch_Name" HeaderText="Batch Name" 
                            SortExpression="Batch_Name">
                        <HeaderStyle Font-Size="Medium" Font-Underline="False" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Enrollment_Id" HeaderText="Enrollment" 
                            InsertVisible="False" ReadOnly="True" SortExpression="Enrollment_Id">
                        <HeaderStyle Font-Size="Medium" Font-Underline="False" />
                        </asp:BoundField>
                        <asp:BoundField DataField="LeaveFROM" HeaderText="From" ReadOnly="True" 
                            SortExpression="LeaveFROM">
                        <HeaderStyle Font-Size="Medium"  />
                        </asp:BoundField>
                        <asp:BoundField DataField="LeaveTO" HeaderText="To" ReadOnly="True" 
                            SortExpression="LeaveTO">
                        <HeaderStyle Font-Size="Medium" Font-Underline="False" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Leave_Reason" HeaderText="Reason" 
                            SortExpression="Leave_Reason">
                        <HeaderStyle Font-Size="Medium" Font-Underline="False" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Approval">
                            <ItemTemplate>
                                <asp:CheckBox ID="CheckBox1" runat="server" />
                            </ItemTemplate>
                            <HeaderStyle Font-Size="Medium" />
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
            </tr>
            <tr>
                <td class="style3">
                </td>
                <td class="style3">
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString_CONCEPT %>" 
                    
                        SelectCommand="SELECT L.Leave_Id,S.Standard, B.Batch_Name, E.Enrollment_Id, CONVERT (varchar, L.Leave_To, 3) AS LeaveTO, CONVERT (varchar, L.Leave_From, 3) AS LeaveFROM, L.Leave_Reason FROM Enrollment AS E INNER JOIN Leave_Application AS L ON E.Enrollment_Id = L.Enrollment_Id INNER JOIN Batch AS B ON E.Batch_Id = B.Batch_Id INNER JOIN Standard AS S ON E.Standard_Id = S.Standard_Id WHERE (L.Status = 0)" 
                        >
                </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="Button1" runat="server" Text="Button" 
                        class="btn btn-rounded btn-primary" Height="44px" Width="130px" 
                        onclick="Button1_Click" />
                    <br />
                &nbsp;&nbsp;
                <asp:Label ID="lblMessage" runat="server" Font-Bold="True" ForeColor="Black" 
                    Visible="False" />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
      
    </table>
    </div>
    </div>
    </div>
    </form>
</asp:Content>

