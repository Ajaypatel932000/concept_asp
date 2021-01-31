<%@ Page Title="" Language="C#" MasterPageFile="~/ADMIN_/MasterPage.master" AutoEventWireup="true" CodeFile="StudentDetails.aspx.cs" Inherits="ADMIN_StudentDetails" %>

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
    <link rel="stylesheet" type="text/css" href="../App_Themes/Theme1/assets/vendor/datatables/css/buttons.bootstrap4.css"/>
    <link rel="stylesheet" type="text/css" href="../App_Themes/Theme1/assets/vendor/datatables/css/select.bootstrap4.css"/>
    <link rel="stylesheet" type="text/css" href="../App_Themes/Theme1/assets/vendor/datatables/css/fixedHeader.bootstrap4.css"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
<div class="page-header">
        <h2 class="pageheader-title">Student Details</h2>
</div>
<form class="splash-container">
<div class="card">
<div class="card-body">
<div class="table-responsive">
    <asp:GridView ID="GridView1" runat="server" 
        AutoGenerateColumns="False"  DataKeyNames="enrollment_Id" 
        DataSourceID="SqlDataSource1"  Width="100%" class="table table-striped table-bordered first">
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                        CommandName="Select" 
                        PostBackUrl='<%# Eval("Enrollment_Id" , "StudentDetailsBrief.aspx?stud={0}") %>' 
                        Text="Select"></asp:LinkButton>
                </ItemTemplate>
                <ControlStyle ForeColor="#0066FF" />
            </asp:TemplateField>
            <asp:BoundField DataField="Standard" HeaderText="Standard" 
                SortExpression="Standard">
            <HeaderStyle ForeColor="Black"/>
            </asp:BoundField>
            <asp:BoundField DataField="enrollment_Id" HeaderText="Enrollment Id" 
                InsertVisible="False" ReadOnly="True" SortExpression="enrollment_Id">
            <HeaderStyle ForeColor="Black" />
            </asp:BoundField>
            <asp:BoundField DataField="Column1" HeaderText="Name" ReadOnly="True" 
                SortExpression="Column1">
            <HeaderStyle ForeColor="Black" />
            </asp:BoundField>
            <asp:BoundField DataField="batch_name" HeaderText="Batch" 
                SortExpression="batch_name">
            <HeaderStyle ForeColor="Black" />
            </asp:BoundField>
            <asp:BoundField DataField="Total_Fees" HeaderText="Total Fees" 
                SortExpression="Total_Fees">
            <HeaderStyle ForeColor="Black" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="Fees Details">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton6" runat="server" 
                        PostBackUrl='<%# Eval("Enrollment_Id" , "~/ADMIN_/Fees_Details.aspx?fees={0}") %>'>Fees Details</asp:LinkButton>
                </ItemTemplate>
                <ControlStyle ForeColor="#0066FF" />
                <HeaderStyle ForeColor="Black" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Attendance">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton7" runat="server" 
                        PostBackUrl='<%# Eval("Enrollment_Id" , "~/ADMIN_/Attendance.aspx?attend={0}") %>'>Attendance</asp:LinkButton>
                </ItemTemplate>
                <ControlStyle ForeColor="#0066FF" />
                <HeaderStyle ForeColor="Black" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Notification">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton8" runat="server" 
                        PostBackUrl='<%# Eval("Enrollment_Id" , "~/ADMIN_/Notification.aspx?noti={0}") %>'>Notification</asp:LinkButton>
                </ItemTemplate>
                <ControlStyle ForeColor="#0066FF" />
                <HeaderStyle ForeColor="Black" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Result">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton9" runat="server" 
                        PostBackUrl='<%# Eval("Enrollment_Id" , "~/ADMIN_/Result.aspx?res={0}") %>'>Result</asp:LinkButton>
                </ItemTemplate>
                <ControlStyle ForeColor="#0066FF" />
                <HeaderStyle ForeColor="Black" />
            </asp:TemplateField>
        </Columns>
        <HeaderStyle Height="25px" HorizontalAlign="Center" />
        <PagerStyle CssClass="pgr" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString_CONCEPT %>" 
        
        SelectCommand="Select s.Standard, e.enrollment_Id, b.batch_name, e.Total_Fees,dbo.GetProfilePropertyValue('Name', PropertyNames, PropertyValuesString)
FROM Standard s , Enrollment e, Batch b, Student st, aspnet_Profile , aspnet_Users u
WHERE 
aspnet_Profile.UserId = u.UserId AND u.UserName = st.UserName AND st.Student_Id = e.Student_Id AND s.Standard_Id=e.Standard_Id AND b.Batch_Id = e.Batch_Id AND st.UserName=@">
        <SelectParameters>
            <asp:QueryStringParameter QueryStringField="user" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />

    <br />
    <br />

    <asp:Button ID="Button1" runat="server" PostBackUrl="~/ADMIN_/Student.aspx" 
        Text="Back" class="btn btn-rounded btn-primary"  Height="44px"  Width="130px" />
</div>
</div>
</div>
</form>

</asp:Content>

