DROP DATABASE IF EXISTS furama_resort;
CREATE DATABASE IF NOT EXISTS furama_resort;
USE furama_resort;

CREATE TABLE vi_tri (
    id_vi_tri INT PRIMARY KEY AUTO_INCREMENT,
    ten_vi_tri VARCHAR(45)
);
CREATE TABLE trinh_do (
    id_trinh_do INT PRIMARY KEY AUTO_INCREMENT,
    ten_trinh_do VARCHAR(45)
);
CREATE TABLE bo_phan (
    id_bo_phan INT PRIMARY KEY AUTO_INCREMENT,
    ten_bo_phan VARCHAR(45)
);
CREATE TABLE loai_khach (
    id_loai_khach INT PRIMARY KEY AUTO_INCREMENT,
    ten_loai_khach VARCHAR(45)
);
CREATE TABLE kieu_thue (
    id_kieu_thue INT PRIMARY KEY AUTO_INCREMENT,
    ten_kieu_thue VARCHAR(45),
    gia INT
);
CREATE TABLE loai_dich_vu (
    id_loai_dich_vu INT PRIMARY KEY AUTO_INCREMENT,
    ten_loai_dich_vu VARCHAR(45)
);
CREATE TABLE dich_vu_di_kem (
    id_dich_vu_di_kem INT PRIMARY KEY AUTO_INCREMENT,
    ten_dich_vu_di_kem VARCHAR(45),
    gia INT,
    don_vi INT,
    trang_thai_kha_dung VARCHAR(45)
);
CREATE TABLE nhan_vien (
    id_nhan_vien INT PRIMARY KEY AUTO_INCREMENT,
    ho_va_ten VARCHAR(45),
    id_vi_tri INT,
    id_trinh_do INT,
    id_bo_phan INT,
    ngay_sinh DATE,
    so_cmnd VARCHAR(45),
    luong INT,
    so_dien_thoai VARCHAR(10),
    email VARCHAR(45),
    dia_chi VARCHAR(45),
    FOREIGN KEY (id_vi_tri)
        REFERENCES vi_tri (id_vi_tri)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (id_trinh_do)
        REFERENCES trinh_do (id_trinh_do)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (id_bo_phan)
        REFERENCES bo_phan (id_bo_phan)
        ON UPDATE CASCADE ON DELETE CASCADE
);
CREATE TABLE khach_hang (
    id_khach_hang INT PRIMARY KEY AUTO_INCREMENT,
    id_loai_khach INT,
    ho_va_ten VARCHAR(45),
    ngay_sinh DATE,
    so_CMND VARCHAR(45),
    so_dien_thoai VARCHAR(10),
    email VARCHAR(45),
    dia_chi VARCHAR(45),
    FOREIGN KEY (id_loai_khach)
        REFERENCES loai_khach (id_loai_khach)
        ON UPDATE CASCADE ON DELETE CASCADE
);
CREATE TABLE dich_vu (
    id_dich_vu INT PRIMARY KEY AUTO_INCREMENT,
    ten_dich_vu VARCHAR(45),
    dien_tich INT,
    so_tang INT,
    so_nguoi_toi_da INT,
    chi_phi_thue INT,
    id_kieu_thue INT,
    id_loai_dich_vu INT,
    trang_thai VARCHAR(45),
    FOREIGN KEY (id_kieu_thue)
        REFERENCES kieu_thue (id_kieu_thue)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (id_loai_dich_vu)
        REFERENCES loai_dich_vu (id_loai_dich_vu)
        ON UPDATE CASCADE ON DELETE CASCADE
);
CREATE TABLE hop_dong (
    id_hop_dong INT PRIMARY KEY AUTO_INCREMENT,
    id_nhan_vien INT,
    id_khach_hang INT,
    id_dich_vu INT,
    ngay_lam_hop_dong DATE,
    ngay_ket_thuc DATE,
    tien_dat_coc INT,
    tong_tien INT,
    FOREIGN KEY (id_nhan_vien)
        REFERENCES nhan_vien (id_nhan_vien)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (id_khach_hang)
        REFERENCES khach_hang (id_khach_hang)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (id_dich_vu)
        REFERENCES dich_vu (id_dich_vu)
        ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE hop_dong_chi_tiet (
    id_hop_dong_chi_tiet INT PRIMARY KEY AUTO_INCREMENT,
    so_luong INT,
    id_hop_dong INT,
    id_dich_vu_di_kem INT,
    FOREIGN KEY (id_hop_dong)
        REFERENCES hop_dong (id_hop_dong)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (id_dich_vu_di_kem)
        REFERENCES dich_vu_di_kem (id_dich_vu_di_kem)
        ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO bo_phan( ten_bo_phan)
VALUES	('sale_marketing'),
		('hanh_chinh'),
		('phuc_vu'),
        ('quan_ly');
INSERT INTO trinh_do(ten_trinh_do)
VALUES 	('trung cap'),
		('cao dang'),
		('dai hoc'),
		('sau dai hoc');
INSERT INTO vi_tri(ten_vi_tri)
VALUES 	('le tan'),
		('phuc vu'),
		('chuyen vien'),
		('giam sat'),
		('quan ly'),
		('giam doc');
INSERT INTO loai_khach(ten_loai_khach)
VALUES 	('Diamond'),
		('Platinium'),
		('Gold'),
		('Silver'),
		('Member');
INSERT INTO kieu_thue(ten_kieu_thue,gia)
VALUES 	('Nam',300),
		('Thang',20),
		('Ngay',5),
		('Gio',1);
INSERT INTO loai_dich_vu(ten_loai_dich_vu)
VALUES 	('Villa'),
		('House'),
		('Room');
    SET FOREIGN_KEY_CHECKS=0;
INSERT INTO nhan_vien(ho_va_ten,id_vi_tri,id_trinh_do,id_bo_phan,
						ngay_sinh,so_cmnd,luong,so_dien_thoai,email
                        ,dia_chi)
		VALUES ('Tran Van Thanh',1,1,1,'1990-3-23','201605555',
        1500000,'0912111111','van.anh@gmail.com','ha noi'),
        ('Nguyen Huong',2,2,2,'1995-11-2','201601111',
        5000000,'0912222222','ngochuong@gmail.com','da nang'),
        ('La Van Khanh',3,3,3,'1998-2-11','101801111',
        10000000,'0912333333','khanh.dang@gmail.com','ho chi minh'),
         ('Tran Thi Ngoc Tinh',1,2,3,'1992-12-15','131801111',
        12000000,'0912444444','tinh.tran@gmail.com','Quang Tri'),
        ('Tran Thi Ngoc Minh',1,2,3,'1952-12-15','191801111',
        12000000,'0912555444','minh.tran@gmail.com','ho chi minh'),
        ('Tran Van Tien',1,2,1,'1995-01-12','201505555',
        1500000,'0751123321','tien.tran@gmail.com','Hải Châu'),
        ('Nguyen Thi Thu Ha',1,1,3,'1999-01-22','202605555',
        1500000,'0333154451','ha.nguyen@gmail.com','Hải Châu'),
        ('Tran Van Hai',1,2,1,'1965-01-12','121515555',
        1500000,'0725123321','haihai@gmail.com','Hải Châu'),
        ('Nguyen Thi Thu Suong',1,1,3,'1979-01-22','162605555',
        1500000,'0332254451','suongnguyen@gmail.com','Hải Châu');
      
  
   
	INSERT INTO khach_hang(id_loai_khach,
	ho_va_ten,ngay_sinh,so_CMND,so_dien_thoai,email,dia_chi)
VALUES
(1,'Tran Van Hanh','2000-12-31','200101333','0123455552','van.hanh@gmail.com','Quảng Trị'),
(1,'Tran Van Kien','2000-07-02','211101333','0333455552','kien.tran@gmail.com','Đà Nẵng'),
(2,'Trinh Dung','1970-05-31','120101333','0123455111','dung.trinh@gmail.com','Đà Nẵng'),
(3,'Nguyen Van Binh','1980-06-30','150101333','0123225111','binh.nguyen@gmail.com','Hà Nội'),
(4,'Ha Thu Thuy','1985-07-22','160101333','0123455911','thuy.ha@gmail.com','Sài Gòn'),
(1,'Tran Van Kien','1981-06-21','160101433','0123457911','kienkien@gmail.com','Sài Gòn'),
(1,'Tran Van Kien','1995-02-22','160105313','0123458901','kien.tran@gmail.com','Quảng Ngãi'),
(1,'Nguyen Van Minh','1995-01-23','160105303','0123458921','minhvan@gmail.com','Vinh'),
(2,'Tran Thi Diem','2005-08-24','160105383','0123458991','thidiem@gmail.com','Quảng Ngãi'),
(3,'Tran Thi Dao','2001-02-02','260605383','0123118991','dao.tran@gmail.com','Quảng Ngãi'),
(4,'Tran Thi Vy','2002-05-23','261155383','0124589910','vy.thi@gmail.com','Vinh');
 INSERT INTO dich_vu_di_kem(ten_dich_vu_di_kem,gia,don_vi,trang_thai_kha_dung)
 VALUES( 'massage',5000000,1,'Đang sử dụng'),
		( 'karaoke',2000000,1,'Đang sử dụng'),
        ( 'thức ăn',500000,1,'Đang sử dụng'),
        ( 'nước uống',100000,1,'Đang sử dụng'),
        ( 'tham quan',1000000,1,'Đang sử dụng'),
        ('gym',500000,1,'Đang sử dụng');
	
 INSERT INTO dich_vu(ten_dich_vu,dien_tich,so_tang,so_nguoi_toi_da,chi_phi_thue,id_kieu_thue,id_loai_dich_vu,trang_thai)
 VALUES('thue_villa',500,3,20,5000000,1,1,'dang su dung'),
		('thue_villa',500,3,20,1000000,2,1,'dang su dung'),
        ('thue_villa',400,3,20,5000000,1,1,'dang su dung'),
        ('thue_villa',400,3,20,5000000,1,1,'dang su dung'),
        ('thue_villa',400,3,20,5000000,1,1,'dang su dung'),
        ('thue_villa',500,3,20,2000000,3,1,'dang su dung'),
        ('thue_villa',500,3,20,100000,4,1,'dang su dung'),
        ('thue_house',200,2,10,2000000,1,2,'dang su dung'),
        ('thue_house',200,2,10,200000,2,2,'dang su dung'),
        ('thue_house',200,2,10,100000,3,2,'dang su dung'),
        ('thue_house',200,2,10,50000,4,2,'dang su dung'),
        ('thue_room',100,1,5,1000000,1,3,'dang su dung'),
        ('thue_room',100,1,5,100000,2,3,'dang su dung'),
        ('thue_room',100,1,5,50000,3,3,'dang su dung'),
        ('thue_room',100,1,5,20000,4,3,'dang su dung');
     
INSERT INTO hop_dong(id_nhan_vien,id_khach_hang,id_dich_vu,
   ngay_lam_hop_dong,ngay_ket_thuc,tien_dat_coc,tong_tien)
   VALUES	(1,2,12,'2021-01-24','2021-10-25',5000000,5000000),
			(2,1,9,'2018-02-24','2021-10-25',2000000,5000000),
			(3,3,8,'2019-03-19','2021-10-25',1000000,1000000),
            (3,3,7,'2019-04-23','2021-10-25',1000000,1000000),
			(1,3,7,'2019-04-23','2021-10-25',1000000,1000000),
			(2,3,7,'2019-04-23','2021-10-25',1000000,1000000),
			(6,3,7,'2019-12-12','2021-10-25',1000000,1000000),
			(7,3,7,'2019-12-12','2021-10-25',1000000,1000000),
			(8,3,7,'2019-04-23','2021-10-25',1000000,1000000),
			(9,3,7,'2019-04-23','2021-10-25',1000000,1000000),
            (3,9,6,'2019-05-27','2021-10-25',1000000,1000000),
            (3,4,5,'2019-06-26','2021-10-25',1000000,1000000),
            (3,3,4,'2019-02-02','2021-10-25',1000000,1000000),
            (3,2,3,'2019-08-05','2021-10-25',1000000,1000000),
            (3,1,2,'2019-09-06','2021-10-25',1000000,1000000),
            (3,6,1,'2019-09-08','2021-10-25',1000000,1000000),
            (3,7,10,'2019-09-17','2021-10-25',1000000,1000000),
            (3,5,11,'2019-011-14','2021-10-25',1000000,1000000),
            (3,3,13,'2019-09-15','2021-10-25',1000000,1000000),
            (3,3,1,'2019-10-22','2021-10-25',1000000,1000000),
			(3,3,1,'2019-06-23','2021-10-25',1000000,1000000),
			(3,1,1,'2019-12-23','2021-10-25',1000000,1000000),
            (3,3,1,'2019-07-30','2021-10-25',1000000,1000000),
            (3,8,1,'2019-12-31','2021-10-25',1000000,1000000),
            (3,7,1,'2019-01-29','2021-10-25',1000000,1000000),
			(2,8,2,'2021-04-22','2021-10-25',2000000,5000000),
			(2,9,1,'2021-05-21','2021-10-25',2000000,5000000),
            (5,10,1,'2015-05-21','2015-10-25',2000000,5000000),
            (6,11,1,'2014-05-21','2014-10-25',2000000,5000000),
            (8,11,1,'2019-12-12','2021-12-25',2000000,5000000),
            (9,11,1,'2019-12-12','2021-12-25',2000000,5000000),
             (6,12,12,'2015-05-21','2017-10-25',2000000,5000000),
            (8,15,13,'2015-12-12','2021-12-25',2000000,5000000),
             (8,13,14,'2019-12-12','2021-12-25',2000000,5000000),
            (9,14,15,'2019-12-12','2021-12-25',2000000,5000000);
	
   INSERT INTO hop_dong_chi_tiet(so_luong,id_hop_dong,id_dich_vu_di_kem)
   VALUES 	(1,1,6),(1,5,1),(1,5,2),(1,5,3),(1,5,4),
			(1,7,1),(1,7,2),(1,7,3),(1,7,4),
			(1,19,2),(1,2,2),(1,3,2),(1,4,2),
			(1,20,3),(1,3,2),(1,4,2),(1,5,2),
			(1,21,4),(1,8,2),(1,5,2),(1,6,2),
			(1,2,5),(1,12,5),(1,11,5),(1,13,5),(1,14,5)
            ,(1,15,5),(1,2,5),(1,18,5),(1,17,5),(1,16,5),
            (1,2,5),(1,19,5),(1,11,5),(1,12,5),(1,6,5);


  SET FOREIGN_KEY_CHECKS=1; 
-- TASK 2:	Hiển thị thông tin của tất cả 
-- 			nhân viên có trong hệ thống có tên bắt đầu 
-- 			là một trong các ký tự “H”, “T” hoặc “K” và
--  		có tối đa 15 ký tự.
	USE furama_resort;
	SELECT*FROM nhan_vien
    WHERE  char_length(ho_va_ten)<=15 AND  
    ((SELECT substring_index(ho_va_ten,' ',-1)) REGEXP '^T|K|H')
    ;
-- Task 3.	Hiển thị thông tin của tất cả khách hàng 
-- 			có độ tuổi từ 18 đến 50 tuổi và có địa chỉ
-- 			ở “Đà Nẵng” hoặc “Quảng Trị”.
-- hàm trả về tuổi từ ngày sinh :  (YEAR(CURDATE()) - YEAR(ngay_sinh)) - (RIGHT(CURDATE(), 5) < RIGHT(ngay_sinh, 5))
	USE furama_resort;
	SELECT*FROM khach_hang
    WHERE  (YEAR(CURDATE()) - YEAR(ngay_sinh)) - (RIGHT(CURDATE(), 5) < RIGHT(ngay_sinh, 5))>=18 
    AND (YEAR(CURDATE()) - YEAR(ngay_sinh)) - (RIGHT(CURDATE(), 5) < RIGHT(ngay_sinh, 5))<=50 
    AND ((dia_chi LIKE 'Quảng Trị') OR (dia_chi LIKE 'Đà Nẵng'));

 -- Task 4.	Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần.
--  		Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng.
-- 		    Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.
USE furama_resort;
SELECT*FROM hop_dong;
SELECT*FROM khach_hang;
SELECT K.ho_va_ten,count(H.id_khach_hang) AS so_lan_dat_phong,L.ten_loai_khach
FROM khach_hang K JOIN hop_dong H ON K.id_khach_hang = H.id_khach_hang
	JOIN loai_khach L ON L.id_loai_khach=K.id_loai_khach
GROUP BY H.id_khach_hang
HAVING L.ten_loai_khach ="Diamond"
ORDER BY so_lan_dat_phong;
/*  Task 5.	Hiển thị IDKhachHang, HoTen, TenLoaiKhach, IDHopDong,
			TenDichVu, NgayLamHopDong, NgayKetThuc, TongTien
 		   (Với TongTien được tính theo công thức như sau:
			ChiPhiThue + SoLuong*Gia, với SoLuong và Giá là từ bảng DichVuDiKem) 
			cho tất cả các Khách hàng đã từng đặt phỏng.
			(Những Khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra). */
            SELECT*FROM hop_dong;
SELECT K.id_khach_hang,K.ho_va_ten,L.ten_loai_khach,H.id_hop_dong,D.ten_dich_vu,
		H.ngay_lam_hop_dong,H.ngay_ket_thuc,sum(D.chi_phi_thue+(C.so_luong*V.gia)) AS tong_tien
FROM khach_hang K LEFT JOIN hop_dong H ON K.id_khach_hang=H.id_khach_hang
	LEFT JOIN loai_khach L ON K.id_loai_khach= L.id_loai_khach
   LEFT  JOIN dich_vu D ON D.id_dich_vu = H.id_dich_vu
  LEFT  JOIN hop_dong_chi_tiet C ON C.id_hop_dong=H.id_hop_dong
  LEFT  JOIN dich_vu_di_kem V ON V.id_dich_vu_di_kem = C.id_dich_vu_di_kem
    GROUP BY K.id_khach_hang;
 /* Task 6.Hiển thị IDDichVu, TenDichVu, DienTich, ChiPhiThue, TenLoaiDichVu 
	của tất cả các loại Dịch vụ chưa từng được Khách hàng thực hiện đặt 
	từ quý 1 của năm 2019 (Quý 1 là tháng 1, 2, 3). */	
SELECT D.id_dich_vu, D.ten_dich_vu, D.dien_tich, D.chi_phi_thue,L.ten_loai_dich_vu,H.ngay_lam_hop_dong
FROM dich_vu D LEFT JOIN loai_dich_vu L ON L.id_loai_dich_vu = D.id_loai_dich_vu
LEFT JOIN hop_dong H ON H.id_dich_vu=D.id_dich_vu
WHERE NOT (month(H.ngay_lam_hop_dong)=1 OR month(H.ngay_lam_hop_dong)=2
 OR month(H.ngay_lam_hop_dong)=3);
/* Task 7.	Hiển thị thông tin IDDichVu, TenDichVu, DienTich, SoNguoiToiDa, 
ChiPhiThue, TenLoaiDichVu của tất cả các loại dịch vụ đã từng được 
Khách hàng đặt phòng trong năm 2018 nhưng chưa từng 
được Khách hàng đặt phòng  trong năm 2019.
 */
 SELECT D.id_dich_vu, D.ten_dich_vu, D.dien_tich,D.so_nguoi_toi_da,
 D.chi_phi_thue,L.ten_loai_dich_vu,H.ngay_lam_hop_dong
FROM dich_vu D LEFT JOIN loai_dich_vu L ON L.id_loai_dich_vu = D.id_loai_dich_vu
LEFT JOIN hop_dong H ON H.id_dich_vu=D.id_dich_vu
WHERE ( NOT (year(H.ngay_lam_hop_dong)=2019) ) AND year(H.ngay_lam_hop_dong)=2018;
/* 
8.	Hiển thị thông tin HoTenKhachHang có trong hệ thống,
 với yêu cầu HoThenKhachHang không trùng nhau.
Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên
*/
-- Cách 1:
SELECT ho_va_ten 
FROM khach_hang
GROUP BY ho_va_ten;
-- Cách 2:
SELECT ho_va_ten
FROM khach_hang
UNION
SELECT ho_va_ten
FROM khach_hang;
-- Cách 3:
SELECT DISTINCT ho_va_ten
FROM khach_hang;

/* Task 9:	Thực hiện thống kê doanh thu theo tháng, 
nghĩa là tương ứng với mỗi tháng trong năm 2019 
thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng. */
CREATE TEMPORARY TABLE thang(
thang int primary key AUTO_INCREMENT
);
INSERT into thang()
Values(),(),(),(),(),(),(),(),(),(),(),();
SELECT*FROM thang;
SELECT DISTINCT*FROM (
SELECT count(H.id_hop_dong) AS doanh_thu 
,month(ngay_lam_hop_dong) AS thang
FROM hop_dong H
WHERE year(ngay_lam_hop_dong)=2019
GROUP BY month(ngay_lam_hop_dong)
UNION 
SELECT null, thang FROM thang) AS a ;


/*Task 10:Hiển thị thông tin tương ứng với từng 
Hợp đồng thì đã sử dụng bao nhiêu Dịch vụ đi kèm. 
Kết quả hiển thị bao gồm IDHopDong, NgayLamHopDong,
 NgayKetthuc, TienDatCoc, SoLuongDichVuDiKem 
 (được tính dựa trên việc count các IDHopDongChiTiet). */
 Use furama_resort;
 SELECT H.id_hop_dong,H.ngay_lam_hop_dong,
 H.ngay_ket_thuc,H.tien_dat_coc,count(T.id_dich_vu_di_kem) AS so_luong_dich_vu_di_kem
 FROM hop_dong H JOIN hop_dong_chi_tiet T on H.id_hop_dong=T.id_hop_dong
GROUP BY T.id_hop_dong;
/*Task 11.	Hiển thị thông tin các Dịch vụ đi kèm đã được
 sử dụng bởi những Khách hàng có TenLoaiKhachHang là “Diamond” 
 và có địa chỉ là “Vinh” hoặc “Quảng Ngãi”. */
SELECT 
    K.id_dich_vu_di_kem,
    K.ten_dich_vu_di_kem,
    K.gia,
    K.don_vi,
    K.trang_thai_kha_dung,
    G.ho_va_ten,
    G.dia_chi,
    L.ten_loai_khach
FROM dich_vu_di_kem K
        JOIN hop_dong_chi_tiet T ON K.id_dich_vu_di_kem = T.id_dich_vu_di_kem
        JOIN hop_dong H ON H.id_hop_dong = T.id_hop_dong
        JOIN khach_hang G ON H.id_khach_hang = G.id_khach_hang
        JOIN loai_khach L ON L.id_loai_khach = G.id_loai_khach
WHERE L.ten_loai_khach= "Diamond" AND (G.dia_chi = "Vinh" OR G.dia_chi="Quảng Ngãi");
/* Task 12.	Hiển thị thông tin IDHopDong, TenNhanVien, TenKhachHang, 
SoDienThoaiKhachHang, TenDichVu, SoLuongDichVuDikem 
(được tính dựa trên tổng Hợp đồng chi tiết),
 TienDatCoc của tất cả các dịch vụ đã từng được
 khách hàng đặt vào 3 tháng cuối năm 2019 nhưng 
 chưa từng được khách hàng đặt vào 6 tháng đầu năm 2019. */

SELECT  H.id_hop_dong,N.ho_va_ten AS ten_nhan_vien,
 K.ho_va_ten AS ten_khach_hang,K.so_dien_thoai,
 D.ten_dich_vu, count(T.id_dich_vu_di_kem )AS 'So luong dich vu di kem',
 H.tien_dat_coc,H.ngay_lam_hop_dong
FROM dich_vu D 
Join hop_dong H  on D.id_dich_vu = H.id_dich_vu
 JOIN  nhan_vien N on H.id_nhan_vien =N.id_nhan_vien
 JOIN khach_hang K on K.id_khach_hang=H.id_khach_hang 
 JOIN hop_dong_chi_tiet T on T.id_hop_dong = H.id_hop_dong
JOIN dich_vu_di_kem V on V.id_dich_vu_di_kem = T.id_dich_vu_di_kem
WHERE year(ngay_lam_hop_dong)=2019 AND quarter(ngay_lam_hop_dong)=4 
AND D.id_dich_vu NOT IN (SELECT  D.id_dich_vu
						FROM  dich_vu D  JOIN  hop_dong H ON D.id_dich_vu = H.id_dich_vu
						WHERE (QUARTER(H.ngay_lam_hop_dong) = 1
							OR QUARTER(H.ngay_lam_hop_dong) = 2)
							AND (YEAR(H.ngay_lam_hop_dong) = 2019))
GROUP BY T.id_hop_dong;

/* Task 13. Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất
 bởi các Khách hàng đã đặt phòng. (Lưu ý là có thể có nhiều dịch vụ có 
 số lần sử dụng nhiều như nhau).
 */
 
 SELECT T.id_dich_vu_di_kem,count(T.id_dich_vu_di_kem) AS so_lan ,K.gia,K.ten_dich_vu_di_kem
 FROM hop_dong_chi_tiet T JOIN dich_vu_di_kem K on K.id_dich_vu_di_kem=T.id_dich_vu_di_kem
 GROUP by T.id_dich_vu_di_kem
  HAVING count(T.id_dich_vu_di_kem)>= ALL ( 
  SELECT count(id_dich_vu_di_kem) FROM hop_dong_chi_tiet
 GROUP by id_dich_vu_di_kem);
 
 /* Task 14.	Hiển thị thông tin tất cả các Dịch vụ đi kèm 
 chỉ mới được sử dụng một lần duy nhất. Thông tin hiển thị
 bao gồm IDHopDong, TenLoaiDichVu, TenDichVuDiKem, SoLanSuDung. */
 SELECT T.id_hop_dong, ten_loai_dich_vu,K.ten_dich_vu_di_kem,count(T.id_dich_vu_di_kem)AS so_lan_su_dung
 FROM hop_dong H
 JOIN dich_vu D on D.id_dich_vu = H.id_dich_vu
 JOIN loai_dich_vu L on L.id_loai_dich_vu = D.id_loai_dich_vu
 JOIN hop_dong_chi_tiet T on T.id_hop_dong = H.id_hop_dong
 JOIN dich_vu_di_kem K on K.id_dich_vu_di_kem = T.id_dich_vu_di_kem
 GROUP BY K.id_dich_vu_di_kem
 Having count(K.id_dich_vu_di_kem)=1;
/* Task 15.	Hiển thi thông tin của tất cả nhân viên bao gồm 
IDNhanVien, HoTen, TrinhDo, TenBoPhan, SoDienThoai, DiaChi mới
 chỉ lập được tối đa 3 hợp đồng từ năm 2018 đến 2019. */
 SELECT N.id_nhan_vien,N.ho_va_ten, T.ten_trinh_do,B.ten_bo_phan,
 N.so_dien_thoai,N.dia_chi,count(H.id_hop_dong) AS so_lan_lam_hop_dong
 FROM nhan_vien N
 JOIN hop_dong H on H.id_nhan_vien = N.id_nhan_vien
 JOIN trinh_do T on T.id_trinh_do = N.id_trinh_do
 JOIN bo_phan B on B.id_bo_phan = N.id_bo_phan
 WHERE year(H.ngay_lam_hop_dong) BETWEEN 2018 AND 2019
 GROUP BY N.id_nhan_vien
 HAVING count(H.id_hop_dong)<=3;
 /* Task 16.Xóa những Nhân viên chưa từng lập được
 hợp đồng nào từ năm 2017 đến năm 2019.
 */
 SET SQL_SAFE_UPDATES=0;
 DELETE FROM nhan_vien
 WHERE id_nhan_vien IN 
 ( SELECT id_nhan_vien 
	FROM (SELECT* FROM nhan_vien) AS A
	WHERE id_nhan_vien NOT IN
    (	SELECT N.id_nhan_vien
		FROM  (SELECT* FROM nhan_vien ) AS N JOIN hop_dong H on N.id_nhan_vien=H.id_nhan_vien
		WHERE  YEAR(H.ngay_lam_hop_dong) BETWEEN 2017 AND 2019
		GROUP BY N.id_nhan_vien
		HAVING COUNT(H.id_hop_dong) >0));
SET SQL_SAFE_UPDATES=1;
/* Task 17.	Cập nhật thông tin những khách hàng có 
TenLoaiKhachHang từ  Platinium lên Diamond, 
chỉ cập nhật những khách hàng đã từng đặt phòng
 với tổng Tiền thanh toán trong năm 2019 là lớn hơn 10.000.000 VNĐ.
 */  
 CREATE TEMPORARY table tgg (SELECT *FROM thang);
SET SQL_SAFE_UPDATES = 0;
UPDATE khach_hang
SET id_loai_khach=1
WHERE id_khach_hang IN (SELECT id_khach_hang FROM
	  (SELECT K.id_khach_hang
            FROM khach_hang K
            JOIN loai_khach L ON K.id_loai_khach = L.id_loai_khach
            JOIN hop_dong H ON K.id_khach_hang = H.id_khach_hang
            JOIN dich_vu D ON H.id_dich_vu = D.id_dich_vu
            JOIN hop_dong_chi_tiet T ON T.id_hop_dong = H.id_hop_dong
            JOIN dich_vu_di_kem V ON V.id_dich_vu_di_kem = T.id_dich_vu_di_kem
            WHERE  (L.ten_loai_khach = 'Platinium')
					AND (YEAR(H.ngay_lam_hop_dong) = 2019)
            GROUP BY H.id_khach_hang
            HAVING SUM(D.chi_phi_thue + V.gia * V.don_vi) > 10000000) AS id_khach_hang_cap_2);
SET SQL_SAFE_UPDATES = 1;
SELECT*FROM khach_hang;

/* Task 18. Xóa những khách hàng có hợp đồng trước năm 2016 
(chú ý ràngbuộc giữa các bảng).
 */
 SELECT* FROM khach_hang;
 SET SQL_SAFE_UPDATES = 0;
DELETE 
FROM khach_hang
WHERE id_khach_hang IN ( 
	SELECT id_khach_hang FROM (
		SELECT  K.id_khach_hang
		FROM khach_hang K  JOIN
        hop_dong H ON H.id_khach_hang = K.id_khach_hang 
		WHERE
        YEAR(H.ngay_lam_hop_dong) < 2016) AS X);
 SELECT* FROM khach_hang;
 SET SQL_SAFE_UPDATES = 1;
/* Task 19:	Cập nhật giá cho các Dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2019 lên gấp đôi.*/
-- SELECT D.id_dich_vu_di_kem,D.ten_dich_vu_di_kem,gia,count(H.id_dich_vu_di_kem) AS so_lan
-- FROM hop_dong_chi_tiet H JOIN dich_vu_di_kem D on H.id_dich_vu_di_kem= D.id_dich_vu_di_kem
-- GROUP BY id_dich_vu_di_kem;

SET SQL_SAFE_UPDATES = 0;
UPDATE dich_vu_di_kem
SET gia=gia*2
WHERE id_dich_vu_di_kem IN 
(SELECT id_dich_vu_di_kem FROM (
			SELECT D.id_dich_vu_di_kem 
			FROM dich_vu_di_kem D JOIN hop_dong_chi_tiet H on H.id_dich_vu_di_kem = D.id_dich_vu_di_kem
			JOIN  hop_dong  on H.id_hop_dong = hop_dong.id_hop_dong
			Where year(hop_dong.ngay_lam_hop_dong)=2019
			GROUP BY D.id_dich_vu_di_kem
			Having count(D.id_dich_vu_di_kem)>10)AS  X );
            
/* Task 20.	Hiển thị thông tin của tất cả các Nhân viên và 
Khách hàng có trong hệ thống, thông tin hiển thị bao gồm ID 
(IDNhanVien, IDKhachHang), HoTen, Email, SoDienThoai, NgaySinh, DiaChi. */
-- cách 1:
CREATE VIEW person_view AS
SELECT id_nhan_vien,ho_va_ten,email,so_dien_thoai,ngay_sinh,dia_chi
FROM nhan_vien
UNION 
SELECT id_khach_hang,ho_va_ten,email,so_dien_thoai,ngay_sinh,dia_chi
FROM khach_hang;
SELECT*FROM person_view;
-- cách 2:
SELECT id_nhan_vien,ho_va_ten,email,so_dien_thoai,ngay_sinh,dia_chi
FROM nhan_vien
UNION ALL
SELECT id_khach_hang,ho_va_ten,email,so_dien_thoai,ngay_sinh,dia_chi
FROM khach_hang;

/* Task  21. Tạo khung nhìn có tên là V_NHANVIEN
 để lấy được thông tin của tất cả các nhân viên 
 có địa chỉ là “Hải Châu” và đã từng lập hợp đồng cho 1 
 hoặc nhiều Khách hàng bất kỳ  với ngày lập hợp đồng là “12/12/2019” */
DROP VIEW IF EXISTS V_NHANVIEN;
CREATE VIEW V_NHANVIEN AS
SELECT V.id_nhan_vien,V.ho_va_ten,V.email,V.so_dien_thoai,V.ngay_sinh,V.dia_chi
FROM nhan_vien V JOIN hop_dong H ON V.id_nhan_vien= H.id_nhan_vien
WHERE V.dia_chi = "Hải Châu" AND H.ngay_lam_hop_dong = '2019-12-12'
;
SELECT*FROM V_NHANVIEN;
/* Task 22.	Thông qua khung nhìn V_NHANVIEN thực hiện cập nhật
 địa chỉ thành “Liên Chiểu” đối với tất cả các Nhân viên được
 nhìn thấy bởi khung nhìn này.  */
 
 SET SQL_SAFE_UPDATES = 0;
UPDATE V_NHANVIEN 
SET V_NHANVIEN.dia_chi="Liên Chiểu"
;
 SET SQL_SAFE_UPDATES = 1;

 /* Task 23:	Tạo Store procedure Sp_1 Dùng để xóa thông tin 
 của một Khách hàng nào đó với Id Khách hàng được truyền 
 vào như là 1 tham số của Sp_1 */
 USE furama_resort;
 DROP PROCEDURE IF EXISTS Sp_1;
 DELIMITER $$
 CREATE PROCEDURE  Sp_1(
 IN in_id INT
 )
 BEGIN
 DELETE FROM khach_hang
 WHERE khach_hang.id_khach_hang=in_id;
 SELECT*FROM khach_hang;
 END $$
 DELIMITER ; 
 SELECT*FROM khach_hang;
 CALL Sp_1(5);

/* Task 24:	Tạo Store procedure Sp_2 Dùng để thêm mới 
vào bảng HopDong với yêu cầu Sp_2 phải thực hiện kiểm tra 
tính hợp lệ của dữ liệu bổ sung, với nguyên tắc không được
 trùng khóa chính và đảm bảo toàn vẹn tham chiếu đến các bảng liên quan.*/	
USE furama_resort;
 DROP PROCEDURE IF EXISTS Sp_2;
 
 DELIMITER $$
 CREATE PROCEDURE  Sp_2(
 IN id_nhan_vien INT ,
 IN id_khach_hang INT,
 IN id_dich_vu INT,
 IN ngay_lam_hop_dong DATE,
 IN ngay_ket_thuc DATE,
 IN tien_dat_coc INT,
 IN tong_tien INT
 )
 BEGIN
INSERT INTO  hop_dong(id_nhan_vien,id_khach_hang,id_dich_vu,
   ngay_lam_hop_dong,ngay_ket_thuc,tien_dat_coc,tong_tien)
   VALUES	(id_nhan_vien,id_khach_hang,id_dich_vu,
			ngay_lam_hop_dong,ngay_ket_thuc,tien_dat_coc,tong_tien);
 END $$
 DELIMITER ;
 CALL Sp_2 ( 9,5,7,'2021-09-27','2021-09-30',5000000,15000000);

USE furama_resort;
/* Task 25. Tạo triggers có tên Tr_1 Xóa bản ghi trong bảng HopDong 
thì hiển thị tổng số lượng bản ghi còn lại có trong bảng HopDong ra giao diện console của database */
-- DROP TRIGGER Tr_1;
DELIMITER //
	CREATE TRIGGER Tr_1 AFTER DELETE  ON hop_dong
	FOR EACH ROW
 BEGIN
		SET @a = (SELECT count(id_hop_dong) 
				FROM hop_dong);
END //
DELIMITER ;

SET SQL_SAFE_UPDATES = 0;
DELETE FROM hop_dong
WHERE id_hop_dong=30;
SET SQL_SAFE_UPDATES = 1;
SELECT @a;


/* Task 26.Tạo triggers có tên Tr_2 Khi cập nhật Ngày kết thúc hợp đồng,
 cần kiểm tra xem thời gian cập nhật có phù hợp hay không, với quy tắc sau: 
 Ngày kết thúc hợp đồng phải lớn hơn ngày làm hợp đồng ít nhất là 2 ngày. 
 Nếu dữ liệu hợp lệ thì cho phép cập nhật, nếu dữ liệu không hợp lệ thì 
 in ra thông báo “Ngày kết thúc hợp đồng phải lớn hơn ngày làm hợp đồng 
 ít nhất là 2 ngày” trên console của database */
 
 -- DROP TRIGGER TR_2;
DELIMITER //
CREATE TRIGGER Tr_2 BEFORE UPDATE ON hop_dong FOR EACH ROW
BEGIN
DECLARE allert VARCHAR(100);
SET allert = 'Ngày kết thúc hợp đồng phải lớn hơn ngày làm hợp đồng ít nhất là 2 ngày !!';
IF (datediff(new.ngay_ket_thuc, old.ngay_lam_hop_dong)) < 2
THEN 
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = allert;
END IF;
END //
DELIMITER ;

UPDATE hop_dong 
SET  ngay_ket_thuc = '2021-01-25'
WHERE  id_hop_dong = 1;

-- SELECT id_hop_dong, ngay_ket_thuc
-- FROM hop_dong
-- WHERE id_hop_dong =1;
/* Task 27a.Tạo user function func_1: Đếm các dịch vụ đã được sử dụng với Tổng tiền là > 2.000.000 VNĐ. */

Create view dem_dich_vu
AS
SELECT H.id_dich_vu,sum(chi_phi_thue) 
FROM dich_vu D join hop_dong H on H.id_dich_vu = D.id_dich_vu
Group by H.id_dich_vu
Having sum(chi_phi_thue)>2000000;
SELECT*FROM dem_dich_vu;

DELIMITER //
CREATE PROCEDURE func_1()
BEGIN
 SELECT count(id_dich_vu) as tong_so_dich_vu
 FROM dem_dich_vu;
END //
DELIMITER ;

Call func_1();
 
/* Task 27b.Tạo user function Func_2: Tính khoảng thời gian dài nhất
 tính từ lúc bắt đầu làm hợp đồng đến lúc kết thúc hợp đồng mà 
 Khách hàng đã thực hiện thuê dịch vụ (lưu ý chỉ xét các khoảng 
 thời gian dựa vào từng lần làm hợp đồng thuê dịch vụ,
 không xét trên toàn bộ các lần làm hợp đồng). Mã của Khách hàng
 được truyền vào như là 1 tham số của function này.*/


CREATE or Replace VIEW so_ngay_thue AS
SELECT id_hop_dong,id_khach_hang,ngay_lam_hop_dong,ngay_ket_thuc,
datediff(ngay_ket_thuc, ngay_lam_hop_dong) AS so_ngay_dat_phong
FROM hop_dong;
SELECT*FROM so_ngay_thue;

DELIMITER //
CREATE PROCEDURE func_2( IN ma_khach_hang INT, OUT so_lan INT)
BEGIN
SELECT*FROM so_ngay_thue
WHERE id_khach_hang = ma_khach_hang;
SET so_lan = (	SELECT max(so_ngay_dat_phong)
				FROM so_ngay_thue
				WHERE id_khach_hang = ma_khach_hang );
END //
DELIMITER ;

SET @id_khach_hang= 1;
CALl func_2(1,@so_lan);
SELECT @so_lan;
/* Task 28. Tạo Store procedure Sp_3 để tìm các dịch vụ 
được thuê bởi khách hàng với loại dịch vụ là “Room” từ đầu năm 2015
 đến hết năm 2019 để xóa thông tin của các dịch vụ đó (tức là xóa các bảng ghi trong bảng DichVu)
 và xóa những HopDong sử dụng dịch vụ liên quan (tức là phải xóa những bản gi trong bảng HopDong)
 và những bản liên quan khác. */
 
-- TẠO VIEW CHỨA NHỮNG id_hop_dong và id_dich_vu theo yêu cầu của đề để xóa
USE furama_resort;
	CREATE OR REPLACE VIEW  delete_row AS
	SELECT id_hop_dong, D.id_dich_vu
	FROM dich_vu D  JOIN hop_dong H on D.id_dich_vu = H.id_dich_vu
					JOIN loai_dich_vu L on L.id_loai_dich_vu = D.id_loai_dich_vu
	WHERE L.ten_loai_dich_vu = "Room" and year(ngay_lam_hop_dong) between 2015 and 2019;
    SELECT*FROM delete_row;

 DELIMITER //
 CREATE PROCEDURE sp_3()
 BEGIN
 -- TẠO BẢNG COPY DATA TỪ VIEW QUA 
 DROP table if exists delete_by_id;
 Create table if not exists delete_by_id(
 id_hop_dong INT PRIMARY KEY,
 id_dich_vu INT );
 INSERT INTO delete_by_id
 SELECT* FROM delete_row;
 DELETE FROM hop_dong
 WHERE id_hop_dong in ( SELECT id_hop_dong FROM delete_by_id);
 DELETE FROM dich_vu
 WHERE id_dich_vu in ( SELECT id_dich_vu FROM delete_by_id);
 DROP table delete_by_id;
 END //
 DELIMITER ;
 
 SELECT*FROM delete_row;
 Call sp_3();
 SELECT*FROM delete_row;