<%@ Page Title="" Language="C#" MasterPageFile="~/Student/MasterPage.master" AutoEventWireup="true" CodeFile="GiveTest.aspx.cs" Inherits="Student_GiveTest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
<div class = "card-body">

    <asp:Label ID="Label8" runat="server" 
        style="text-align: center; font-weight: 700; font-size: large;" 
        Text="Enter Test ID :"></asp:Label>
    <asp:TextBox ID="TextBox1" runat="server" style="margin-left: 0px"></asp:TextBox>
    <asp:Button ID="Button3" runat="server" BackColor="#1A6ABE" Font-Bold="True" 
        ForeColor="White" Height="30px" onclick="Button3_Click" Text="SHOW" 
        Width="120px" />

</div>
</asp:Content>

