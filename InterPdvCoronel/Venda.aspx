<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Venda.aspx.cs" Inherits="InterPdvCoronel.Venda" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="bootstrap-5.1.3-dist/css/bootstrap-grid.min.css" rel="stylesheet" />
    <link href="estilos/estilo.css" rel="stylesheet" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Venda</title>
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
                               <li><asp:LinkButton ID="lkbSair" runat="server" Text="Logoff" OnClick="lkbSair_Click"></asp:LinkButton></li>
                               <li><asp:LinkButton ID="lkbRelatorio"  runat="server" OnClick="lkbRelatorio_Click" Text="Relatório"></asp:LinkButton></li>
                               <li><a href="Produtos.aspx">Produto</a></li>
                               <li><asp:LinkButton ID="lbkUsuario"  runat="server" OnClick="lbkUsuario_Click">Gestão de Usuário</asp:LinkButton></li>
                           </ul>
                        </div>
                 </div><!-- menu -->
                 <div class="formulario col-12 col-md-10 container posicaoForm">
                     <div class ="row">
                           <div class="container col-12 col-md-5">
                               <div class="row">
                                   <div class="col-12 col-md-5 divUsuario">
                                       <label>Código:</label>
                                       <asp:TextBox ID="txtCodigo" runat="server" CssClass="campos"></asp:TextBox>
                                   </div>
                                   <div class="col-12 col-md-5 divUsuario">
                                       <label id="qtd">Quantidade:</label>
                                       <asp:TextBox ID="txtQtd" runat="server" CssClass="campos"></asp:TextBox>
                                   </div>

                               </div>
                               <div class="row">
                                   <div class="col-12 col-md-5 divUsuario">
                                       <label>Val_Unitario:</label>
                                       <asp:TextBox ID="txtVal_Unit" runat="server" CssClass="campos"></asp:TextBox>
                                   </div>
                                   <div class="col-12 col-md-5 divUsuario">
                                       <label id="sub">Subtotal:</label>
                                       <asp:TextBox ID="txtSubtotal" runat="server" CssClass="campos"></asp:TextBox>
                                   </div>

                               </div>
                               <div class="row">
                                   <div class="col-12 col-md-5 divUsuario">
                                       <label>Total:</label>
                                       <asp:TextBox ID="txtTotal" runat="server" CssClass="campos"></asp:TextBox>
                                   </div>
                               </div>
                                
                           </div>
                           <div class="container col-12 col-md-5">

                               <div class="row">
                                   <div class="col-12 divUsuario">
                                       <label>Produto:</label>
                                       <asp:TextBox ID="txtProduto" runat="server" CssClass="campos"></asp:TextBox>
                                   </div>
                               </div>
                               <div class="row">
                                   <div class="col-12 divUsuario">
                                       <asp:GridView ID="gridVenda" runat="server"></asp:GridView>
                                   </div>
                               </div>

                           </div>
                     </div>
                       
                 </div>

            </div>
        </div>
                            
            <footer class="rodPosicao">
                <div>
                    <asp:Label ID="lblUsuario" runat="server"></asp:Label>
               
                </div>
                <div>
                    <asp:Label ID="lblCodVenda" runat="server"></asp:Label>
                </div>
                <div>
            
               
                    &nbsp<asp:Label ID="lblMsg" runat="server"></asp:Label>
                </div>
            </footer>
    </form>
   
</body>
</html>
