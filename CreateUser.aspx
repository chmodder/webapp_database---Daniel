<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CreateUser.aspx.cs" Inherits="CreateUser" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="UserNameLbl" AssociatedControlID="CreateUserNameText" Text="Brugernavn: " runat="server"></asp:Label>
            <asp:TextBox ID="CreateUserNameText" Placeholder="Brugernavn" required="required" runat="server"></asp:TextBox>
            <br />

            <asp:Label ID="PasswordLbl" AssociatedControlID="CreatePassWordText" Text="Password: " runat="server"></asp:Label>
            <asp:TextBox ID="CreatePassWordText" Placeholder="Password" required="required" runat="server" TextMode="Password">Kodeord</asp:TextBox>
            <br />

            <asp:LinkButton ID="CreateUserBtn" runat="server" Text="Opret bruger" OnClick="CreateUserBtn_Click" />

        </div>
    </form>
</body>
</html>
