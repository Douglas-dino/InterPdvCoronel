using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InterPdvCoronel
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogar_Click(object sender, EventArgs e)
        {
            string usuario = txtUsuario.Text;
            string senha = txtSenha.Text;
            //Cria conexão com banco de dados

            using (coronelEntities conexao = new coronelEntities())
            {
                //Busca usuários no banco
                USUARIO user =
                conexao.USUARIO.FirstOrDefault(
                    linha => linha.LOGIN.Equals(usuario) &&
                             linha.SENHA.Equals(senha)
                    );

                if (user != null)
                {
                    //verifica se o usuário está ativo ou inativo
                    if (user.STATUS.Equals("I"))
                    {
                        lblMsg.Text = "Usuário inativo";
                    }
                    else
                    {
                        Session["LOGIN"] = user.NOME; // Guarda o nome do usuário
                        Session["NIVEL"] = user.NIVEL;// Guarda o nivel de acesso do usuário
                        Response.Redirect("Venda.aspx");
                    }

                }
                else
                {
                    lblMsg.Text = "Usuário ou Senha Ivalido!";
                }
                if (txtUsuario.Text.Equals("") || txtSenha.Text.Equals(""))
                {
                    lblMsg.Text = "Preencha os campos usuário e senha";
                }
            }
          

           
        }

        
    }
}