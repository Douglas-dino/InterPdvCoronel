using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace InterPdvCoronel
{
    public partial class Pagamento : System.Web.UI.Page
    {
        static int cod;
        public static string caminho = System.Environment.CurrentDirectory;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["LOGIN"] != null)// Verifica se há acesso de usuário
                {
                    BuscarValoreCodigo();
                }
                else
                {
                    Response.Redirect("Default.aspx");
                }
            }
            

            
        }
        private void BuscarValoreCodigo()
        {
            using (coronelEntities conexao = new coronelEntities()) 
            {
                //Busca o ultimo código de venda
                VENDA venda =
                    conexao.VENDA.OrderBy(
                        linha => linha.CODIGO).OrderByDescending(n => n.CODIGO).Take(1).Single();
               

                if (venda != null)
                {
                    cod = (venda.CODIGO);
                    
                    lblCodVenda.Text = "Codigo Venda:" + cod.ToString();
                    txtValor.Text = Session["valor"].ToString();
                }
                else
                {
                    lblMsg.Text = "erro";
                }

            }
            

        }


        protected void btnInserir_Click(object sender, EventArgs e)
        {
            if(txtValPago.Text != null || drpTipoPg.SelectedValue != null)
            {
                if (Convert.ToDecimal(txtTroco.Text) > 0 && drpTipoPg.SelectedIndex.Equals(0) ||
                   Convert.ToDecimal(txtTroco.Text) > 0 && drpTipoPg.SelectedIndex.Equals(1) ||
                   Convert.ToDecimal(txtTroco.Text) > 0 && drpTipoPg.SelectedIndex.Equals(3))
                {
                    lblMsg.Text = "Selecione o tipo de pagamento e recalcule.";
                }
                else
                {
                    using (coronelEntities conexao = new coronelEntities())
                    {

                        PAGAMENTO p = new PAGAMENTO();

                        p.COD_VENDA = cod;
                        p.TIPO_PG = drpTipoPg.SelectedValue;
                        p.TOTAL = Convert.ToDecimal(txtValPago.Text);
                        p.TROCO = Convert.ToDecimal(txtTroco.Text);
                        conexao.PAGAMENTO.Add(p);
                        conexao.SaveChanges();
                        Response.Redirect("Venda.aspx");


                    }
                }
                
            }
            else
            {
                lblMsg.Text = " Preencha o valor pago e selecione o tipo de pagamento.";
            }
            
        }


        protected void btnCalcular_Click(object sender, EventArgs e)
        {

            if(txtValPago.Text != null)
            {
               txtTroco.Text = (Convert.ToDecimal(txtValPago.Text) - Convert.ToDecimal(Session["valor"])).ToString();

                if (Convert.ToDecimal(txtTroco.Text) > 0 && drpTipoPg.SelectedIndex.Equals(0) ||
                    Convert.ToDecimal(txtTroco.Text) > 0 && drpTipoPg.SelectedIndex.Equals(1) ||
                    Convert.ToDecimal(txtTroco.Text) > 0 && drpTipoPg.SelectedIndex.Equals(3))
                {
                    lblMsg.Text = "Selecione o tipo de pagamento e recalcule.";
                }
                
                else
                {
                    lblMsg.Text = string.Empty;
                }

            }
            else
            {
                lblMsg.Text = "Preencha a o valor pago";
            }
            
        }
    }
}