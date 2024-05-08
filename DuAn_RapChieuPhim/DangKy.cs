using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.ListView;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.StartPanel;
using DataAccess;
using System.Text.RegularExpressions;

namespace DuAn_RapChieuPhim
{
    public partial class DangKy : Form
    {
        public DangKy()
        {
            InitializeComponent();
        }
        public bool CheckAccount(string ac)
        {
            return Regex.IsMatch(ac, "^[a-zA-Z0-9]{1,24}$");
        }

        private void lblDN_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            this.Hide();
            this.Close();
            var f = new DangNhap();
            // Gắn sự kiện Closed cho Form Phim để hiển thị lại Form TrangChu khi Form Phim đóng
            f.Closed += (s, args) => this.Show();
            f.ShowDialog();
        }
        Modify modify = new Modify();
        private void btnDangKy_Click(object sender, EventArgs e)
        {
            string id = textBox_TenTaiKhoanDK.Text;
            string name = textBox_Ten.Text;
            string password = textBox_MatKhauDK.Text;
            string email = textBox_EmailDK.Text;
            string phone = textBox_SDT.Text;
            if (!CheckAccount(id)) { MessageBox.Show("tên đăng nhập dài từ 1-24 ký tự!"); return; }
            if (!CheckAccount(name)) { MessageBox.Show("tên tài khoản dài từ 1-24 ký tự!"); return; }
            if (!CheckAccount(password)) { MessageBox.Show("tên mật khẩu dài từ 1-24 ký tự!"); return; }
            if (!CheckAccount(email)) { MessageBox.Show("tên Email dài từ 1-24 ký tự!"); return; }
            if (!CheckAccount(phone)) { MessageBox.Show("Số điện thoại dài từ 1-24 ký tự!"); return; }
            try
            {
                string query = "insert into [Account] values ('" +id + "','" + name + "','" + password + "','" + email + "','" + phone + "')";
                modify.Command(query);
                if (MessageBox.Show("đăng ký thành công! bạn có muốn đăng nhập luôn không?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Information) == DialogResult.Yes)
                {
                    this.Close();
                }
            }
            catch
            {
                MessageBox.Show("Tên tài khoản này đã được đăng ký, vui lòng đăng ký tên tài khoản khác");
            }
        }

    }
}
