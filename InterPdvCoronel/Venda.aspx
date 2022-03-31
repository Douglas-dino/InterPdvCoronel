<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Venda.aspx.cs" Inherits="InterPdvCoronel.Venda" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Venda</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="lblUsuario" runat="server"></asp:Label>
            &nbsp<asp:LinkButton ID="lkbSair" runat="server" Text="Logoff" OnClick="lkbSair_Click"></asp:LinkButton>
        </div>
        <div>
            
            <asp:LinkButton ID="lbkUsuario"  runat="server" OnClick="lbkUsuario_Click">LinkButton</asp:LinkButton>
            &nbsp<asp:Label ID="lblMsg" runat="server"></asp:Label>
        </div>
        <div>
            <asp:Label ID="lblCodVenda" runat="server"></asp:Label>
        </div>
    </form>
    
</body>
</html>
