using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;
using DataTransferObject;
using Business;
using DevExpress.XtraWaitForm;
using static DevExpress.XtraEditors.Mask.MaskSettings;
namespace DuAn_RapChieuPhim
{
    public partial class DangNhap : Form
    {
        QL_TaiKhoan qL_TaiKhoan = new QL_TaiKhoan();
        TaiKhoanBLL TKBLL = new TaiKhoanBLL();

        public DangNhap()
        {
            InitializeComponent();
        }

        private void DangNhap_Load(object sender, EventArgs e)
        {

        }
        private void lblDK_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            this.Hide();
            var f = new DangKy();
            // Gắn sự kiện Closed cho Form Phim để hiển thị lại Form TrangChu khi Form Phim đóng
            f.Closed += (s, args) => this.Show();
            f.ShowDialog();
        }
        
        private void btnDangNhap_Click(object sender, EventArgs e)
        {
            qL_TaiKhoan.name = textBox_TenTaiKhoanDN.Text;
            qL_TaiKhoan.password = textBox_MatKhauDN.Text;
            string getUser = TKBLL.checkLogin(qL_TaiKhoan);
            switch(getUser)
            {
                case "Sai tài khoản hoặc mật khẩu":
                    MessageBox.Show("Sai tài khoản hoặc mật khẩu");
                    return;
            }
            this.Hide();
            TrangChu f = new TrangChu();
            
            f.Show();
        }

        private void textBox_TenTaiKhoanDN_Enter(object sender, EventArgs e)
        {
            if(textBox_TenTaiKhoanDN.Text == "Nhập tên tài khoản")
            {
                textBox_TenTaiKhoanDN.Text = "";
                textBox_TenTaiKhoanDN.ForeColor = Color.Black;
            }
        }

        private void textBox_TenTaiKhoanDN_Leave(object sender, EventArgs e)
        {
            if(textBox_TenTaiKhoanDN.Text == "")
            {
                textBox_TenTaiKhoanDN.Text = "Nhập tên tài khoản";
                textBox_TenTaiKhoanDN.ForeColor = Color.Silver;
            }
        }

        private void textBox_MatKhauDN_Enter(object sender, EventArgs e)
        {
            if(textBox_MatKhauDN.Text == "Nhập mật khẩu")
            {
                textBox_MatKhauDN.Text = "";
                textBox_MatKhauDN.ForeColor = Color.Black;
            }
        }

        private void textBox_MatKhauDN_Leave(object sender, EventArgs e)
        {
            if (textBox_MatKhauDN.Text == "")
            {
                textBox_MatKhauDN.Text = "Nhập mật khẩu";
                textBox_MatKhauDN.ForeColor = Color.Silver;
            }
        }
    }
}
