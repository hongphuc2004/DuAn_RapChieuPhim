using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccess;
using DataTransferObject;
namespace Business
{
    public class TaiKhoanBLL
    {
        TaiKhoanAccess tkAccess = new TaiKhoanAccess();
        public string checkLogin(QL_TaiKhoan qL_TaiKhoan)
        {
            string info = tkAccess.checkLogin(qL_TaiKhoan); 
            return info;
        }
    }
}
