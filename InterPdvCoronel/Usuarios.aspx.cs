using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InterPdvCoronel
{
    public partial class Usuarios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["LOGIN"] != null)// Verifica se há acesso de usuário
                {
                    atualizarGrid();
                }
                else
                {
                    Response.Redirect("Default.aspx");
                }
               
            }

        }

        private void atualizarGrid()
        {
            using(coronelEntities conexao = new coronelEntities())
            {
                //Lista os registros do banco de dados
                var lista = conexao.USUARIO.OrderBy(linha => linha.NOME).ToList();
                gridUsuario.DataSource = lista;
                gridUsuario.DataBind();
                    
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

        protected void btnSalvar_Click(object sender, EventArgs e)
        {
            using(coronelEntities conexao = new coronelEntities())
            {
                USUARIO user = // verifica se há cpf ou login já cadastrado
                conexao.USUARIO.FirstOrDefault(
                    linha => linha.LOGIN.Equals(txtLogin.Text) ||
                             linha.CPF.Equals(txtCpf.Text)
                    );

                if (txtNome.Text != null || txtSobrenome.Text != null || txtCpf.Text != null ||
                    txtLogin.Text != null || txtSenhaCad.Text != null)
                {
                    lblMsg.Text = string.Empty;
                    //Verifica se esstá inserindo ou atualizando
                    if (gridUsuario.SelectedValue != null)
                    {//atualizando

                        USUARIO u = conexao.USUARIO.FirstOrDefault(
                            linha => linha.CODIGO.ToString().Equals(gridUsuario.SelectedValue.ToString())
                            );

                        u.NOME = txtNome.Text;
                        u.SOBRENOME = txtSobrenome.Text;
                        u.CPF = txtCpf.Text;
                        u.LOGIN = txtLogin.Text;
                        u.SENHA = txtSenhaCad.Text;
                        u.NIVEL = Convert.ToInt32(drpNivel.SelectedValue);
                        u.STATUS = drpStatus.SelectedValue;
                        conexao.Entry(u);
                        atualizarGrid();
                        gridUsuario.SelectedIndex = -1;
                    }
                    else
                    {
                        if (user != null)
                        {
                            // cpf ou login já cadastrado
                            lblMsg.Text = " Usuário ou login já cadastrado!";
                            return;
                        }
                        else
                        {
                            // adcionando

                            USUARIO u = new USUARIO();
                            u.NOME = txtNome.Text;
                            u.SOBRENOME = txtSobrenome.Text;
                            u.CPF = txtCpf.Text;
                            u.LOGIN = txtLogin.Text;
                            u.SENHA = txtSenhaCad.Text;
                            u.NIVEL = Convert.ToInt32(drpNivel.SelectedValue);
                            u.STATUS = drpStatus.SelectedValue;
                            conexao.USUARIO.Add(u);
                            gridUsuario.SelectedIndex = -1;
                        }

                    }
                    conexao.SaveChanges();
                    atualizarGrid();
                    LimparControles(this.Page.Form.Controls);
                }
                else
                {
                    lblMsg.Text = "Preencha o formulário";
                }
                
            }
        }

        protected void gridUsuario_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblMsg.Text = string.Empty;
            using (coronelEntities conexao  = new coronelEntities())
            {
                int IdSlecionado = Convert.ToInt32(gridUsuario.SelectedValue.ToString());

                USUARIO u = conexao.USUARIO.FirstOrDefault(
                    linha =>  linha.CODIGO.ToString().Equals(IdSlecionado.ToString())
                    
                    );

                txtNome.Text = u.NOME;
                txtSobrenome.Text = u.SOBRENOME;
                txtCpf.Text = u.CPF;
                txtLogin.Text = u.LOGIN;
                txtSenhaCad.Text = u.SENHA;
                drpNivel.SelectedValue = u.NIVEL.ToString();
                drpStatus.SelectedValue = u.STATUS;

            }
        }

        protected void btnNovo_Click(object sender, EventArgs e)
        {
            lblMsg.Text = string.Empty;
            gridUsuario.SelectedIndex = -1;
            LimparControles(this.Page.Form.Controls);

        }

        protected void btnExcluir_Click(object sender, EventArgs e)
        {
            if (gridUsuario.SelectedIndex.Equals(-1))
            {
                lblMsg.Text = "Selecione um cadastro para excluir.";
            }
            else
            {
                lblMsg.Text = string.Empty;
                using (coronelEntities conexao = new coronelEntities())
                {
                    int IdSlecionado = Convert.ToInt32(gridUsuario.SelectedValue.ToString());

                    USUARIO u = conexao.USUARIO.FirstOrDefault(
                        linha => linha.CODIGO.ToString().Equals(IdSlecionado.ToString())
                        );

                    conexao.USUARIO.Remove(u);
                    gridUsuario.SelectedIndex = -1;
                    conexao.SaveChanges();
                    atualizarGrid();
                    LimparControles(this.Page.Form.Controls);

                }
            }
           

        }

       
    }
}
