<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Forslag.aspx.cs" Inherits="Forslag" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="aProposal">
            <ItemTemplate>
                <hr />
                <p> <%# Eval("upvotes") %> </p>
                <p> <%# Eval("proposalTitle") %> </p>
                <p> <%# Eval("proposalText") %> </p>
                <p> <%# displayName(Convert.ToInt16(Eval("proposalAnonymous")), Eval("userName").ToString()) %></p>
                <hr />
            </ItemTemplate>
        </asp:Repeater>

        <asp:Repeater ID="Repeater2" runat="server">
            <ItemTemplate>

            </ItemTemplate>
        </asp:Repeater>





        <asp:SqlDataSource runat="server" ID="aProposal" ConnectionString='<%$ ConnectionStrings:ConnectionString %>'
            SelectCommand="Select 
    Proposal.proposalID, Proposal.proposalTitle, Proposal.proposalText, Proposal.proposalAnonymous, [User].userName, upvotes 
FROM 
    Proposal 
        INNER JOIN
    (SELECT 
        proposalID, count(Upvote.FKuserID) as upvotes
    FROM 
        Proposal LEFT JOIN Upvote
    ON 
        Proposal.proposalID = Upvote.FKproposalID
    GROUP BY 
        Proposal.proposalID) as upvotestable
    ON 
        upvotestable.proposalID = Proposal.proposalID
        INNER JOIN 
    [User]
    ON [User].userID = Proposal.FKUserID
WHERE Proposal.proposalID = @pid

">
            <SelectParameters>
                <asp:QueryStringParameter QueryStringField="id" Name="pid" DbType="Int32" />
            </SelectParameters> 
        </asp:SqlDataSource>
    </form>
</body>
</html>
