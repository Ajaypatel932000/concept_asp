<%@ Page Title="" Language="C#" MasterPageFile="~/ADMIN_/MasterPage.master" AutoEventWireup="true" CodeFile="CreateTest.aspx.cs" Inherits="ADMIN_CreateTest" %>

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
    <style>
    html, body {
        height: 100%;
        
    }

    body {
        display: -ms-flexbox;
        display:table;
        -ms-flex-align: center;
        align-items: center;
        padding-bottom: 40px;
    }
        .style10
        {
            text-align: left;
            font-size: medium;
        }
        .style11
        {
            height: 44px;
        }
        .style18
        {
            width: 364px;
            height: 50px;
        }
        .style19
        {
            height: 50px;
            width: 334px;
        }
        .style20
        {
            height: 50px;
            width: 339px;
        }
        .style21
        {
            font-size: x-large;
        }
        .style22
        {
            height: 51px;
        }
        .style23
        {
            height: 51px;
            width: 334px;
        }
        .style24
        {
            height: 51px;
            width: 339px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <div class="page-header"><h2 class = "pageheader-title">Create Test</h2></div>

    <form class="splash-container">
<div class="card">
<div class="card-body">
<div class="form-group">
    <table>
           
        <tbody> 
         <tr>
            <td class="style18">
                <asp:Label ID="Label9" runat="server"
Font-Size="Medium" Text="Select a Type "></asp:Label>
                <br />
                <asp:DropDownList ID="DropDownList4" class="form-control form-control-sm" runat="server" AutoPostBack="True" 
                    Height="27px" Width="150px" placeholder = "Type">
                    <asp:ListItem Value="-1">--SELECT--</asp:ListItem>
                    <asp:ListItem Value="1">Subjective</asp:ListItem>
                    <asp:ListItem Value="2">Objective</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="DropDownList4" ErrorMessage="Please select." 
                    ForeColor="#CC0000" InitialValue="-1" SetFocusOnError="True"></asp:RequiredFieldValidator>
                <br />
            </td>
            <td class="style19">
                <asp:Label ID="Label1" runat="server" Font-Size="Medium" Text="Standard "></asp:Label>
                <br />
                <asp:DropDownList ID="DropDownList1" class="form-control form-control-sm" runat="server" AppendDataBoundItems="True" 
                    AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="Standard" 
                    DataValueField="Standard_Id" Height="27px" 
                    onselectedindexchanged="DropDownList1_SelectedIndexChanged" Width="150px">
                    <asp:ListItem Text="--SELECT--" Value="0"></asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                    ControlToValidate="DropDownList1" ErrorMessage="Please select." 
                    ForeColor="#CC0000" InitialValue="-1" SetFocusOnError="True"></asp:RequiredFieldValidator>
            </td>
             <td class="style20">
                <asp:Label ID="Label2" runat="server" Font-Size="Medium" Text="Subject "></asp:Label>
                 <br />
                <asp:DropDownList ID="DropDownList2" class="form-control form-control-sm" 
                     runat="server" AutoPostBack="True" 
                    DataSourceID="SqlDataSource2" DataTextField="Subject_Name" 
                    DataValueField="Subject_Id" Height="27px" 
                    onselectedindexchanged="DropDownList2_SelectedIndexChanged" Width="150px" 
                     AppendDataBoundItems="True">

                    <asp:ListItem Text="--SELECT--" Value="0"></asp:ListItem>

                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                    ControlToValidate="DropDownList2" ErrorMessage="Please select." 
                    ForeColor="#CC0000" ></asp:RequiredFieldValidator>
                <asp:Label ID="Label7" runat="server" Visible="False"></asp:Label>
                </td>
        </tr>
    
         <tr>
            <td class="style22">
                <br />
                <asp:Label ID="Label3" runat="server" Font-Size="Medium" Text="Total Marks "></asp:Label>
                <asp:TextBox ID="TextBox1" runat="server" ontextchanged="TextBox1_TextChanged" 
                    class="form-control form-control-lg" Width="150px" placeholder="Total Marks" 
                    Height="27px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="TextBox1" ErrorMessage="Total Marks is required." 
                    ForeColor="#CC0000"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ControlToValidate="TextBox1" ErrorMessage="Only Number Allow" 
                    ForeColor="#CC0000" ValidationExpression="\d+"></asp:RegularExpressionValidator>
                <br />
            </td>
            <td class="style23">
                <br />
                <asp:Label ID="Label5" runat="server" Font-Size="Medium" 
                    Text="Type of Question "></asp:Label>
                <asp:DropDownList class="form-control form-control-sm" ID="DropDownList3" 
                     runat="server" AppendDataBoundItems="True" 
                    AutoPostBack="True" DataSourceID="Question_type" DataTextField="Minimum_Marks" 
                    DataValueField="Minimum_Marks" Height="27px" 
                    onselectedindexchanged="DropDownList3_SelectedIndexChanged" Width="150px">
                    <asp:ListItem Value="0">--SELECT--</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                    ControlToValidate="DropDownList3" ErrorMessage="Please Select Value" 
                    ForeColor="#CC0000" InitialValue="0" SetFocusOnError="True"></asp:RequiredFieldValidator>
                 <br />
            </td>
             <td class="style24">
                 <br />
                 <br />
                </td>
        </tr>
    
         <tr>
            <td class="style22" colspan="3">
                <asp:Label ID="Label4" runat="server" Font-Size="Medium" 
                    Text="Select Chapter  "></asp:Label><asp:CheckBoxList ID="CheckBoxList1"  runat="server" DataSourceID="chapter" 
                    DataTextField="Chapter_Name" DataValueField="Chapter_Id" Height="20px" 
                    RepeatColumns="1" Width="500px">
                </asp:CheckBoxList>
                
                <asp:Button ID="Button1" runat="server" BackColor="#1A6ABE" ForeColor="White" 
                    Height="30px" onclick="Button1_Click" style="margin-left: 0px" 
                    Text="Show Questions" Width="120px" />
                <br />
            </td>
        </tr>
    
         <tr>
            <td class="style22" colspan="3">
                <br />
                <asp:Label ID="Label6" runat="server" Font-Size="Medium" 
                    Text="Select Questions  "></asp:Label>
                <asp:CheckBoxList ID="CheckBoxList2" runat="server" Height="16px" 
                    onselectedindexchanged="CheckBoxList2_SelectedIndexChanged" Width="800px">
                </asp:CheckBoxList>
                <asp:CheckBoxList ID="CheckBoxList3" runat="server" Height="16px" 
                    RepeatColumns="10" RepeatDirection="Horizontal" Width="800px" 
                    Visible="False">
                </asp:CheckBoxList>
                <asp:Button ID="Button2" runat="server" BackColor="#1A6ABE" ForeColor="White" 
                    Height="30px" onclick="Button2_Click" Text="Add Question" Width="120px" />
                <br />
                <br />
             </td>
        </tr>
    
         <tr>
            <td class="style22" colspan="3">
                <asp:GridView ID="GridView1" class="table table-hover" runat="server" AutoGenerateColumns="False" 
                    Width="700px" onrowdeleting="GridView1_RowDeleting" 
                    onrowdeleted="GridView1_RowDeleted">
                  
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="ID ">
                        <ItemStyle HorizontalAlign="Center" Width="100px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Question" HeaderText="Questions">
                        <ItemStyle HorizontalAlign="Center" Width="300px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Mark" HeaderText="Marks">
                        <ItemStyle HorizontalAlign="Center" Width="100px" />
                        </asp:BoundField>
                        <asp:CommandField HeaderText="Remove" ShowDeleteButton="True" 
                            DeleteImageUrl="~/App_Themes/Theme1/assets/images/logout.png" 
                            DeleteText="Remove">
                        <ItemStyle HorizontalAlign="Center" Width="100px" />
                        </asp:CommandField>
                    </Columns>
                    <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <HeaderStyle  Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                    <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#0000A9" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#000065" />
                </asp:GridView>
                <br />
                <asp:Button ID="Button3" runat="server" BackColor="#1A6ABE" Font-Size="Medium" 
                    ForeColor="White" Height="35px" onclick="Button3_Click" Text="Create Test" 
                    Width="123px" />
             </td>
        </tr>
    
         <tr>
            <td class="style11" colspan="3">
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\ASPNETDB.MDF;Integrated Security=True;User Instance=True" 
        ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [Standard]">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="Question_type" runat="server" 
        ConnectionString="Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\ASPNETDB.MDF;Integrated Security=True;User Instance=True" 
        ProviderName="System.Data.SqlClient" 
        SelectCommand="SELECT DISTINCT [Minimum_Marks] FROM [Question_Bank] ORDER BY [Minimum_Marks]">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="chapter" runat="server" 
        ConnectionString="Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\ASPNETDB.MDF;Integrated Security=True;User Instance=True" 
        ProviderName="System.Data.SqlClient" 
        SelectCommand="SELECT * FROM [Chapter] WHERE ([Subject_Id] = @Subject_Id)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList2" Name="Subject_Id" 
                PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\ASPNETDB.MDF;Integrated Security=True;User Instance=True" 
        ProviderName="System.Data.SqlClient" 
        SelectCommand="SELECT * FROM [Subject] WHERE ([Standard_Id] = @Standard_Id)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="Standard_Id" 
                PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
                <br />
            </td>
        </tr>
    </tbody>
    </table>
    </div>
    </div>
    </div>
    </form>
</asp:Content>

