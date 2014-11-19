using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using QuanLyThuVien_N8.Models;

namespace QuanLyThuVien_N8.Controllers
{
    public class ThuThuController : Controller
    {
        //
        // GET: /ThuThu/

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult GetAllNguoiDung()
        {
            List<NguoiDung> listUser = new List<NguoiDung>();

            using (QuanLyThuVienEntities ql = new QuanLyThuVienEntities())
            {
                listUser = ql.NguoiDungs.ToList();
            }
            return View(listUser);
        }

        public JsonResult GetNguoiDungWithParameter(String prefix)
        {
            List<NguoiDung> listUser = new List<NguoiDung>();

            using (QuanLyThuVienEntities ql = new QuanLyThuVienEntities())
            {
                listUser = ql.NguoiDungs.Where(a => a.HoTen.Contains(prefix)).ToList();
            }
            return new JsonResult { Data = listUser, JsonRequestBehavior = JsonRequestBehavior.AllowGet };
        }
    }
}
