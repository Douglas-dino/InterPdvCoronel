<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Venda.aspx.cs" Inherits="InterPdvCoronel.Venda" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="bootstrap-5.1.3-dist/css/bootstrap-grid.min.css" rel="stylesheet" />
    <link href="estilos/estilo_venda.css" rel="stylesheet" />
    
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Venda</title>
</head>
<body>
    <header>
        <img src="imagens/logo2.png" />
    </header>
    <form id="form1" runat="server">
        <div class="">
            <div class="row">
                <div class="col-12 col-md-2" ><!-- menu -->
                       
                           <ul>
                               <li><asp:LinkButton ID="lkbSair" CssClass="ativoMenu" runat="server" Text="Logoff" OnClick="lkbSair_Click"></asp:LinkButton></li>
                               <li><asp:LinkButton ID="lkbRelatorio"  runat="server" OnClick="lkbRelatorio_Click" Text="Relatório"></asp:LinkButton></li>
                               <li><asp:LinkButton ID="lkbProduto"  runat="server" OnClick="lkbProduto_Click">Produtos</asp:LinkButton></li>
                               <li><asp:LinkButton ID="lbkUsuario"  runat="server" OnClick="lbkUsuario_Click">Gestão de Usuário</asp:LinkButton></li>
                           </ul>
                        
                 </div><!-- menu -->
                 <div class="formulario container-fluid col-12 col-md-8">
                     <div class ="row">
                           <div class="container col-12 col-md-4">
                               <div class="row">
                                   <div class="col-12 col-md-5 divUsuario">
                                       <asp:Label ID="lblCodigo" runat="server" Text="Código:" CssClass="rotulosl"></asp:Label>
                                       <asp:TextBox ID="txtCodigo" runat="server" CssClass="camposVenda"></asp:TextBox>
                                   </div>
                                   <div class="col-12 col-md-5 divUsuario">
                                       <asp:Label ID="qtd" runat="server" Text="Quantidade:" CssClass="rotulosl"></asp:Label>
                                       <asp:TextBox ID="txtQtd" runat="server" CssClass="camposVenda"></asp:TextBox>
                                   </div>

                               </div>
                               <div class="row">
                                   <div class="col-12 col-md-5 divUsuario">
                                       <asp:Label ID="lblVal" runat="server" Text="Val_Unitário" CssClass="rotulosl"></asp:Label>
                                       <asp:TextBox ID="txtVal_Unit" runat="server" CssClass="camposVenda"></asp:TextBox>
                                   </div>
                                   <div class="col-12 col-md-5 divUsuario">
                                       <asp:Label ID="sub" runat="server" Text="Subtotal:" CssClass="rotulosl"></asp:Label>
                                       <asp:TextBox ID="txtSubtotal" runat="server" CssClass="camposVenda"></asp:TextBox>
                                   </div>

                               </div>
                               <div class="row">
                                   <div class="col-12 col-md-5 divUsuario"> 
                                       <asp:Label ID="lblTotal" runat="server" Text="Total:" CssClass="rotulosl"></asp:Label>
                                       <asp:TextBox ID="txtTotal" runat="server" CssClass="camposVenda" ViewStateMode="Enabled"></asp:TextBox>
                                   </div>
                               </div>
                                <div class="row">
                                    <div class="col-12 col-md-3 divUsuario">
                                        <asp:Button ID="btnInserir" CssClass="btnCadastro" runat="server"
                                            Text="Inserir" OnClick="btnInserir_Click" />
                                    </div>
                                    <div class="col-12 col-md-3 divUsuario botoes">
                                        
                                    </div>
                                    <div class="col-12 col-md-3 divUsuario botoes">
                                       <asp:Button ID="btnFinalizar" CssClass="btnCadastro" runat="server" 
                                            Text="Finalizar" OnClick="btnFinalizar_Click"/>
                                    </div>
                                </div>
                               <div class="row">
                                   <div class="col-12 divUsuario">
                                       <asp:Label ID="lblMsg" runat="server"></asp:Label>
                                   </div>
                               </div>
                                
                           </div>
                           <div class="container col-12 col-md-6">

                               <div class="row">
                                   <div class="col-12 divUsuario">
                                       
                                      <asp:Label ID="lblProduto" runat="server" Text="Produto:" CssClass="rotulosl"></asp:Label>
                                       <asp:TextBox ID="txtProduto" runat="server" CssClass="campos"></asp:TextBox>
                                   </div>
                                 </div>
                              
                                 <div class="row">
                                    <div class="col-12 divUsuario">
                                        <asp:GridView ID="gridVenda" runat="server" BackColor="White" BorderColor="#A4C639" BorderStyle="Solid" BorderWidth="3px" CellPadding="3" ForeColor="Black" GridLines="Vertical" OnSelectedIndexChanged="gridVenda_SelectedIndexChanged" DataKeyNames="ID" AutoGenerateColumns="False">
                                            <AlternatingRowStyle BackColor="#CCCCCC" />
                                            <Columns>
                                                <asp:BoundField DataField="PRODUTO.NOME" HeaderText="Produto" />
                                                <asp:BoundField DataField="QUANTIDADE" HeaderText="Qtd" />
                                                <asp:BoundField DataField="PRODUTO.VALOR" HeaderText="Val_unit" />
                                                <asp:BoundField DataField="VAL_UNITARIO" HeaderText="Subtotal" />
                                                <asp:CommandField HeaderText="Selecionar" ShowSelectButton="True" />
                                            </Columns>
                                            <FooterStyle BackColor="#CCCCCC" />
                                            <HeaderStyle BackColor="#2e2e2e" Font-Bold="True" ForeColor="White" />
                                            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                                            <SelectedRowStyle BackColor="#2e2e2e" Font-Bold="True" ForeColor="#A4C639" />
                                            <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                            <SortedAscendingHeaderStyle BackColor="#808080" />
                                            <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                            <SortedDescendingHeaderStyle BackColor="#383838" />
                                        </asp:GridView> 
                                       
                                        
                                       
                                        </div>
                               </div> 
                               <div class="row">
                                   <div class="col-12 divUsuario">
                                        <asp:Button ID="btnExcluirVen" CssClass="btnCadastro btnExcluir" runat="server"
                                            Text="Excluir" OnClick="btnExcluirVen_Click"/>
                                   </div>
                               </div>

                           </div>
                     </div>
                       
                 </div>

            </div>
         </div> <!-- -->
                            
            <footer class="rodPosicao">
                <div class="container">
                    <div class="row">
                         <div class="col-12 col-md-3">
                            <asp:Label ID="lblUsuario" runat="server"></asp:Label>
               
                        </div>
                        <div class="col-12 col-md-3">
                            <asp:Label ID="lblCodVenda" runat="server"></asp:Label>
                        </div>
                       
                    </div>
                </div>
               
            </footer>
    </form>
   
</body>
</html>
