//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace QuanLyThuVien_N8.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class NhanVien
    {
        public NhanVien()
        {
            this.DonHangs = new HashSet<DonHang>();
            this.PhieuMuons = new HashSet<PhieuMuon>();
        }
    
        public int MaNhanVien { get; set; }
        public string HoTen { get; set; }
        public string CMND { get; set; }
        public Nullable<System.DateTime> NgaySinh { get; set; }
        public string LoaiNV { get; set; }
        public string SDT { get; set; }
        public string TenDangNhap { get; set; }
        public string MatKhau { get; set; }
        public Nullable<int> DeleteFlag { get; set; }
    
        public virtual ICollection<DonHang> DonHangs { get; set; }
        public virtual ICollection<PhieuMuon> PhieuMuons { get; set; }
    }
}
