USE [QuanLyThuVien]
GO
/****** Object:  Table [dbo].[ChiTietDonHang]    Script Date: 11/30/2014 8:50:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietDonHang](
	[MaChiTietDonHang] [int] NOT NULL,
	[MaDonHang] [int] NULL,
	[Stt] [int] NULL,
	[TenSach] [nvarchar](70) NULL,
	[NhanDeChinh] [nvarchar](100) NULL,
	[NhanDePhu] [nvarchar](100) NULL,
	[Gia] [float] NULL,
	[SoCuon] [int] NULL,
	[SoTrang] [int] NULL,
	[KichThuoc] [nvarchar](12) NULL,
	[NgonNgu] [nvarchar](30) NULL,
	[NamXuatBan] [int] NULL,
	[NgayMua] [date] NULL,
	[NgayGiao] [date] NULL,
	[NgayGiaoThucTe] [date] NULL,
	[TacGia] [nvarchar](30) NULL,
	[NhaXuatBan] [int] NULL,
	[Cuon] [int] NULL,
	[Tap] [int] NULL,
	[DeleteFlag] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaChiTietDonHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ChiTietPhieuMuon]    Script Date: 11/30/2014 8:50:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietPhieuMuon](
	[MaChiTietPhieuMuon] [int] NOT NULL,
	[MaSach] [int] NULL,
	[MaPhieuMuon] [int] NULL,
	[NgayTra] [datetime] NULL,
	[NgayMuon] [datetime] NULL,
	[LanMuon] [int] NULL,
	[DeleteFlag] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaChiTietPhieuMuon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DanhMuc]    Script Date: 11/30/2014 8:50:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhMuc](
	[MaDanhMuc] [int] NOT NULL,
	[TenDanhMuc] [nvarchar](50) NULL,
	[DeleteFlag] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDanhMuc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DonHang]    Script Date: 11/30/2014 8:50:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonHang](
	[MaDonHang] [int] NOT NULL,
	[TongTien] [float] NULL,
	[NgayMua] [date] NULL,
	[NhanVienLap] [int] NULL,
	[DeleteFlag] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDonHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GopY]    Script Date: 11/30/2014 8:50:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GopY](
	[MaGopY] [int] NOT NULL,
	[NguoiGopY] [nvarchar](30) NULL,
	[TimeGopY] [datetime] NULL,
	[Email] [nvarchar](30) NULL,
	[NguoiDungGopY] [int] NULL,
	[NoiDungGopY] [text] NULL,
	[DaXem] [int] NULL,
	[DeleteFlag] [int] NULL,
 CONSTRAINT [PK__GopY__7EC2B73171CD3982] PRIMARY KEY CLUSTERED 
(
	[MaGopY] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NguoiDung]    Script Date: 11/30/2014 8:50:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NguoiDung](
	[MaNguoiDung] [int] IDENTITY(1,1) NOT NULL,
	[HoTen] [nvarchar](30) NULL,
	[SoCMND] [varchar](9) NULL,
	[NgaySinh] [date] NULL,
	[MSSV] [nvarchar](7) NULL,
	[NgayHetHan] [date] NULL,
	[LoaiND] [nvarchar](20) NULL,
	[TenDangNhap] [nvarchar](30) NULL,
	[MatKhau] [nvarchar](30) NULL,
	[AnhDaiDien] [nvarchar](100) NULL,
	[NgayDangKy] [date] NULL,
	[DeleteFlag] [int] NULL,
 CONSTRAINT [PK__NguoiDun__C539D7623410024F] PRIMARY KEY CLUSTERED 
(
	[MaNguoiDung] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 11/30/2014 8:50:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MaNhanVien] [int] NOT NULL,
	[HoTen] [nvarchar](30) NULL,
	[CMND] [varchar](9) NULL,
	[NgaySinh] [date] NULL,
	[LoaiNV] [nvarchar](20) NULL,
	[SDT] [nvarchar](11) NULL,
	[TenDangNhap] [nvarchar](20) NULL,
	[MatKhau] [nvarchar](20) NULL,
	[DeleteFlag] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNhanVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NhaXuatBan]    Script Date: 11/30/2014 8:50:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaXuatBan](
	[MaNhaXuatBan] [int] NOT NULL,
	[TenNhaXuatBan] [nvarchar](30) NULL,
	[DiaChi] [nvarchar](30) NULL,
	[SoTaiKhoan] [nvarchar](15) NULL,
	[SoDienThoai] [nvarchar](11) NULL,
	[Email] [nvarchar](30) NULL,
	[Website] [nvarchar](30) NULL,
	[DeleteFlag] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNhaXuatBan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Phat]    Script Date: 11/30/2014 8:50:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Phat](
	[MaPhat] [int] NOT NULL,
	[ChiTietPhieuMuon] [int] NULL,
	[QuyDinhPhat] [int] NULL,
	[NgayNopPhat] [datetime] NULL,
	[SoTienNop] [float] NULL,
	[NguoiThu] [int] NULL,
	[DeleteFlag] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaPhat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PhieuMuon]    Script Date: 11/30/2014 8:50:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuMuon](
	[MaPhieuMuon] [int] NOT NULL,
	[NhanVien] [int] NULL,
	[NguoiMuon] [int] NULL,
	[NgayMuon] [datetime] NULL,
	[NgayTra] [datetime] NULL,
	[SoLuongSach] [int] NULL,
	[TinhTrangMuon] [int] NULL,
	[DeleteFlag] [int] NULL,
 CONSTRAINT [PK__PhieuMuo__C4C8222229B0ED98] PRIMARY KEY CLUSTERED 
(
	[MaPhieuMuon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QuyDinhPhat]    Script Date: 11/30/2014 8:50:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuyDinhPhat](
	[MaQuyDinhPhat] [int] NOT NULL,
	[MoTa] [nvarchar](50) NULL,
	[SoTien] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaQuyDinhPhat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sach]    Script Date: 11/30/2014 8:50:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sach](
	[MaSach] [int] NOT NULL,
	[TenSach] [nvarchar](70) NULL,
	[NhanDeChinh] [nvarchar](100) NULL,
	[NhanDePhu] [nvarchar](100) NULL,
	[NamXuatBan] [date] NULL,
	[TinhTrangSach] [nvarchar](100) NULL,
	[TinhTrangMuon] [int] NULL,
	[GiaSach] [float] NULL,
	[KichThuoc] [nvarchar](12) NULL,
	[NgonNgu] [nvarchar](30) NULL,
	[Cuon] [int] NULL,
	[Tap] [int] NULL,
	[XemTruoc] [nvarchar](100) NULL,
	[TomTat] [text] NULL,
	[TacGia] [int] NULL,
	[NhaXuatBan] [int] NULL,
	[MaDanhMuc] [int] NULL,
	[DeleteFlag] [int] NULL,
 CONSTRAINT [PK__Sach__B235742D1AFC8226] PRIMARY KEY CLUSTERED 
(
	[MaSach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TacGia]    Script Date: 11/30/2014 8:50:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TacGia](
	[MaTacGia] [int] NOT NULL,
	[TenTacGia] [nvarchar](30) NULL,
	[QuocTich] [nvarchar](30) NULL,
	[NamSinh] [date] NULL,
	[TenVietTat] [nvarchar](10) NULL,
	[DeleteFlag] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaTacGia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[NguoiDung] ON 

INSERT [dbo].[NguoiDung] ([MaNguoiDung], [HoTen], [SoCMND], [NgaySinh], [MSSV], [NgayHetHan], [LoaiND], [TenDangNhap], [MatKhau], [AnhDaiDien], [NgayDangKy], [DeleteFlag]) VALUES (1, N'Tài', N'35345', CAST(0x00000000 AS Date), N'1112345', CAST(0x00000000 AS Date), N'Sinh Viên Trường', N'1112345', N'1112345', N'/Images/1112345.png', CAST(0x00000000 AS Date), 0)
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [HoTen], [SoCMND], [NgaySinh], [MSSV], [NgayHetHan], [LoaiND], [TenDangNhap], [MatKhau], [AnhDaiDien], [NgayDangKy], [DeleteFlag]) VALUES (2, N'Trần B', N'234545', CAST(0x00000000 AS Date), N'1112323', CAST(0x00000000 AS Date), N'Sinh Viên Trường', N'1112323', N'1112323', N'~/Images/1112323.png', CAST(0x00000000 AS Date), 0)
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [HoTen], [SoCMND], [NgaySinh], [MSSV], [NgayHetHan], [LoaiND], [TenDangNhap], [MatKhau], [AnhDaiDien], [NgayDangKy], [DeleteFlag]) VALUES (3, N'Phan', N'6547567', CAST(0x00000000 AS Date), N'0888741', CAST(0x00000000 AS Date), N'Cán Bộ Trường', N'0888741', N'0888741', N'~/Images/0888741.png', CAST(0x00000000 AS Date), 0)
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [HoTen], [SoCMND], [NgaySinh], [MSSV], [NgayHetHan], [LoaiND], [TenDangNhap], [MatKhau], [AnhDaiDien], [NgayDangKy], [DeleteFlag]) VALUES (4, N'Trần Tiến', N'345668', CAST(0x00000000 AS Date), N'54354', CAST(0x00000000 AS Date), N'Cán Bộ Trường', N'54354', N'54354', N'~/Images/54354.png', CAST(0x00000000 AS Date), 0)
INSERT [dbo].[NguoiDung] ([MaNguoiDung], [HoTen], [SoCMND], [NgaySinh], [MSSV], [NgayHetHan], [LoaiND], [TenDangNhap], [MatKhau], [AnhDaiDien], [NgayDangKy], [DeleteFlag]) VALUES (5, N'Nguyễn T', N'24234', CAST(0xC1AD1000 AS Date), N'1112222', CAST(0x693A0B00 AS Date), N'Sinh Viên Trường', N'1112222', N'1112222', N'', CAST(0x00000000 AS Date), 0)
SET IDENTITY_INSERT [dbo].[NguoiDung] OFF
INSERT [dbo].[Sach] ([MaSach], [TenSach], [NhanDeChinh], [NhanDePhu], [NamXuatBan], [TinhTrangSach], [TinhTrangMuon], [GiaSach], [KichThuoc], [NgonNgu], [Cuon], [Tap], [XemTruoc], [TomTat], [TacGia], [NhaXuatBan], [MaDanhMuc], [DeleteFlag]) VALUES (100001, N'CSDL', N'123', N'123', CAST(0x94360B00 AS Date), N'Mới', 1, 12000, N'123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Sach] ([MaSach], [TenSach], [NhanDeChinh], [NhanDePhu], [NamXuatBan], [TinhTrangSach], [TinhTrangMuon], [GiaSach], [KichThuoc], [NgonNgu], [Cuon], [Tap], [XemTruoc], [TomTat], [TacGia], [NhaXuatBan], [MaDanhMuc], [DeleteFlag]) VALUES (100002, N'PTUD HTTT', N'213', N'213', CAST(0x94360B00 AS Date), N'Cũ', 0, 123123, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD  CONSTRAINT [fk_ChiTietDonHang_DonHang] FOREIGN KEY([MaDonHang])
REFERENCES [dbo].[DonHang] ([MaDonHang])
GO
ALTER TABLE [dbo].[ChiTietDonHang] CHECK CONSTRAINT [fk_ChiTietDonHang_DonHang]
GO
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD  CONSTRAINT [fk_ChiTietDonHang_NXB] FOREIGN KEY([NhaXuatBan])
REFERENCES [dbo].[NhaXuatBan] ([MaNhaXuatBan])
GO
ALTER TABLE [dbo].[ChiTietDonHang] CHECK CONSTRAINT [fk_ChiTietDonHang_NXB]
GO
ALTER TABLE [dbo].[ChiTietPhieuMuon]  WITH CHECK ADD  CONSTRAINT [fk_CtPhieuMuon_PhieuMuon] FOREIGN KEY([MaPhieuMuon])
REFERENCES [dbo].[PhieuMuon] ([MaPhieuMuon])
GO
ALTER TABLE [dbo].[ChiTietPhieuMuon] CHECK CONSTRAINT [fk_CtPhieuMuon_PhieuMuon]
GO
ALTER TABLE [dbo].[ChiTietPhieuMuon]  WITH CHECK ADD  CONSTRAINT [fk_CtPhieuMuon_Sach] FOREIGN KEY([MaSach])
REFERENCES [dbo].[Sach] ([MaSach])
GO
ALTER TABLE [dbo].[ChiTietPhieuMuon] CHECK CONSTRAINT [fk_CtPhieuMuon_Sach]
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD  CONSTRAINT [fk_DonHang_NhanVien] FOREIGN KEY([NhanVienLap])
REFERENCES [dbo].[NhanVien] ([MaNhanVien])
GO
ALTER TABLE [dbo].[DonHang] CHECK CONSTRAINT [fk_DonHang_NhanVien]
GO
ALTER TABLE [dbo].[GopY]  WITH CHECK ADD  CONSTRAINT [fk_Gopy_NguoiDung] FOREIGN KEY([NguoiDungGopY])
REFERENCES [dbo].[NguoiDung] ([MaNguoiDung])
GO
ALTER TABLE [dbo].[GopY] CHECK CONSTRAINT [fk_Gopy_NguoiDung]
GO
ALTER TABLE [dbo].[Phat]  WITH CHECK ADD  CONSTRAINT [fk_Phat_CTPhieuMuon] FOREIGN KEY([ChiTietPhieuMuon])
REFERENCES [dbo].[ChiTietPhieuMuon] ([MaChiTietPhieuMuon])
GO
ALTER TABLE [dbo].[Phat] CHECK CONSTRAINT [fk_Phat_CTPhieuMuon]
GO
ALTER TABLE [dbo].[Phat]  WITH CHECK ADD  CONSTRAINT [fk_Phat_QDPhat] FOREIGN KEY([QuyDinhPhat])
REFERENCES [dbo].[QuyDinhPhat] ([MaQuyDinhPhat])
GO
ALTER TABLE [dbo].[Phat] CHECK CONSTRAINT [fk_Phat_QDPhat]
GO
ALTER TABLE [dbo].[PhieuMuon]  WITH CHECK ADD  CONSTRAINT [fk_PhieuMuon_NguoiDung] FOREIGN KEY([NguoiMuon])
REFERENCES [dbo].[NguoiDung] ([MaNguoiDung])
GO
ALTER TABLE [dbo].[PhieuMuon] CHECK CONSTRAINT [fk_PhieuMuon_NguoiDung]
GO
ALTER TABLE [dbo].[PhieuMuon]  WITH CHECK ADD  CONSTRAINT [fk_PhieuMuon_NhanVien] FOREIGN KEY([NhanVien])
REFERENCES [dbo].[NhanVien] ([MaNhanVien])
GO
ALTER TABLE [dbo].[PhieuMuon] CHECK CONSTRAINT [fk_PhieuMuon_NhanVien]
GO
ALTER TABLE [dbo].[Sach]  WITH CHECK ADD  CONSTRAINT [fk_Sach_DanhMuc] FOREIGN KEY([MaDanhMuc])
REFERENCES [dbo].[DanhMuc] ([MaDanhMuc])
GO
ALTER TABLE [dbo].[Sach] CHECK CONSTRAINT [fk_Sach_DanhMuc]
GO
ALTER TABLE [dbo].[Sach]  WITH CHECK ADD  CONSTRAINT [fk_Sach_NhaXuatBan] FOREIGN KEY([NhaXuatBan])
REFERENCES [dbo].[NhaXuatBan] ([MaNhaXuatBan])
GO
ALTER TABLE [dbo].[Sach] CHECK CONSTRAINT [fk_Sach_NhaXuatBan]
GO
ALTER TABLE [dbo].[Sach]  WITH CHECK ADD  CONSTRAINT [fk_Sach_TacGia] FOREIGN KEY([TacGia])
REFERENCES [dbo].[TacGia] ([MaTacGia])
GO
ALTER TABLE [dbo].[Sach] CHECK CONSTRAINT [fk_Sach_TacGia]
GO
