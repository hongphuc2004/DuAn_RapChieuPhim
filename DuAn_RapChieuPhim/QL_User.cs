using Business;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Globalization;
using System.Linq;
using System.Runtime.ConstrainedExecution;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace DuAn_RapChieuPhim
{
    public partial class QL_User : Form
    {
        private SqlConnection conn;
        string maKH, tenKH, diachi, email, sdt;
        DateTime ngaysinh;
        public QL_User()
        {
            InitializeComponent();
        }
        public void connect()
        {
            //Lấy chuỗi kết nối CSDL
            string strcon = "Data Source=LAPTOP-PICGBI40\\HONGPHUC;Initial Catalog=ABC_CINEMA_MOVIE_BOOKING;Integrated Security=True;";
            try
            {
                conn = new SqlConnection(strcon);
                // Mở kết nối
                conn.Open();
                //Ko làm gì thì đóng kết nối lại
                conn.Close();
            }
            catch (Exception e)
            {
                MessageBox.Show("Không kết nối được CSDL", "Thông báo",
                MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
        private void QL_User_Load(object sender, EventArgs e)
        {
            connect();
            dgvKH.DataSource = getDSKH();
            DinhDangLuoi();
        }
        private DataTable getDSKH()
        {
            string str = "Select c.Id, c.TenKH, c.NgaySinh, c.SDT, c.Email, c.DiaChi From Customer c";
            SqlDataAdapter adapter = new SqlDataAdapter(str, conn);
            DataSet dataSet = new DataSet();
            adapter.Fill(dataSet);
            return dataSet.Tables[0];
        }
        private void DinhDangLuoi()
        {
            dgvKH.ReadOnly = true;
            dgvKH.Columns[0].HeaderText = "Mã KH";
            dgvKH.Columns[0].Width = 80;
            dgvKH.Columns[1].HeaderText = "Tên KH";
            dgvKH.Columns[1].Width = 120;
            dgvKH.Columns[2].HeaderText = "Ngày sinh";
            dgvKH.Columns[2].Width = 100;
            dgvKH.Columns[3].HeaderText = "SDT";
            dgvKH.Columns[3].Width = 150;
            dgvKH.Columns[4].HeaderText = "Email";
            dgvKH.Columns[4].Width = 130;
            dgvKH.Columns[5].HeaderText = "Địa chỉ";
            dgvKH.Columns[5].Width = 120;
        }

        private void BtnThoat_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }
        private void btnLuu_Click(object sender, EventArgs e)
        {
            maKH = txtMaKH.Text;
            tenKH = txtTenKH.Text;
            ngaysinh = dtpNgaySinh.Value; //DateTimePicker
            sdt =  txtSDT.Text; 
            email = txtEmail.Text;
            diachi = txtDiaChi.Text;
            if (txtMaKH.Text == "")
            {
                errorProvider1.SetError(txtMaKH, "Hãy nhập mã khách hàng!");
                return;
            }
            if (txtTenKH.Text == "")
            {
                errorProvider1.SetError(txtTenKH, "Hãy nhập tên khách hàng!");
                return;
            }
            if (DateTime.Now.Year - ngaysinh.Year < 15 || DateTime.Now.Year - ngaysinh.Year > 20)
            {
                errorProvider1.SetError(dtpNgaySinh, "14 trở lên");
                return;
            }
            if (txtSDT.Text == "")
            {
                errorProvider1.SetError(txtSDT, "Hãy nhập SDT");
                return;
            }
            try
            {
                conn.Open();
                string str = "insert into Customer VALUES('" +
                maKH + "',N'" + tenKH + "','" +
                ngaysinh + "',N'" + sdt + "'," +
                email + ",'" + diachi + "')";
                SqlCommand cmd1 = new SqlCommand(str, conn);
                cmd1.ExecuteNonQuery();
                conn.Close();
                MessageBox.Show("Thêm dữ liệu thành công");
                txtMaKH.Text = "";
                txtTenKH.Text = "";
                dtpNgaySinh.Text = "";
                txtSDT.Text = "";
                txtEmail.Text = "";
                txtDiaChi.Text = "";
            }
            catch (Exception ex)
            {
                MessageBox.Show("Lỗi khi thêm dữ liệu: " + ex.ToString(), "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            try
            {
                conn.Open();
                string strSQL = "delete from Customer where Id ='" + maKH + "'";
                SqlCommand cmd = new SqlCommand(strSQL, conn);
                cmd.ExecuteNonQuery();
                conn.Close();
                MessageBox.Show("Xóa dữ liệu thành công");
            }
            catch (Exception ex)
            {
                MessageBox.Show("Xóa bị lỗi" + ex.ToString());
            }
            dgvKH.DataSource = getDSKH();
        }
        private void btnCapNhat_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(maKH))
            {
                MessageBox.Show("Vui lòng tìm kiếm khách hàng trước!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
            string updatedTenKH = txtTenKH.Text;
            DateTime updatedNgaySinh = dtpNgaySinh.Value;
            int updatedSDT = int.Parse(txtSDT.Text, CultureInfo.InvariantCulture);
            string updatedEmail = txtEmail.Text;
            string updatedDiaChi = txtDiaChi.Text;
            try
            {
                conn.Open();
                string str = "UPDATE Customer SET TenKH = @tenKH, NgaySinh = @ngaysinh, SDT = @sdt, Email = @email, DiaChi = @diachi WHERE MaKH = @maKH";

                SqlCommand cmd = new SqlCommand(str, conn);
                cmd.Parameters.AddWithValue("@maKH", maKH);
                cmd.Parameters.AddWithValue("@tenKH", updatedTenKH);
                cmd.Parameters.AddWithValue("@ngaysinh", updatedNgaySinh);
                cmd.Parameters.AddWithValue("@sdt", updatedSDT);
                cmd.Parameters.AddWithValue("@email", updatedEmail);
                cmd.Parameters.AddWithValue("@diachi", updatedDiaChi);

                cmd.ExecuteNonQuery();
                MessageBox.Show("Cập nhật dữ liệu thành công", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                dgvKH.DataSource = getDSKH();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Lỗi khi cập nhật dữ liệu: " + ex.ToString(), "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            finally
            {
                if (conn.State == ConnectionState.Open)
                {
                    conn.Close();
                }
            }
        }
    }
}
