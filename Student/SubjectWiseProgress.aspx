<%@ Page Title="" Language="C#" MasterPageFile="~/Student/MasterPage.master" AutoEventWireup="true" CodeFile="SubjectWiseProgress.aspx.cs" Inherits="Student_SubjectWiseProgress" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
<div class="page-header">
        <h2 class="pageheader-title"> Subject Wise Progress Report </h2>
</div>
<form class="splash-container">
<div class="card">
<div class="card-body">
<div class="form-group">
    <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
    <table class="w-100">
        <tr>
            <td align="right">
                &nbsp;</td>
        </tr>
        <tr>
            <td>
    <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource1" 
        Height="297px" Width="1149px">
        <Series>
            <asp:Series Name="Series1" ChartType="Line" XValueMember="Test" 
                YValueMembers="Percentage">
            </asp:Series>
        </Series>
        <ChartAreas>
            <asp:ChartArea Name="ChartArea1">
            </asp:ChartArea>
        </ChartAreas>
    </asp:Chart>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString_CONCEPT %>" 
        SelectCommand="SELECT r.Obtained_Mark * 100 / t.Total_Marks AS Percentage, r.Test_Id AS Test FROM Test AS t INNER JOIN Result AS r ON t.Test_Id = r.Test_Id WHERE (r.Enrollment_Id = @Enrollment_Id) AND (t.Subject_Id = @Subject_Id) ORDER BY Test">
        <SelectParameters>
            <asp:SessionParameter Name="Enrollment_Id" SessionField="Eid" />
            <asp:ControlParameter ControlID="Label1" Name="Subject_Id" 
                PropertyName="Text" />
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

