<%@ Page Title="" Language="C#" MasterPageFile="~/Student/MasterPage.master" AutoEventWireup="true" CodeFile="ShowResult.aspx.cs" Inherits="Student_ShowResult" %>

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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
 

<div class="page-header">
        <h2 class="pageheader-title">Show Notification </h2>
</div>
<form class="splash-container">
<div class="card">
<div class="card-body">
<div class="form-group">

    <table class="dropzone-previews">
        <tr>
            <td align="right" class="style5">
                <asp:Label ID="Label2" runat="server" Text="Subject :" Font-Size="Medium" 
                    style="text-align: left" Width="100px"></asp:Label>
            </td>
            <td class="style3">
                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                    DataSourceID="SqlDataSource1Subject" DataTextField="Subject_Name" 
                    DataValueField="Subject_Id">
                    <asp:ListItem Value="0">SELECT</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="style3">
                <asp:SqlDataSource ID="SqlDataSource1Subject" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString_CONCEPT %>" 
                    
                    SelectCommand="SELECT [Subject_Id], [Subject_Name] FROM [ProgressReportSubject] WHERE ([Enrollment_Id] = @Enrollment_Id)">
                    <SelectParameters>
                        <asp:SessionParameter Name="Enrollment_Id" SessionField="Eid" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td align="right" class="style6">
                <asp:Label ID="Label3" runat="server" Text="Test Name :" Font-Size="Medium" 
                    style="text-align: left" Width="100px"></asp:Label>
            </td>
            <td class="style4">
                <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" 
                    DataSourceID="SqlDataSource1TestName" DataTextField="Test_Name" 
                    DataValueField="Test_Id">
                    <asp:ListItem Value="0">SELECT</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="style4">
                <asp:SqlDataSource ID="SqlDataSource1TestName" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString_CONCEPT %>" 
                    SelectCommand="SELECT [Test_Name], [Test_Id] FROM [ProgressReportSubject] WHERE (([Enrollment_Id] = @Enrollment_Id) AND ([Subject_Id] = @Subject_Id))">
                    <SelectParameters>
                        <asp:SessionParameter Name="Enrollment_Id" SessionField="Eid" Type="Int32" />
                        <asp:ControlParameter ControlID="DropDownList1" Name="Subject_Id" 
                            PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource1LIST" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString_CONCEPT %>" 
                    SelectCommand="SELECT qb.Question_Details, (SELECT Option_Value FROM Option_T WHERE (Option_Id = q.Correct_Option) AND (Question_Id = qb.Question_Id)) AS CORRECTOPTION, (SELECT Option_Value FROM Option_T AS Option_T_1 WHERE (Option_Id = q.Attempted_option) AND (Question_Id = qb.Question_Id)) AS ATTEMPOPTION, CASE q.Attempted_option WHEN 0 THEN 'Not Attempted' ELSE 'Attempted' END AS Expr1 FROM Question_Bank AS qb INNER JOIN Test_Answered_Paper AS q ON qb.Question_Id = q.Question_Id WHERE (q.Test_Id = @test_id) AND (q.Enrollment_Id = @enrollment_id)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList2" Name="test_id" 
                            PropertyName="SelectedValue" />
                        <asp:SessionParameter Name="enrollment_id" SessionField="Eid" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        
    </table>

                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    DataSourceID="SqlDataSource1LIST" Width="100%" CssClass="Grid" 
                    onrowdatabound="GridView1_RowDataBound" >
                    <Columns>
                        <asp:BoundField DataField="Question_Details" HeaderText="Question Details" 
                            SortExpression="Question_Details" >
                        <HeaderStyle Font-Size="Large" Font-Underline="True" />
                        </asp:BoundField>
                        <asp:BoundField DataField="CORRECTOPTION" HeaderText="Correct Answer" 
                            ReadOnly="True" SortExpression="CORRECTOPTION" >
                        <HeaderStyle Font-Size="Large" Font-Underline="True" />
                        </asp:BoundField>
                        <asp:BoundField DataField="ATTEMPOPTION" HeaderText="Attempt Answer" 
                            ReadOnly="True" SortExpression="ATTEMPOPTION" >
                        <HeaderStyle Font-Size="Large" Font-Underline="True" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Expr1" HeaderText="Status" ReadOnly="True" 
                            SortExpression="Expr1" />
                    </Columns>
                    <RowStyle HorizontalAlign="Center" />
                </asp:GridView>

    <br />
</div>
</div>
</div>
</form>

</asp:Content>

