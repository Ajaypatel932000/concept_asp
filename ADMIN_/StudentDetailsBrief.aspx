<%@ Page Title="" Language="C#" MasterPageFile="~/ADMIN_/MasterPage.master" AutoEventWireup="true" CodeFile="StudentDetailsBrief.aspx.cs" Inherits="ADMIN_StudentDetailsBrief" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
<div class="page-header"><h2 class = "pageheader-title">Student Details</h2></div>

<div class="card">
<div class="card-body">
<div class="form-group">
<table width="100%">
<tr>
<td align="center">
<asp:FormView ID="FormView1" runat="server"
        DataSourceID="SqlDataSource1" Height="220px" onload="FormView1_Load" 
        DataKeyNames="Enrollment_Id" Width="60%">
        <EditItemTemplate>
            Enrollment_Id:
            <asp:Label ID="Enrollment_IdLabel1" runat="server" 
                Text='<%# Eval("Enrollment_Id") %>' />
            <br />
            Standard:
            <asp:TextBox ID="StandardTextBox" runat="server" 
                Text='<%# Bind("Standard") %>' />
                <br />
                Name:
            <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
                <br />
                Picture:
            <asp:TextBox ID="PictureTextBox" runat="server" 
                Text='<%# Bind("Picture") %>' />
                <br />
                Email:
            <asp:TextBox ID="EmailTextBox" runat="server" 
                Text='<%# Bind("Email") %>' />
                <br />
                MobileNo:
            <asp:TextBox ID="MobileNoTextBox" runat="server" 
                Text='<%# Bind("MobileNo") %>' />
                <br />
                M_Mobile_No:
            <asp:TextBox ID="M_Mobile_NoTextBox" runat="server" 
                Text='<%# Bind("M_Mobile_No") %>' />
                <br />
                F_Mobile_No:
            <asp:TextBox ID="F_Mobile_NoTextBox" runat="server" 
                Text='<%# Bind("F_Mobile_No") %>' />
            <br />
                Address:
            <asp:TextBox ID="AddressTextBox" runat="server" Text='<%# Bind("Address") %>' />
            <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            Standard:
            <asp:TextBox ID="StandardTextBox" runat="server" 
                Text='<%# Bind("Standard") %>' />
                <br />
                Name:
            <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
                <br />
                Picture:
            <asp:TextBox ID="PictureTextBox" runat="server" 
                Text='<%# Bind("Picture") %>' />
                <br />
                Email:
            <asp:TextBox ID="EmailTextBox" runat="server" 
                Text='<%# Bind("Email") %>' />
                <br />
                MobileNo:
            <asp:TextBox ID="MobileNoTextBox" runat="server" 
                Text='<%# Bind("MobileNo") %>' />
                <br />
                M_Mobile_No:
            <asp:TextBox ID="M_Mobile_NoTextBox" runat="server" 
                Text='<%# Bind("M_Mobile_No") %>' />
                <br />
                F_Mobile_No:
            <asp:TextBox ID="F_Mobile_NoTextBox" runat="server" 
                Text='<%# Bind("F_Mobile_No") %>' />
            <br />
                Address:
            <asp:TextBox ID="AddressTextBox" runat="server" Text='<%# Bind("Address") %>' />
            <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
       
        <ItemTemplate>
            <div class="card-body">
            <table class="table table-hover" style="border-style: none">
            <tbody>
                <tr>
                    <td align="center" rowspan="8" valign="middle">
                        <asp:Label ID="PictureLabel" runat="server" Text='<%# Bind("Picture") %>' 
                            Visible="False" />
                        <br />
                        <asp:Image ID="Image1" runat="server" Height="200px" Width="200px" />
                    </td>
                    <td align="left" valign="bottom">
                        Enrollment No.</td>
                    <td align="center" valign="bottom">
                        :</td>
                    <td align="left" valign="bottom">
                        <asp:Label ID="Enrollment_IdLabel" runat="server" 
                            Text='<%# Eval("Enrollment_Id") %>' />
                    </td>
                </tr>
                <tr>
                    <td align="left" valign="bottom">
                        <asp:Label ID="Label2" runat="server" Text="Standard"></asp:Label>
                    </td>
                    <td align="center" valign="bottom">
                        :</td>
                    <td align="left" valign="bottom">
                        <asp:Label ID="StandardLabel" runat="server" Text='<%# Bind("Standard") %>' />
                    </td>
                </tr>
                <tr>
                    <td align="left" valign="bottom">
                        <asp:Label ID="Label3" runat="server" Text="Name"></asp:Label>
                    </td>
                    <td align="center" valign="bottom">
                        :</td>
                    <td align="left" valign="bottom">
                        <asp:Label ID="NameLabel" runat="server" Text='<%# Bind("Name") %>' />
                    </td>
                </tr>
                <tr>
                    <td align="left" valign="bottom">
                        <asp:Label ID="Label4" runat="server" Text="Email"></asp:Label>
                    </td>
                    <td align="center" valign="bottom">
                        :</td>
                    <td align="left" valign="bottom">
                        <asp:Label ID="EmailLabel" runat="server" Text='<%# Bind("Email") %>' />
                    </td>
                </tr>
                <tr>
                    <td align="left" valign="bottom">
                        <asp:Label ID="Label5" runat="server" Text="Mobile No."></asp:Label>
                    </td>
                    <td align="center" valign="bottom">
                        :</td>
                    <td align="left" valign="bottom">
                        <asp:Label ID="MobileNoLabel" runat="server" Text='<%# Bind("MobileNo") %>' />
                    </td>
                </tr>
                <tr>
                    <td align="left" valign="bottom">
                        <asp:Label ID="Label6" runat="server" Text="Mother No."></asp:Label>
                    </td>
                    <td align="center" valign="bottom">
                        :</td>
                    <td align="left" valign="bottom">
                        <asp:Label ID="M_Mobile_NoLabel" runat="server" 
                            Text='<%# Bind("M_Mobile_No") %>' />
                    </td>
                </tr>
                <tr>
                    <td align="left" valign="bottom">
                        <asp:Label ID="Label7" runat="server" Text="Father No."></asp:Label>
                    </td>
                    <td align="center" valign="bottom">
                        :</td>
                    <td align="left" valign="bottom">
                        <asp:Label ID="F_Mobile_NoLabel" runat="server" 
                            Text='<%# Bind("F_Mobile_No") %>' />
                    </td>
                </tr>
                <tr>
                    <td align="left" valign="bottom">
                        <asp:Label ID="Label8" runat="server" Text="Residence Address"></asp:Label>
                    </td>
                    <td align="center" valign="bottom">
                        :</td>
                    <td align="left" valign="bottom">
                        <asp:Label ID="AddressLabel" runat="server" Text='<%# Bind("Address") %>' />
                    </td>
                </tr>
                </tbody>
            </table>
            </div>
            <br />
        </ItemTemplate>
    </asp:FormView>
