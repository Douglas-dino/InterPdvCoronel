using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace InterPdvCoronel
{
    public partial class Venda : System.Web.UI.Page
    {
        static decimal  totalVenda = 0;
        static int cod;
        int qtd_unit;


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["LOGIN"] != null) //Verifica se há acesso de usuário
                {
                    lblUsuario.Text = "Operador: " + Session["LOGIN"].ToString();
                }
                else
                {
                   // Response.Redirect("Default.aspx");
                }

                GerarCodVenda();
            }
            
        }

        private void GerarCodVenda()
        {
            using (coronelEntities conexao = new coronelEntities()) 
            {
                //Busca o ultimo código de venda
                VENDA venda =
                    conexao.VENDA.OrderBy(
                        /* Duvida sobre esse código, ele não retorna resultados vazios
                           O lastorDefault não funcionou   */
                        linha => linha.CODIGO).OrderByDescending(n => n.CODIGO).Take(1).Single();

                cod = (venda.CODIGO) + 1; //Adiciona + 1 ao código de venda

                lblCodVenda.Text = "Codigo Venda:" + cod.ToString(); //Novo código de venda
            }
            
            
        }

        private void atualizarGrid()
        {
            using (coronelEntities conexao = new coronelEntities())
            {
                //Lista os registros do banco de dados
                var lista = conexao.ITEM_VENDA.ToList().Where(
                    linha => linha.COD_VENDA.Equals(cod)
                    );
                
                gridVenda.DataSource = lista;
                gridVenda.DataBind();

            }
        }
        public void Limpar()
        {
            txtCodigo.Text = string.Empty;
            txtQtd.Text = string.Empty;
            
        }

        public void LimparControles(ControlCollection controles)
        {
            // limpa todos os textbox
            foreach (Control controle in controles)
            {
                if (controle.GetType() == typeof(TextBox))

                   ((TextBox)controle).Text = string.Empty;
            }
        }

        private void gruardaItemVenda()
        {
            using (coronelEntities conexao = new coronelEntities())
            {
                                
                lblMsg.Text = string.Empty;
                // grava os itens da venda na tabela item_venda
                ITEM_VENDA i = new ITEM_VENDA();
                i.COD_PRODUTO = Convert.ToInt32(txtCodigo.Text);
                i.COD_VENDA = cod;
                i.QUANTIDADE = Convert.ToInt32(txtQtd.Text);
                i.VAL_UNITARIO = Convert.ToDecimal(txtSubtotal.Text);
                conexao.ITEM_VENDA.Add(i);
                conexao.SaveChanges();
                
                
            }
        }

        private void gravarVenda()
        {
            
            using(coronelEntities conexao = new coronelEntities())
            {
                // grava a venda na tabela venda
                DateTime data = DateTime.Now;
                DateTime hora = DateTime.Now;
                 
                VENDA v = new VENDA();
                v.DATA = data;
                v.HORA = hora.ToString("HH:mm:ss");
                v.VALOR = totalVenda;

                conexao.VENDA.Add(v);
                conexao.SaveChanges();
            }
        }

        protected void lkbSair_Click(object sender, EventArgs e)
        {
            totalVenda = 0;
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
                totalVenda = 0;
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
                totalVenda = 0;
                Response.Redirect("Relatorio.aspx");
            }

        }

      

        protected void lkbProduto_Click(object sender, EventArgs e)
        {
            totalVenda = 0;
            Response.Redirect("Produtos.aspx");
        }
        protected void btnInserir_Click(object sender, EventArgs e)
        {

            if (txtCodigo.Text != null || txtQtd.Text != null)
            {
                int codigo = Convert.ToInt32(txtCodigo.Text);
                using (coronelEntities conexao = new coronelEntities())
                {
                    // busca os produtos na tabela produto
                    PRODUTO p =
                        conexao.PRODUTO.FirstOrDefault(
                            linha => linha.CODIGO.Equals(codigo)
                            );
                    
                    if (p != null)
                    {
                        if (p.QTD_ESTOQUE < Convert.ToInt32(txtQtd.Text))
                        {
                            // verifica se há quntidade suficiente no estoque
                            txtProduto.Text = p.NOME;
                            txtVal_Unit.Text = p.VALOR.ToString();
                            lblMsg.Text = "Este produto possui " + p.QTD_ESTOQUE + " unidades no estoque.";
                            //LimparControles(this.Page.Form.Controls);
                            return;

                        }

                        else
                        {
                            // insere os dados nos controles
                            txtProduto.Text = p.NOME;
                            txtVal_Unit.Text = p.VALOR.ToString();
                            qtd_unit = p.QTD_ESTOQUE;
                            // calculo quantidade x  valor unitário
                            txtSubtotal.Text = (Convert.ToDecimal(txtVal_Unit.Text) * Convert.ToInt32(txtQtd.Text)).ToString();
                            // insere no controle o calculo
                            txtTotal.Text = (totalVenda += Convert.ToDecimal(txtSubtotal.Text)).ToString();
                            gruardaItemVenda();
                            atualizarGrid();
                            //Limpar();
                        }


                    }
                    else
                    {
                        lblMsg.Text = "Produto não encontrado";
                        return;
                    }

                }

            }
            else
            {
                lblMsg.Text = "Preencha os campos.";
            }
           


        }

        protected void gridVenda_SelectedIndexChanged(object sender, EventArgs e)
        {
           
            using (coronelEntities conexao = new coronelEntities())
            {
                // seleção de itens para excluir
                int IdSlecionado = Convert.ToInt32(gridVenda.SelectedValue.ToString());
                

                ITEM_VENDA i = conexao.ITEM_VENDA.FirstOrDefault(
                    linha => linha.ID.ToString().Equals(IdSlecionado.ToString())

                    );
                
                txtSubtotal.Text = i.VAL_UNITARIO.ToString();
                txtCodigo.Text = i.COD_PRODUTO.ToString();
                txtVal_Unit.Text = i.PRODUTO.VALOR.ToString();
                txtQtd.Text = i.QUANTIDADE.ToString();
            }
        }

        protected void btnFinalizar_Click(object sender, EventArgs e)
        {
            using (coronelEntities conexao = new coronelEntities())
            {
                //Lista os registros do banco de dados
                ITEM_VENDA i =
                 conexao.ITEM_VENDA.FirstOrDefault(
                    linha => linha.COD_VENDA.Equals(cod)
                    );

                if (i != null)
                {
                    
                    // grava a venda no banco
                    gravarVenda();
                    Session["valor"] = totalVenda;
                    totalVenda = 0;
                    cod = 0;
                    GerarCodVenda();
                    LimparControles(this.Page.Form.Controls);
                    Response.Redirect("Pagamento.aspx");
                }
                else
                {
                    lblMsg.Text = "Registre um item na venda.";

                }

            }

            
        }

        protected void btnExcluirVen_Click(object sender, EventArgs e)
        {
            // exclusão de item
            if (gridVenda.SelectedIndex.Equals(-1))
            {
                lblMsg.Text = "Selecione um item para excluir!";
            }
            else
            {
                using (coronelEntities conexao = new coronelEntities())
                {

                    int IdSlecionado = Convert.ToInt32(gridVenda.SelectedValue.ToString());

                    ITEM_VENDA i =
                        conexao.ITEM_VENDA.FirstOrDefault(
                            linha => linha.ID.ToString().Equals(IdSlecionado.ToString())
                            );

                    conexao.ITEM_VENDA.Remove(i);
                    conexao.SaveChanges();

                    if (gridVenda.SelectedValue != null)
                    {
                        //recalcula o valor da compra apos a exclusão de item
                        if (Convert.ToDecimal(txtSubtotal.Text) > totalVenda)
                        {
                            totalVenda = (Convert.ToDecimal(txtSubtotal.Text) - totalVenda) * -1;
                            txtTotal.Text = totalVenda.ToString();
                        }
                        else
                        {
                            totalVenda = (totalVenda - Convert.ToDecimal(txtSubtotal.Text));
                            txtTotal.Text = totalVenda.ToString();
                        }

                    }
                    atualizarGrid();
                    gridVenda.SelectedIndex = -1;
                }
            }
            

        }

        
    }
}
