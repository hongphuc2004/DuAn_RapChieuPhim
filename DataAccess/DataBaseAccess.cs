using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataTransferObject;
using System.Data;
using System.Runtime.CompilerServices;
using System.Security.Cryptography.X509Certificates;
namespace DataAccess
{
    public class DataBaseAccess
    {
        private static DataBaseAccess dt = null;
        static string ChuoiKetNoi;
        public class SqlConnectionData
        {
            public static SqlConnection Connect()
            {
                ChuoiKetNoi = @"Data Source=LAPTOP-PICGBI40\HONGPHUC;Initial Catalog=ABC_CINEMA_MOVIE_BOOKING;Integrated Security=True;";
                SqlConnection conn = new SqlConnection(ChuoiKetNoi);
                return conn;
            }
        }
        public static DataBaseAccess GetInstance()
        {
            if (dt == null)
                dt = new DataBaseAccess();
            return dt;
        }
        public DataTable FillDataTable(string strSQL)
        {
            SqlDataAdapter DA = new SqlDataAdapter(strSQL, ChuoiKetNoi);
            DataTable dt = new DataTable();
            DA.FillSchema(dt, SchemaType.Mapped);
            DA.Fill(dt);
            return dt;
        }
        public static string checkLoginDTO(QL_TaiKhoan qL_TaiKhoan)
        {
            string user = "";
            //hàm connect csdl
            SqlConnection conn = SqlConnectionData.Connect();
            conn.Open();
            SqlCommand cmd = new SqlCommand("proc_Login", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@username", qL_TaiKhoan.name);
            cmd.Parameters.AddWithValue("@password", qL_TaiKhoan.password);
            //kiểm tra quyền 
            cmd.Connection = conn;
            SqlDataReader reader = cmd.ExecuteReader();
            if(reader.HasRows)
            {
                while(reader.Read())
                {
                    if (!reader.IsDBNull(0)) // Kiểm tra xem giá trị có bị null không
                    {
                        //user = reader.GetString(0);
                        // Sử dụng phương thức đọc chính xác dựa trên kiểu dữ liệu
                        var value = reader[0]; // Đọc giá trị đầu tiên

                        if (value is int) // Kiểm tra nếu là số nguyên
                        {
                            user = value.ToString(); // Chuyển số nguyên thành chuỗi
                        }
                        else if (value is string) // Kiểm tra nếu là chuỗi
                        {
                            user = (string)value;
                        }
                    }
                }
                reader.Close();
                conn.Close();
            }
            else
            {
                return "Sai tài khoản hoặc mật khẩu";
            }
            return user;
        }
    }
}
