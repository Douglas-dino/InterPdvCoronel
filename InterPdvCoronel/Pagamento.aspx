<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Pagamento.aspx.cs" Inherits="InterPdvCoronel.Pagamento" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="bootstrap-5.1.3-dist/css/bootstrap-grid.min.css" rel="stylesheet" />
    <link href="estilos/estilo_pagamento.css" rel="stylesheet" />
    <title>Pagamento</title>
</head>
<body>
   <header>
        <img src="imagens/logo2.png" />
    </header>
    <form id="form1" runat="server">
        <div class="container">
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="inserir" ShowMessageBox="true" ForeColor="#373B44" />
            <div class="row">
                
                 <div class="formulario col-12 col-md-10 container posicaoForm">
                     <div class="row">
                        <div class="col-12">
                            <p class="pformulario">Pagamento</p>
                        </div>
                     </div>
                     <div class ="row">
                           <div class="container col-12 ">
                                <div class=" row">
                                    <div class="col-12 col-md-5">
                                        <asp:Label ID="Label1" runat="server" Text="Valor" CssClass="pcampos"></asp:Label>
                                    </div>
                                     <div class="col-12 col-md-5">
                                         <asp:Label ID="Label2" runat="server" Text="Tipo de Pagamento" CssClass="pcampos"></asp:Label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="clo-12 col-md-5">
                                        
                                        <asp:TextBox ID="txtValor" runat="server" CssClass="divUsuario campos pcampos" Enabled="False" ReadOnly="True"></asp:TextBox>
                                    </div>
                                    <div class="col-12 col-md-5">
                                        
                                        <asp:DropDownList ID="drpTipoPg" runat="server" CssClass="divUsuario campos pcampos">
                                            <asp:ListItem>Credito</asp:ListItem>
                                            <asp:ListItem>Debito</asp:ListItem>
                                            <asp:ListItem>Dinheiro</asp:ListItem>
                                            <asp:ListItem>Pix</asp:ListItem>
                                            
                                        </asp:DropDownList>
                                    </div>
                                </div>
                               <div class="row">
                                       <div class="col-12 col-md-5">
                                            <asp:Label ID="Label3" runat="server" Text="Valor Pago" CssClass="divUsuario pcampos"></asp:Label>
                                       </div>
                                        <div class="col-12 col-md-5">
                                               <asp:Label ID="Label4" runat="server" Text="Troco" CssClass="divUsuario pcampos"></asp:Label>
                                        </div>
                                   </div>
                               <div class ="row">
                                   <div class ="col-12 col-md-5">
                                      
                                       <asp:TextBox ID="txtValPago" runat="server" CssClass="divUsuario campos pcampos" ></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="O Campo valor pago é obrigatório" Text="*" ValidationGroup="inserir" ForeColor="Red" ControlToValidate="txtValPago"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="O campo Produto só aceita numeros com virgula. " Text="*" ValidationGroup="inserir" ControlToValidate="txtValPago" ForeColor="#CCFFCC" ValidationExpression="[+-]?\d+(\,\d+)?"></asp:RegularExpressionValidator>
                                   </div>
                                   <div class ="col-12 col-md-5">
                                     
                                       <asp:TextBox ID="txtTroco" runat="server" CssClass="divUsuario campos pcampos" Enabled="False" ReadOnly="True"></asp:TextBox>
                                   </div>
                               </div>
                                <div class="row">
                                   <div class="col-12">
                                       <asp:Label ID="lblMsg" runat="server"></asp:Label>
                                   </div>
                               </div>
                               <div class="row">
                                   <div class ="col-12 col-md-5">
                                       <asp:Button ID="btnCalcular" CssClass="btnCadastro" runat="server" 
                                            Text="Calcular" OnClick="btnCalcular_Click" ValidationGroup="inserir" />
                                   </div>
                                   <div class="col-12 col-md-5">
                                        <asp:Button ID="btnInserir" CssClass="btnCadastro" runat="server" 
                                            Text="Finalizar" OnClick="btnInserir_Click" />
                                   </div>
                               </div>
                              
                           </div>
                           
                     </div>
                       
                 </div>

            </div>
        </div>
                            
            <footer class="rodPosicao">
                <div class="row">
                    <div class="col-12 col-md-3">
                        <asp:Label ID="lblCodVenda" runat="server"></asp:Label>
                    </div>
                       
                 </div>
            </footer>
    </form>
</body>
</html>
