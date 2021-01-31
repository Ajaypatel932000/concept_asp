<%@ Page Title="" Language="C#" MasterPageFile="~/Student/MasterPage.master" AutoEventWireup="true" CodeFile="All_Notification.aspx.cs" Inherits="Student_All_Notification" %>

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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
 <div class="page-header">
        <h2 class="pageheader-title">All Notification </h2>
</div>
<form class="splash-container">
<div class="card">
<div class="card-body">
<div class="form-group">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        CssClass="Grid" DataSourceID="SqlDataSource1_notification" 
         Width="453px" class="table table-hover" Height="147px">
        <Columns>
            <asp:BoundField DataField="Date" HeaderText="Date" ReadOnly="True" 
                SortExpression="Date">
            <HeaderStyle  />
            </asp:BoundField>
            <asp:BoundField DataField="Message" HeaderText="Message" 
                SortExpression="Message">
            <HeaderStyle  />
            </asp:BoundField>
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
    <br />
    <asp:SqlDataSource ID="SqlDataSource1_notification" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString_CONCEPT %>" 
        SelectCommand="SELECT CONVERT (varchar, Notification_Date, 5) AS Date, Message FROM Notification WHERE (Enrollment_Id = @Enrollment_Id) ORDER BY Notification_Id DESC">
        <SelectParameters>
            <asp:SessionParameter Name="Enrollment_Id" SessionField="Eid" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</div>
</div>
</div>
</form>
</asp:Content>

