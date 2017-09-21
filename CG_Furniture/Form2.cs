using System;
using System.Drawing;
using System.Windows.Forms;
using System.Linq;
using System.Data.Entity.Validation;

namespace CG_Furniture
{
    public partial class Form2 : Form
    {
        /// <summary>
        /// 全局变量
        /// </summary>
        /// 
        TabPage[] FirstYuan = new TabPage[5];
        private DBCL.DBEntities db = new DBCL.DBEntities();
        private static string strCaiName = "";


        public Form2()//初始化界面时执行此函数***
        {
            InitializeComponent();
            // 选项卡
            for (int i = 0; i < 5; i++)
            {
                FirstYuan[i] = this.Show.TabPages[i];
            }
            this.Show.TabPages.Clear();
            this.Show.TabPages.Add(新增采购单);
            //其他初始化
            initRest();
        }

        private void initRest()
        {
            // 新增采购订单中
            // 供应商下拉框
            var model = db.Suppliers;
            cbbGong.Items.Clear();
            foreach (var model1 in model)
            {
                cbbGong.Items.Add(model1.Supplier_Name);
            }
            if (cbbGong.Items[cbbGong.Items.Count - 1].ToString() != "添加")
            {
                cbbGong.Items.Insert(cbbGong.Items.Count, "添加");
            }

            // 采购员下拉框
            var model2 = db.Staffs.Where(m => m.Position == "采购员");
            cbbCai.Items.Clear();
            foreach (var model1 in model2)
            {
                cbbCai.Items.Add(model1.Staff_Name);
            }
            if (cbbCai.Items[cbbCai.Items.Count-1].ToString() != "添加")
            {
                cbbCai.Items.Insert(cbbCai.Items.Count, "添加");
            }

        }

        private void splitContainer1_Panel1_Paint(object sender, PaintEventArgs e)
        {

        }
        /// <summary>
        /// 双击Show显示的Tab，关闭
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void Show_DoubleClick(object sender, EventArgs e)
        {
            this.Show.TabPages.Remove(this.Show.SelectedTab);
        }


        /// <summary>
        /// 当鼠标进入左边功能菜单时，自动显示子菜单，离开时自动关闭************************
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        //原料采购
        private void toolStripDropDownButton1_MouseEnter(object sender, EventArgs e)
        {
            this.原料采购.ShowDropDown();
        }
        private void toolStripDropDownButton1_MouseLeave(object sender, EventArgs e)
        {
            Point whereMouse = MousePosition;
            if (原料采购.DropDown.Bounds.Contains(whereMouse))
            {
                原料采购.DropDown.MouseLeave += new EventHandler(原料采购DropDownMouseLeave);
            }
            else
            {
                原料采购.DropDown.Close();  
            }
        }
        private void 原料采购DropDownMouseLeave(object sender, EventArgs e)
        {
            原料采购.DropDown.Close();
        }
        //生产加工
        private void toolStripDropDownButton2_MouseEnter(object sender, EventArgs e)
        {
            this.生产加工.ShowDropDown();
        }
        private void toolStripDropDownButton2_MouseLeave(object sender, EventArgs e)
        {
            Point whereMouse = MousePosition;
            if (生产加工.DropDown.Bounds.Contains(whereMouse))
            {
                生产加工.DropDown.MouseLeave += new EventHandler(生产加工DropDownMouseLeave);
            }
            else
            {
                生产加工.DropDown.Close();
            }
        }
        private void 生产加工DropDownMouseLeave(object sender, EventArgs e)
        {
            生产加工.DropDown.Close();
        }
        //货品销售
        private void 货品销售_MouseEnter(object sender, EventArgs e)
        {
            this.货品销售.ShowDropDown();
        }

        private void 货品销售_MouseLeave(object sender, EventArgs e)
        {
            Point whereMouse = MousePosition;
            if (货品销售.DropDown.Bounds.Contains(whereMouse))
            {
                货品销售.DropDown.MouseLeave += new EventHandler(货品销售DropDownMouseLeave);
            }
            else
            {
                货品销售.DropDown.Close();
            }
        }
        private void 货品销售DropDownMouseLeave(object sender, EventArgs e)
        {
            货品销售.DropDown.Close();
        }
        //库存管理
        private void 库存管理_MouseEnter(object sender, EventArgs e)
        {
            this.库存管理.ShowDropDown();
        }

