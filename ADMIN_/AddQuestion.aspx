<%@ Page Title="" Language="C#" MasterPageFile="~/ADMIN_/MasterPage.master" AutoEventWireup="true" CodeFile="AddQuestion.aspx.cs" Inherits="AddQuestion" %>

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
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
<div class="page-header"><h2 class = "pageheader-title">Add Question</h2></div>

<div class="card">
<div class="card-body">
<div class="form-group">

    <asp:FormView ID="FormView1" runat="server" DataKeyNames="Question_Id" 
        DataSourceID="SqlDataSource1_All" oniteminserted="FormView1_ItemInserted" 
        Width="100%">
        <EditItemTemplate>
            Question_Id:
            <asp:Label ID="Question_IdLabel1" runat="server" 
                Text='<%# Eval("Question_Id") %>' />
            <br />
            Question_Details:
            <asp:TextBox ID="Question_DetailsTextBox" runat="server" 
                Text='<%# Bind("Question_Details") %>' />
            <br />
            Answer_Details:
            <asp:TextBox ID="Answer_DetailsTextBox" runat="server" 
                Text='<%# Bind("Answer_Details") %>' />
            <br />
            Minimum_Marks:
            <asp:TextBox ID="Minimum_MarksTextBox" runat="server" 
                Text='<%# Bind("Minimum_Marks") %>' />
            <br />
            Chapter_Id:
            <asp:TextBox ID="Chapter_IdTextBox" runat="server" 
                Text='<%# Bind("Chapter_Id") %>' />
            <br />
            Subject_Id:
            <asp:TextBox ID="Subject_IdTextBox" runat="server" 
                Text='<%# Bind("Subject_Id") %>' />
            <br />
            Correct_Option:
            <asp:TextBox ID="Correct_OptionTextBox" runat="server" 
                Text='<%# Bind("Correct_Option") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
           
            <table class="w-100">
                <tr>
                    <td colspan="4">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td align="left" valign="bottom">
                        &nbsp;</td>
                    <td align="left" valign="bottom">
                        <asp:TextBox ID="Subject_IdTextBox3" runat="server" 
                            Text='<%# Bind("Subject_Id") %>' Visible="False" />
                    </td>
                    <td align="left" valign="bottom">
                        <asp:TextBox ID="Chapter_IdTextBox3" runat="server" 
                            Text='<%# Bind("Chapter_Id") %>' Visible="False" />
                    </td>
                    <td align="left" valign="bottom">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td align="left" valign="bottom">
                        <asp:Label ID="Label8" runat="server" CssClass="style26" Font-Size="Medium" 
                            Text="Standard "></asp:Label>
                    </td>
                    <td align="left" valign="bottom">
                        <asp:Label ID="Label9" runat="server" CssClass="style26" Font-Size="Medium" 
                            Text="Subject "></asp:Label>
                    </td>
                    <td align="left" valign="bottom">
                        <asp:Label ID="Label10" runat="server" CssClass="style26" Font-Size="Medium" 
                            Text="Chapter "></asp:Label>
                    </td>
                    <td align="left" valign="bottom">
                        <asp:Label ID="Label12" runat="server" CssClass="style26" Font-Size="Medium" 
                            Text="Minimum Marks "></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="left" valign="bottom">
                        <asp:DropDownList ID="DropDownList4" runat="server" AppendDataBoundItems="True" 
                            AutoPostBack="True" class="form-control form-control-sm" 
                            DataSourceID="SqlDataSource1Standard0" DataTextField="Standard" 
                            DataValueField="Standard_Id" Height="27px" placeholder="Type" Width="150px">
                            <asp:ListItem Text="--SELECT-- " Value="0"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td align="left" valign="bottom">
                        <asp:DropDownList ID="DropDownList5" runat="server" AppendDataBoundItems="True" 
                            AutoPostBack="True" class="form-control form-control-sm" 
                            DataSourceID="SqlDataSource1_Subject1" DataTextField="Subject_Name" 
                            DataValueField="Subject_Id" Height="27px" 
                            onselectedindexchanged="DropDownList5_SelectedIndexChanged" placeholder="Type" 
                            Width="150px">
                            <asp:ListItem Value="0">-- SELECT --</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td align="left" valign="bottom">
                        <asp:DropDownList ID="DropDownList6" runat="server" AppendDataBoundItems="True" 
                            AutoPostBack="True" class="form-control form-control-sm" 
                            DataSourceID="SqlDataSource1_Chapter1" DataTextField="Chapter_Name" 
                            DataValueField="Chapter_Id" Height="27px" 
                            onselectedindexchanged="DropDownList6_SelectedIndexChanged" placeholder="Type" 
                            Width="150px">
                            <asp:ListItem Value="0">-- SELECT --</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td align="left" valign="bottom">
                        <asp:TextBox ID="Minimum_MarksTextBox3" runat="server" 
                            class="form-control form-control-lg" Height="27px" placeholder="Minimum Marks" 
                            Text='<%# Bind("Minimum_Marks") %>' Width="150px" />
                    </td>
                </tr>
                <tr>
                    <td align="left" valign="top">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                            ControlToValidate="DropDownList4" ErrorMessage="Standard is required.">*</asp:RequiredFieldValidator>
                        <asp:SqlDataSource ID="SqlDataSource1Standard0" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ConnectionString_CONCEPT %>" 
                            SelectCommand="SELECT * FROM [Standard]"></asp:SqlDataSource>
                    </td>
                    <td align="left" valign="top">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                            ControlToValidate="DropDownList5" ErrorMessage="Subject is required.">*</asp:RequiredFieldValidator>
                        <asp:SqlDataSource ID="SqlDataSource1_Subject1" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ConnectionString_CONCEPT %>" 
                            SelectCommand="SELECT * FROM [Subject] WHERE ([Standard_Id] = @Standard_Id)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="DropDownList4" Name="Standard_Id" 
                                    PropertyName="SelectedValue" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                    <td align="left" valign="top">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                            ControlToValidate="DropDownList6" ErrorMessage="Chapter is required.">*</asp:RequiredFieldValidator>
                        <asp:SqlDataSource ID="SqlDataSource1_Chapter1" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ConnectionString_CONCEPT %>" 
                            SelectCommand="SELECT Chapter_Id, Chapter_Name, Subject_Id FROM Chapter WHERE (Subject_Id = @Subject_Id)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="DropDownList5" Name="Subject_Id" 
                                    PropertyName="SelectedValue" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                    <td align="left" valign="top">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                            ControlToValidate="Minimum_MarksTextBox3" 
                            ErrorMessage="Please Enter the Marks.">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                            ControlToValidate="Minimum_MarksTextBox3" ErrorMessage="Enter Only Number." 
                            ValidationExpression="^[0-9]*$">*</asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td align="left" colspan="4" valign="bottom">
                        <asp:Label ID="Label11" runat="server" CssClass="style26" Font-Size="Medium" 
                            Text="Question "></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="left" colspan="4" valign="top">
                        <asp:TextBox ID="Question_DetailsTextBox3" runat="server" class="form-control" 
                            Height="200px" placeholder="Question" style="margin-top: 9px;margin-left: 0px" 
                            Text='<%# Bind("Question_Details") %>' TextMode="MultiLine" Width="90%" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                            ControlToValidate="Question_DetailsTextBox3" 
                            ErrorMessage="Question is required.">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td align="left" colspan="4" valign="bottom">
                        <br />
                        <asp:Label ID="Label13" runat="server" CssClass="style26" Font-Size="Medium" 
                            Text="Answer Description "></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="left" colspan="4" valign="top">
                        <asp:TextBox ID="Answer_DetailsTextBox3" runat="server" class="form-control" 
                            Height="200px" placeholder="Answer" style="margin-top: 9px;margin-left: 0px" 
                            Text='<%# Bind("Answer_Details") %>' TextMode="MultiLine" Width="90%" />
                    </td>
                </tr>
                <tr>
                    <td align="left" colspan="4" valign="bottom">
                        <asp:ValidationSummary ID="ValidationSummary2" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td align="right" colspan="2" valign="bottom">
                        <br />
                        <asp:LinkButton ID="InsertButton1" runat="server" CausesValidation="True" 
                            class="btn btn-rounded btn-primary" CommandName="Insert" Text="Insert" 
                            Width="130px" />
                    </td>
                    <td align="left" colspan="2" valign="bottom">
                        <asp:LinkButton ID="InsertCancelButton1" runat="server" 
                            CausesValidation="False" class="btn btn-rounded btn-primary" 
                            CommandName="Cancel" Text="Cancel" Width="130px" />
                    </td>
                </tr>
            </table>
            <br />
            <br />
            <br />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
           
        </InsertItemTemplate>
        <ItemTemplate>
            Question_Id:
            <asp:Label ID="Question_IdLabel" runat="server" 
                Text='<%# Eval("Question_Id") %>' />
            <br />
            Question_Details:
            <asp:Label ID="Question_DetailsLabel" runat="server" 
                Text='<%# Bind("Question_Details") %>' />
            <br />
            Answer_Details:
            <asp:Label ID="Answer_DetailsLabel" runat="server" 
                Text='<%# Bind("Answer_Details") %>' />
            <br />
            Minimum_Marks:
            <asp:Label ID="Minimum_MarksLabel" runat="server" 
                Text='<%# Bind("Minimum_Marks") %>' />
            <br />
            Chapter_Id:
            <asp:Label ID="Chapter_IdLabel" runat="server" 
                Text='<%# Bind("Chapter_Id") %>' />
            <br />
            Subject_Id:
            <asp:Label ID="Subject_IdLabel" runat="server" 
                Text='<%# Bind("Subject_Id") %>' />
            <br />
            Correct_Option:
            <asp:Label ID="Correct_OptionLabel" runat="server" 
                Text='<%# Bind("Correct_Option") %>' />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                CommandName="Edit" Text="Edit" />
            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                CommandName="Delete" Text="Delete" />
            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                CommandName="New" Text="New" />
        </ItemTemplate>
        <PagerStyle CssClass="pgr" />
    </asp:FormView>

    <br />
    <br />
    <asp:SqlDataSource ID="SqlDataSource1_All" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString_CONCEPT %>" 
        DeleteCommand="DELETE FROM [Question_Bank] WHERE [Question_Id] = @Question_Id" 
        InsertCommand="INSERT INTO [Question_Bank] ([Question_Details], [Answer_Details], [Minimum_Marks], [Chapter_Id], [Subject_Id], [Correct_Option]) VALUES (@Question_Details, @Answer_Details, @Minimum_Marks, @Chapter_Id, @Subject_Id, @Correct_Option)" 
        SelectCommand="SELECT * FROM [Question_Bank]" 
        
        UpdateCommand="UPDATE [Question_Bank] SET [Question_Details] = @Question_Details, [Answer_Details] = @Answer_Details, [Minimum_Marks] = @Minimum_Marks, [Chapter_Id] = @Chapter_Id, [Subject_Id] = @Subject_Id, [Correct_Option] = @Correct_Option WHERE [Question_Id] = @Question_Id">
        <DeleteParameters>
            <asp:Parameter Name="Question_Id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Question_Details" Type="String" />
            <asp:Parameter Name="Answer_Details" Type="String" />
            <asp:Parameter Name="Minimum_Marks" Type="Int32" />
            <asp:Parameter Name="Chapter_Id" Type="Int32" />
            <asp:Parameter Name="Subject_Id" Type="Int32" />
            <asp:Parameter Name="Correct_Option" Type="Byte" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Question_Details" Type="String" />
            <asp:Parameter Name="Answer_Details" Type="String" />
            <asp:Parameter Name="Minimum_Marks" Type="Int32" />
            <asp:Parameter Name="Chapter_Id" Type="Int32" />
            <asp:Parameter Name="Subject_Id" Type="Int32" />
            <asp:Parameter Name="Correct_Option" Type="Byte" />
            <asp:Parameter Name="Question_Id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>

    <br />
    <br />

</div>
</div>
</div>
</asp:Content>

