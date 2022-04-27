<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Produtos.aspx.cs" Inherits="InterPdvCoronel.Produtos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="bootstrap-5.1.3-dist/css/bootstrap-grid.min.css" rel="stylesheet" />
    <link href="estilos/estilo_produto.css" rel="stylesheet" />
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
                       
                           <ul>
                               
                               <li><asp:LinkButton ID="lkbRelatorio"  runat="server"  Text="Voltar" CssClass="ativo"></asp:LinkButton></li>
                               <li><asp:LinkButton ID="lkbProduto"  runat="server" Text="Relatório"></asp:LinkButton></li>
                               <li><asp:LinkButton ID="lbkUsuario"  runat="server" Text="Gestão de Usuário"></asp:LinkButton></li>
                              
                           </ul>
                       
                  </div><!-- menu -->
                  <div class="formulario col-12 col-md-10 container ">
                       <div class="row">
                            <div class="col-12">
                                <p class="pformulario">Cadastro de Produtos</p>
                            </div>
                        </div>
                        <div class ="row">
                            <div class="container col-12 col-md-4">


                                <!-- componentes do formulario -->
                                <div class="row">
                                    <div class="col-12 col-md-5 divUsuario">
                                         <asp:Label ID="Label1" runat="server" Text="Código:"></asp:Label>
                                         <asp:TextBox ID="CODIGO" runat="server" CssClass="campos"></asp:TextBox>
                                    </div>
                                    <div class="col-12 col-md-5 divUsuario">
                                         <asp:Label ID="lblBarra" runat="server" Text="Cod_Barras:"></asp:Label>
                                         <asp:TextBox ID="COD_BARRA" runat="server" CssClass="campos"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-12 divUsuario">
                                        <asp:Label ID="Label3" runat="server" Text="Produto:"></asp:Label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-12 divUsuario">
                                        
                                        <asp:TextBox ID="NOME" runat="server" CssClass="campos"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-12 divUsuario">
                                        <asp:Label ID="Label4" runat="server" Text="Descrição:"></asp:Label>
                                    </div>
                                </div>
                               <div class="row">
                                    <div class="col-12 divUsuario">
                                        
                                         <asp:TextBox ID="DESCRICAO" runat="server" CssClass="campos"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-12 col-md-5 divUsuario">
                                        <asp:Label ID="Label5" runat="server" Text="Quantidade:"></asp:Label>
                                        <asp:TextBox ID="QTD_ESTOQUE" runat="server" CssClass="campos"></asp:TextBox>
                                    </div>
                                    <div class="col-12 col-md-5 divUsuario">
                                        
                                        <asp:Label ID="lblValor" runat="server" Text="Valor:"></asp:Label>
                                        <asp:TextBox ID="VALOR" runat="server" CssClass="campos"></asp:TextBox>
                                    </div>
                                </div>
                                 <div class="row">
                                    <div class="col-12 col-md-3 botoes">
                                        <asp:Button ID="btnNovo" CssClass="btnCadastro" runat="server"
                                            Text="Novo" OnClick="btnNovo_Click" />
                                    </div>
                                    <div class="col-12 col-md-3 botoes">
                                        <asp:Button ID="btnSalvar" CssClass="btnCadastro" runat="server" 
                                            Text="Salvar" OnClick="btnSalvar_Click" />
                                    </div>
                                    <div class="col-12 col-md-3 botoes">
                                        <asp:Button ID="btnExcluir" CssClass="btnCadastro" runat="server"
                                            Text="Excluir" OnClick="btnExcluir_Click" OnClientClick="javascript:return confirm('Deseja realmente excluir este usuário?')"/>
                                    </div>
                                </div>
                               
                            </div>
                            <div class="container col-12 col-md-8">

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
