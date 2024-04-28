
namespace SportShop.Forms
{
    partial class BaskForm
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(BaskForm));
            this.ProductDG = new System.Windows.Forms.DataGridView();
            this.panel2 = new System.Windows.Forms.Panel();
            this.DiscLbl = new System.Windows.Forms.Label();
            this.PanelInfo = new System.Windows.Forms.Panel();
            this.CostLbl = new System.Windows.Forms.Label();
            this.ManafLbl = new System.Windows.Forms.Label();
            this.DescLbl = new System.Windows.Forms.Label();
            this.NameLbl = new System.Windows.Forms.Label();
            this.panel1 = new System.Windows.Forms.Panel();
            this.FIOlbl = new System.Windows.Forms.Label();
            this.CountLbl = new System.Windows.Forms.Label();
            this.ProductImage = new System.Windows.Forms.PictureBox();
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            ((System.ComponentModel.ISupportInitialize)(this.ProductDG)).BeginInit();
            this.panel2.SuspendLayout();
            this.PanelInfo.SuspendLayout();
            this.panel1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.ProductImage)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
            this.SuspendLayout();
            // 
            // ProductDG
            // 
            this.ProductDG.AllowUserToAddRows = false;
            this.ProductDG.AllowUserToDeleteRows = false;
            this.ProductDG.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.ProductDG.BackgroundColor = System.Drawing.Color.White;
            this.ProductDG.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.ProductDG.Dock = System.Windows.Forms.DockStyle.Fill;
            this.ProductDG.Location = new System.Drawing.Point(0, 70);
            this.ProductDG.Name = "ProductDG";
            this.ProductDG.ReadOnly = true;
            this.ProductDG.RowHeadersWidthSizeMode = System.Windows.Forms.DataGridViewRowHeadersWidthSizeMode.AutoSizeToAllHeaders;
            this.ProductDG.Size = new System.Drawing.Size(800, 228);
            this.ProductDG.TabIndex = 7;
            // 
            // panel2
            // 
            this.panel2.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(118)))), ((int)(((byte)(227)))), ((int)(((byte)(131)))));
            this.panel2.Controls.Add(this.DiscLbl);
            this.panel2.Controls.Add(this.PanelInfo);
            this.panel2.Controls.Add(this.ProductImage);
            this.panel2.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.panel2.Location = new System.Drawing.Point(0, 298);
            this.panel2.Name = "panel2";
            this.panel2.Size = new System.Drawing.Size(800, 152);
            this.panel2.TabIndex = 6;
            // 
            // DiscLbl
            // 
            this.DiscLbl.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.DiscLbl.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(73)))), ((int)(((byte)(140)))), ((int)(((byte)(81)))));
            this.DiscLbl.ForeColor = System.Drawing.Color.White;
            this.DiscLbl.Location = new System.Drawing.Point(680, 14);
            this.DiscLbl.Name = "DiscLbl";
            this.DiscLbl.Size = new System.Drawing.Size(108, 129);
            this.DiscLbl.TabIndex = 2;
            this.DiscLbl.Text = "2121";
            this.DiscLbl.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // PanelInfo
            // 
            this.PanelInfo.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.PanelInfo.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(73)))), ((int)(((byte)(140)))), ((int)(((byte)(81)))));
            this.PanelInfo.Controls.Add(this.CostLbl);
            this.PanelInfo.Controls.Add(this.ManafLbl);
            this.PanelInfo.Controls.Add(this.DescLbl);
            this.PanelInfo.Controls.Add(this.NameLbl);
            this.PanelInfo.Location = new System.Drawing.Point(133, 14);
            this.PanelInfo.Name = "PanelInfo";
            this.PanelInfo.Size = new System.Drawing.Size(541, 129);
            this.PanelInfo.TabIndex = 4;
            // 
            // CostLbl
            // 
            this.CostLbl.AutoSize = true;
            this.CostLbl.ForeColor = System.Drawing.Color.White;
            this.CostLbl.Location = new System.Drawing.Point(19, 107);
            this.CostLbl.Name = "CostLbl";
            this.CostLbl.Size = new System.Drawing.Size(35, 13);
            this.CostLbl.TabIndex = 3;
            this.CostLbl.Text = "label5";
            // 
            // ManafLbl
            // 
            this.ManafLbl.AutoSize = true;
            this.ManafLbl.ForeColor = System.Drawing.Color.White;
            this.ManafLbl.Location = new System.Drawing.Point(19, 76);
            this.ManafLbl.Name = "ManafLbl";
            this.ManafLbl.Size = new System.Drawing.Size(35, 13);
            this.ManafLbl.TabIndex = 2;
            this.ManafLbl.Text = "label4";
            // 
            // DescLbl
            // 
            this.DescLbl.AutoSize = true;
            this.DescLbl.ForeColor = System.Drawing.Color.White;
            this.DescLbl.Location = new System.Drawing.Point(19, 44);
            this.DescLbl.Name = "DescLbl";
            this.DescLbl.Size = new System.Drawing.Size(35, 13);
            this.DescLbl.TabIndex = 1;
            this.DescLbl.Text = "label3";
            // 
            // NameLbl
            // 
            this.NameLbl.AutoSize = true;
            this.NameLbl.ForeColor = System.Drawing.Color.White;
            this.NameLbl.Location = new System.Drawing.Point(19, 13);
            this.NameLbl.Name = "NameLbl";
            this.NameLbl.Size = new System.Drawing.Size(35, 13);
            this.NameLbl.TabIndex = 0;
            this.NameLbl.Text = "label2";
            // 
            // panel1
            // 
            this.panel1.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(118)))), ((int)(((byte)(227)))), ((int)(((byte)(131)))));
            this.panel1.Controls.Add(this.FIOlbl);
            this.panel1.Controls.Add(this.CountLbl);
            this.panel1.Controls.Add(this.pictureBox1);
            this.panel1.Dock = System.Windows.Forms.DockStyle.Top;
            this.panel1.Location = new System.Drawing.Point(0, 0);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(800, 70);
            this.panel1.TabIndex = 5;
            // 
            // FIOlbl
            // 
            this.FIOlbl.Location = new System.Drawing.Point(602, 4);
            this.FIOlbl.Name = "FIOlbl";
            this.FIOlbl.Size = new System.Drawing.Size(198, 22);
            this.FIOlbl.TabIndex = 3;
            this.FIOlbl.Text = "Иванов Иван Иванович";
            this.FIOlbl.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            // 
            // CountLbl
            // 
            this.CountLbl.AutoSize = true;
            this.CountLbl.Location = new System.Drawing.Point(4, 56);
            this.CountLbl.Name = "CountLbl";
            this.CountLbl.Size = new System.Drawing.Size(0, 13);
            this.CountLbl.TabIndex = 2;
            // 
            // ProductImage
            // 
            this.ProductImage.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.ProductImage.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(73)))), ((int)(((byte)(140)))), ((int)(((byte)(81)))));
            this.ProductImage.ErrorImage = ((System.Drawing.Image)(resources.GetObject("ProductImage.ErrorImage")));
            this.ProductImage.InitialImage = ((System.Drawing.Image)(resources.GetObject("ProductImage.InitialImage")));
            this.ProductImage.Location = new System.Drawing.Point(12, 14);
            this.ProductImage.Name = "ProductImage";
            this.ProductImage.Size = new System.Drawing.Size(115, 129);
            this.ProductImage.SizeMode = System.Windows.Forms.PictureBoxSizeMode.Zoom;
            this.ProductImage.TabIndex = 3;
            this.ProductImage.TabStop = false;
            // 
            // pictureBox1
            // 
            this.pictureBox1.Image = global::SportShop.Properties.Resources.logo;
            this.pictureBox1.Location = new System.Drawing.Point(3, 20);
            this.pictureBox1.Name = "pictureBox1";
            this.pictureBox1.Size = new System.Drawing.Size(36, 33);
            this.pictureBox1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.Zoom;
            this.pictureBox1.TabIndex = 0;
            this.pictureBox1.TabStop = false;
            // 
            // BaskForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.ProductDG);
            this.Controls.Add(this.panel2);
            this.Controls.Add(this.panel1);
            this.Name = "BaskForm";
            this.Text = "BaskForm";
            ((System.ComponentModel.ISupportInitialize)(this.ProductDG)).EndInit();
            this.panel2.ResumeLayout(false);
            this.PanelInfo.ResumeLayout(false);
            this.PanelInfo.PerformLayout();
            this.panel1.ResumeLayout(false);
            this.panel1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.ProductImage)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.DataGridView ProductDG;
        private System.Windows.Forms.Panel panel2;
        private System.Windows.Forms.Label DiscLbl;
        private System.Windows.Forms.Panel PanelInfo;
        private System.Windows.Forms.Label CostLbl;
        private System.Windows.Forms.Label ManafLbl;
        private System.Windows.Forms.Label DescLbl;
        private System.Windows.Forms.Label NameLbl;
        private System.Windows.Forms.PictureBox ProductImage;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Label FIOlbl;
        private System.Windows.Forms.Label CountLbl;
        private System.Windows.Forms.PictureBox pictureBox1;
    }
}