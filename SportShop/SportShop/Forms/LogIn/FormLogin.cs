using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Microsoft.SqlServer.Server;
using SportShop.Classes;
using SportShop.Forms.LogIn;

namespace SportShop
{
    public partial class FormLogin : Form
    {
        static string connect = ClassCnct.connection;
        SqlConnection sqlConnect = new SqlConnection(connect);
        int сountEnter = 3;
        int sec = 10;

        public CaptchaForm CaptchaForm { get; private set; }

        public FormLogin()
        {
            InitializeComponent();
            PasswordTB.Text = SportShop.Properties.Settings.Default.PasswordRmb;
            LogInTB.Text = SportShop.Properties.Settings.Default.LoginRmb;
        }

        private void LoginB_Click(object sender, EventArgs e)
        {
            RemebrMe();
            LogIn();
        }

        private void GuestB_Click(object sender, EventArgs e)
        {
            FormTable table = new FormTable();
            UsrClass.UsrFIO = "Гость";
            UsrClass.UsrRole = 0;
            table.Show();
            Hide();
        }

        private void ShowPassCB_CheckedChanged(object sender, EventArgs e)
        {
            if (ShowPassCB.Checked == true)
            {
                PasswordTB.UseSystemPasswordChar = false;
            }
            else
            {
                PasswordTB.UseSystemPasswordChar = true;
            }
        }

        private void RemebrMe()
        {
            if (RemembCB.Checked == true)
            {
                SportShop.Properties.Settings.Default.PasswordRmb = PasswordTB.Text;
                SportShop.Properties.Settings.Default.Save();

                SportShop.Properties.Settings.Default.LoginRmb = LogInTB.Text;
                SportShop.Properties.Settings.Default.Save();
            }
            else
            {
                SportShop.Properties.Settings.Default.PasswordRmb = String.Empty;
                SportShop.Properties.Settings.Default.Save();

                SportShop.Properties.Settings.Default.LoginRmb = String.Empty;
                SportShop.Properties.Settings.Default.Save();
            }
        }
        private void LogIn()
        {
            if (PasswordTB.Text.Length > 0 && LogInTB.Text.Length > 0)
            {
                try
                {
                    sqlConnect.Open();
                    SqlCommand Login = new SqlCommand();
                    Login.CommandType = CommandType.StoredProcedure;
                    Login.CommandText = "Login";
                    Login.Parameters.AddWithValue("@login", LogInTB.Text);
                    Login.Parameters.AddWithValue("@password", PasswordTB.Text);
                    Login.Connection = sqlConnect;
                    SqlDataReader sqlReader = Login.ExecuteReader();
                    sqlReader.Read();
                    if (sqlReader.HasRows)
                    {
                        UsrClass.UsrLogIn = sqlReader.GetString(4);
                        UsrClass.UsrFIO = sqlReader.GetString(1) + " " + sqlReader.GetString(2) + " " + sqlReader.GetString(3);
                        UsrClass.UsrRole = sqlReader.GetInt32(6);
                        sqlConnect.Close();
                        FormTable table = new FormTable();
                        table.Show();
                        Hide();
                    }
                    else
                    {
                        sqlConnect.Close();
                        if (сountEnter != 1)
                        {
                            сountEnter--;
                            MessageBox.Show($"Неверный логин или пароль. Осталось попыток {сountEnter}");
                        }
                        else
                        {
                            CaptchaForm capcha = new CaptchaForm();
                            capcha.ShowDialog();
                            сountEnter = 3;
                        }
                    }
            }
                catch (Exception ex)
            {
                MessageBox.Show("Ошибка: " + ex.Message);
                sqlConnect.Close();
            }
        }
            else { MessageBox.Show("Все поля должны быть заполнены"); }
        }
        private void timer10sec_Tick(object sender, EventArgs e)
        {
            LogInTB.Enabled = true;
            PasswordTB.Enabled = true;
            LoginB.Enabled = true;
            GuestB.Enabled = true;
            LoginB.Text = "Войти";
            timer10sec.Enabled = false;
            timer1sec.Enabled = false;
            CapthcaClass.CaptchaCheck = 1;
            сountEnter = 3;
            sec = 10;
        }

        private void timer1sec_Tick(object sender, EventArgs e)
        {
            sec -= 1;
            LoginB.Text = $"({sec})";
        }

        private void LoginFrm_FormClosed(object sender, FormClosedEventArgs e)
        {
            Application.Exit();
        }

        private void FormLogin_Activated(object sender, EventArgs e)
        {
            if (CapthcaClass.CaptchaCheck == 0)
            {
                timer10sec.Enabled = true;
                timer1sec.Enabled = true;
                LogInTB.Enabled = false;
                PasswordTB.Enabled = false;
                LoginB.Enabled = false;
                GuestB.Enabled = false;
            }
        }
    }
}
