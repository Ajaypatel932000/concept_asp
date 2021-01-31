<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="TestReport.aspx.cs" Inherits="Student_TestReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Concept - Bootstrap 4 Admin Dashboard Template</title>
    <link rel="stylesheet" href="../App_Themes/Theme1/assets/vendor/bootstrap/css/bootstrap.min.css">
    <link href="../App_Themes/Theme1/assets/vendor/fonts/circular-std/style.css" rel="stylesheet">
    <link rel="stylesheet" href="../App_Themes/Theme1/assets/libs/css/style.css">
    <link rel="stylesheet" href="../App_Themes/Theme1/assets/vendor/fonts/fontawesome/css/fontawesome-all.css">
    <style type="text/css">
        html, body {
        height: 100%;
        
    }

    body {
        display: -ms-flexbox;
        -ms-flex-align: center;
        align-items: center;
        padding-bottom: 40px;
    }
        .style1
        {
            width: 100%;
        }
        .style3
        {
            width: 100%;
            height: 150px;
        }
        .style8
        {
            width: 123px;
            height: 80px;
        }
        .style14
        {
            width: 155px;
        }
        .style9
        {
            width: 138px;
        }
        .style13
        {
            width: 119px;
        }
        .style6
        {
            width: 112px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
<div class="page-header"><h2 class = "pageheader-title">Test Report </h2></div>

<div class="card">
<div class="card-body">
<div class="form-group">

    <table class="style1">
        <tr>
            <td>
                <table class="style3">
                    <tr>
                        <td bgcolor="#CCFF66" class="style8">
                            <br />
                            &nbsp;<asp:Label ID="LabelScore" runat="server" ForeColor="Black"></asp:Label>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <br />
                            <br />
                            <br />
                            &nbsp;<asp:Label ID="Label3" runat="server" ForeColor="Black" Text="Score" 
                                Width="80px"></asp:Label>
                            <br />
                        </td>
                        <td bgcolor="#CCFF66" class="style8">
                            &nbsp;&nbsp;
                            <asp:ImageButton ID="ImageButton1" runat="server" Height="20px" 
                                ImageUrl="~/App_Themes/Theme1/assets/images/Score2.jpg" Width="20px" />
                        </td>
                    </tr>
                </table>
            </td>
            <td>
                <table class="style3">
                    <tr>
                        <td bgcolor="#FFCCCC" class="style14">
                            <br />
                            &nbsp;<asp:Label ID="LabelInCorrect" runat="server" ForeColor="Black"></asp:Label>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <br />
                            <br />
                            <br />
                            &nbsp;<asp:Label ID="Label4" runat="server" ForeColor="Black" 
                                Text="Negetive Answered" Width="134px" Height="42px"></asp:Label>
                            <br />
                        </td>
                        <td bgcolor="#FFCCCC" class="style9">
                            &nbsp;&nbsp;&nbsp;
                            <asp:ImageButton ID="ImageButton2" runat="server" Height="20px" 
                                ImageUrl="~/App_Themes/Theme1/assets/images/Negative_Mark3.png" 
                                style="text-align: right" Width="20px" />
                        </td>
                    </tr>
                </table>
            </td>
            <td>
                <table class="style3">
                    <tr>
                        <td bgcolor="#99CCFF" class="style13">
                            <br />
                            &nbsp;<asp:Label ID="LabelPercentage" runat="server" ForeColor="Black"></asp:Label>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <br />
                            <br />
                            <br />
                            &nbsp;<asp:Label ID="Label6" runat="server" ForeColor="Black" Text="Percentage % " 
                                Width="100px"></asp:Label>
                            <br />
                        </td>
                        <td bgcolor="#99CCFF" class="style6">
                            &nbsp;&nbsp;
                            <asp:ImageButton ID="ImageButton3" runat="server" Height="20px" 
                                ImageUrl="~/App_Themes/Theme1/assets/images/Percentage1.png" 
                                style="text-align: right" Width="20px" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>

</div>
</div>
</div>

<div class="page-header"><h3 class = "pageheader-title">Test Summary </h3></div>

<div class="card">
<div class="card-body">
<div class="form-group">

    <table class="style1">
        <tr>
            <td align="center">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    DataSourceID="SqlDataSource1" Width="100%" class="table table-hover">
                    <Columns>
                        <asp:BoundField DataField="Question_Details" HeaderText="Question" 
                            SortExpression="Question_Details" />
                        <asp:BoundField DataField="ATTEMPOPTION" HeaderText="Attempted Answer" 
                            ReadOnly="True" SortExpression="ATTEMPOPTION" />
                        <asp:BoundField DataField="CORRECTOPTION" HeaderText="Correct Answer" 
                            ReadOnly="True" SortExpression="CORRECTOPTION" />
                        <asp:BoundField DataField="Expr1" HeaderText="Status" ReadOnly="True" 
                            SortExpression="Expr1" />
                    </Columns>
                    <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <HeaderStyle  Font-Bold="True" ForeColor="Black" HorizontalAlign="Center" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                    <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#0000A9" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#000065" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString_CONCEPT %>" 
                    SelectCommand="SELECT qb.Question_Details, (SELECT Option_Value FROM Option_T WHERE (Option_Id = q.Correct_Option) AND (Question_Id = qb.Question_Id)) AS CORRECTOPTION, (SELECT Option_Value FROM Option_T AS Option_T_1 WHERE (Option_Id = q.Attempted_option) AND (Question_Id = qb.Question_Id)) AS ATTEMPOPTION, CASE q.Attempted_option WHEN 0 THEN 'Skipped' ELSE 'Attempted' END AS Expr1 FROM Question_Bank AS qb INNER JOIN Test_Answered_Paper AS q ON qb.Question_Id = q.Question_Id WHERE (q.Test_Id = @test_id) AND (q.Enrollment_Id = @enrollment_id)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="LabelTestId" Name="test_id" 
                            PropertyName="Text" />
                        <asp:SessionParameter Name="enrollment_id" SessionField="Eid" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>

    <br />
    <asp:Label ID="LabelTestId" runat="server" Text="Label" Visible="False"></asp:Label>

</div>
</div>
</div>

</asp:Content>

