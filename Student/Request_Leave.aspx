<%@ Page Title="" Language="C#" MasterPageFile="~/Student/MasterPage.master" AutoEventWireup="true" CodeFile="Request_Leave.aspx.cs" Inherits="Student_Request_Leave" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <div class="page-header">
        <h2 class="pageheader-title">Request Leave </h2>
</div>
<form class="splash-container">
<div class="card">
<div class="card-body">
<div class="form-group">  
   
    <table class="dropzone-previews">
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="From"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/App_Themes/Theme1/documentation/img/Calendar.jpg" />
                <ajaxToolkit:CalendarExtender ID="TextBox1_CalendarExtender" runat="server" 
                      BehaviorID="TextBox1_CalendarExtender" TargetControlID="TextBox1" PopupButtonID="ImageButton2" PopupPosition="BottomRight" Format="MM/dd/yyyy" />
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Text="To"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                <ajaxToolkit:CalendarExtender ID="TextBox2_CalendarExtender" runat="server" 
                    BehaviorID="TextBox2_CalendarExtender" TargetControlID="TextBox2" PopupButtonID="ImageButton1" PopupPosition="BottomRight" Format="MM/dd/yyyy"  />
                <asp:ImageButton ID="ImageButton1" runat="server" 
                    ImageUrl="~/App_Themes/Theme1/documentation/img/Calendar.jpg" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Text="Reason"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox3" runat="server" TextMode="MultiLine"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                  <asp:Button ID="Button1" class="btn btn-rounded btn-primary" runat="server" 
                    Text="Submit" Height="44px"  Width="130px" onclick="Button1_Click" />
                  <br />
                  <asp:Label ID="lblMessage" runat="server" Font-Bold="False" ForeColor="Black" 
                      style="font-weight: 700" Visible="False" />
                <br />&nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    CssClass="Grid" DataSourceID="SqlDataSource1_show_leave" Height="50px" 
                    Width="557px">
                    <Columns>
                        <asp:BoundField DataField="Leave_Reason" HeaderText="Leave Reason" 
                            SortExpression="Leave_Reason">
                        <HeaderStyle Font-Size="Large" Font-Underline="True" />
                        </asp:BoundField>
                        <asp:BoundField DataField="LeaveTO" HeaderText="LeaveTO" ReadOnly="True" 
                            SortExpression="LeaveTO">
                        <HeaderStyle Font-Size="Large" Font-Underline="True" />
                        </asp:BoundField>
                        <asp:BoundField DataField="LeaveFROM" HeaderText="LeaveFROM" ReadOnly="True" 
                            SortExpression="LeaveFROM">
                        <HeaderStyle Font-Size="Large" Font-Underline="True" />
                        </asp:BoundField>
                        <asp:BoundField DataField="STATUS" HeaderText="Status" ReadOnly="True" 
                            SortExpression="STATUS">
                        <HeaderStyle Font-Size="Large" Font-Underline="True" />
                        </asp:BoundField>
                    </Columns>
                    <RowStyle HorizontalAlign="Center" />
                </asp:GridView>
                <br />
                <asp:SqlDataSource ID="SqlDataSource1_show_leave" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString_CONCEPT %>" 
                    SelectCommand="SELECT Leave_Reason, CONVERT (varchar, Leave_To, 3) AS LeaveTO, CONVERT (varchar, Leave_From, 3) AS LeaveFROM, CASE Status WHEN '0' THEN 'NO' ELSE 'YES' END AS STATUS FROM Leave_Application WHERE (Enrollment_Id = @Enrollment_Id)">
                    <SelectParameters>
                        <asp:SessionParameter Name="Enrollment_Id" SessionField="Eid" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
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

