﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Schema;
using DataTransferObject;
namespace DataAccess
{
    public class TaiKhoanAccess:DataBaseAccess
    {
        public string checkLogin(QL_TaiKhoan qL_TaiKhoan)
        {
            string info = checkLoginDTO(qL_TaiKhoan);
            return info;
        }
    }
}
