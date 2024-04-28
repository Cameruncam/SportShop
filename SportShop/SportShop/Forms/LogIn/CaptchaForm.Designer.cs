
namespace SportShop.Forms.LogIn
{
    partial class CaptchaForm
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.panel1 = new System.Windows.Forms.Panel();
            this.Titlelbl = new System.Windows.Forms.Label();
            this.bRefresh = new System.Windows.Forms.Button();
            this.bEnter = new System.Windows.Forms.Button();
            this.CaptchaTB = new System.Windows.Forms.TextBox();
            this.CptchImg = new System.Windows.Forms.PictureBox();
            this.panel1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.CptchImg)).BeginInit();
            this.SuspendLayout();
            // 
            // panel1
            // 
            this.panel1.Controls.Add(this.Titlelbl);
            this.panel1.Location = new System.Drawing.Point(13, 13);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(349, 44);
            this.panel1.TabIndex = 9;
            // 
            // Titlelbl
            // 
            this.Titlelbl.AutoSize = true;
            this.Titlelbl.Font = new System.Drawing.Font("Microsoft Sans Serif", 15.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.Titlelbl.Location = new System.Drawing.Point(134, 12);
            this.Titlelbl.Name = "Titlelbl";
            this.Titlelbl.Size = new System.Drawing.Size(83, 25);
            this.Titlelbl.TabIndex = 0;
            this.Titlelbl.Text = "Каптча";
            // 
            // bRefresh
            // 
            this.bRefresh.Location = new System.Drawing.Point(86, 306);
            this.bRefresh.Name = "bRefresh";
            this.bRefresh.Size = new System.Drawing.Size(202, 31);
            this.bRefresh.TabIndex = 8;
            this.bRefresh.Text = "Обновить";
            this.bRefresh.UseVisualStyleBackColor = true;
            this.bRefresh.Click += new System.EventHandler(this.bRefresh_Click);
            // 
            // bEnter
            // 
            this.bEnter.Location = new System.Drawing.Point(86, 269);
            this.bEnter.Name = "bEnter";
            this.bEnter.Size = new System.Drawing.Size(202, 31);
            this.bEnter.TabIndex = 7;
            this.bEnter.Text = "Подтвердить";
            this.bEnter.UseVisualStyleBackColor = true;
            this.bEnter.Click += new System.EventHandler(this.bEnter_Click);
            // 
            // CaptchaTB
            // 
            this.CaptchaTB.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.CaptchaTB.Location = new System.Drawing.Point(86, 237);
            this.CaptchaTB.MaxLength = 10;
            this.CaptchaTB.Name = "CaptchaTB";
            this.CaptchaTB.Size = new System.Drawing.Size(202, 26);
            this.CaptchaTB.TabIndex = 6;
            // 
            // CptchImg
            // 
            this.CptchImg.Location = new System.Drawing.Point(13, 63);
            this.CptchImg.Name = "CptchImg";
            this.CptchImg.Size = new System.Drawing.Size(349, 159);
            this.CptchImg.SizeMode = System.Windows.Forms.PictureBoxSizeMode.Zoom;
            this.CptchImg.TabIndex = 10;
            this.CptchImg.TabStop = false;
            // 
            // CaptchaForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(374, 365);
            this.Controls.Add(this.panel1);
            this.Controls.Add(this.bRefresh);
            this.Controls.Add(this.bEnter);
            this.Controls.Add(this.CaptchaTB);
            this.Controls.Add(this.CptchImg);
            this.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None;
            this.MaximizeBox = false;
            this.Name = "CaptchaForm";
            this.ShowIcon = false;
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Каптча";
            this.FormClosed += new System.Windows.Forms.FormClosedEventHandler(this.CaptchaForm_FormClosed);
            this.Load += new System.EventHandler(this.CaptchaForm_Load);
            this.panel1.ResumeLayout(false);
            this.panel1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.CptchImg)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Label Titlelbl;
        private System.Windows.Forms.Button bRefresh;
        private System.Windows.Forms.Button bEnter;
        private System.Windows.Forms.TextBox CaptchaTB;
        private System.Windows.Forms.PictureBox CptchImg;
    }
}