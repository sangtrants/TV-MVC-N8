using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using QuanLyThuVien_N8.Models;
using PagedList;

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

        public ActionResult QuanLySach(int? page)
        {
            QuanLyThuVienEntities data = new QuanLyThuVienEntities();
            var sach = from s in data.Saches select s;
            sach = sach.OrderBy(s => s.MaSach);
            int pageSize = 1;
            int pageNumber = (page ?? 1);
            return View(sach.ToPagedList(pageNumber, pageSize));
        }
    }
}
