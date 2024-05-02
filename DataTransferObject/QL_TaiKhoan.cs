using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataTransferObject
{
    public class QL_TaiKhoan
    {
        public int id { get; set; }
        public string name { get; set; }
        public string password { get; set; }
        public string status {  get; set; }
        public string email {  get; set; }
        public string phone {  get; set; }
    }
}
