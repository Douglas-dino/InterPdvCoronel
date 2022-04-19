﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Produtos.aspx.cs" Inherits="InterPdvCoronel.Produtos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="bootstrap-5.1.3-dist/css/bootstrap-grid.min.css" rel="stylesheet" />
    <link href="estilos/estilo.css" rel="stylesheet" />
    <title>Gestão de Produtos</title>
</head>
<body>
    <header>
        <img src="imagens/logo2.png" />
    </header>
    <form id="form1" runat="server">
        <div class="container">
            <div class="row">
                <div class="col-12 col-md-2 container"><!-- menu -->
                       <div class ="divMenu">
                           
                             <ul>
                                <li><a href="Venda.aspx">Vendas</a></li>
                                <li><a href="Venda.aspx">Gerenciamentor</a></li>
                                <li><a href="Venda.aspx">cadastro</a></li>
                                <li><a href="Venda.aspx">Configurações</a></li>
                                <li><a href="Venda.aspx">Sair</a></li>
                               <
                             </ul>
                        
                       </div>
                  </div>
                </div>
        
                <!-- menu -->

                  <div class="formulario col-12 col-md-10 container posicaoForm">
                       <div class="row">
                            <div class="col-12">
                                <p class="pformulario">Cadastro de Produtos</p>
                            </div>
                        </div>
                        <div class ="row">
                            <div class="container col-12 col-md-5">

                                <!-- componentes do formulario -->

                                <asp:Label ID="Label1" runat="server" Text="Label">CÓDIGO:</asp:Label>
                                <asp:TextBox ID="CODIGO" runat="server"></asp:TextBox>

                                <asp:Label ID="Label2" runat="server" Text="Label">CÓDIGO DE BARRAS:</asp:Label>
                                <asp:TextBox ID="COD_BARRA" runat="server"></asp:TextBox>

                                <asp:Label ID="Label3" runat="server" Text="Label">NOME:</asp:Label>
                                <asp:TextBox ID="NOME" runat="server"></asp:TextBox>

                                <asp:Label ID="Label4" runat="server" Text="Label">DESCRIÇÃO:</asp:Label>
                                <asp:TextBox ID="DESCRICAO" runat="server"></asp:TextBox>

                                <asp:Label ID="Label5" runat="server" Text="Label">QUANTIDADE EM ESTOQUE:</asp:Label>
                                <asp:TextBox ID="QTD_ESTOQUE" runat="server"></asp:TextBox>

                                <asp:Label ID="Label6" runat="server" Text="Label">VALOR(R$):</asp:Label>
                                <asp:TextBox ID="VALOR" runat="server"></asp:TextBox>

                            </div>
                            <div class="container col-12 col-md-5">

                                <!-- grid -->

                                <asp:GridView ID="CAD_PRODUTOS" runat="server"></asp:GridView>

                            </div>
                        </div>
                  </div>
            </div>
        </div>
        <footer class="rodPosicao">

        </footer>
    </form>
</body>
</html>
