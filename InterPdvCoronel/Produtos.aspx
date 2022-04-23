<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Produtos.aspx.cs" Inherits="InterPdvCoronel.Produtos" %>

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
                                <li><a href="Venda.aspx">Gerenciamento</a></li>
                                <li><a href="Venda.aspx">Cadastro</a></li>
                                <li><a href="Venda.aspx">Configuração</a></li>
                                <li><a href="Venda.aspx">Sair</a></li>
                              
                           </ul>
                       </div>
                  </div><!-- menu -->
                  <div class="formulario col-12 col-md-10 container posicaoForm" width="1000px" heigth="2000px">
                       <div class="row">
                            <div class="col-12">
                                <p class="pformulario">Cadastro de Produtos</p>
                            </div>
                        </div>
                        <div class ="row">
                            <div class="container col-12 col-md-5">


                                <!-- componentes do formulario -->

                                <asp:Label ID="Label1" runat="server" Text="Label">Código:</asp:Label>
                                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>

                                <asp:Label ID="Label2" runat="server" Text="Label">Código de Barras:</asp:Label>
                                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>

                                <asp:Label ID="Label3" runat="server" Text="Label">Nome:</asp:Label>
                                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>

                                <asp:Label ID="Label4" runat="server" Text="Label">Descrição:</asp:Label>
                                <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>

                                <asp:Label ID="Label5" runat="server" Text="Label">Quantidade em Estoque:</asp:Label>
                                <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>

                                <asp:Label ID="Label6" runat="server" Text="Label">Valor:</asp:Label>
                                <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>

                                <asp:Button ID="Cadastrar" runat="server" Text="Cadastrar" />
                              

                            </div>
                            <div class="container col-12 col-md-5">

                                <!-- grid -->

                                <asp:GridView ID="GridView1" runat="server" ></asp:GridView>



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
