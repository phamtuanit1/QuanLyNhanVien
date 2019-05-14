create database quanlynhanvien character set utf8;

use quanlynhanvien;

create table role (
	id int not null primary key auto_increment,
    name varchar(50),
    createddate date
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci ROW_FORMAT=DYNAMIC;

create table user (
	id int not null primary key auto_increment,
    username varchar(50) not null unique,
    password varchar(50) not null,
    fullname nvarchar(50),
    roleid int not null,
    image varchar(255),
    createddate date null,
    constraint FK_user_roleid foreign key (roleid) references role (id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci ROW_FORMAT=DYNAMIC;

create table chucvu (
	idchucvu int not null primary key auto_increment,
    tenchucvu nvarchar(50) not null,
    bacluong float not null
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci ROW_FORMAT=DYNAMIC;

create table department (
	idphong int not null primary key auto_increment,
    tenphong nvarchar(50) not null,
    soNV int default 0
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci ROW_FORMAT=DYNAMIC;

CREATE TABLE employee (
	id int NOT NULL PRIMARY KEY auto_increment,
	tennhanvien NVARCHAR(50) NOT NULL,
    chungminhthu nvarchar(50) not null,
    gioitinh NVARCHAR(10),
    ngaysinh DATE,
    diachi NVARCHAR(100),
    quequan NVARCHAR(100),
    sodienthoai VARCHAR(10),
    email VARCHAR(100),
    luongcb int not null,
	idchucvu int NOT NULL,
	idphong int NOT NULL,
	trinhdo NVARCHAR(50),
    ngayvaolam date,
    filenameimg varchar(255),
    partimg varchar(255),
    constraint FK_nhanvien_phong foreign key(idphong) references department(idphong) on update cascade on delete cascade,
	constraint FK_nhanvien_chucvu foreign key(idchucvu) references	chucvu(idchucvu) on update cascade on delete cascade
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci ROW_FORMAT=DYNAMIC;

create table salary(
	idluong int not null auto_increment,
    idemployee int not null,
	idchucvu int not null,
	phucap int,
    ngaynhanluong date,
    constraint PK_luong primary key (idluong,idemployee,idchucvu),
    constraint FK_luong_chucvu foreign key(idchucvu) references	chucvu(idchucvu),
    constraint FK_luong_idemployee foreign key (idemployee) references employee (id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci ROW_FORMAT=DYNAMIC;

-- thêm dữ liêu cho bảng role
INSERT INTO `quanlynhanvien`.`role` (`id`, `name`, `createddate`) VALUES ('1', 'admin', '2019-02-02');
INSERT INTO `quanlynhanvien`.`role` (`id`, `name`, `createddate`) VALUES ('2', 'user ', '2019-02-02');

-- thêm dữ liệu cho bảng user 
INSERT INTO `quanlynhanvien`.`user` (`username`, `password`, `fullname`, `roleid`,`image`, `createddate`) VALUES ('admin', 'admin', 'Phạm Văn Tuấn', '1','tuan.jpg', '2019-02-02');
INSERT INTO `quanlynhanvien`.`user` (`username`, `password`, `fullname`, `roleid`,`image`, `createddate`) VALUES ('user1', '123', 'Nguyễn Văn Trí', '2','tri.jpg', '2019-02-02');
INSERT INTO `quanlynhanvien`.`user` (`username`, `password`, `fullname`, `roleid`,`image`,`createddate`) VALUES ('user2', '123', 'Đào Văn Hùng', '2','hung.jpg', '2019-02-02');
INSERT INTO `quanlynhanvien`.`user` (`username`, `password`, `fullname`, `roleid`,`image`, `createddate`) VALUES ('user3', '123', 'Đỗ Thị Lan Anh', '2','lanh.jpg', '2019-02-02');

-- thêm dữ liệu cho bảng phòng ban
INSERT INTO `quanlynhanvien`.`department` (`tenphong`) VALUES ('Phòng Giám Đốc');
INSERT INTO `quanlynhanvien`.`department` (`tenphong`) VALUES ('Phòng Hành Chính');
INSERT INTO `quanlynhanvien`.`department` (`tenphong`) VALUES ('Phòng Tài Chính');
INSERT INTO `quanlynhanvien`.`department` (`tenphong`) VALUES ('Phòng Marketing');
INSERT INTO `quanlynhanvien`.`department` (`tenphong`) VALUES ('Phòng Bán Hàng');
INSERT INTO `quanlynhanvien`.`department` (`tenphong`) VALUES ('Phòng Kỹ Thuật');
INSERT INTO `quanlynhanvien`.`department` (`tenphong`) VALUES ('Phòng Nhân Sự');
INSERT INTO `quanlynhanvien`.`department` (`tenphong`) VALUES ('Phòng Kế Toán');


-- thêm dữ liệu cho bảng chucvu
INSERT INTO `quanlynhanvien`.`chucvu` (`tenchucvu`, `bacluong`) VALUES ('Giám đốc', '3.0');
INSERT INTO `quanlynhanvien`.`chucvu` (`tenchucvu`, `bacluong`) VALUES ('Trưởng phòng',2.0);
INSERT INTO `quanlynhanvien`.`chucvu` (`tenchucvu`, `bacluong`) VALUES ('Chủ nhiệm',1.75);
INSERT INTO `quanlynhanvien`.`chucvu` (`tenchucvu`, `bacluong`) VALUES ('Trợ lý',1.5);
INSERT INTO `quanlynhanvien`.`chucvu` (`tenchucvu`, `bacluong`) VALUES ('Thư ký',1.25);
INSERT INTO `quanlynhanvien`.`chucvu` (`tenchucvu`, `bacluong`) VALUES ('Trưởng nhóm',1.0);
INSERT INTO `quanlynhanvien`.`chucvu` (`tenchucvu`, `bacluong`) VALUES ('Tổ trưởng',0.75);
INSERT INTO `quanlynhanvien`.`chucvu` (`tenchucvu`, `bacluong`) VALUES ('Quản lý',0.5);
INSERT INTO `quanlynhanvien`.`chucvu` (`tenchucvu`, `bacluong`) VALUES ('Nhân viên',0.25);
INSERT INTO `quanlynhanvien`.`chucvu` (`tenchucvu`, `bacluong`) VALUES ('Thực tập',0);

-- thêm dữ liệu cho bảng nhân viên
INSERT INTO `quanlynhanvien`.`employee` (`tennhanvien`, `chungminhthu`, `gioitinh`, `ngaysinh`, `diachi`, `quequan`, `sodienthoai`, `email`, `luongcb`, `idchucvu`, `idphong`, `trinhdo`, `ngayvaolam`,`filenameimg`,`partimg`) VALUES ('Phạm Văn Tuấn', '152196198', 'Nam', '1998-02-13', 'Hà Nội', 'Thái Bình', '0976654867', 'tuan@gmail.com', '10000000', '1', '1', 'Đại học', '2019-01-01','tuan.jpg','');
INSERT INTO `quanlynhanvien`.`employee` (`tennhanvien`, `chungminhthu`, `gioitinh`, `ngaysinh`, `diachi`, `quequan`, `sodienthoai`, `email`, `luongcb`, `idchucvu`, `idphong`, `trinhdo`, `ngayvaolam`,`filenameimg`,`partimg`) VALUES ('Nguyễn Thị Nga', '323455345', 'Nữ', '1986-06-12', 'Hà Nội', 'Bắc Giang', '0934333321', 'nga@gmail.com', '8200000', '5', '2', 'Đại học', '2019-01-01','nu3.jpg','');
INSERT INTO `quanlynhanvien`.`employee` (`tennhanvien`, `chungminhthu`, `gioitinh`, `ngaysinh`, `diachi`, `quequan`, `sodienthoai`, `email`, `luongcb`, `idchucvu`, `idphong`, `trinhdo`, `ngayvaolam`,`filenameimg`,`partimg`) VALUES ('Nguyễn Văn An', '123456789', 'Nam', '1977-02-03', 'Hà Nội', 'Hưng Yên', '0987654321', 'an@gmail.com', '9000000', '2', '1', 'Đại học', '2019-01-01','pewpew.jpg','');
INSERT INTO `quanlynhanvien`.`employee` (`tennhanvien`, `chungminhthu`, `gioitinh`, `ngaysinh`, `diachi`, `quequan`, `sodienthoai`, `email`, `luongcb`, `idchucvu`, `idphong`, `trinhdo`, `ngayvaolam`,`filenameimg`,`partimg`) VALUES ('Nguyễn Thị Bốn', '123456789', 'Nữ', '1996-02-20', 'Hà Nội', 'Quảng ninh', '0987654321', 'bon@gmail.com', '8800000', '3', '3', 'Đại học', '2019-01-01','tramanh.jpg','');
INSERT INTO `quanlynhanvien`.`employee` (`tennhanvien`, `chungminhthu`, `gioitinh`, `ngaysinh`, `diachi`, `quequan`, `sodienthoai`, `email`, `luongcb`, `idchucvu`, `idphong`, `trinhdo`, `ngayvaolam`,`filenameimg`,`partimg`) VALUES ('Nguyễn Thị Tam', '123456789', 'Nữ', '1985-02-20', 'Hà Nội', 'Quảng ninh', '0987654321', 'tam@gmail.com', '7000000', '4', '4', 'Đại học', '2019-01-01','lanh.jpg','');
INSERT INTO `quanlynhanvien`.`employee` (`tennhanvien`, `chungminhthu`, `gioitinh`, `ngaysinh`, `diachi`, `quequan`, `sodienthoai`, `email`, `luongcb`, `idchucvu`, `idphong`, `trinhdo`, `ngayvaolam`,`filenameimg`,`partimg`) VALUES ('Phạm Mỹ Linh', '123456789', 'Nữ', '1956-02-20', 'Hà Nội', 'Cà Mau', '2783297347', 'tuan@gmail.com', '6000000', '5', '5', 'Đại học', '2019-01-01','linh.jpg','');
INSERT INTO `quanlynhanvien`.`employee` (`tennhanvien`, `chungminhthu`, `gioitinh`, `ngaysinh`, `diachi`, `quequan`, `sodienthoai`, `email`, `luongcb`, `idchucvu`, `idphong`, `trinhdo`, `ngayvaolam`,`filenameimg`,`partimg`) VALUES ('Đào Văn Hùng', '372628917', 'Nam', '1991-03-07', 'Hà Nội', 'Huế', '0987654321', 'hai@gmail.com', '5000000', '6', '6', 'Đại học', '2019-01-01','hung.jpg','');
INSERT INTO `quanlynhanvien`.`employee` (`tennhanvien`, `chungminhthu`, `gioitinh`, `ngaysinh`, `diachi`, `quequan`, `sodienthoai`, `email`, `luongcb`, `idchucvu`, `idphong`, `trinhdo`, `ngayvaolam`,`filenameimg`,`partimg`) VALUES ('Nguyễn Văn Trí', '123456789', 'Nam', '1998-03-18', 'Hà Nội', 'Bắc Giang', '0985800465', 'tri@gmail.com', '400000', '7', '7', 'Đại học', '2019-01-01','tri.jpg','');
INSERT INTO `quanlynhanvien`.`employee` (`tennhanvien`, `chungminhthu`, `gioitinh`, `ngaysinh`, `diachi`, `quequan`, `sodienthoai`, `email`, `luongcb`, `idchucvu`, `idphong`, `trinhdo`, `ngayvaolam`,`filenameimg`,`partimg`) VALUES ('Nguyễn Thị Tiến', '123456789', 'Nữ', '1994-02-20', 'Hà Nội', 'Hải Dương', '0987654321', 'tien@gmail.com', '1000000', '8', '8', 'Đại học', '2019-01-01','tramanh.jpg','');
INSERT INTO `quanlynhanvien`.`employee` (`tennhanvien`, `chungminhthu`, `gioitinh`, `ngaysinh`, `diachi`, `quequan`, `sodienthoai`, `email`, `luongcb`, `idchucvu`, `idphong`, `trinhdo`, `ngayvaolam`,`filenameimg`,`partimg`) VALUES ('Tạ Văn Toàn', '123456345', 'Nam', '1989-04-24', 'Hà Nội', 'Bắc Ninh', '0934353321', 'toan@gmail.com', '6800000', '2', '5', 'Đại học', '2019-01-01','nam.jpg','');
INSERT INTO `quanlynhanvien`.`employee` (`tennhanvien`, `chungminhthu`, `gioitinh`, `ngaysinh`, `diachi`, `quequan`, `sodienthoai`, `email`, `luongcb`, `idchucvu`, `idphong`, `trinhdo`, `ngayvaolam`,`filenameimg`,`partimg`) VALUES ('Lê Văn Cởi', '123456347', 'Nam', '1987-09-24', 'Hà Nội', 'Hải Phòng', '0934553321', 'coi@gmail.com', '6200000', '5', '5', 'Đại học', '2019-01-01','nam1.jpg','');
INSERT INTO `quanlynhanvien`.`employee` (`tennhanvien`, `chungminhthu`, `gioitinh`, `ngaysinh`, `diachi`, `quequan`, `sodienthoai`, `email`, `luongcb`, `idchucvu`, `idphong`, `trinhdo`, `ngayvaolam`,`filenameimg`,`partimg`) VALUES ('Nguyễn Thị Lan Anh', '323456345', 'Nữ', '1985-06-24', 'Hà Nội', 'Hà Nội', '0934353321', 'anh@gmail.com', '1200000', '6', '8', 'Đại học', '2019-01-01','nu.jpg','');
INSERT INTO `quanlynhanvien`.`employee` (`tennhanvien`, `chungminhthu`, `gioitinh`, `ngaysinh`, `diachi`, `quequan`, `sodienthoai`, `email`, `luongcb`, `idchucvu`, `idphong`, `trinhdo`, `ngayvaolam`,`filenameimg`,`partimg`) VALUES ('Nguyễn Văn Hùng', '323456345', 'Nam', '1955-06-24', 'Hà Nội', 'Hà Nội', '0934353321', 'hung@gmail.com', '7400000', '3', '4', 'Đại học', '2019-01-01','nam2.jpg','');
INSERT INTO `quanlynhanvien`.`employee` (`tennhanvien`, `chungminhthu`, `gioitinh`, `ngaysinh`, `diachi`, `quequan`, `sodienthoai`, `email`, `luongcb`, `idchucvu`, `idphong`, `trinhdo`, `ngayvaolam`,`filenameimg`,`partimg`) VALUES ('Nguyễn Thị Ngọc', '323456344', 'Nữ', '1989-03-24', 'Hà Nội', 'Ninh Bình', '0934553321', 'ngoc@gmail.com', '4600000', '4', '7', 'Đại học', '2019-01-01','nu1.jpg','');
INSERT INTO `quanlynhanvien`.`employee` (`tennhanvien`, `chungminhthu`, `gioitinh`, `ngaysinh`, `diachi`, `quequan`, `sodienthoai`, `email`, `luongcb`, `idchucvu`, `idphong`, `trinhdo`, `ngayvaolam`,`filenameimg`,`partimg`) VALUES ('Nguyễn Thị Nga', '323455345', 'Nữ', '1986-06-12', 'Hà Nội', 'Bắc Giang', '0934333321', 'nga@gmail.com', '8200000', '5', '3', 'Đại học', '2019-01-01','nu2.jpg','');


-- thêm dữ liệu cho bảng lương
INSERT INTO `quanlynhanvien`.`salary` (`idemployee`, `idchucvu`, `phucap`, `ngaynhanluong`) VALUES ('1', '1', '1000000', '2018-02-02');
INSERT INTO `quanlynhanvien`.`salary` (`idemployee`, `idchucvu`, `phucap`, `ngaynhanluong`) VALUES ('2', '2', '900000', '2018-03-02');
INSERT INTO `quanlynhanvien`.`salary` (`idemployee`, `idchucvu`, `phucap`, `ngaynhanluong`) VALUES ('3', '3', '800000', '2018-04-02');
INSERT INTO `quanlynhanvien`.`salary` (`idemployee`, `idchucvu`, `phucap`, `ngaynhanluong`) VALUES ('4', '4', '700000', '2018-05-02');
INSERT INTO `quanlynhanvien`.`salary` (`idemployee`, `idchucvu`, `phucap`, `ngaynhanluong`) VALUES ('5', '5', '600000', '2018-06-02');
INSERT INTO `quanlynhanvien`.`salary` (`idemployee`, `idchucvu`, `phucap`, `ngaynhanluong`) VALUES ('6', '6', '200000', '2018-07-02');
INSERT INTO `quanlynhanvien`.`salary` (`idemployee`, `idchucvu`, `phucap`, `ngaynhanluong`) VALUES ('7', '7', '700000', '2018-08-02');
INSERT INTO `quanlynhanvien`.`salary` (`idemployee`, `idchucvu`, `phucap`, `ngaynhanluong`) VALUES ('8', '8', '900000', '2018-09-02');
INSERT INTO `quanlynhanvien`.`salary` (`idemployee`, `idchucvu`, `phucap`, `ngaynhanluong`) VALUES ('9', '1', '900000', '2018-10-02');
INSERT INTO `quanlynhanvien`.`salary` (`idemployee`, `idchucvu`, `phucap`, `ngaynhanluong`) VALUES ('10', '7', '900000', '2018-11-02');
INSERT INTO `quanlynhanvien`.`salary` (`idemployee`, `idchucvu`, `phucap`, `ngaynhanluong`) VALUES ('11', '2', '300000', '2018-12-02');
INSERT INTO `quanlynhanvien`.`salary` (`idemployee`, `idchucvu`, `phucap`, `ngaynhanluong`) VALUES ('12', '5', '400000', '2019-01-02');
INSERT INTO `quanlynhanvien`.`salary` (`idemployee`, `idchucvu`, `phucap`, `ngaynhanluong`) VALUES ('13', '6', '150000', '2019-02-02');
INSERT INTO `quanlynhanvien`.`salary` (`idemployee`, `idchucvu`, `phucap`, `ngaynhanluong`) VALUES ('14', '3', '550000', '2019-03-02');
INSERT INTO `quanlynhanvien`.`salary` (`idemployee`, `idchucvu`, `phucap`, `ngaynhanluong`) VALUES ('15', '4', '250000', '2018-04-02');
