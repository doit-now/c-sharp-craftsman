-- Tạo database
CREATE DATABASE SU26_DieuDao;
GO

USE SU26_DieuDao;
GO

-- Xóa bảng nếu đã tồn tại
-- Phải xóa bảng con Fruit trước vì có khóa ngoại
IF OBJECT_ID('Fruit', 'U') IS NOT NULL
    DROP TABLE Fruit;
GO

IF OBJECT_ID('Category', 'U') IS NOT NULL
    DROP TABLE Category;
GO

-- Tạo bảng Category
CREATE TABLE Category (
    id INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(100) NOT NULL
);
GO

-- Tạo bảng Fruit
CREATE TABLE Fruit (
    id INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(100) NOT NULL,
    description NVARCHAR(255),
    price DECIMAL(18,2) NOT NULL,

    category_id INT NOT NULL,

    CONSTRAINT FK_Fruit_Category
        FOREIGN KEY (category_id)
        REFERENCES Category(id)
);
GO

-- Thêm dữ liệu Category
INSERT INTO Category (name)
VALUES
(N'Trái cây nhập khẩu'),
(N'Trái cây sấy khô'),
(N'Trái cây VietGap');
GO

-- Thêm dữ liệu Fruit
-- category_id:
-- 1 = Trái cây nhập khẩu
-- 2 = Trái cây sấy khô
-- 3 = Trái cây VietGap

INSERT INTO Fruit (name, description, price, category_id)
VALUES
-- 5 trái đầu: mâm ngũ quả Cầu - Sung - Dừa - Đủ - Xoài
(N'Mãng cầu', N'Tượng trưng cho chữ Cầu trong mâm ngũ quả', 35000, 3),
(N'Sung', N'Tượng trưng cho sự sung túc, đầy đủ', 25000, 3),
(N'Dừa', N'Tượng trưng cho chữ Vừa trong cách đọc dân gian miền Nam', 30000, 3),
(N'Đu đủ', N'Tượng trưng cho sự đầy đủ, no ấm', 28000, 3),
(N'Xoài', N'Tượng trưng cho chữ Xài trong câu Cầu Sung Vừa Đủ Xài', 40000, 3),

-- 5 trái cây Việt Nam khác
(N'Chuối', N'Trái cây phổ biến ở Việt Nam', 20000, 3),
(N'Cam', N'Trái cây giàu vitamin C', 45000, 3),
(N'Thanh long', N'Trái cây đặc sản phổ biến ở miền Nam Việt Nam', 32000, 3),
(N'Vải sấy khô', N'Trái cây sấy khô, vị ngọt tự nhiên', 75000, 2),
(N'Táo nhập khẩu', N'Trái cây nhập khẩu, giòn và ngọt', 90000, 1);
GO

-- Kiểm tra dữ liệu từng bảng
SELECT * FROM Category;
SELECT * FROM Fruit;
GO

-- Kiểm tra dữ liệu có join Category
SELECT 
    f.id,
    f.name AS fruit_name,
    f.description,
    f.price,
    c.name AS category_name
FROM Fruit f
JOIN Category c ON f.category_id = c.id;
GO