</td>
</tr>
</table>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString_CONCEPT %>" 
            
            
        SelectCommand="SELECT e.Enrollment_Id, std.Standard, dbo.GetProfilePropertyValue('Name', PropertyNames, PropertyValuesString) as &quot;Name&quot;, 
dbo.GetProfilePropertyValue('ProfilePic', PropertyNames, PropertyValuesString) as &quot;Picture&quot;, m.Email,dbo.GetProfilePropertyValue('MobileNo', 

PropertyNames, PropertyValuesString) as &quot;MobileNo&quot;,s.M_Mobile_No, s.F_Mobile_No, dbo.GetProfilePropertyValue('Address', PropertyNames, 

PropertyValuesString) as &quot;Address&quot;
FROM aspnet_Profile, aspnet_Membership m, Student s, aspnet_Users u, Enrollment e, Standard std
WHERE
aspnet_Profile.UserId = u.UserId AND m.UserId =u.UserId AND u.UserName = s.UserName AND s.Student_Id = e.Student_Id AND e.Standard_Id=std.Standard_Id AND e.Enrollment_Id = @Enrollment_Id">
            <SelectParameters>
                <asp:QueryStringParameter Name="Enrollment_Id" QueryStringField="stud" />
            </SelectParameters>
        </asp:SqlDataSource>
</div>
</div>
</div>
</asp:Content>

