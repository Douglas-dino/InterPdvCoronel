<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Relatorio.aspx.cs" Inherits="InterPdvCoronel.Relatorio" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="bootstrap-5.1.3-dist/css/bootstrap-grid.min.css" rel="stylesheet" />
    <link href="estilos/login.css" rel="stylesheet" />
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
                 <div class="formulario col-12 col-md-10 container">
                     <div class="row">
                        <div class="col-12">
                            <p class="pformulario">Relatórios</p>
                        </div>
                     </div>
                     <div class ="row">
                           <div class="container col-12 col-md-5">

                                <!-- componentes do formulario -->
                           </div>
                           <div class="container col-12 col-md-5">

                                <!-- grid -->

                           </div>
                     </div>
                       
                 </div>

            </div>
        </div>
                            
            <footer>
                
            </footer>
    </form>
</body>
</html>
