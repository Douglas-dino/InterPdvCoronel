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
                               <li><a class="ativo" href="Venda.aspx">Voltar</a></li> 
                               <li><a href="Produtos.aspx">Produto</a></li>
                               <li><a href="Usuarios.aspx">Usuário</a></li>
                           </ul>
                        </div>
                 </div><!-- menu -->
                 <div class="formulario col-12 col-md-10 container posicaoForm">
                     <div class="row">
                        <div class="col-12">
                            <p class="pformulario">Relatórios</p>
                        </div>
                     </div>
                     <div class ="row">
                           <div class="container col-12 col-md-5">
                               <div class="row">
                                   <div class="col-12 col-md-3">
                                       <asp:Calendar ID="cadRelatorio" runat="server" BackColor="White" BorderColor="#A4C639" DayNameFormat="Shortest" Font-Names="Times New Roman" Font-Size="10pt" ForeColor="Black" Height="153px" NextPrevFormat="FullMonth" TitleFormat="Month" Width="304px" SelectionMode="None">
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
                               </div>
                               
                                <!-- componentes do formulario -->
                           </div>
                           <div class="container col-12 col-md-5">

                                <div class="row">
                                    <div class="col-12">
                                        <asp:GridView ID="gridRelatorio" runat="server" AutoGenerateColumns="False">
                                            <Columns>
                                                <asp:BoundField DataField="CODIGO" HeaderText="Código" />
                                                <asp:BoundField DataField="DATA" HeaderText="Data" />
                                                <asp:BoundField DataField="HORA" HeaderText="Hora" />
                                                <asp:BoundField DataField="VALOR" HeaderText="Valor" />
                                                <asp:BoundField DataField="VENDA.TIPO_PG" HeaderText="Tipo_pg" />
                                            </Columns>
                                        </asp:GridView>
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
