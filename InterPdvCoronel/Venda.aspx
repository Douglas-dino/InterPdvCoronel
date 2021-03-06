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
        <div class=" container">
            <div class="row">
                <div class="col-12">
                    <asp:ValidationSummary ID="vsInserir" runat="server" ShowMessageBox="true" ValidationGroup="inserir"/>
                </div>
            </div>
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
                                       <asp:TextBox ID="txtCodigo" runat="server" CssClass="camposVenda" ValidationGroup="inserir"></asp:TextBox><asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="O campo código só aceita numeros" ControlToValidate="txtCodigo" ForeColor="#D1FEEF" ValidationExpression="\d+" ValidationGroup="inserir"  SetFocusOnError="True">*</asp:RegularExpressionValidator>
                                       <asp:RequiredFieldValidator ID="rfInserir1" runat="server" ValidationGroup="inserir" Text="*" ControlToValidate="txtCodigo" ErrorMessage="O campo codigo é de prenenchimento obrigatorio!" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                                   </div>
                                   <div class="col-12 col-md-5 divUsuario">
                                       <asp:Label ID="qtd" runat="server" Text="Quantidade:" CssClass="rotulosl"></asp:Label>
                                       <asp:TextBox ID="txtQtd" runat="server" CssClass="camposVenda" ValidationGroup="inserir" ForeColor="Black"></asp:TextBox><asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="O campo quantidade só aceita numeros" ControlToValidate="txtQtd" ForeColor="#D1FEEF" ValidationExpression="\d+" ValidationGroup="inserir">*</asp:RegularExpressionValidator>
                                       <asp:RequiredFieldValidator ID="rfInserir2" runat="server" ValidationGroup="inserir" Text="*" ControlToValidate="txtQtd" ErrorMessage="O campo quantidade é de prenenchimento obrigatorio!" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                                   </div>

                               </div>
                               <div class="row">
                                   <div class="col-12 col-md-5 divUsuario">
                                       <asp:Label ID="lblVal" runat="server" Text="Val_Unitário" CssClass="rotulosl"></asp:Label>
                                       <asp:TextBox ID="txtVal_Unit" runat="server" CssClass="camposVenda" EnableViewState="False" ReadOnly="True" Enabled="False"></asp:TextBox>
                                   </div>
                                   <div class="col-12 col-md-5 divUsuario">
                                       <asp:Label ID="sub" runat="server" Text="Subtotal:" CssClass="rotulosl"></asp:Label>
                                       <asp:TextBox ID="txtSubtotal" runat="server" CssClass="camposVenda" Enabled="False"></asp:TextBox>
                                   </div>

                               </div>
                               <div class="row">
                                   <div class="col-12 col-md-5 divUsuario"> 
                                       <asp:Label ID="lblTotal" runat="server" Text="Total:" CssClass="rotulosl"></asp:Label>
                                       <asp:TextBox ID="txtTotal" runat="server" CssClass="camposVenda" ViewStateMode="Enabled" Enabled="False" ReadOnly="True"></asp:TextBox>
                                   </div>
                               </div>
                                <div class="row">
                                    <div class="col-12 col-md-3 divUsuario">
                                        <asp:Button ID="btnInserir" CssClass="btnCadastro" runat="server"
                                            Text="Inserir" OnClick="btnInserir_Click" ValidationGroup="inserir" />
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
                                <div class="row ">
                                   
                                </div>  
                                
                           </div>
                           <div class="container col-12 col-md-6">

                               <div class="row">
                                   <div class="col-12 divUsuario">
                                       
                                      <asp:Label ID="lblProduto" runat="server" Text="Produto:" CssClass="rotulosl"></asp:Label>
                                       <asp:TextBox ID="txtProduto" runat="server" CssClass="campos" Enabled="False" ReadOnly="True"></asp:TextBox>
                                   </div>
                                 </div>
                              
                                 <div class="row">
                                    <div class="col-12 divUsuario">
                                        <div class="rolagem">
                                            <asp:GridView ID="gridVenda" runat="server" BackColor="White"  CellPadding="1" ForeColor="Black" GridLines="Vertical" OnSelectedIndexChanged="gridVenda_SelectedIndexChanged" DataKeyNames="ID" AutoGenerateColumns="False">
                                                <AlternatingRowStyle BackColor="#CCCCCC" />
                                                <Columns>
                                                    <asp:BoundField DataField="PRODUTO.NOME" HeaderText="Produto"/>
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
                               </div> 
                               <div class="row">
                                   <div class="col-12 divUsuario">
                                        <asp:Button ID="btnExcluirVen" CssClass="btnCadastro btnExcluir" runat="server"
                                            Text="Excluir" OnClick="btnExcluirVen_Click" OnClientClick="javascript:return confirm('Deseja realmente excluir este item da venda?')"/>
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
