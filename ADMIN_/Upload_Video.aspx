<%@ Page Title="" Language="C#" MasterPageFile="~/ADMIN_/MasterPage.master" AutoEventWireup="true" CodeFile="Upload_Video.aspx.cs" Inherits="ADMIN_Upload_Video" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <table class="style1">
        <tr>
            <td class="style2">
                <asp:Label ID="Label1" runat="server" Font-Size="Medium" Text="Standard :" 
                    Width="150px"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="DropDownList1" runat="server" AppendDataBoundItems="True" 
                    AutoPostBack="True" DataSourceID="SqlDataSource1_std" DataTextField="Standard" 
                    DataValueField="Standard_Id" 
                    onselectedindexchanged="DropDownList1_SelectedIndexChanged">
                    <asp:ListItem Value="0">SELECT</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Label2" runat="server" Font-Size="Medium" Text="Subject :" 
                    Width="150px"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="DropDownList2" runat="server" AppendDataBoundItems="True" 
                    AutoPostBack="True" DataSourceID="SqlDataSource1_subject" 
                    DataTextField="Subject_Name" DataValueField="Subject_Id" 
                    onselectedindexchanged="DropDownList2_SelectedIndexChanged" 
                    style="height: 22px">
                    <asp:ListItem Value="0">SELECT</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Label3" runat="server" Font-Size="Medium" Text="Chapter :" 
                    Width="150px"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="DropDownList3" runat="server" AppendDataBoundItems="True" 
                    AutoPostBack="True" DataSourceID="SqlDataSource1_ch" 
                    DataTextField="Chapter_Name" DataValueField="Chapter_Id">
                    <asp:ListItem Value="0">SELECT</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Label6" runat="server" Text="Batch"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="DropDownList4" runat="server" AutoPostBack="True" 
                    DataSourceID="SqlDataSource1_batch" DataTextField="Batch_Name" 
                    DataValueField="Batch_Id" Height="22px" Width="104px">
                    <asp:ListItem Value="0">SELECT </asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Label4" runat="server" Font-Size="Medium" Text="Choose Video :" 
                    Width="150px"></asp:Label>
            </td>
            <td>
                <asp:FileUpload ID="FileUpload1" runat="server" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Label5" runat="server" Font-Size="Medium" Height="16px" 
                    Text="Enter Video Name :" Width="168px"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="lblMessage" runat="server" Font-Bold="True" ForeColor="Black" 
                    Visible="False" />
            </td>
            <td>
                <asp:ImageButton ID="ImageButton1" runat="server" Height="44px" 
                    ImageUrl="~/App_Themes/Theme1/documentation/img/submit_btn2.gif" 
                    onclick="ImageButton1_Click" Width="166px" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2" colspan="2">
                <asp:GridView ID="GridView1" runat="server" align="center" 
                    AutoGenerateColumns="False" CssClass="Grid" 
                    DataSourceID="SqlDataSource1_GridView" PagerStyle-CssClass="pgr" Width="395px">
                    <Columns>
                        <asp:BoundField DataField="Video_Details" HeaderText="Video_Details" 
                            SortExpression="Video_Details" />
                        <asp:BoundField DataField="Path" HeaderText="Path" 
                            SortExpression="Path" />
                    </Columns>
                    <PagerStyle CssClass="pgr" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1_batch" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString_CONCEPT %>" 
                    SelectCommand="SELECT [Batch_Id], [Batch_Name] FROM [Batch] WHERE ([Standard_Id] = @Standard_Id)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList1" Name="Standard_Id" 
                            PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource1_ch" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString_CONCEPT %>" 
                    SelectCommand="SELECT * FROM [Chapter] WHERE ([Subject_Id] = @Subject_Id)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList2" Name="Subject_Id" 
                            PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource1_subject" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString_CONCEPT %>" 
                    SelectCommand="SELECT * FROM [Subject] WHERE ([Standard_Id] = @Standard_Id)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList1" Name="Standard_Id" 
                            PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource1_std" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString_CONCEPT %>" 
                    SelectCommand="SELECT * FROM [Standard]"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource1_GridView" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString_CONCEPT %>" 
                    
                    SelectCommand="SELECT [Video_Details], [Path] FROM [Video_Batch_wise] WHERE (([Subject_Id] = @Subject_Id) AND ([Chapter_Id] = @Chapter_Id) AND ([Batch_Id] = @Batch_Id))">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList2" Name="Subject_Id" 
                            PropertyName="SelectedValue" Type="Int32" />
                        <asp:ControlParameter ControlID="DropDownList3" Name="Chapter_Id" 
                            PropertyName="SelectedValue" Type="Int32" />
                        <asp:ControlParameter ControlID="DropDownList4" Name="Batch_Id" 
                            PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

