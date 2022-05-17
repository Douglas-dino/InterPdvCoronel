<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Relatorio.aspx.cs" Inherits="InterPdvCoronel.Relatorio" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="bootstrap-5.1.3-dist/css/bootstrap-grid.min.css" rel="stylesheet" />
    <link href="estilos/estilo_relatorio.css" rel="stylesheet" />
    <title>Relatório</title>
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
                               <li><a class="ativo" href="Venda.aspx">Home</a></li> 
                               <li><a href="Produtos.aspx">Produto</a></li>
                               <li><a href="Usuarios.aspx">Usuário</a></li>
                           </ul>
                        </div>
                 </div><!-- menu -->
                 <div class="formulario col-12 col-md-10 container posicaoForm">
                     <div class="row">
                        <div class="col-12">
                            <p class="pformulario">Relatório</p>
                        </div>
                     </div>
                     <div class ="row">
                           <div class="container col-12 col-md-5" style="border:2px solid #A4C639;" >
                               <div class="row">                             
                                   <div class="col-12 col-md-2">
                                       <asp:Label ID="lblData" runat="server" Text="Data: "></asp:Label>
                                       <asp:Calendar ID="cadRelatorio1" runat="server" BackColor="White" BorderColor="#A4C639" DayNameFormat="Shortest" Font-Names="Times New Roman" Font-Size="10pt" ForeColor="Black" Height="53px" NextPrevFormat="FullMonth" TitleFormat="Month" Width="209px" FirstDayOfWeek="Sunday" OnSelectionChanged="cadRelatorio1_SelectionChanged1">
                                           <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" ForeColor="#333333" Height="10pt" />
                                           <DayStyle Width="14%" />
                                           <NextPrevStyle Font-Size="8pt" ForeColor="White" />
                                           <OtherMonthDayStyle ForeColor="#999999" />
                                           <SelectedDayStyle BackColor="#2e2e2e" ForeColor="#A4C639" />
                                           <SelectorStyle BackColor="#CCCCCC" Font-Bold="True" Font-Names="Verdana" Font-Size="8pt" ForeColor="#333333" Width="1%" />
                                           <TitleStyle BackColor="#2e2e2e" Font-Bold="True" Font-Size="13pt" ForeColor="White" Height="14pt" />
                                           <TodayDayStyle BackColor="#CCCC99" />
                                       </asp:Calendar>
                                   </div>
                                   <div class="col-12 col-md-2 pcampos">
                                       <asp:Label ID="lblEntrada" runat="server" Text="Entrada: "></asp:Label>
                                       <asp:TextBox ID="txtEntrada" CssClass="campos" runat="server" Enabled="False" ReadOnly="True"></asp:TextBox>
                                       <asp:Label ID="lblSaida" runat="server" CssClass="divUsuario" Text="Saida: "></asp:Label>
                                       <asp:TextBox ID="txtSaida" CssClass="campos" runat="server" Enabled="False" ReadOnly="True"></asp:TextBox>
                                       <asp:Label ID="lblCaixa" runat="server" CssClass="divUsuario" Text="Caixa: "></asp:Label>
                                       <asp:TextBox ID="txtCaixa" CssClass="campos" runat="server" Enabled="False" ReadOnly="True"></asp:TextBox>
                                   </div>
                               </div>
                               <div class="row">
                                   <div class="col-12">
                                       <asp:Label ID="lblMsg" runat="server"></asp:Label>
                                   </div>
                               </div>
                               <div class="row divUsuario">
                                  
                                    <div class="col-12 col-md-3">
                                        <asp:Button ID="btnLimpar" CssClass=" btnCadastro" runat="server" Text="Limpar" OnClick="btnLimpar_Click" />
                                    </div>
                                    <div class="col-12 col-md-3">
                                        <asp:Button ID="btnConsultar" CssClass=" btnCadastro" runat="server" Text="Consultar" OnClick="btnConsultar_Click" />
                                      
                                    </div>
                                   
                               </div>
                               
                               <div class="row drop" style="border-top:2px solid #A4C639;">
                               
                                   <div class="col-12 col-md-3" >
                                       <asp:Label ID="Label1" runat="server" Text="Código: "></asp:Label>
                                       <asp:DropDownList ID="drpItems" CssClass="rolagemDrp" runat="server" onmousedown="this.size=3;" onfocusout="this.size=1;">

                                       </asp:DropDownList>
                                       
                                   </div>
                                   <div class="col-12 col-md-3">
                                        <asp:Button ID="btnProcurar" CssClass=" btnCadastro" runat="server" Text="Consultar Itens" OnClick="btnProcurar_Click" />
                                      
                                    </div>
                               </div>
                               
                                <!-- componentes do formulario -->
                           </div>
                           <div class="container col-12 col-md-5">

                                <div class="row">
                                    <div class="col-12">
                                       <div class="rolagem">
                                           <asp:GridView ID="gridRelatorio" runat="server" UseAccessibleHeader="False" BackColor="White"  CellPadding="3" ForeColor="Black" GridLines="Vertical">
                                                <AlternatingRowStyle BackColor="#CCCCCC" />
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
                                   <div class="col-12 divGrid"> 
                                       <div class="rolagem">
                                           <asp:GridView ID="gridItens" runat="server" UseAccessibleHeader="False" BackColor="White"  CellPadding="3" ForeColor="Black" GridLines="Vertical" AutoGenerateColumns="False">
                                                <AlternatingRowStyle BackColor="#CCCCCC" />
                                                <Columns>
                                                    <asp:BoundField DataField="COD_VENDA" HeaderText="Código Venda" />
                                                    <asp:BoundField DataField="PRODUTO.NOME" HeaderText="Produto" ItemStyle-Width="200px" />
                                                    <asp:BoundField DataField="QUANTIDADE" HeaderText="Quantidade" />
                                                    <asp:BoundField DataField="VAL_UNITARIO" HeaderText="Total" />
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
