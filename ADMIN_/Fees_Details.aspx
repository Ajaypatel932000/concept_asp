<%@ Page Title="" Language="C#" MasterPageFile="~/ADMIN_/MasterPage.master" AutoEventWireup="true" CodeFile="Fees_Details.aspx.cs" Inherits="ADMIN_Fees_Details" %>

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
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
<div class="page-header"><h2 class = "pageheader-title">Fees Details </h2></div>

<div class="card">
<div class="card-body">
<div class="form-group">

    <table class="style1">
        <tr>
            <td align="center" valign="top">
                <asp:FormView ID="FormView1" runat="server" 
                    DataSourceID="SqlDataSource1">
                    <EditItemTemplate>
                        ENROLLMENT_ID:
                        <asp:Label ID="ENROLLMENT_IDLabel2" runat="server" 
                            Text='<%# Eval("ENROLLMENT_ID") %>' />
        <br />
                        NAME:
                        <asp:TextBox ID="NAMETextBox" runat="server" Text='<%# Bind("NAME") %>' />
        <br />
                        BATCH_NAME:
                        <asp:TextBox ID="BATCH_NAMETextBox" runat="server" 
                            Text='<%# Bind("BATCH_NAME") %>' />
        <br />
                        EDATE:
                        <asp:TextBox ID="EDATETextBox" runat="server" Text='<%# Bind("EDATE") %>' />
        <br />
                        Total_Fees:
                        <asp:TextBox ID="Total_FeesTextBox" runat="server" 
                            Text='<%# Bind("Total_Fees") %>' />
        <br />
                        STANDARD:
                        <asp:TextBox ID="STANDARDTextBox" runat="server" 
                            Text='<%# Bind("STANDARD") %>' />
        <br />
                        <asp:LinkButton ID="UpdateButton0" runat="server" CausesValidation="True" 
                            CommandName="Update" Text="Update" />
                        &nbsp;<asp:LinkButton ID="UpdateCancelButton0" runat="server" 
                            CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        NAME:
                        <asp:TextBox ID="NAMETextBox0" runat="server" Text='<%# Bind("NAME") %>' />
        <br />
                        BATCH_NAME:
                        <asp:TextBox ID="BATCH_NAMETextBox0" runat="server" 
                            Text='<%# Bind("BATCH_NAME") %>' />
        <br />
                        EDATE:
                        <asp:TextBox ID="EDATETextBox0" runat="server" Text='<%# Bind("EDATE") %>' />
        <br />
                        Total_Fees:
                        <asp:TextBox ID="Total_FeesTextBox0" runat="server" 
                            Text='<%# Bind("Total_Fees") %>' />
        <br />
                        STANDARD:
                        <asp:TextBox ID="STANDARDTextBox0" runat="server" 
                            Text='<%# Bind("STANDARD") %>' />
        <br />
                        <asp:LinkButton ID="InsertButton0" runat="server" CausesValidation="True" 
                            CommandName="Insert" Text="Insert" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton0" runat="server" 
                            CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </InsertItemTemplate>
                    <ItemTemplate>
                    <div class="card-body">
                     
                     <table class="table table-striped">
                     <thead align="center">
             <tr>
                <th scope="col" colspan="3" align="center">
                    <asp:Label ID="Label9" runat="server" Font-Size="Medium" Text="Student Details"></asp:Label>
                 </th>
            </tr>
            </thead>
                            <tbody>
                            <tr>
                                <td align="left" valign="bottom">
                                 <asp:Label ID="Label1" runat="server"
                                        Text="Enrollment Id"></asp:Label>
                                </td>
                                <td align="center" valign="bottom">
                                    :</td>
                                <td align="left" valign="bottom">
                                    <asp:Label ID="ENROLLMENT_IDLabel3" runat="server" Text='<%# Eval("ENROLLMENT_ID") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td align="left" valign="bottom">
                                    <asp:Label ID="Label2" runat="server"
                                        Text="Name "></asp:Label>
                                </td>
                                <td align="center" valign="bottom">
                                    :</td>
                                <td align="left" valign="bottom">
                                    <asp:Label ID="NAMELabel" runat="server"
                                        Text='<%# Bind("NAME") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td align="left" valign="bottom">
                                    <asp:Label ID="Label4" runat="server"
                                        Text="Enrolled Date "></asp:Label>
                                </td>
                                <td align="center" valign="bottom">
                                    :</td>
                                <td align="left" valign="bottom">
                                    <asp:Label ID="EDATELabel" runat="server" 
                                        Text='<%# Bind("EDATE") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td align="left" valign="bottom">
                                    <asp:Label ID="Label6" runat="server"  
                                        Text="Standard "></asp:Label>
                                </td>
                                <td align="center" valign="bottom">
                                    :</td>
                                <td align="left" valign="bottom">
                                    <asp:Label ID="STANDARDLabel" runat="server"
                                        Text='<%# Bind("STANDARD") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td align="left" valign="bottom">
                                    <asp:Label ID="Label3" runat="server"
                                        Text="Batch Name "></asp:Label>
                                </td>
                                <td align="center" valign="bottom">
                                    :</td>
                                <td align="left" valign="bottom">
                                    <asp:Label ID="BATCH_NAMELabel" runat="server" Text='<%# Bind("BATCH_NAME") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td align="left" valign="bottom">
                                    <asp:Label ID="Label5" runat="server"
                                        Text="Total Fees "></asp:Label>
                                </td>
                                <td align="center" valign="bottom">
                                    :</td>
                                <td align="left" valign="bottom">
                                    <asp:Label ID="Total_FeesLabel" runat="server" Text='<%# Bind("Total_Fees") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td align="left" valign="bottom">
                                    <asp:Label ID="Label7" runat="server"
                                        Text="Total Fees Paid "></asp:Label>
                                </td>
                                <td align="center" valign="bottom">
                                    :</td>
                                <td align="left" valign="bottom">
                                    <asp:Label ID="PaidFeesLabel" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="left" valign="bottom">
                                    <asp:Label ID="Label8" runat="server"
                                        Text="Remaining Amount "></asp:Label>
                                </td>
                                <td align="center" valign="bottom">
                                    :</td>
                                <td align="left" valign="bottom">
                                    <asp:Label ID="RemainingFeesLabel" runat="server"></asp:Label>
                                </td>
                            </tr>
                            </tbody>
                        </table>

                        </div>
                    </ItemTemplate>
             
                </asp:FormView>
                <br />
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString_CONCEPT %>" 
                    SelectCommand="SELECT e.Enrollment_Id, dbo.GetProfilePropertyValue('Name', aspnet_Profile.PropertyNames, aspnet_Profile.PropertyValuesString) AS Name, b.Batch_Name,e.EDate, e.Total_Fees, sd.Standard FROM aspnet_Profile INNER JOIN aspnet_Users AS u ON aspnet_Profile.UserId = u.UserId INNER JOIN Student AS s ON u.UserName = s.UserName INNER JOIN Enrollment AS e ON s.Student_Id = e.Student_Id INNER JOIN Batch AS b ON e.Batch_Id = b.Batch_Id INNER JOIN Standard AS sd ON e.Standard_Id = sd.Standard_Id WHERE (e.Enrollment_Id = @Enrollment_Id)">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="Enrollment_Id" QueryStringField="fees" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />
            </td>
        </tr>
        </table>

    <br />
    
    <table class="style1">
        <tr>
            <td align="center" valign="top">
             <hr />
                <asp:Label ID="Label11" runat="server" Font-Size="Medium" ForeColor="Black" 
                    Text="Paid Installments" Width="200px"></asp:Label>
                    <hr />

                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    DataSourceID="SqlDataSource2" Height="81px">
                    <Columns>
                        <asp:BoundField DataField="Enrollment_Id" HeaderText="Enrollment_Id" 
                            SortExpression="Enrollment_Id" Visible="False" />
                        <asp:BoundField DataField="Expr1" HeaderText="Date" ReadOnly="True" 
                            SortExpression="Expr1">
                        </asp:BoundField>
                        <asp:BoundField DataField="Expr2" HeaderText="Day" ReadOnly="True" 
                            SortExpression="Expr2">
                        </asp:BoundField>
                        <asp:BoundField DataField="Amount_Paid" HeaderText="Installments" 
                            SortExpression="Amount_Paid">
                        </asp:BoundField>
                        <asp:BoundField DataField="Payment_Type" HeaderText="Type" 
                            SortExpression="Payment_Type">
                        </asp:BoundField>
                        <asp:BoundField DataField="Transaction_Id" HeaderText="Transaction Id" 
                            SortExpression="Transaction_Id">
                        </asp:BoundField>
                    </Columns>
                    <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <HeaderStyle Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EEEEEE" ForeColor="Black" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#0000A9" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#000065" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString_CONCEPT %>" 
                    
                    SelectCommand="SELECT Enrollment_Id, CONVERT (varchar, FDate, 103) AS Expr1, DATENAME(weekday, FDate) AS Expr2, Amount_Paid, Payment_Type, Transaction_Id FROM Fees_Payment WHERE (Enrollment_Id = @Enrollment_Id)">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="Enrollment_Id" QueryStringField="fees" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />
                <asp:Button ID="Button1" runat="server" class="btn btn-rounded btn-primary" 
                    Height="44px" onclick="Button1_Click" Text="Add" Width="100px" />
            </td>
            <td align="center" valign="top">
                <asp:Panel ID="Panel1" runat="server">
                    <asp:Label ID="Label10" runat="server" Text="Payment Type"></asp:Label>
                    <br />
                    <table class="style1">
                        <tr>
                            <td align="right">
                                <asp:Button ID="Button2" runat="server" onclick="Button2_Click" Text="Cash" 
                                    Width="150px" />
                            </td>
                            <td align="left">
                                <asp:Button ID="Button3" runat="server" onclick="Button3_Click" Text="Cheque" 
                                    Width="150px" />
                            </td>
                        </tr>
                    </table>

                    <br />
                    <table width="80%">
                        <tr>
                            <td align="left" valign="bottom">
                                <asp:Label ID="Label12" runat="server" Text="Date"></asp:Label>
                                <br />
                                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" valign="bottom">
                                <asp:Label ID="Label13" runat="server" Text="Amount"></asp:Label>
                                <br />
                                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                                <br />
                            </td>
                        </tr>
                        <tr>
                            <td align="left" valign="bottom">
                                <asp:Label ID="Label14" runat="server" Text="Transaction ID"></asp:Label>
                                <br />
                                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" valign="bottom">
                                <asp:Button ID="Button4" runat="server" onclick="Button4_Click" 
                                    Text="Do Payment" />
                            </td>
                        </tr>
                    </table>

                </asp:Panel>
                &nbsp;</td>
        </tr>
        </table>
    
    <br />
    <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
    
</div>
</div>
</div>
</asp:Content>


