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
    public partial class Form3 : Form
    {
        // 变量 ***************************************************************
        string strCaiId = "";
        string strCaiName = "";
        string strCaiPosi = "采购员";
        string strCaiLine = "0";
        string strCaiPhone = "";
        string strCaiShen = "";
        string strCaiAddress = "";
        string strCaiOther = "";

        DBCL.DBEntities db = new DBCL.DBEntities();

        // 构造
        public Form3()
        {
            InitializeComponent();
        }
        // 初始化
        private void Form3_Load(object sender, EventArgs e)
        {
            //tbCaiId.Focus();
        }
        // 事件 *************************************************************
        // 添加按钮
        private void btCaiAdd_Click(object sender, EventArgs e)
        {
            // 赋值
            strCaiId = tbCaiId.Text.Trim();
            strCaiName = tbCaiName.Text.Trim();
            strCaiPhone = tbCaiPhone.Text.Trim();
            strCaiShen = tbCaiShen.Text.Trim();
            strCaiAddress = tbCaiAddress.Text.Trim();
            strCaiOther = tbCaiOther.Text.Trim();

            // 校验
            if(strCaiId=="")
            {
                MessageBox.Show("采购员编号不能为空！");
                tbCaiId.Focus();
                return;
            }
            if(strCaiName=="")
            {
                MessageBox.Show("采购员名字不能为空！");
                tbCaiName.Focus();
                return;
            }
            if (strCaiPhone == "")
            {
                MessageBox.Show("采购员联系方式不能为空！");
                tbCaiPhone.Focus();
                return;
            }
            if (strCaiShen == "")
            {
                MessageBox.Show("采购员身份证号不能为空！");
                tbCaiShen.Focus();
                return;
            }
            if (strCaiAddress == "")
            {
                MessageBox.Show("采购员住址不能为空！");
                tbCaiAddress.Focus();
                return;
            }

            if (db.Staffs.Any(m => m.Staff_ID == strCaiId) == true)
            {
                MessageBox.Show("该职工编号已存在！");
                return;
            }

            DBCL.Staff model = new DBCL.Staff();

            model.Staff_ID = strCaiId;
            model.Staff_Name = strCaiName;
            model.Position = strCaiPosi;
            model.ID_num = strCaiShen;
            model.Line = strCaiLine;
            model.Addres = strCaiAddress;
            model.Remark = strCaiOther;
            model.Phone = strCaiPhone;

            try
            {
                db.Staffs.Add(model);
                db.SaveChanges();
            }
            catch
            {
                MessageBox.Show("添加失败");
                return;
            }
            MessageBox.Show("添加成功");
            Form2.setCaiName(strCaiName);
            this.Close();
        }
        // 取消按钮
        private void btCaiCancle_Click(object sender, EventArgs e)
        {
            this.Close();
        }

    }
}
