<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Usuarios.aspx.cs" Inherits="InterPdvCoronel.Usuarios" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="bootstrap-5.1.3-dist/css/bootstrap-grid.min.css" rel="stylesheet" />
    <link href="estilos/estilo.css" rel="stylesheet" />
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
                            <div class="container col-12 col-md-5"><!-- componentes do formulario -->
                                <div class="row">
                                    <div class ="col-12 divUsuario">
                                        <label>Nome:</label>
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
                                        <asp:TextBox ID="txtSenhaCad" runat="server" CssClass="campos"></asp:TextBox>
                                    </div>
                                    <div class="col-12 col-md-5 divUsuario">
                                        <label id="lblNivel">Nivel:</label>
                                        <asp:DropDownList ID="drpNivel" runat="server" CssClass="campos">
                                            <asp:ListItem Value="1"></asp:ListItem>
                                            <asp:ListItem Value="2"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-12 col-md-5 divUsuario">
                                        <label>Status:</label>
                                        <asp:DropDownList ID="drpStatus" runat="server" CssClass="campos">
                                            <asp:ListItem Value="A"></asp:ListItem>
                                            <asp:ListItem Value="I"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-12 col-md-3 divUsuario botoes">
                                        <asp:Button ID="btnNovo" CssClass="btnCadastro" runat="server"
                                            Text="Novo" OnClick="btnNovo_Click" />
                                    </div>
                                    <div class="col-12 col-md-3 divUsuario botoes">
                                        <asp:Button ID="btnSalvar" CssClass="btnCadastro" runat="server" 
                                            Text="Salvar" OnClick="btnSalvar_Click" />
                                    </div>
                                    <div class="col-12 col-md-3 divUsuario botoes">
                                        <asp:Button ID="btnExcluir" CssClass="btnCadastro" runat="server"
                                            Text="Excluir" OnClick="btnExcluir_Click" OnClientClick="javascript:return confirm('Deseja realmente excluir este usuário?')"/>
                                    </div>
                                </div>
                            </div><!-- componentes do formulario -->
                            <div class="col-12 col-md-5 divUsuario"><!-- grid -->
                                    <asp:GridView ID="gridUsuario" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="gridUsuario_SelectedIndexChanged" DataKeyNames="CODIGO" >
                                           <AlternatingRowStyle BackColor="White" />
                                           <Columns>
                                               <asp:BoundField HeaderText="Código" DataField="CODIGO" />
                                               <asp:BoundField HeaderText="Nome" DataField="NOME" />
                                               <asp:BoundField HeaderText="Sobrenome" DataField="SOBRENOME" />
                                               <asp:CommandField AccessibleHeaderText="Seleecionar" SelectText="......" ShowSelectButton="True" />
                                           </Columns>
                                           <EditRowStyle BackColor="#7C6F57" />
                                           <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                           <HeaderStyle BackColor="#2e2e2e" Font-Bold="True" ForeColor="White" />
                                           <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                                           <RowStyle BackColor="#E3EAEB" />
                                           <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                           <SortedAscendingCellStyle BackColor="#F8FAFA" />
                                           <SortedAscendingHeaderStyle BackColor="#246B61" />
                                           <SortedDescendingCellStyle BackColor="#D4DFE1" />
                                           <SortedDescendingHeaderStyle BackColor="#15524A" />
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