        private void 库存管理_MouseLeave(object sender, EventArgs e)
        {
            Point whereMouse = MousePosition;
            if (库存管理.DropDown.Bounds.Contains(whereMouse))
            {
                库存管理.DropDown.MouseLeave += new EventHandler(库存管理DropDownMouseLeave);
            }
            else
            {
                库存管理.DropDown.Close();
            }
        }
        private void 库存管理DropDownMouseLeave(object sender, EventArgs e)
        {
            库存管理.DropDown.Close();
        }
        //人员管理
        private void 人员管理_MouseEnter(object sender, EventArgs e)
        {
            this.人员管理.ShowDropDown();
        }

        private void 人员管理_MouseLeave(object sender, EventArgs e)
        {
            Point whereMouse = MousePosition;
            if (人员管理.DropDown.Bounds.Contains(whereMouse))
            {
                人员管理.DropDown.MouseLeave += new EventHandler(人员管理DropDownMouseLeave);
            }
            else
            {
                人员管理.DropDown.Close();
            }
        }
        private void 人员管理DropDownMouseLeave(object sender, EventArgs e)
        {
            人员管理.DropDown.Close();
        }
        //财务管理
        private void 财务管理_MouseEnter(object sender, EventArgs e)
        {
            this.财务管理.ShowDropDown();
        }

        private void 财务管理_MouseLeave(object sender, EventArgs e)
        {
            Point whereMouse = MousePosition;
            if (财务管理.DropDown.Bounds.Contains(whereMouse))
            {
                财务管理.DropDown.MouseLeave += new EventHandler(财务管理DropDownMouseLeave);
            }
            else
            {
                财务管理.DropDown.Close();
            }
        }
        private void 财务管理DropDownMouseLeave(object sender, EventArgs e)
        {
            财务管理.DropDown.Close();
        }


        /// <summary>
        /// 二级菜单
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>

        //原料采购二级功能选择，Show显示
        private void 原料采购_DropDownItemClicked(object sender, ToolStripItemClickedEventArgs e)
        {
            //string itemName = e.ClickedItem.toString();
            System.Text.StringBuilder messageBoxCS = new System.Text.StringBuilder();
            messageBoxCS.AppendFormat("{0}",e.ClickedItem);
            messageBoxCS.AppendLine();
            string itemName = messageBoxCS.ToString().Trim();
            for (int i = 0; i < 5; i++)
            {
                if (FirstYuan[i].Text.Trim() == itemName)
                {
                    if (this.Show.TabPages.Contains(FirstYuan[i]))
                    {
                        this.Show.SelectedTab = FirstYuan[i];
                    }
                    else
                    {
                        this.Show.TabPages.Add(FirstYuan[i]);
                        this.Show.SelectedTab = FirstYuan[i];
                    }
                    
                }
            }
           
           
        }

        //private void 新增采购订单_Click(object sender, EventArgs e)
        //{
        //    if (this.Show.TabPages.Contains(新增采购单))
        //    {
        //        this.Show.SelectedTab = this.新增采购单;
        //    }
        //    else
        //    {
        //        this.Show.TabPages.Add(新增采购单);
        //        this.Show.SelectedTab = this.新增采购单;
        //    }
        //}
       

        //主菜单******************************************************************
        private void dataGridView1_RowStateChanged(object sender, DataGridViewRowStateChangedEventArgs e)
        {
            e.Row.HeaderCell.Value = string.Format("{0}", e.Row.Index + 1);  
        }

        private void Form2_Load(object sender, EventArgs e)
        {
           
            
        }

        private void 退出ToolStripMenuItem1_Click(object sender, EventArgs e)
        {
            this.Close();
        }
        /// <summary>
        /// textbox提示信息
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private string textTiShi = "请输入日期或供应商";
        
