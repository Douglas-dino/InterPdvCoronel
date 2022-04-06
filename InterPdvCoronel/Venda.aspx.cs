using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace InterPdvCoronel
{
    public partial class Venda : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["LOGIN"] == null)// Verifica se há acesso de usuário
                Response.Redirect("Default.aspx");
            lblUsuario.Text =  Session["LOGIN"].ToString();

            GerarCodVenda();
               
        }

     
        private void GerarCodVenda()
        {
            coronelEntities conexao = new coronelEntities();
            //Busca o ultimo código de venda
            VENDA venda = 
                conexao.VENDA.OrderBy(
                    /* Duvida sobre esse código, ele não retorna resultados vazios
                       O lastorDefault não funcionou   */
                    linha => linha.CODIGO).OrderByDescending(n => n.CODIGO).Take(1).Single();
                int cod;
                cod = (venda.CODIGO) + 1; //Adiciona + 1 ao código de venda
            
                lblCodVenda.Text = cod.ToString(); //Novo código de venda
            
        }
       
        protected void lkbSair_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("Default.aspx");
        }

        protected void lbkUsuario_Click(object sender, EventArgs e)
        {
            // Verifica o nivel de acesso do usuário
            if (Session["NIVEL"].Equals(1))
            {
                lblMsg.Text = "Acesso negado!";
            }
            else
            {
                Response.Redirect("Usuarios.aspx");
            }
            
            
        }

        protected void lkbRelatorio_Click(object sender, EventArgs e)
        {
            // Verifica o nivel de acesso do usuário
            if (Session["NIVEL"].Equals(1))
            {
                lblMsg.Text = "Acesso negado!";
            }
            else
            {
                Response.Redirect("Relatorio.aspx");
            }

            
        }
    }
}