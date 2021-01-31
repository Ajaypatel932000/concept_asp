<%@ Page Title="" Language="C#" MasterPageFile="~/Student/MasterPage.master" AutoEventWireup="true" CodeFile="Note_Download.aspx.cs" Inherits="Student_Notes_Rating" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <%--    <script type="text/javascript">
        function HideLabel() {
            var seconds = 3;
            setTimeout(function () {
                document.getElementById("<%=lblMessage.ClientID %>").style.display = "none";
            }, seconds * 1000);
        };
        </script>--%>
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

    
        
    
       
        
        .style2
        {
            width: 405px;
        }

       
        .style3
        {
            width: 120%;
            height: 171px;
        }
        .style5
        {
            width: 134px;
        }

       
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <table class="dropzone-previews">
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Label2" runat="server" CssClass="style11" Text="Subject :" 
                    Width="150px"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="DropDownList2" runat="server" AppendDataBoundItems="True" 
                    AutoPostBack="True" DataSourceID="SqlDataSource1_subject" 
                    DataTextField="Subject_Name" DataValueField="Subject_Id" 
                  
                    style="height: 22px">
                    <asp:ListItem Value="0">SELECT</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Label3" runat="server" CssClass="style11" Text="Chapter :" 
                    Width="150px"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="DropDownList3" runat="server" AppendDataBoundItems="True" 
                    AutoPostBack="True" DataSourceID="SqlDataSource2_CH" 
                    DataTextField="Chapter_Name" DataValueField="Chapter_Id">
                    <asp:ListItem Value="0">SELECT</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:DataList ID="DataList1" runat="server" 
                    DataSourceID="SqlDataSource2_note_show" DataKeyField="Note_Id" 
                    onitemcommand="DataList1_ItemCommand">
                    <ItemTemplate>
                        &nbsp;<table class="style3">
                            <tr>
                                <td class="style5">
                                    <asp:Label ID="Label4" runat="server" Text="Note No"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="Note_IdLabel" runat="server" Text='<%# Eval("Note_Id") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td class="style5">
                                    <asp:Label ID="Label5" runat="server" Text="Note Name"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="Note_DetailsLabel" runat="server" 
                                        Text='<%# Eval("Note_Details") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td class="style5">
                                    &nbsp;</td>
                                <td>
                                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("Path") %>'> View &amp;&amp; Download</asp:HyperLink>
                                </td>
                            </tr>
                            <tr>
                                <td class="style5">
                                    <asp:Label ID="Label6" runat="server" Text="Select Rating"></asp:Label>
                                </td>
                                <td>
                                    <ajaxToolkit:Rating ID="Rating1" runat="server" Height="16px" Width="219px"  
                                        CurrentRating="0" EmptyStarCssClass="starempty" FilledStarCssClass="starfilled" 
                            MaxRating="5" StarCssClass="starempty" 
                            WaitingStarCssClass="starwaiting" onchanged="Rating1_Changed">
                                    </ajaxToolkit:Rating>
                                </td>
                            </tr>
                            <tr>
                                <td class="style5">
                                    &nbsp;</td>
                                <td>
                                    <asp:Button ID="Button1" runat="server" Height="32px" Text="Submit" 
                                        Width="87px" CommandArgument='<%# Eval("Note_id")%>' 
                                        CommandName="Note_id" />
                                </td>
                            </tr>
                        </table>
                        <br />
                        <br />
                    </ItemTemplate>
                </asp:DataList>
                <asp:SqlDataSource ID="SqlDataSource2_note_show" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString_CONCEPT %>" 
                    
                    SelectCommand="SELECT [Note_Id], [Note_Details], [Path] FROM [Note_Batch_wise] WHERE (([Subject_Id] = @Subject_Id) AND ([Chapter_Id] = @Chapter_Id) AND ([Batch_Id] = @Batch_Id))">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList2" Name="Subject_Id" 
                            PropertyName="SelectedValue" Type="Int32" />
                        <asp:ControlParameter ControlID="DropDownList3" Name="Chapter_Id" 
                            PropertyName="SelectedValue" Type="Int32" />
                        <asp:SessionParameter Name="Batch_Id" SessionField="batch_id" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td>
                <asp:SqlDataSource ID="SqlDataSource2_CH" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString_CONCEPT %>" 
                    SelectCommand="SELECT [Chapter_Id], [Chapter_Name] FROM [Chapter] WHERE ([Subject_Id] = @Subject_Id)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList2" Name="Subject_Id" 
                            PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
                <asp:SqlDataSource ID="SqlDataSource1_subject" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString_CONCEPT %>" 
                    SelectCommand="SELECT Subject_Name, Subject_Id FROM Subject WHERE (Subject_Id IN (SELECT Subject_Id FROM Batch_Subject WHERE (Batch_Id = @BATCH_ID)))">
                    <SelectParameters>
                        <asp:SessionParameter Name="BATCH_ID" SessionField="batch_id" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>

