using Business;
using DataTransferObject;
using DevExpress.Xpo.DB;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using static DevExpress.XtraEditors.Mask.MaskSettings;

namespace DuAn_RapChieuPhim
{
    public partial class TrangChu : Form
    {
        public TrangChu()
        {
            InitializeComponent();
        }
        public TrangChu(string isname)
        {
            InitializeComponent();
        }
        private void TrangChu_Load(object sender, EventArgs e)
        {
            
        }

        private void rạpToolStripMenuItem_Click(object sender, EventArgs e)
        {
            this.Hide();
            var f = new Rap();
            // Gắn sự kiện Closed cho Form Phim để hiển thị lại Form TrangChu khi Form Phim đóng
            f.Closed += (s, args) => this.Show();
            f.ShowDialog();
        }

        private void đăngNhậpToolStripMenuItem_Click(object sender, EventArgs e)
        {
            this.Hide();
            var f = new DangNhap();
            // Gắn sự kiện Closed cho Form Phim để hiển thị lại Form TrangChu khi Form Phim đóng
            f.Closed += (s, args) => this.Show();
            f.ShowDialog();
        }

        private void đăngKýToolStripMenuItem_Click(object sender, EventArgs e)
        {
            this.Hide();
            var f = new DangKy();
            // Gắn sự kiện Closed cho Form Phim để hiển thị lại Form TrangChu khi Form Phim đóng
            f.Closed += (s, args) => this.Show();
            f.ShowDialog();
        }

        private void xemThôngTinToolStripMenuItem_Click(object sender, EventArgs e)
        {
            this.Hide();
            var f = new TaiKhoan();
            // Gắn sự kiện Closed cho Form Phim để hiển thị lại Form TrangChu khi Form Phim đóng
            f.Closed += (s, args) => this.Show();
            f.ShowDialog();
        }

        private void đăngXuấtToolStripMenuItem_Click(object sender, EventArgs e)
        {
            this.Close();
            DangNhap f = new DangNhap();
            f.Show();
        }

        private void pictureEdit1_EditValueChanged(object sender, EventArgs e)
        {

        }

        private void quảnLýPhimToolStripMenuItem1_Click(object sender, EventArgs e)
        {
            this.Hide();
            var f = new QLPhim();
            // Gắn sự kiện Closed cho Form Phim để hiển thị lại Form TrangChu khi Form Phim đóng
            f.Closed += (s, args) => this.Show();
            f.ShowDialog();
        }

        private void quảnLýToolStripMenuItem_Click(object sender, EventArgs e)
        {
            
        }

        private void quảnLýRạpToolStripMenuItem_Click(object sender, EventArgs e)
        {
            this.Hide();
            var f = new Rap();
            // Gắn sự kiện Closed cho Form Phim để hiển thị lại Form TrangChu khi Form Phim đóng
            f.Closed += (s, args) => this.Show();
            f.ShowDialog();
        }

        private void phimToolStripMenuItem_Click(object sender, EventArgs e)
        {
            this.Hide();
            var f = new Phim();
            // Gắn sự kiện Closed cho Form Phim để hiển thị lại Form TrangChu khi Form Phim đóng
            f.Closed += (s, args) => this.Show();
            f.ShowDialog();
        }

        private void lịchChiếuToolStripMenuItem_Click(object sender, EventArgs e)
        {

        }

        private void quảnLýNgườiDùngToolStripMenuItem_Click(object sender, EventArgs e)
        {
            this.Hide();
            var f = new QL_User();
            // Gắn sự kiện Closed cho Form Phim để hiển thị lại Form TrangChu khi Form Phim đóng
            f.Closed += (s, args) => this.Show();
            f.ShowDialog();
        }
    }
}
