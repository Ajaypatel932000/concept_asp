<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Video_Download.aspx.cs" Inherits="Student_Video_Download" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style type="text/css">
    .starempty
        {
            background-image: url(../Star/starempty.png);
            width: 20px;
            height: 20px;
        }
        .starfilled
        {
            background-image: url(../Star/starfilled.png);
            width: 20px;
            height: 20px;
        }
        .starwaiting
        {
            background-image: url(../Star/starwaiting.png);
            width: 20px;
            height: 20px;
        }

    
        .style1
        {
            width: 132%;
            height: 116px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <table class="style1">
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
                <asp:Label ID="Label2" runat="server" Font-Size="Medium" Text="Subject :" 
                    Width="150px"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="DropDownList2" runat="server" AppendDataBoundItems="True" 
                    AutoPostBack="True" DataSourceID="SqlDataSource2_subject" 
                    DataTextField="Subject_Name" DataValueField="Subject_Id" 
                  
                    style="height: 22px">
                    <asp:ListItem Value="0">SELECT</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2_subject" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString_CONCEPT %>" 
                    
                    SelectCommand="SELECT Subject_Name, Subject_Id FROM Subject WHERE (Subject_Id IN (SELECT Subject_Id FROM Batch_Subject WHERE (Batch_Id = @BATCH_ID)))">
                    <SelectParameters>
                        <asp:SessionParameter Name="BATCH_ID" SessionField="batch_id" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
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
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label5" runat="server"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    <br />
                <asp:SqlDataSource ID="SqlDataSource1_ch" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString_CONCEPT %>" 
                    
        SelectCommand="SELECT [Chapter_Id], [Chapter_Name] FROM [Chapter] WHERE ([Subject_Id] = @Subject_Id)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList2" Name="Subject_Id" 
                            PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString_CONCEPT %>" 
        
        
        SelectCommand="SELECT [Video_Id], [Video_Details], [Path] FROM [Video_Batch_wise] WHERE (([Subject_Id] = @Subject_Id) AND ([Chapter_Id] = @Chapter_Id) AND ([Batch_Id] = @Batch_Id))">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList2" Name="Subject_Id" 
                PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="DropDownList3" Name="Chapter_Id" 
                PropertyName="SelectedValue" Type="Int32" />
            <asp:SessionParameter Name="Batch_Id" SessionField="batch_id" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
<br />
<br />
    Video ma login kari ne aavnu login ma code lakyo che<asp:DataList 
        ID="DataList1" runat="server" 
    DataSourceID="SqlDataSource1" RepeatColumns="3" RepeatDirection="Horizontal" 
        DataKeyField="Video_Id" onitemcommand="DataList1_ItemCommand">
    <ItemTemplate>
        <br />
        <table class="style1">
            <tr>
                <td>
                    <asp:Label ID="Label6" runat="server" Text="Video No"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="Video_IdLabel" runat="server" Text='<%# Eval("Video_Id") %>' />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label7" runat="server" Text="Video Name"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="Video_DetailsLabel" runat="server" 
                        Text='<%# Eval("Video_Details") %>' />
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:Literal ID="Literal1" runat="server" Text='<%# Eval("Path") %>'></asp:Literal>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label8" runat="server" Text="Select Rating"></asp:Label>
                </td>
                <td>
                    <ajaxToolkit:Rating ID="Rating1" runat="server" Height="28px" Width="257px" 
                        CurrentRating="0" EmptyStarCssClass="starempty" 
                        FilledStarCssClass="starfilled"  MaxRating="5" StarCssClass="starempty"  
                        WaitingStarCssClass="starwaiting" onchanged="Rating1_Changed">
                    </ajaxToolkit:Rating>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:Button ID="Button1" runat="server" 
                        CommandArgument='<%# Eval("Video_id")%>' CommandName="Video_Id" Height="33px" 
                        Text="Submit" Width="85px" />
                </td>
            </tr>
        </table>
        <br />
    </ItemTemplate>
</asp:DataList>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
</asp:Content>

