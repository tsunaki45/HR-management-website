USE master
GO
--Tạo CSDL Personel
CREATE DATABASE ASM
GO
--Chọn CSDL làm việc
USE ASM
GO
--Tạo bảng User lưu thông tin người sử dụng
CREATE TABLE Users(
	Username nvarchar(50) NOT NULL,
	Password nvarchar(50) ,
	Fullname nvarchar(50) ,
	PRIMARY KEY(Username)
)

GO
INSERT INTO Users VALUES ('Nghialt','123','Trong Nghia')
INSERT INTO Users VALUES ('HuynhThai','abc','Vu Thai')


GO
--Tạo bảng Departs lưu thông tin phòng ban
CREATE TABLE Departs(
	Id nvarchar(10) NOT NULL,
	Name nvarchar(50) ,
	PRIMARY KEY(Id)
)
GO
INSERT INTO Departs VALUES ('PB001','Tai Chinh')
INSERT INTO Departs VALUES ('PB002','Nhan Su')

--Tạo bảng Staffs lưu thông tin nhân viên
CREATE TABLE Staffs(
	Id nvarchar(10) NOT NULL,
	Name nvarchar(50) ,
	Gender bit ,
	Birthday date ,
	Photo nvarchar(50) ,
	Email nvarchar(50) ,
	Phone nvarchar(25) ,
	Salary float ,
	Notes nvarchar(500) NULL,
	DepartId nvarchar(10) NOT NULL,
	PRIMARY KEY(Id),
	FOREIGN KEY(DepartId) REFERENCES Departs(Id) ON DELETE CASCADE ON UPDATE CASCADE
)
GO
	INSERT INTO Staffs VALUES ('NV001','Le Trong Nghia','1','2000-07-09','1.jpg','Nghialt@gmail.com','0908123456','200','a','PB001')
	INSERT INTO Staffs VALUES ('NV002','Pham Tri Vu','1','2000-12-29','2.jpg','VuTri@gmail.com','0908666777','150','a','PB002')
GO
--Tạo bảng Records lưu thông tin thành tích và kỷ luật của nhân viên
CREATE TABLE Records(
	Id bigint IDENTITY(1,1) NOT NULL,
	Type int ,
	Reason nvarchar(200),
	Date date ,
	StaffId nvarchar(10) NOT NULL,
	PRIMARY KEY(Id),
	FOREIGN KEY(StaffId) REFERENCES Staffs(Id) ON DELETE NO ACTION ON UPDATE CASCADE
 )
 GO
 INSERT INTO Records(Type,Reason,Date,StaffId) VALUES ('1','Di Tre','2024-01-25','NV002')
