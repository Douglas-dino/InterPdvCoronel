<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="InterPdvCoronel.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="estilos/estilo_login.css" rel="stylesheet" />
    <link href="bootstrap-5.1.3-dist/css/bootstrap-grid.min.css" rel="stylesheet" />
    
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Login</title>
 
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-12 col-md-8">
                <img src="imagens/background.png" class="fundo"  />

            </div>

            <div class="col-12 col-md-4 ">
                <form id="form1" runat="server" class="formLogin">

                    <div>
          
                        <img src="imagens/Logologin.png" class ="login" />

                    </div>
                    <div>
                        <asp:TextBox ID="txtUsuario"  placeholder="Usuário" runat="server" ></asp:TextBox>

                    </div>
                    <div>

                        <asp:TextBox ID="txtSenha" placeholder="Senha" runat="server"  TextMode ="Password"></asp:TextBox>

                    </div>
                    <div>

                        <asp:Button ID="btnLogar"  runat="server" Text="Entrar" OnClick="btnLogar_Click"  />

                    </div>
                    <div class="mensagem">

                        <asp:Label ID="lblMsg" runat="server"></asp:Label>

                    </div>
                    <div class ="copy">

                        <label class ="rotulo">&copy Tecnodroid</label>

                    </div>

               </form>
            </div>
        </div>
        
   </div>
    
  
</body>
</html>
