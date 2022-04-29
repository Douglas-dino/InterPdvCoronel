<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Usuarios.aspx.cs" Inherits="InterPdvCoronel.Usuarios" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="bootstrap-5.1.3-dist/css/bootstrap-grid.min.css" rel="stylesheet" />
    <link href="estilos/estilo_usuario.css" rel="stylesheet" />
    <title>Gestão de Usuários</title>

     
</head>
<body>
    <header >
         <img src="imagens/logo2.png" />
   </header>
    <form id="form1" runat="server">
        <div class="container">
            <div class="row"> <!--dentro desta tag está o menu e o formulario -->
                   <div class="col-12 col-md-2 container"><!-- menu -->
                       <div class ="divMenu">
                           <ul>
                               <li><a class="ativo" href="Venda.aspx">Voltar</a></li>
                               <li><a href="Relatorio.aspx">Relatório</a></li>
                               <li><a href="Produtos.aspx">Produto</a></li>
                           </ul>
                       </div>
                   </div><!-- menu -->
                    <div class="formulario col-12 col-md-10 container">
                        <div class="row">
                            <div class="col-12">
                                <p class="pformulario">Cadastro de Usuários</p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="container col-12 col-md-4"><!-- componentes do formulario -->
                                <div class="row">
                                    <div class="col-12">
                                        <label>Nome:</label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class ="col-12 divUsuario">
                                        
                                        <asp:TextBox ID ="txtNome" runat="server" CssClass="campos"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-12 divUsuario">
                                        <label>Sobrenome:</label>
                                        <asp:TextBox ID="txtSobrenome" runat="server" CssClass="campos"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-12 col-md-5 divUsuario">
                                        <label>Cpf:</label>
                                        <asp:TextBox ID="txtCpf" runat="server" CssClass="campos"></asp:TextBox>
                                    </div>
                                    <div class="col-12 col-md-5 divUsuario">
                                        <label id="lblLogin">Login:</label>
                                        <asp:TextBox ID="txtLogin" runat="server" CssClass="campos"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-12 col-md-5 divUsuario">
                                        <label>Senha:</label>
                                        <asp:TextBox ID="txtSenhaCad" runat="server" CssClass="campos" TextMode ="Password"></asp:TextBox>
                                    </div>
                                    <div class="col-12 col-md-2 divUsuario">
                                        <label id="lblNivel">Nivel:</label>
                                        <asp:DropDownList ID="drpNivel" runat="server" CssClass="campos">
                                            <asp:ListItem Value="1" Selected="True"></asp:ListItem>
                                            <asp:ListItem Value="2"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <div class="col-12 col-md-3 divUsuario">
                                        <label id="status">Status:</label>
                                        <asp:DropDownList ID="drpStatus" runat="server" CssClass="campos">
                                            <asp:ListItem Value="A"></asp:ListItem>
                                            <asp:ListItem Value="I"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-12">
                                         <asp:Label ID="lblMsg" runat="server" CssClass="divUsuario" ></asp:Label>
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
                            </div><!-- componentes do formulario -->
                            <div class="col-12 col-md-8 divUsuario"><!-- grid -->
                                    <asp:GridView ID="gridUsuario" runat="server" AutoGenerateColumns="False" CellPadding="5" OnSelectedIndexChanged="gridUsuario_SelectedIndexChanged" DataKeyNames="CODIGO" BackColor="White" BorderColor="#A4C639" BorderStyle="Solid" BorderWidth="2px" ForeColor="Black" GridLines="Vertical" >
                                           <AlternatingRowStyle BackColor="#CCCCCC" />
                                           <Columns>
                                               <asp:BoundField HeaderText="Código" DataField="CODIGO" />
                                               <asp:BoundField HeaderText="Nome" DataField="NOME"/>
                                               <asp:BoundField HeaderText="Sobrenome" DataField="SOBRENOME" />
                                               <asp:CommandField AccessibleHeaderText="Selecionar" SelectText="selecionar" ShowSelectButton="True" HeaderText="Selecionar" />
                                           </Columns>
                                           <FooterStyle BackColor="#CCCCCC" />
                                           <HeaderStyle BackColor="#2e2e2e" Font-Bold="True" ForeColor="White" />
                                           <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                                           <SelectedRowStyle BackColor="#2e2e2e" Font-Bold="True" ForeColor="#A4C639" />
                                           <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                           <SortedAscendingHeaderStyle BackColor="Gray" />
                                           <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                           <SortedDescendingHeaderStyle BackColor="#383838" />
                                       </asp:GridView>      
                            </div><!-- grid -->
                        </div>
                    </div>
            </div>
        </div>
       
    </form>
     <footer>

    </footer>     
</body>
</html>
