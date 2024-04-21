using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace DuAn_RapChieuPhim
{
    public partial class Phim : Form
    {
        public Phim()
        {
            InitializeComponent();
        }

        private void Phim_Load(object sender, EventArgs e)
        {

        }

        private void btnClick_datve(object sender, EventArgs e)
        {
            this.Hide();
            var f = new ChonGhe();
            // Gắn sự kiện Closed cho Form Phim để hiển thị lại Form TrangChu khi Form Phim đóng
            f.Closed += (s, args) => this.Show();
            f.ShowDialog();
        }

        private void btnQLPhim_Click(object sender, EventArgs e)
        {
            this.Hide();
            var f = new QLPhim();
            // Gắn sự kiện Closed cho Form Phim để hiển thị lại Form TrangChu khi Form Phim đóng
            f.Closed += (s, args) => this.Show();
            f.ShowDialog();
        }

    }
}
