<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div data-role="panel" data-position="right" data-display="reveal" data-theme="a" id="add-form">
            <div class="userform">
                <h2>Login</h2>

                <asp:Label ID="Labelname" AssociatedControlID="name" runat="server" Text="Username:"></asp:Label>
                <asp:TextBox ID="name" name="name" value="" data-clear-btn="true" data-mini="true" runat="server"></asp:TextBox>

                <asp:Label ID="Labelpassword" AssociatedControlID="password" runat="server" Text="Password:"></asp:Label>
                <asp:TextBox ID="password" type="password" name="password" runat="server" value="" data-clear-btn="true" autocomplete="off" data-mini="true"></asp:TextBox>
                <asp:CheckBox ID="chkRememberMe" runat="server" />

                <asp:Panel ID="PanelMsgError" runat="server"></asp:Panel>
                <div class="ui-grid-a">
                    <div class="ui-block-a"><a href="#" data-rel="close" class="ui-btn ui-shadow ui-corner-all ui-btn-b ui-mini">Cancel</a></div>
                    <div class="ui-block-b">
                        <asp:LinkButton ID="LoginBtn" data-rel="close" CssClass="ui-btn ui-shadow ui-corner-all ui-btn-a ui-mini" Text="Login" runat="server" OnClick="LoginBtn_Click"></asp:LinkButton>
                    </div>
                </div>
                <div>
                    <div class="ui-block"><a href="#" data-rel="close" class="ui-btn ui-shadow ui-corner-all ui-btn-a ui-mini">Opret Bruger</a></div>
                </div>
            </div>
        </div>
        <!-- /panel -->
    </form>
</body>
</html>

