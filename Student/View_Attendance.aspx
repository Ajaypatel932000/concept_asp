<%@ Page Title="" Language="C#" MasterPageFile="~/Student/MasterPage.master" AutoEventWireup="true" CodeFile="View_Attendance.aspx.cs" Inherits="Student_View_Attendance" %>
<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>


<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
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

    <style type="text/css">

        .style2
        {
            font-size: large;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    
     <div class="page-header">
        <h2 class="pageheader-title"> View Attendance </h2>
</div>
<form class="splash-container">
<div class="card">
<div class="card-body">
<div class="form-group">
    <table class="dropzone-previews">
        <tr>
            <td>
                <asp:Panel 
        ID="Panel1" runat="server" onload="Panel1_Load">
                    <asp:Chart ID="Chart3" runat="server" DataSourceID="SqlDataSource1_Year" BackColor="LightSkyBlue" BackImageTransparentColor="LightSkyBlue">
                        <Series>
                            <asp:Series ChartType="Pie" Name="Series1" IsValueShownAsLabel="True" 
                                 LabelFormat="#.##%" Legend="Legend1" XValueMember="Status" 
                                 YValueMembers="TOTAL">
                            </asp:Series>
                        </Series>
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea1">
                            </asp:ChartArea>
                        </ChartAreas>
                        <Legends>
                            <asp:Legend BackColor="LightSkyBlue" Name="Legend1">
                            </asp:Legend>
                        </Legends>
                        <Titles>
                            <asp:Title BackColor="LightSkyBlue" 
                                 Font="Microsoft Sans Serif, 12pt, style=Bold, Underline" Name="Title1" 
                                 Text="Yearly Attendance Report">
                            </asp:Title>
                        </Titles>
                    </asp:Chart>
                    <asp:SqlDataSource ID="SqlDataSource1_Year" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionString_CONCEPT %>" 
                        SelectCommand="SELECT COUNT(Enrollment_Id) * 1.0 / (SELECT COUNT(Enrollment_Id) AS Expr1 FROM Attendance WHERE (Enrollment_Id = @Enrollment_Id)) AS TOTAL, CASE Status WHEN 'True' THEN 'Present' ELSE 'Absent' END AS Status FROM Attendance AS Attendance_1 WHERE (Enrollment_Id = @Enrollment_Id) GROUP BY Status">
                        <SelectParameters>
                            <asp:SessionParameter Name="Enrollment_Id" SessionField="Eid" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <br />
                    <br />
                    <br />
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="15pt" 
                         Text="Label"></asp:Label>
                </asp:Panel>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <br />
                <asp:Panel ID="Panel2" runat="server" onload="Panel2_Load">
                    <asp:Chart ID="Chart4" runat="server" DataSourceID="SqlDataSource1_monthly" BackColor="LightSkyBlue" BackImageTransparentColor="LightSkyBlue">
                        <Series>
                            <asp:Series ChartType="Pie" Name="Series1" IsValueShownAsLabel="True" 
                    LabelFormat="#.##%" XValueMember="Status" YValueMembers="TOTAL">
                            </asp:Series>
                        </Series>
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea1">
                            </asp:ChartArea>
                        </ChartAreas>
                         <Legends>
                            <asp:Legend Name="Legend1" BackColor="LightSkyBlue">
                            </asp:Legend>
                        </Legends>
                        <Titles>
                            <asp:Title Font="Microsoft Sans Serif, 12pt, style=Bold, Underline" 
                    Name="Monthly Report" Text="Monthly Attendance Report" 
                    BackColor="LightSkyBlue">
                            </asp:Title>
                        </Titles>
                    </asp:Chart>
                    <asp:SqlDataSource ID="SqlDataSource1_monthly" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionString_CONCEPT %>" SelectCommand="SELECT COUNT(Enrollment_Id)*1.0/(SELECT COUNT(Enrollment_Id) FROM Attendance WHERE Enrollment_Id=@Enrollment_Id AND MONTH(A_DATE)=@A_DATE) AS 'TOTAL',
CASE Status 
WHEN 
  'True' THEN 'Present' ELSE 'Absent' END AS Status FROM Attendance WHERE Enrollment_Id=@Enrollment_Id AND MONTH(A_DATE)=@A_DATE GROUP BY Status



">
                        <SelectParameters>
                            <asp:SessionParameter Name="Enrollment_Id" SessionField="Eid" />
                            <asp:ControlParameter ControlID="DropDownList1" Name="A_DATE" 
                                PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <br />
                    <br />
                    <br />
                    <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="15pt" 
            Text="Label"></asp:Label>
                </asp:Panel>
                <br />&nbsp;</td>
            <td>
                <asp:Label ID="Label2" runat="server" Text="Label" Visible="False"></asp:Label>
                <br /><span class="style2"><strong>Select Month :</strong></span>
                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
        onselectedindexchanged="DropDownList1_SelectedIndexChanged" 
                    AppendDataBoundItems="True">
                    <asp:ListItem Value="00">Select</asp:ListItem>
                    <asp:ListItem Value="01">January</asp:ListItem>
                    <asp:ListItem Value="02">February</asp:ListItem>
                    <asp:ListItem Value="03">March</asp:ListItem>
                    <asp:ListItem Value="04">April</asp:ListItem>
                    <asp:ListItem Value="05">May</asp:ListItem>
                    <asp:ListItem Value="06">June</asp:ListItem>
                    <asp:ListItem Value="07">July</asp:ListItem>
                    <asp:ListItem Value="08">August</asp:ListItem>
                    <asp:ListItem Value="09">September</asp:ListItem>
                    <asp:ListItem Value="10">October</asp:ListItem>
                    <asp:ListItem Value="11">November</asp:ListItem>
                    <asp:ListItem Value="12">December</asp:ListItem>
                </asp:DropDownList>
                <asp:TextBox ID="TextBox1" runat="server" Visible="False"></asp:TextBox>
                <br />
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    DataSourceID="SqlDataSource1_attendance" AllowPaging="True" 
                    BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" 
                    CellPadding="4" CssClass="Grid"  
                      AlternatingRowStyle-CssClass="alt"
                      PagerStyle-CssClass="pgr" AllowSorting="True" Width="99%" 
                    Font-Size="12pt" ForeColor="Black" Height="100%" Font-Bold="True" 
                    PageSize="16">
                    <AlternatingRowStyle CssClass="alt"></AlternatingRowStyle>
                    <Columns>
                        <asp:BoundField DataField="DATE" HeaderText="DATE" ReadOnly="True" 
                            SortExpression="DATE" >
                            <HeaderStyle Font-Size="Medium" Font-Underline="True" />
            <ItemStyle HorizontalAlign="Center" VerticalAlign="Bottom" />
            </asp:BoundField>
                        <asp:BoundField DataField="STATUS" HeaderText="STATUS" ReadOnly="True" 
                            SortExpression="STATUS">
                            <HeaderStyle Font-Size="Medium" Font-Underline="True" />
            <ItemStyle HorizontalAlign="Center" VerticalAlign="Bottom" />
            </asp:BoundField>
                    </Columns>
                     <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
        <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
        <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
        <RowStyle BackColor="White" ForeColor="#003399" />
        <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
        <SortedAscendingCellStyle BackColor="#EDF6F6" />
        <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
        <SortedDescendingCellStyle BackColor="#D6DFDF" />
        <SortedDescendingHeaderStyle BackColor="#002876" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1_attendance" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString_CONCEPT %>" 
                    
                    SelectCommand="SELECT CONVERT (varchar, A_Date, 3) AS DATE, CASE Status WHEN 'False' THEN 'ABSENT' ELSE 'PRESENT' END AS STATUS FROM Attendance WHERE (Enrollment_Id = @Enrollment_Id) AND (MONTH(A_Date) = @A_Date)">
                    <SelectParameters>
                        <asp:SessionParameter Name="Enrollment_Id" SessionField="Eid" />
                        <asp:ControlParameter ControlID="DropDownList1" Name="A_Date" 
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
       
    </table>
 </div>
 </div>
 </div>
 </form>

</asp:Content>

