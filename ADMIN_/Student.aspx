<%@ Page Title="" Language="C#" MasterPageFile="~/ADMIN_/MasterPage.master" AutoEventWireup="true" CodeFile="Student.aspx.cs" Inherits="ADMIN_Student" %>

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
    <style type="text/css">
        html,
    body {
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
            width: 118%;
        }
        .style2
        {
        }
       
        .style3
        {
            width: 330px;
        }
        .style4
        {
            width: 385px;
        }

        .style5
        {
            width: 330px;
            height: 27px;
        }
        .style6
        {
            width: 385px;
            height: 27px;
        }
        .style7
        {
            height: 27px;
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
<div class="page-header">
        <h2 class="pageheader-title">Student</h2>
</div>
<form class="splash-container">
<div class="card">
<div class="card-body">
<div class="form-group">

    <table class="style1">
        <tr>
            <td class="style5">
                <asp:Label ID="Label1" runat="server" Font-Size="Large" Text="Year"></asp:Label>
            </td>
            <td class="style6">
                <asp:Label ID="Label2" runat="server" Font-Size="Large" Text="Standard"></asp:Label>
            </td>
            <td class="style7">
                <asp:Label ID="Label3" runat="server" Font-Size="Large" Text="Batch"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style3">
                <asp:DropDownList ID="DropDownList1" runat="server" AppendDataBoundItems="True" 
                    AutoPostBack="True" DataSourceID="SqlDataSource1_YEAR" DataTextField="Column1" 
                    DataValueField="Column1" class="form-control form-control-sm" Height="27px" Width="150px">
                    <asp:ListItem Value="0">--SELECT--</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="style4">
                <asp:DropDownList ID="DropDownList2" runat="server" AppendDataBoundItems="True" 
                    AutoPostBack="True" DataSourceID="SqlDataSource1_STD" DataTextField="Standard" 
                    DataValueField="Standard_Id" 
                    onselectedindexchanged="DropDownList2_SelectedIndexChanged" class="form-control form-control-sm" Height="27px" Width="150px">
                      <asp:ListItem Value="0">--SELECT--</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>
                <asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True" 
                    onselectedindexchanged="DropDownList3_SelectedIndexChanged" 
                    AppendDataBoundItems="True" class="form-control form-control-sm" Height="27px" Width="150px">
                     <asp:ListItem Value="0">--SELECT--</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="style3">
                <asp:SqlDataSource ID="SqlDataSource1_YEAR" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString_CONCEPT %>" SelectCommand="SELECT DISTINCT(YEAR(EDATE)) FROM ENROLLMENT ORDER BY YEAR(EDATE) ASC
"></asp:SqlDataSource>
            </td>
            <td class="style4">
                <asp:SqlDataSource ID="SqlDataSource1_STD" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString_CONCEPT %>" 
                    SelectCommand="SELECT Standard, Standard_Id FROM Standard">
                </asp:SqlDataSource>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2" colspan="3">

                        <br />
                <asp:Panel ID="Panel1" runat="server" Height="246px">
                    <asp:GridView ID="GridView1" runat="server" 
    AllowPaging="True" AllowSorting="True" 
    AutoGenerateColumns="False"  DataSourceID="SqlDataSource1_All" 
    Height="146px"  class="table table-striped table-bordered first"  
    PageSize="5" Width="978px">
                        <AlternatingRowStyle CssClass="alt" />
                        <Columns>
                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" 
                    CausesValidation="False" CommandName="Select" 
                    PostBackUrl='<%# Eval("UserName", "~/ADMIN_/StudentDetails.aspx?user={0}") %>'>Select</asp:LinkButton>
                                </ItemTemplate>
                                <ControlStyle ForeColor="#0066FF" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="UserName" 
            HeaderText="UserName" SortExpression="UserName" Visible="False" />
                            <asp:BoundField DataField="Name" HeaderText="Name" 
            ReadOnly="True" SortExpression="Name">
                            <HeaderStyle  Font-Underline="False" ForeColor="Black" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Email" HeaderText="Email" 
            SortExpression="Email">
                            <HeaderStyle  Font-Underline="False" ForeColor="Black" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Mobile No." 
            HeaderText="Mobile No." ReadOnly="True" SortExpression="Mobile No.">
                            <HeaderStyle Font-Underline="False" ForeColor="Black" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Father No." 
            HeaderText="Father No." SortExpression="Father No.">
                            <HeaderStyle Font-Underline="False" ForeColor="Black" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Mother No." 
            HeaderText="Mother No." SortExpression="Mother No.">
                            <HeaderStyle  Font-Underline="False" ForeColor="Black" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Address" HeaderText="Address" 
            ReadOnly="True" SortExpression="Address">
                            <HeaderStyle  Font-Underline="False" ForeColor="Black" />
                            </asp:BoundField>
                        </Columns>
                        <HeaderStyle HorizontalAlign="Center" />
                        <PagerStyle CssClass="pgr" />
                    </asp:GridView>
                    <br />
                    <asp:SqlDataSource ID="SqlDataSource1_All" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionString_CONCEPT %>" 
                        SelectCommand="SELECT u.UserName, dbo.GetProfilePropertyValue('Name', aspnet_Profile.PropertyNames, aspnet_Profile.PropertyValuesString) AS Name, m.Email, dbo.GetProfilePropertyValue('MobileNo', aspnet_Profile.PropertyNames, aspnet_Profile.PropertyValuesString) AS [Mobile No.], s.M_Mobile_No AS [Mother No.], s.F_Mobile_No AS [Father No.], dbo.GetProfilePropertyValue('Address', aspnet_Profile.PropertyNames, aspnet_Profile.PropertyValuesString) AS Address FROM aspnet_Profile INNER JOIN aspnet_Users AS u ON aspnet_Profile.UserId = u.UserId INNER JOIN aspnet_Membership AS m ON u.UserId = m.UserId INNER JOIN Student AS s ON u.UserName = s.UserName">
                    </asp:SqlDataSource>
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                </asp:Panel>
                <br />
                        <asp:Panel ID="Panel2" runat="server">
                            <asp:GridView ID="GridView2" runat="server" 
    AllowPaging="True" AllowSorting="True"  
    AutoGenerateColumns="False"  class="table table-striped table-bordered first"
    DataSourceID="SqlDataSource1_BatchWise"  PageSize="5" Width="877px">
                               
                                <Columns>
                                    <asp:TemplateField ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton2" runat="server" 
                    CausesValidation="False" CommandName="Select" 
                    PostBackUrl='<%# Eval("UserName", "~/ADMIN_/StudentDetails.aspx?user={0}") %>' 
                    Text="Select"></asp:LinkButton>
                                        </ItemTemplate>
                                        <ControlStyle ForeColor="#0066FF" />
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="UserName" 
            HeaderText="UserName" SortExpression="UserName" Visible="False" />
                                    <asp:BoundField DataField="Name" HeaderText="Name" 
            ReadOnly="True" SortExpression="Name">
                                    <HeaderStyle  ForeColor="Black" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Email" HeaderText="Email" 
            SortExpression="Email">
                                    <HeaderStyle ForeColor="Black" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Mobile No." 
            HeaderText="Mobile No." ReadOnly="True" SortExpression="Mobile No.">
                                    <HeaderStyle ForeColor="Black" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Father No." 
            HeaderText="Father No." SortExpression="Father No.">
                                    <HeaderStyle ForeColor="Black" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Mother No." 
            HeaderText="Mother No." SortExpression="Mother No.">
                                    <HeaderStyle ForeColor="Black" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Address" HeaderText="Address" 
            ReadOnly="True" SortExpression="Address">
                                    <HeaderStyle ForeColor="Black" />
                                    </asp:BoundField>
                                </Columns>
                                <HeaderStyle Height="25px" HorizontalAlign="Center" />
                                <PagerStyle CssClass="pgr" />
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource1_BatchWise" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:ConnectionString_CONCEPT %>" 
                                SelectCommand="SELECT u.UserName, dbo.GetProfilePropertyValue('Name', PropertyNames, PropertyValuesString) AS [Name] ,m.Email AS [Email], dbo.GetProfilePropertyValue('MobileNo', PropertyNames, PropertyValuesString) AS [Mobile No.],s.M_Mobile_No AS [Mother No.],s.F_Mobile_No AS [Father No.], dbo.GetProfilePropertyValue('Address', PropertyNames, PropertyValuesString) AS [Address] FROM aspnet_Profile, aspnet_Users u, aspnet_Membership m, Student s,Batch b,Enrollment e WHERE aspnet_Profile.UserId =u.UserId AND m.UserId = u.UserId AND s.UserName = u.UserName AND s.Student_Id = e.Student_Id AND b.Batch_Id = e.Batch_Id AND b.Batch_Id=@">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="DropDownList3" PropertyName="SelectedValue" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </asp:Panel>
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                <br />
            </td>
        </tr>

        <br />
    </table>

</div>
</div>
</div>
</form>
</asp:Content>

