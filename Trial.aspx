<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Trial.aspx.cs" Inherits="Trial" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        Enter value
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <br />
        <br />
&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        <br />
&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
    
        <br />
        <asp:Literal ID="Literal1" runat="server"></asp:Literal>
    
        <br />
        <br />
    
    </div>
     <div class="radio-container">
      <input type="radio" value="male" name="Gender" />
      <label for="male">Male</label>

      <input type="radio" value="female" name="Gender" />
      <label for="female">Female</label>
    </div>
    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Button" />
    </form>
</body>
</html>
