using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace InterPdvCoronel
{
    public partial class Relatorio : System.Web.UI.Page
    { 
        protected void Page_Load(object sender, EventArgs e)
        {
          if (Session["LOGIN"] == null)// Verifica se há acesso de usuário
          {
              Response.Redirect("Default.aspx");
          }
         

        }

        protected void atualizarGrid()
        {
            DataTable dt = new DataTable();
            SqlConnection conexao = new SqlConnection("Data Source = JOKER;Initial Catalog=CORONEL;Integrated Security=True");
            SqlDataAdapter da = new SqlDataAdapter(@"
                         SELECT 
	                        VENDA.CODIGO AS ID_VENDA,
                            CONVERT(VARCHAR, VENDA.DATA, 104) AS DATA,
	                        VENDA.HORA AS HORA, 
	                        VENDA.VALOR AS VAL_COMPRA,
                            PAGAMENTO.TIPO_PG,
                            PAGAMENTO.TOTAL AS PAGAMENTO,
	                        PAGAMENTO.TROCO

                        FROM 
	                        VENDA
	                   
                        INNER JOIN 
		                    PAGAMENTO ON PAGAMENTO.COD_VENDA = VENDA.CODIGO
                        WHERE VENDA.DATA = '" + cadRelatorio1.SelectedDate + "' ", conexao);
            
            da.Fill(dt);
            try
            {
                if (conexao.State == ConnectionState.Closed)
                {
                    conexao.Open();
                    if(dt.Rows.Count.Equals(0))
                    {
                        lblMsg.Text = "Data não selecionada ou Registro não encontrado!";
                        LimparControles(this.Page.Form.Controls);

                    }
                    else
                    {
                        decimal ValorEntrada = 0;
                        decimal ValorSaida = 0;

                        gridRelatorio.DataSource = dt;
                        gridRelatorio.DataBind();
                        
                        for(int i = 0; i < dt.Rows.Count; i++)
                        {
                            drpItems.Items.Add( dt.Rows[i].ItemArray[0].ToString());

                            
                        }

                        

                        foreach (GridViewRow row in gridRelatorio.Rows)
                        {

                            if (row.RowType != DataControlRowType.Header && row.RowType != DataControlRowType.Footer)
                            {
                                if (row.Cells[5].Text != null && row.Cells[5].Text != string.Empty  )
                                {
                                    ValorEntrada += Convert.ToDecimal(row.Cells[5].Text);
                                    txtEntrada.Text = ValorEntrada.ToString();
                                }
                                if(row.Cells[6].Text != null && row.Cells[6].Text != string.Empty)
                                {
                                    ValorSaida += Convert.ToDecimal(row.Cells[6].Text);
                                    txtSaida.Text = ValorSaida.ToString();
                                }
                            }
                        }
                        
                        txtCaixa.Text = (ValorEntrada - ValorSaida).ToString(); 
                        lblMsg.Text = string.Empty;


                    }

                }


                
            }
            catch (Exception )
            {
                lblMsg.Text = "Erro! ";
            }
            finally
            {
                if (conexao.State == ConnectionState.Open)
                {
                    conexao.Close();
                }

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
               


            }
            drpItems.Items.Clear();
            gridRelatorio.DataSource = null;
            gridRelatorio.DataBind();
            gridItens.DataSource = null;
            gridItens.DataBind();
            
        }

        protected void btnConsultar_Click(object sender, EventArgs e)
        {
                atualizarGrid();
                
        }

        protected void btnLimpar_Click(object sender, EventArgs e)
        {
            LimparControles(this.Page.Form.Controls);
        }

        protected void cadRelatorio1_SelectionChanged1(object sender, EventArgs e)
        {
            LimparControles(this.Page.Form.Controls);
        }

        protected void btnProcurar_Click(object sender, EventArgs e)
        {
            using (coronelEntities conexao = new coronelEntities())
            {
                if(drpItems.SelectedIndex.Equals(-1))
                {
                    lblMsg.Text = "Consulte as vendas.";
                   
                }
                else
                {
                    var lista = conexao.ITEM_VENDA.ToList().Where(
                  linha => linha.COD_VENDA.Equals(Convert.ToInt32(drpItems.SelectedValue)));
                    gridItens.DataSource = lista;
                    gridItens.DataBind();
                }

            }

        }
    }
}