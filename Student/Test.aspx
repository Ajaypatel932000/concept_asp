<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Test.aspx.cs" Inherits="Student_Test" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="style1">
            <tr>
                <td rowspan="2">
        <table class="style1">
            <tr>
                <td align="left">
                    <asp:Label ID="Label1" runat="server" Text="Question No." Font-Bold="True" 
                        Font-Size="Medium"></asp:Label>
                    <asp:Label ID="QuestionNo" runat="server" Text="Label"></asp:Label>
                    <asp:Label ID="QuestionID" runat="server"></asp:Label>
                    <hr />
                    <br />
                </td>
            </tr>
            <tr>
                <td align="left">
                    <asp:Label ID="LabelQuestion" runat="server" Font-Bold="True" 
                        Font-Size="Medium" Text="abc"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="left">
                    <asp:RadioButtonList ID="RadioButtonList1" runat="server" 
                        DataSourceID="SqlDataSource2" DataTextField="Option_Value" 
                        DataValueField="Option_Id">
                    </asp:RadioButtonList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionString_CONCEPT %>" 
                        SelectCommand="SELECT * FROM [Option_T] WHERE ([Question_Id] = @Question_Id)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="QuestionID" Name="Question_Id" 
                                PropertyName="Text" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <br />
                </td>
            </tr>
            <tr>
                <td align="left">
                    <asp:Button ID="Button1" runat="server" Font-Bold="True" 
                        ForeColor="Black" Height="30px" onclick="Button1_Click" Text="Save &amp; Next" 
                        Width="120px" />
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    
                </td>
                <td align="left">
                   
                    <asp:Panel ID="Panel1" runat="server" Height="134px" Width="100px">
                    </asp:Panel>
                    
                    </td>
            </tr>
            <tr>
                <td align="center" valign="top">
                   
                    <asp:Button ID="Button2" runat="server" onclick="Button2_Click" Text="Submit" />
                    
                    </td>
            </tr>
        </table>
    
        <br />
    
    </div>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="Question_Id" HeaderText="Question_Id" 
                SortExpression="Question_Id" />
            <asp:BoundField DataField="Question_Details" HeaderText="Question_Details" 
                SortExpression="Question_Details" />
            <asp:BoundField DataField="Answer_Details" HeaderText="Answer_Details" 
                SortExpression="Answer_Details" />
            <asp:BoundField DataField="Correct_Option" HeaderText="Correct_Option" 
                SortExpression="Correct_Option" />
            <asp:BoundField DataField="Minimum_Marks" HeaderText="Minimum_Marks" 
                SortExpression="Minimum_Marks" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString_CONCEPT %>" 
        SelectCommand="SELECT tq.Question_Id, qb.Question_Details, qb.Answer_Details, qb.Correct_Option, qb.Minimum_Marks FROM Test_Question AS tq INNER JOIN Test AS t ON tq.Test_Id = t.Test_Id INNER JOIN Question_Bank AS qb ON tq.Question_Id = qb.Question_Id WHERE (tq.Test_Id = @Test_Id)">
        <SelectParameters>
            <asp:QueryStringParameter Name="Test_Id" QueryStringField="test" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False">
        <Columns>
            <asp:BoundField DataField="qid" HeaderText="Question Id" />
            <asp:BoundField DataField="copt" HeaderText="Correct Option" />
            <asp:BoundField DataField="aopt" HeaderText="Attempt Option " />
            <asp:BoundField DataField="marks" HeaderText="Marks" />
            <asp:BoundField DataField="item" HeaderText="Index" />
        </Columns>
    </asp:GridView>
    <br />
    <br />

    
    </form>
</body>
</html>
