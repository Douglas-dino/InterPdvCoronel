using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InterPdvCoronel
{
    public partial class Produtos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // if (Session["LOGIN"] == null)// Verifica se há acesso de usuário
            //Response.Redirect("Default.aspx");
            atualizarGrid();
        }

        private void atualizarGrid()
        {
            using(coronelEntities conexao = new coronelEntities())
            {
                var lista = conexao.PRODUTO.ToList();
                gridProduto.DataSource = lista;
                gridProduto.DataBind();

            }
        }

        public void LimparControles(ControlCollection controles)

        {

            foreach (Control controle in controles)
            {

                if (controle.GetType().Equals(typeof(TextBox)))
                {
                    ((TextBox)controle).Text = string.Empty;
                }
                if (controle.GetType().Equals(typeof(DropDownList)))
                {
                    ((DropDownList)controle).SelectedIndex = 0;
                }


            }

        }
        protected void btnNovo_Click(object sender, EventArgs e)
        {
            lblMsg.Text = string.Empty;
            LimparControles(this.Page.Form.Controls);
        }

        protected void btnSalvar_Click(object sender, EventArgs e)
        {
            using (coronelEntities conexao = new coronelEntities())
            {
                if (COD_BARRA.Text.Equals("") || NOME.Text.Equals("") || DESCRICAO.Text.Equals("") || 
                    QTD_ESTOQUE.Text.Equals("") || VALOR.Text.Equals(""))
                {
                    lblMsg.Text = "Preencha o formulário!";
                }
                else
                {
                    lblMsg.Text = string.Empty;
                    //Verifica se esstá inserindo ou atualizando
                    if (gridProduto.SelectedValue != null)
                    {//atualizando

                        PRODUTO p = conexao.PRODUTO.FirstOrDefault(
                            linha => linha.CODIGO.ToString().Equals(gridProduto.SelectedValue.ToString())
                            );

                        p.COD_BARRA = COD_BARRA.Text;
                        p.NOME = NOME.Text;
                        p.DESCRICAO = DESCRICAO.Text;
                        p.QTD_ESTOQUE = Convert.ToInt32(QTD_ESTOQUE.Text);
                        p.VALOR = Convert.ToDecimal(VALOR.Text);
                        conexao.Entry(p);
                        atualizarGrid();
                        gridProduto.SelectedIndex = -1;
                    }
                    else
                    {// adcionando

                        PRODUTO p = new PRODUTO();
                        p.COD_BARRA = COD_BARRA.Text;
                        p.NOME = NOME.Text;
                        p.DESCRICAO = DESCRICAO.Text;
                        p.QTD_ESTOQUE = Convert.ToInt32(QTD_ESTOQUE.Text);
                        p.VALOR = Convert.ToDecimal(VALOR.Text);
                        conexao.PRODUTO.Add(p);
                        gridProduto.SelectedIndex = -1;

                    }
                    conexao.SaveChanges();
                    atualizarGrid();
                    LimparControles(this.Page.Form.Controls);
                }
                
            }
        }

        protected void btnExcluir_Click(object sender, EventArgs e)
        {
            if (gridProduto.SelectedIndex.Equals(-1))
            {
                lblMsg.Text = "Selecione um cadastro para excluir.";
            }
            else
            {
                lblMsg.Text = string.Empty;
                using (coronelEntities conexao = new coronelEntities())
                {
                    int IdSlecionado = Convert.ToInt32(gridProduto.SelectedValue.ToString());

                    PRODUTO p = conexao.PRODUTO.FirstOrDefault(
                        linha => linha.CODIGO.ToString().Equals(IdSlecionado.ToString())
                        );

                    conexao.PRODUTO.Remove(p);
                    gridProduto.SelectedIndex = -1;
                    conexao.SaveChanges();
                    atualizarGrid();
                    LimparControles(this.Page.Form.Controls);

                }
            }
            
        }

        protected void gridProduto_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblMsg.Text = string.Empty;
            using (coronelEntities conexao = new coronelEntities())
            {
                int IdSlecionado = Convert.ToInt32(gridProduto.SelectedValue.ToString());

                PRODUTO p = conexao.PRODUTO.FirstOrDefault(
                    linha => linha.CODIGO.ToString().Equals(IdSlecionado.ToString())

                    );

                CODIGO.Text = p.CODIGO.ToString();
                COD_BARRA.Text = p.COD_BARRA;
                NOME.Text = p.NOME;
                DESCRICAO.Text = p.DESCRICAO;
                QTD_ESTOQUE.Text = p.QTD_ESTOQUE.ToString();
                VALOR.Text = p.VALOR.ToString();
            }
        }

        protected void lbkUsuario_Click(object sender, EventArgs e)
        {
            // Verifica o nivel de acesso do usuário
            if (Session["NIVEL"].Equals(1))
            {
                //lblMsg.Text = "Acesso negado!";
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
                //lblMsg.Text = "Acesso negado!";
            }
            else
            {
                
                Response.Redirect("Relatorio.aspx");
            }
        }

       
    }
}