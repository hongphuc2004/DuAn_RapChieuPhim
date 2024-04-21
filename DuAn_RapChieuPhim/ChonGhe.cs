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
    public partial class ChonGhe : Form
    {
        private int clickLightCoral = 0;
        private int clickDeepPink = 0;
        private int clickPlum = 0;
        public ChonGhe()
        {
            InitializeComponent();

        }

        private void btnTieptuc_Click(object sender, EventArgs e)
        {
            this.Hide();
            var f = new HoaDon();
            // Gắn sự kiện Closed cho Form Phim để hiển thị lại Form TrangChu khi Form Phim đóng
            f.Closed += (s, args) => this.Show();
            f.ShowDialog();
        }

        private void btnLightCoral(object sender, EventArgs e)
        {
            
            Button clickedButton = sender as Button;
            if (clickLightCoral % 2 == 0)
            {
                // Chuyển màu lần click thứ nhất
                clickedButton.BackColor = Color.Red;
            }
            else
            {
                // Chuyển lại màu cũ khi click lần thứ hai
                clickedButton.BackColor = Color.LightCoral; // Màu mặc định của nền Form
            }
            clickLightCoral++;
        }

        private void btnDeepPink(object sender, EventArgs e)
        {
            Button clickedButton = sender as Button;
            if (clickDeepPink % 2 == 0)
            {
                // Chuyển màu lần click thứ nhất
                clickedButton.BackColor = Color.Red;
            }
            else
            {
                // Chuyển lại màu cũ khi click lần thứ hai
                clickedButton.BackColor = Color.DeepPink; // Màu mặc định của nền Form
            }
            clickDeepPink++;
        }

        private void btnPlum(object sender, EventArgs e)
        {
            Button clickedButton = sender as Button;
            if (clickPlum % 2 == 0)
            {
                // Chuyển màu lần click thứ nhất
                clickedButton.BackColor = Color.Red;
            }
            else
            {
                // Chuyển lại màu cũ khi click lần thứ hai
                clickedButton.BackColor = Color.Plum; // Màu mặc định của nền Form
            }
            clickPlum++;
        }
    }
}