        private void textBox2_Enter(object sender, EventArgs e)
        {
            if(textBox2.Text==textTiShi)
            {
                textBox2.Text = "";
                textBox2.ForeColor = Color.Black;
            }
        }

        private void textBox2_Leave(object sender, EventArgs e)
        {
            if (textBox2.Text == "")
            {
                textBox2.ForeColor = Color.Gray;
                textBox2.Text = "请输入日期或供应商";
            }
        }


        // 采购员 下拉框选择再添加
        private void cbbCai_SelectedIndexChanged(object sender, EventArgs e)
        {
            string cbbCaiAdd = cbbCai.Text.Trim();
            if (cbbCaiAdd == "添加")
            {
                Form3 form3 = new Form3();
                form3.ShowDialog();
                initRest();
                cbbCai.Text = strCaiName;
            }
        }
        // 采购员 静态获取值
        public  static void setCaiName(string name)
        {
            strCaiName = name;
        }


        private void button1_Click(object sender, EventArgs e)
        {
            DBCL.Material_Order model = new DBCL.Material_Order();
            int row = dataGridView1.RowCount;
            int col = dataGridView1.ColumnCount;
            String name = "";
            Decimal zhiJing =0;
            Decimal tiJi = 0;
            decimal danJia = 0;
            int leiNum = 0;

            for (int i = 0; i < row-1; i++)
            {
                leiNum = 0;
                // 获取数据
                try
                {
                    name = dataGridView1.Rows[i].Cells[leiNum].Value.ToString().Trim();
                    leiNum++;
                }
                catch (Exception )
                {
                    i++; leiNum++;
                    MessageBox.Show("第 " + i + " 行 " + leiNum + " 列未输入！");
                    i--; leiNum--;
                    return;
                }
                try
                {
                    zhiJing = Convert.ToDecimal(dataGridView1.Rows[i].Cells[1].Value.ToString().Trim());
                    leiNum++;
                }
                catch (Exception)
                {
                    i++; leiNum++;
                    MessageBox.Show("第 " + i + " 行 " + leiNum + " 列未输入！");
                    i--; leiNum--;
                    return;
                }
                try
                {
                    tiJi = Convert.ToDecimal(dataGridView1.Rows[i].Cells[2].Value.ToString().Trim());
                    leiNum++;
                }
                catch (Exception)
                {
                    i++; leiNum++;
                    MessageBox.Show("第 " + i + " 行 " + leiNum + " 列未输入！");
                    i--; leiNum--;
                    return;
                }
                try
                {
                    danJia = Convert.ToDecimal(dataGridView1.Rows[i].Cells[3].Value.ToString().Trim());
                    leiNum++;
                }
                catch (Exception)
                {
                    i++; leiNum++;
                    MessageBox.Show("第 " + i + " 行 " + leiNum + " 列未输入！");
                    i--; leiNum--;
                    return;
                }
                //if (name == "" || zhijing == "" || tiji == "" || danjia == "")
                //{
                //    break;
                //}
                MessageBox.Show(name + " " + zhiJing + " " + tiJi + " " + danJia);
                model.Material_Name = name;
                model.Price = danJia;
                model.Volume = tiJi;
                model.Diameter = zhiJing;
                model.Order_ID = "22";
                

                // 验重
                if(db.Material_Order.Any(m=>m.Material_Name==name&&m.Diameter==zhiJing)==true)
                {
                    i++;
                    MessageBox.Show("第 " + i + " 行数据已存在！请重新输入本行数据");
                    i--;
                    continue;
                }

                try
                {
                    db.Material_Order.Add(model);
                    db.SaveChanges();
                }
                catch (DbEntityValidationException dbEx)
                {
                    MessageBox.Show(dbEx.ToString());
                    return;
                }
            }
            MessageBox.Show("添加成功");
            while (this.dataGridView1.Rows.Count != 0)
            {
                this.dataGridView1.Rows.RemoveAt(0);
            }
        }


        



        

        

        

        

        

        


     

        

        
    }
}
