using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using QuanLyThuVien_N8.Models;
using PagedList;
using System.Drawing;
using DotNet.Highcharts;
using DotNet.Highcharts.Enums;
using DotNet.Highcharts.Helpers;
using DotNet.Highcharts.Options;
using DotNet.Highcharts.Attributes;
using Point = DotNet.Highcharts.Options.Point;
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

        public ActionResult GetAllNguoiDung(int? page)
        {

            QuanLyThuVienEntities ql = new QuanLyThuVienEntities();

            var listUser = from nd in ql.NguoiDungs select nd;
            listUser = listUser.OrderBy(s => s.MaNguoiDung);

            int pageSize = 4;
            int pageNumber = (page ?? 1);
            return View(listUser.ToPagedList(pageNumber, pageSize));
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
        public ActionResult QuanLySach(int? page)
        {
            QuanLyThuVienEntities data = new QuanLyThuVienEntities();
            var sach = from s in data.Saches select s;
            sach = sach.OrderBy(s => s.MaSach);
            int pageSize = 4;
            int pageNumber = (page ?? 1);
            return View(sach.ToPagedList(pageNumber, pageSize));
        }

        // nguyên cục của anh
        public ActionResult getViewPieChart()
        {
            return View();
        }
        public ActionResult getdata()
        {
            return Json(getListdata(), JsonRequestBehavior.AllowGet);
        }
        private IEnumerable<TypeUserM> getListdata()
        {
            List<TypeUserM> listUser = new List<TypeUserM>();

            QuanLyThuVienEntities data = new QuanLyThuVienEntities();
            var kq = from nd in data.NguoiDungs
                     group nd by nd.LoaiND into newgroup
                     select new { LoaiNguoiDung = newgroup.Key, SoLuong = newgroup.Count() };
            
            foreach (var st in kq)
            {
                TypeUserM user = new TypeUserM();
                user.LoaiNguoiDung = st.LoaiNguoiDung;
                user.SoLuong = st.SoLuong;
                listUser.Add(user);
            }
            return listUser;
        }

    }
}
