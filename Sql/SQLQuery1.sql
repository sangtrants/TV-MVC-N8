create database QuanLyThuVien
go
use QuanLyThuVien
go
create table TacGia(
	MaTacGia int primary key,
	TenTacGia nvarchar(30),
	QuocTich nvarchar(30),
	NamSinh date,
	TenVietTat nvarchar(10)
);
create table Sach(
	MaSach int primary key,
	TenSach nvarchar(70),
	NhanDeChinh nvarchar(100),
	NhanDePhu nvarchar(100),
	NamXuatBan date,
	TinhTrangSach nvarchar(100),
	TinhTrangMuon bit,
	GiaSach float,
	KichThuoc nvarchar(12),
	NgonNgu nvarchar(30),
	Cuon int,
	Tap int,
	XemTruoc nvarchar(100),
	TomTat text,
	TacGia int,---------
	NhaXuatBan int,---------
	MaDanhMuc int--------
);

create table NhanVien(
	MaNhanVien int primary key,
	HoTen nvarchar(30),
	CMND varchar(9),
	NgaySinh date,
	LoaiNV nvarchar(20),
	SDT nvarchar(11),
	TenDangNhap nvarchar(20),
	MatKhau nvarchar(20),
);

create table NhaXuatBan(
	MaNhaXuatBan int primary key,
	TenNhaXuatBan nvarchar(30),
	DiaChi nvarchar(30),
	SoTaiKhoan nvarchar(15),
	SoDienThoai nvarchar(11),
	Email nvarchar(30),
	Website nvarchar(30)
);
create table DonHang(
	MaDonHang int primary key,
	TongTien float,
	NgayMua date,
	NhanVienLap int,
);
create table ChiTietDonHang(
	MaChiTietDonHang int primary key,
	MaDonHang int,
	Stt int,
	TenSach nvarchar(70),
	NhanDeChinh nvarchar(100),
	NhanDePhu nvarchar(100),
	Gia float,
	SoCuon int,
	SoTrang int,
	KichThuoc nvarchar(12),
	NgonNgu nvarchar(30),
	NamXuatBan int,
	NgayMua date,
	NgayGiao date,
	NgayGiaoThucTe date,
	TacGia nvarchar(30),
	NhaXuatBan int,
	Cuon int,
	Tap int
);
create table NguoiDung (
	MaNguoiDung int primary key,
	HoTen nvarchar(30),
	SoCMND varchar(9),
	NgaySinh date,
	MSSV nvarchar(7),
	NgayHetHan date,
	LoaiND nvarchar(20),
	TenDangNhap nvarchar(30),
	MatKhau nvarchar(30)
);

create table GopY(
	MaGopY int primary key,
	NguoiGopY nvarchar(30),
	TimeGopY datetime,
	Email nvarchar(30),
	NguoiDungGopY int,
	NoiDungGopY text,
	DaXem bit,
);
create table PhieuMuon(
	MaPhieuMuon int primary key,
	NhanVien int,
	NguoiMuon int,
	NgayMuon datetime,
	NgayTra datetime,
	SoLuongSach int,
	TinhTrangMuon bit,
);
create table ChiTietPhieuMuon(
	MaChiTietPhieuMuon int primary key,
	MaSach int,
	MaPhieuMuon int,
	NgayTra datetime,
	NgayMuon datetime,
	LanMuon int
); 
create table QuyDinhPhat(
	MaQuyDinhPhat int primary key,
	MoTa nvarchar(50),
	SoTien float
);
create table Phat(
	MaPhat int primary key,
	ChiTietPhieuMuon int,
	QuyDinhPhat int,
	NgayNopPhat datetime,
	SoTienNop float,
	NguoiThu int
);

create table DanhMuc(
	MaDanhMuc int primary key,
	TenDanhMuc nvarchar(50)
)
--SACH
alter table Sach add CONSTRAINT fk_Sach_TacGia FOREIGN KEY (TacGia) REFERENCES TacGia(MaTacGia)

alter table Sach 
add CONSTRAINT fk_Sach_NhaXuatBan FOREIGN KEY (NhaXuatBan)
	REFERENCES NhaXuatBan(MaNhaXuatBan)

alter table Sach 
add CONSTRAINT fk_Sach_DanhMuc FOREIGN KEY (MaDanhMuc)
	REFERENCES DanhMuc(MaDanhMuc)
-- DON HANG
alter table DonHang
add CONSTRAINT fk_DonHang_NhanVien FOREIGN KEY (NhanVienLap)
	REFERENCES NhanVien(MaNhanVien)
--CHI TIET DON HANG
alter table ChiTietDonHang 
add CONSTRAINT fk_ChiTietDonHang_DonHang FOREIGN KEY (MaDonHang)
	REFERENCES DonHang(MaDonHang)
	
alter table ChiTietDonHang 
add CONSTRAINT fk_ChiTietDonHang_NXB FOREIGN KEY (NhaXuatBan)
	REFERENCES NhaXuatBan(MaNhaXuatBan)

--GOP Y
alter table GopY
add CONSTRAINT fk_Gopy_NguoiDung FOREIGN KEY (NguoiDungGopY)
	REFERENCES NguoiDung(MaNguoiDung)
--PHIEU MUON
alter table PhieuMuon 
add CONSTRAINT fk_PhieuMuon_NhanVien FOREIGN KEY (NhanVien)
	REFERENCES NhanVien(MaNhanVien)
	
alter table PhieuMuon 
add CONSTRAINT fk_PhieuMuon_NguoiDung FOREIGN KEY (NguoiMuon)
	REFERENCES NguoiDung(MaNguoiDung)
	
---PHAT
alter table Phat
add CONSTRAINT fk_Phat_CTPhieuMuon FOREIGN KEY (ChiTietPhieuMuon)
	REFERENCES ChiTietPhieuMuon(MaChiTietPhieuMuon)

alter table Phat
add CONSTRAINT fk_Phat_QDPhat FOREIGN KEY (QuyDinhPhat)
	REFERENCES QuyDinhPhat(MaQuyDinhPhat)
--CHI TIẾT PHIẾU MƯỢN
alter table ChiTietPhieuMuon
add CONSTRAINT fk_CtPhieuMuon_PhieuMuon FOREIGN KEY (MaPhieuMuon)
	REFERENCES PhieuMuon(MaPhieuMuon)

alter table ChiTietPhieuMuon
add CONSTRAINT fk_CtPhieuMuon_Sach FOREIGN KEY (MaSach)
	REFERENCES Sach(MaSach)