
namespace SportShop
{
    partial class FormLogin
    {
        /// <summary>
        /// Обязательная переменная конструктора.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Освободить все используемые ресурсы.
        /// </summary>
        /// <param name="disposing">истинно, если управляемый ресурс должен быть удален; иначе ложно.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Код, автоматически созданный конструктором форм Windows

        /// <summary>
        /// Требуемый метод для поддержки конструктора — не изменяйте 
        /// содержимое этого метода с помощью редактора кода.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(FormLogin));
            this.panel1 = new System.Windows.Forms.Panel();
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            this.panel2 = new System.Windows.Forms.Panel();
            this.RemembCB = new System.Windows.Forms.CheckBox();
            this.LoginB = new System.Windows.Forms.Button();
            this.GuestB = new System.Windows.Forms.Button();
            this.LogInTB = new System.Windows.Forms.TextBox();
            this.PasswordTB = new System.Windows.Forms.TextBox();
            this.LoginLbl = new System.Windows.Forms.Label();
            this.PassLbl = new System.Windows.Forms.Label();
            this.ShowPassCB = new System.Windows.Forms.CheckBox();
            this.timer1sec = new System.Windows.Forms.Timer(this.components);
            this.timer10sec = new System.Windows.Forms.Timer(this.components);
            this.panel1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
            this.panel2.SuspendLayout();
            this.SuspendLayout();
            // 
            // panel1
            // 
            this.panel1.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(118)))), ((int)(((byte)(227)))), ((int)(((byte)(131)))));
            this.panel1.Controls.Add(this.pictureBox1);
            this.panel1.Dock = System.Windows.Forms.DockStyle.Top;
            this.panel1.Location = new System.Drawing.Point(0, 0);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(274, 58);
            this.panel1.TabIndex = 0;
            // 
            // pictureBox1
            // 
            this.pictureBox1.Image = ((System.Drawing.Image)(resources.GetObject("pictureBox1.Image")));
            this.pictureBox1.Location = new System.Drawing.Point(13, 13);
            this.pictureBox1.Name = "pictureBox1";
            this.pictureBox1.Size = new System.Drawing.Size(36, 33);
            this.pictureBox1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.Zoom;
            this.pictureBox1.TabIndex = 0;
            this.pictureBox1.TabStop = false;
            // 
            // panel2
            // 
            this.panel2.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(118)))), ((int)(((byte)(227)))), ((int)(((byte)(131)))));
            this.panel2.Controls.Add(this.RemembCB);
            this.panel2.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.panel2.Location = new System.Drawing.Point(0, 279);
            this.panel2.Name = "panel2";
            this.panel2.Size = new System.Drawing.Size(274, 44);
            this.panel2.TabIndex = 1;
            // 
            // RemembCB
            // 
            this.RemembCB.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.RemembCB.AutoSize = true;
            this.RemembCB.Checked = true;
            this.RemembCB.CheckState = System.Windows.Forms.CheckState.Checked;
            this.RemembCB.Location = new System.Drawing.Point(82, 15);
            this.RemembCB.Name = "RemembCB";
            this.RemembCB.Size = new System.Drawing.Size(111, 17);
            this.RemembCB.TabIndex = 0;
            this.RemembCB.Text = "Запомнить меня";
            this.RemembCB.UseVisualStyleBackColor = true;
            // 
            // LoginB
            // 
            this.LoginB.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.LoginB.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(73)))), ((int)(((byte)(140)))), ((int)(((byte)(81)))));
            this.LoginB.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.LoginB.ForeColor = System.Drawing.Color.White;
            this.LoginB.Location = new System.Drawing.Point(82, 192);
            this.LoginB.Name = "LoginB";
            this.LoginB.Size = new System.Drawing.Size(117, 30);
            this.LoginB.TabIndex = 2;
            this.LoginB.Text = "Войти";
            this.LoginB.UseVisualStyleBackColor = false;
            this.LoginB.Click += new System.EventHandler(this.LoginB_Click);
            // 
            // GuestB
            // 
            this.GuestB.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Left)));
            this.GuestB.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(73)))), ((int)(((byte)(140)))), ((int)(((byte)(81)))));
            this.GuestB.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.GuestB.ForeColor = System.Drawing.Color.White;
            this.GuestB.Location = new System.Drawing.Point(82, 228);
            this.GuestB.Name = "GuestB";
            this.GuestB.Size = new System.Drawing.Size(117, 30);
            this.GuestB.TabIndex = 2;
            this.GuestB.Text = "Гость";
            this.GuestB.UseVisualStyleBackColor = false;
            this.GuestB.Click += new System.EventHandler(this.GuestB_Click);
            // 
            // LogInTB
            // 
            this.LogInTB.Location = new System.Drawing.Point(59, 89);
            this.LogInTB.Name = "LogInTB";
            this.LogInTB.Size = new System.Drawing.Size(156, 20);
            this.LogInTB.TabIndex = 3;
            // 
            // PasswordTB
            // 
            this.PasswordTB.Location = new System.Drawing.Point(59, 138);
            this.PasswordTB.Name = "PasswordTB";
            this.PasswordTB.Size = new System.Drawing.Size(156, 20);
            this.PasswordTB.TabIndex = 4;
            this.PasswordTB.UseSystemPasswordChar = true;
            // 
            // LoginLbl
            // 
            this.LoginLbl.AutoSize = true;
            this.LoginLbl.Location = new System.Drawing.Point(56, 73);
            this.LoginLbl.Name = "LoginLbl";
            this.LoginLbl.Size = new System.Drawing.Size(38, 13);
            this.LoginLbl.TabIndex = 5;
            this.LoginLbl.Text = "Логин";
            // 
            // PassLbl
            // 
            this.PassLbl.AutoSize = true;
            this.PassLbl.Location = new System.Drawing.Point(56, 122);
            this.PassLbl.Name = "PassLbl";
            this.PassLbl.Size = new System.Drawing.Size(45, 13);
            this.PassLbl.TabIndex = 6;
            this.PassLbl.Text = "Пароль";
            // 
            // ShowPassCB
            // 
            this.ShowPassCB.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.ShowPassCB.AutoSize = true;
            this.ShowPassCB.Location = new System.Drawing.Point(59, 164);
            this.ShowPassCB.Name = "ShowPassCB";
            this.ShowPassCB.Size = new System.Drawing.Size(114, 17);
            this.ShowPassCB.TabIndex = 0;
            this.ShowPassCB.Text = "Показать пароль";
            this.ShowPassCB.UseVisualStyleBackColor = true;
            this.ShowPassCB.CheckedChanged += new System.EventHandler(this.ShowPassCB_CheckedChanged);
            // 
            // timer1sec
            // 
            this.timer1sec.Interval = 1000;
            this.timer1sec.Tick += new System.EventHandler(this.timer1sec_Tick);
            // 
            // timer10sec
            // 
            this.timer10sec.Interval = 10000;
            this.timer10sec.Tick += new System.EventHandler(this.timer10sec_Tick);
            // 
            // FormLogin
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.White;
            this.ClientSize = new System.Drawing.Size(274, 323);
            this.Controls.Add(this.ShowPassCB);
            this.Controls.Add(this.PassLbl);
            this.Controls.Add(this.LoginLbl);
            this.Controls.Add(this.PasswordTB);
            this.Controls.Add(this.LogInTB);
            this.Controls.Add(this.GuestB);
            this.Controls.Add(this.LoginB);
            this.Controls.Add(this.panel2);
            this.Controls.Add(this.panel1);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "FormLogin";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Авторизация";
            this.Activated += new System.EventHandler(this.FormLogin_Activated);
            this.FormClosed += new System.Windows.Forms.FormClosedEventHandler(this.LoginFrm_FormClosed);
            this.panel1.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
            this.panel2.ResumeLayout(false);
            this.panel2.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Panel panel2;
        private System.Windows.Forms.CheckBox RemembCB;
        private System.Windows.Forms.Button LoginB;
        private System.Windows.Forms.Button GuestB;
        private System.Windows.Forms.TextBox LogInTB;
        private System.Windows.Forms.TextBox PasswordTB;
        private System.Windows.Forms.Label LoginLbl;
        private System.Windows.Forms.Label PassLbl;
        private System.Windows.Forms.CheckBox ShowPassCB;
        private System.Windows.Forms.PictureBox pictureBox1;
        private System.Windows.Forms.Timer timer1sec;
        private System.Windows.Forms.Timer timer10sec;
    }
}

