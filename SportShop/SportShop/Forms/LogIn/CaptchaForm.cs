using SportShop.Classes;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace SportShop.Forms.LogIn
{
    public partial class CaptchaForm : Form
    {
        string CaptchaWord;

        public CaptchaForm()
        {
            InitializeComponent();
        }

        private void CaptchaForm_Load(object sender, EventArgs e)
        {
            CaptchaRefresh();
        }

        private void CaptchaRefresh()
        {
            CaptchaWord = "";
            Random random = new Random();
            string symb = "qwertyuiopasdfghjklzxcvbnm1234567890QWERTYUIOPASDFGHJKLZXCVBNM";
            for (int i = 0; i < 4; ++i)
                CaptchaWord += symb[random.Next(symb.Length)];
            var img = new Bitmap(this.CptchImg.Width, this.CptchImg.Height);
            var font = new Font("Viner Hand ITC", 50, FontStyle.Italic, GraphicsUnit.Pixel);
            var graphics = Graphics.FromImage(img);
            graphics.Clear(Color.White);
            graphics.DrawString(CaptchaWord.ToString(), font, Brushes.DarkGray, new Point(120, 35));
            graphics.DrawLine(Pens.Blue, new Point(0, 205), new Point(252, 0));
            graphics.DrawLine(Pens.Red, new Point(0, 445), new Point(255, 0));
            graphics.DrawLine(Pens.Green, new Point(450, 1000), new Point(150, 0));
            CptchImg.Image = img;
        }

        private void CapthaCheking()
        {
            if (CaptchaTB.Text == CaptchaWord.ToString())
            {
                MessageBox.Show($"Каптча введена верно!");
                CapthcaClass.CaptchaCheck = 1;
                this.Close();
            }
            else
            {
                MessageBox.Show($"Каптча введена не верно!");
                CapthcaClass.CaptchaCheck = 0;
                this.Close();
            }
        }

        private void bEnter_Click(object sender, EventArgs e)
        {
            CapthaCheking();
        }

        private void bRefresh_Click(object sender, EventArgs e)
        {
            CaptchaRefresh();
        }

        private void CaptchaForm_FormClosed(object sender, FormClosedEventArgs e)
        {
            //CapthaCheking();
        }
    }
}
