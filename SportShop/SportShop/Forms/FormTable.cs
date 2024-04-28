using SportShop.Classes;
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
using System.IO;

namespace SportShop
{
    public partial class FormTable : Form
    {
        static string connect = ClassCnct.connection;
        SqlConnection sqlConnect = new SqlConnection(connect);
        int RowsCount1;
        decimal price;
        static public DataTable BasketTable = new DataTable();
        decimal discount;
        string photoPath;
        string projectDirectory = Directory.GetParent(Environment.CurrentDirectory).Parent.FullName;
        int Ee;
        public FormTable()
        {
            InitializeComponent();
        }

        private void FormTable_Load(object sender, EventArgs e)
        {
            ImportTable();
            FIOlbl.Text = UsrClass.UsrFIO;
            RowsCount1 = ProductDG.RowCount;
            CountLbl.Text = Convert.ToString(ProductDG.RowCount) + "/" + RowsCount1;
            BasketB.Visible = false;
            if(UsrClass.UsrRole != 1)
            {
                DelB.Visible = false;
            }
            BasketTable.Columns.Add("Артикль");
            BasketTable.Columns.Add("Название");
            BasketTable.Columns.Add("Цена");
            BasketTable.Columns.Add("Производитель");
            BasketTable.Columns.Add("Скидка");
            BasketTable.Columns.Add("Описание");
            BasketTable.Columns.Add("Фото");
            BasketTable.Columns.Add("Количество");
        }

        private void ImportTable()
        {
            try
            {
                sqlConnect.Open();
                SqlCommand FillTable = new SqlCommand();
                FillTable.CommandText = "SELECT * FROM ProductsV";
                FillTable.Connection = sqlConnect;
                SqlDataAdapter adapter = new SqlDataAdapter(FillTable);
                DataSet dataSet = new DataSet();
                adapter.Fill(dataSet);
                ProductDG.DataSource = dataSet.Tables[0];
                sqlConnect.Close();
                ProductDG.Columns[11].Visible = false;
            }
            catch
            {
                MessageBox.Show("Не удалось заполнить таблицу");
            }
        }

        private void FormTable_FormClosed(object sender, FormClosedEventArgs e)
        {
            BasketTable.Reset();
            FormLogin lgn = new FormLogin();
            lgn.Show();
        }

        private void ProductDG_CellEnter(object sender, DataGridViewCellEventArgs e)
        {
            Ee = e.RowIndex;
            if (BasketTable.Rows.Count != 0)
            {
                BasketB.Visible = true;
            }
            //Звпоминание артикля
            if (ProductDG.Rows[e.RowIndex].Cells[0].Value != DBNull.Value)
            {
                SlctClass.slctProduct = Convert.ToString(ProductDG.Rows[e.RowIndex].Cells[0].Value);
            }
            //Вставка изображения или заглушки
            if (ProductDG.Rows[e.RowIndex].Cells[11].Value != DBNull.Value)
            {
                photoPath = Path.Combine(projectDirectory, $"Images\\ProductPic\\{Convert.ToString(ProductDG.Rows[e.RowIndex].Cells[11].Value)}");
                ProductImage.Image = Image.FromFile(photoPath);
            }
            else
            {
                photoPath = Path.Combine(projectDirectory, $"Images\\Ico_and_Logo\\picture.png");
                ProductImage.Image = Image.FromFile(photoPath);
            }
            //Заполнение данных о товаре
            if (Convert.ToDecimal(ProductDG.Rows[e.RowIndex].Cells[9].Value) != 0)
            {
                price = Convert.ToDecimal(ProductDG.Rows[e.RowIndex].Cells[4].Value);
                discount = Convert.ToDecimal(ProductDG.Rows[e.RowIndex].Cells[9].Value);
                price = price - (price * (discount / 100));
                CostLbl.Text = "Цена: " + Convert.ToString(Math.Round(Convert.ToDecimal(ProductDG.Rows[e.RowIndex].Cells[4].Value), 2)) + " Итог: " + Convert.ToString(Math.Round(price, 2));
            }
            else
            {
                CostLbl.Text = "Цена: " + Convert.ToString(ProductDG.Rows[e.RowIndex].Cells[4].Value);
            }
            NameLbl.Text = "Название: " + Convert.ToString(ProductDG.Rows[e.RowIndex].Cells[1].Value);
            DescLbl.Text = "Описание: " + Convert.ToString(ProductDG.Rows[e.RowIndex].Cells[2].Value);
            ManafLbl.Text = "Производитель: " + Convert.ToString(ProductDG.Rows[e.RowIndex].Cells[6].Value);
            DiscLbl.Text = Convert.ToString(ProductDG.Rows[e.RowIndex].Cells[10].Value);
        }

        private void BackB_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void DelB_Click(object sender, EventArgs e)
        {
            sqlConnect.Open();
            SqlCommand Delete = new SqlCommand();
            Delete.Connection = sqlConnect;
            Delete.CommandType = CommandType.StoredProcedure;
            Delete.CommandText = "DELETE_Product";
            Delete.Parameters.AddWithValue("@ProductAticle", SlctClass.slctProduct);
            try
            {
                Delete.ExecuteNonQuery();
                MessageBox.Show("Товар удален");
                sqlConnect.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Ошибка! : " + ex.Message);
                sqlConnect.Close();
            }
        }

        private void добавитьВКорзинуToolStripMenuItem_Click(object sender, EventArgs e)
        {
            BasketTable.Rows.Add(new object[] { SlctClass.slctProduct, ProductDG.Rows[Ee].Cells[1].Value, ProductDG.Rows[Ee].Cells[4].Value, ProductDG.Rows[Ee].Cells[6].Value, ProductDG.Rows[Ee].Cells[9].Value, ProductDG.Rows[Ee].Cells[2].Value, ProductDG.Rows[Ee].Cells[11].Value, 1 });
        }

        private void BasketB_Click(object sender, EventArgs e)
        {

        }
    }
}
