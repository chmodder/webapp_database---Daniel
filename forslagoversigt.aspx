<%@ Page Language="C#" AutoEventWireup="true" CodeFile="forslagoversigt.aspx.cs" Inherits="forslagoversigt" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="proposalOverview">
                <ItemTemplate>
                    <hr />
                    <p>upvotes = <%# Eval("upvotes") %></p>
                    <h1><%# Eval("proposalTitle") %> </h1>
                    <hr />
                </ItemTemplate>
            </asp:Repeater>
            <asp:SqlDataSource runat="server" ID="proposalOverview" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="Select proposalID, Proposal.proposalTitle, count(Upvote.FKuserID) as upvotes 
from Proposal LEFT JOIN Upvote
    ON Proposal.proposalID = Upvote.FKproposalID                
GROUP BY Proposal.proposalID, Proposal.proposalTitle
ORDER BY upvotes DESC"></asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
