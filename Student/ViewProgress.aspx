<%@ Page Title="" Language="C#" MasterPageFile="~/Student/MasterPage.master" AutoEventWireup="true" CodeFile="ViewProgress.aspx.cs" Inherits="Student_ViewProgress" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
<div class="page-header">
        <h2 class="pageheader-title"> Yearly Progress Report </h2>
</div>
<form class="splash-container">
<div class="card">
<div class="card-body">
<div class="form-group">
    <table class="w-100">
        <tr>
            <td align="right">
                Select Subject
                <br />
                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                    DataSourceID="SqlDataSource1" DataTextField="Subject_Name" 
                    DataValueField="Subject_Id" 
                    onselectedindexchanged="DropDownList1_SelectedIndexChanged" 
                    AppendDataBoundItems="True">
                    <asp:ListItem>Select</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString_CONCEPT %>" 
                    SelectCommand="Select * FROM Subject WHERE Subject_Id IN (SELECT Subject_Id FROM Batch_Subject WHERE Batch_Id = (SELECT Batch_Id FROM Enrollment WHERE Enrollment_Id=@Enrollment_Id))">
                    <SelectParameters>
                        <asp:SessionParameter Name="Enrollment_Id" SessionField="Eid" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
    </table>
<br />
&nbsp;<asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource2" 
        Width="1184px">
        <Series>
            <asp:Series ChartType="Line" Name="Series1" XValueMember="test" 
                YValueMembers="Percentage">
            </asp:Series>
        </Series>
        <ChartAreas>
            <asp:ChartArea Name="ChartArea1">
            </asp:ChartArea>
        </ChartAreas>
    </asp:Chart>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString_CONCEPT %>" SelectCommand="SELECT ((r.Obtained_Mark*100)/t.Total_Marks) as Percentage , r.Test_Id as test FROM Test t, Result r 
WHERE
t.Test_Id=r.Test_Id AND r.Enrollment_Id=@Enrollment_Id ORDER BY (r.Test_Id)">
        <SelectParameters>
            <asp:SessionParameter Name="Enrollment_Id" SessionField="Eid" />
        </SelectParameters>
    </asp:SqlDataSource>
</div>
</div>
</div>
</form>
</asp:Content>

