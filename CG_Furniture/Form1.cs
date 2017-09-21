using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace CG_Furniture
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            //this.ShowInTaskbar = false;//没有form1，没有窗口关闭
            //this.FormBorderStyle = FormBorderStyle.None;
            //this.ControlBox = false;
            //this.Text = "";//没有窗口关闭，但form1仍存在
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            ToolTip tiShi = new ToolTip();
            tiShi.ShowAlways = true;
            tiShi.SetToolTip(this.button1, "确定。");

            Form2 form2 = new Form2();
            this.Visible=false;
            form2.ShowDialog();
            this.Close();
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {
           
        }
    }
}
