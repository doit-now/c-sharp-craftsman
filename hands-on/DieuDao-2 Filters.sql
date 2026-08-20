-- Tạo database
CREATE DATABASE SU26_DieuDao;
GO

USE SU26_DieuDao;
GO

-- Xóa bảng nếu đã tồn tại (Xóa bảng con Fruit trước)
IF OBJECT_ID('Fruit', 'U') IS NOT NULL
    DROP TABLE Fruit;
GO

IF OBJECT_ID('Category', 'U') IS NOT NULL
    DROP TABLE Category;
GO

IF OBJECT_ID('Staff', 'U') IS NOT NULL
    DROP TABLE Staff;
GO

-- 1. Tạo bảng Category
CREATE TABLE Category (
    id INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(100) NOT NULL
);
GO

-- 2. Tạo bảng Staff (Nhân viên trưng bày)
CREATE TABLE Staff (
    id INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(100) NOT NULL,
    phone VARCHAR(15),
    role NVARCHAR(50) DEFAULT N'Nhân viên trưng bày'
);
GO

-- 3. Tạo bảng Fruit (Có khóa ngoại tham chiếu Category và Staff)
CREATE TABLE Fruit (
    id INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(100) NOT NULL,
    description NVARCHAR(255),
    price DECIMAL(18,2) NOT NULL,

    category_id INT NOT NULL,
    staff_id INT NULL, -- Nhân viên phụ trách trưng bày (N - 1)

    CONSTRAINT FK_Fruit_Category
        FOREIGN KEY (category_id)
        REFERENCES Category(id),

    CONSTRAINT FK_Fruit_Staff
        FOREIGN KEY (staff_id)
        REFERENCES Staff(id)
);
GO

-- 4. Thêm dữ liệu Category
INSERT INTO Category (name)
VALUES
(N'Trái cây nhập khẩu'),
(N'Trái cây sấy khô'),
(N'Trái cây VietGap');
GO

-- 5. Thêm dữ liệu 3 Nhân viên trưng bày
INSERT INTO Staff (name, phone, role)
VALUES
(N'Nguyễn Văn An', '0901234567', N'Nhân viên trưng bày'),
(N'Trần Thị Bích', '0912345678', N'Nhân viên trưng bày'),
(N'Lê Hoàng Cường', '0923456789', N'Nhân viên trưng bày');
GO

-- 6. Thêm dữ liệu Fruit (Đã phân công staff_id)
-- staff_id: 1 = Nguyễn Văn An | 2 = Trần Thị Bích | 3 = Lê Hoàng Cường
INSERT INTO Fruit (name, description, price, category_id, staff_id)
VALUES
-- Mâm ngũ quả do NV Nguyễn Văn An (staff_id = 1) phụ trách
(N'Mãng cầu', N'Tượng trưng cho chữ Cầu trong mâm ngũ quả', 35000, 3, 1),
(N'Sung', N'Tượng trưng cho sự sung túc, đầy đủ', 25000, 3, 1),
(N'Dừa', N'Tượng trưng cho chữ Vừa trong cách đọc dân gian miền Nam', 30000, 3, 1),
(N'Đu đủ', N'Tượng trưng cho sự đầy đủ, no ấm', 28000, 3, 1),
(N'Xoài', N'Tượng trưng cho chữ Xài trong câu Cầu Sung Vừa Đủ Xài', 40000, 3, 1),

-- Trái cây VN do NV Trần Thị Bích (staff_id = 2) phụ trách
(N'Chuối', N'Trái cây phổ biến ở Việt Nam', 20000, 3, 2),
(N'Cam', N'Trái cây giàu vitamin C', 45000, 3, 2),
(N'Thanh long', N'Trái cây đặc sản phổ biến ở miền Nam Việt Nam', 32000, 3, 2),

-- Trái cây sấy khô & Nhập khẩu do NV Lê Hoàng Cường (staff_id = 3) phụ trách
(N'Vải sấy khô', N'Trái cây sấy khô, vị ngọt tự nhiên', 75000, 2, 3),
(N'Táo nhập khẩu', N'Trái cây nhập khẩu, giòn và ngọt', 90000, 1, 3);
GO

-- 7. Kiểm tra truy vấn FULL thông tin (JOIN cả Category và Staff)
SELECT 
    f.id,
    f.name AS fruit_name,
    f.description,
    f.price,
    c.name AS category_name,
    s.name AS staff_name,
    s.role AS staff_role
FROM Fruit f
JOIN Category c ON f.category_id = c.id
LEFT JOIN Staff s ON f.staff_id = s.id;
GO