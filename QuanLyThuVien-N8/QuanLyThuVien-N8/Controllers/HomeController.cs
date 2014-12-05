using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using QuanLyThuVien_N8.Models;
using System.IO;

namespace QuanLyThuVien_N8.Controllers
{
    public class HomeController : Controller
    {
        //
        // GET: /Home/

        public ActionResult Index()
        {
            return View();
        }
        //Kiểm tra login (Từ)
        [HttpPost]
        public ActionResult LoginValid(LoginModel model)
        {
            QuanLyThuVienEntities data = new QuanLyThuVienEntities();
            NguoiDung user = (from use in data.NguoiDungs 
                              where use.TenDangNhap == model.UserName && use.MatKhau == model.Password 
                              select use).FirstOrDefault();
            if (user == null)
            {
                NhanVien em = (from use in data.NhanViens
                               where use.TenDangNhap == model.UserName && use.MatKhau == model.Password
                               select use).FirstOrDefault();
                Session["user"] = em.TenDangNhap;
                return RedirectToAction("Index", "ThuThu");
            }
            
            if (user != null)
            {
                model.SoLuongDenHan = 0;
                List<PhieuMuon> Muon = (from use in data.PhieuMuons
                                        where use.NguoiMuon == user.MaNguoiDung
                                        select use).Distinct().ToList();
                for (int i = 0; i < Muon.Count; i++)
                {
                    if (Muon[i].NgayTra <= DateTime.Today)
                        model.SoLuongDenHan++;
                }
                Session["user"] = user.TenDangNhap;
                Session["SoLanDenHan"] = model.SoLuongDenHan;
                return View("~/Views/DocGia/Index.cshtml",model);
            }
            else
            {
                Session["error"] = "wrong";
                return RedirectToAction("Login");
            }
        }

        public ActionResult Login()
        {
            return View();
        }

        public ActionResult Logout()
        {
            Session["user"] = null;
            Session["SoLanDenHan"] = null;
            return View("~/Views/Home/Index.cshtml");
        }
        public ActionResult Demo()
        {
            return View();
        }

        //Lấy thông tin đọc giả cho phần cập nhật dashboard (Từ)
        public ActionResult suadg(string username)
        {
            QuanLyThuVienEntities data = new QuanLyThuVienEntities();
            NguoiDung ngd = (from ngds in data.NguoiDungs
                             where ngds.TenDangNhap == username
                             select ngds).FirstOrDefault();
            NhanVien nv = (from ngds in data.NhanViens
                           where ngds.TenDangNhap == username
                           select ngds).FirstOrDefault();
            if(ngd != null)
                return View("~/Views/DocGia/SuaDocGia.cshtml", ngd);
            else
                return View("~/Views/Home/SuaNhanVien.cshtml", nv);
        }
        
        //Cập nhật thông tin đọc giả (Từ)
        public ActionResult SuaDocGia(FormCollection f)
        {
            int MaNguoiDung = int.Parse(f["MaNguoiDung"]);
            QuanLyThuVienEntities data = new QuanLyThuVienEntities();
            NguoiDung ngd = (from ngds in data.NguoiDungs
                             where ngds.MaNguoiDung == MaNguoiDung
                             select ngds).First();
            ngd.HoTen = f["HoTen"];
            ngd.SoCMND = f["SoCMND"];
            ngd.TenDangNhap = f["TenDangNhap"];
            ngd.NgaySinh = DateTime.Parse(f["NgaySinh"]);
            ngd.MSSV = f["MSSV"];
            ngd.LoaiND = f["LoaiND"];
            ngd.MatKhau = f["MatKhau"];
            data.SaveChanges();
            return RedirectToAction("suadg", "Home", new { username = f["TenDangNhap"]});
        }

        //Cập nhật thông tin nhân viên (Từ)
        public ActionResult SuaNhanVien(FormCollection f)
        {
            int MaNguoiDung = int.Parse(f["MaNhanVien"]);
            QuanLyThuVienEntities data = new QuanLyThuVienEntities();
            NhanVien ngd = (from ngds in data.NhanViens
                             where ngds.MaNhanVien == MaNguoiDung
                             select ngds).First();
            ngd.HoTen = f["HoTen"];
            ngd.CMND = f["CMND"];
            ngd.TenDangNhap = f["TenDangNhap"];
            ngd.NgaySinh = DateTime.Parse(f["NgaySinh"]);
            ngd.MatKhau = f["MatKhau"];
            data.SaveChanges();
            return RedirectToAction("suadg", "Home", new { username = f["TenDangNhap"] });
        }

        //Cập nhật ảnh của người dùng (Từ)
        public ActionResult capnhatAnh(string username)
        {
            QuanLyThuVienEntities data = new QuanLyThuVienEntities();
            NguoiDung ngd = (from ngds in data.NguoiDungs
                             where ngds.TenDangNhap == username
                             select ngds).First();
            return View("~/Views/DocGia/CapNhatAnh.cshtml", ngd);
        }

        [HttpPost]
        public ActionResult cnAnh(HttpPostedFileBase file, FormCollection f)
        {
            string mand = f["TenDangNhap"];
            if (ModelState.IsValid)
            {
                string temp = "";
                if (file != null)
                {
                    var tenAnh = mand + ".png";
                    var path = Path.Combine(Server.MapPath("~/Images"), tenAnh);
                    file.SaveAs(path);
                    temp = tenAnh;
                }
            }
            return RedirectToAction("suadg", "Home", new { username = mand });
        }
    }
}
