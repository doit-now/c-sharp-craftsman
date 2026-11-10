IF DB_ID(N'PRN212_5') IS NOT NULL
BEGIN
    ALTER DATABASE [PRN212_5] SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE [PRN212_5];
END
GO
CREATE DATABASE [PRN212_5];
GO
USE [PRN212_5];
GO
CREATE TABLE Categories (
    CategoryId INT IDENTITY(1,1) PRIMARY KEY,
    CategoryName NVARCHAR(100) NOT NULL
);
GO
CREATE TABLE Kitchens (
    KitchenId INT IDENTITY(1,1) PRIMARY KEY,
    KitchenName NVARCHAR(100) NOT NULL,
    Email NVARCHAR(150) NOT NULL
);
GO
CREATE TABLE MenuItems (
    MenuItemId INT IDENTITY(1,1) PRIMARY KEY,
    ItemName NVARCHAR(150) NOT NULL,
    ItemCode NVARCHAR(50) NOT NULL,
    Price DECIMAL(18,2) NOT NULL,
    PreparationMinutes INT NOT NULL,
    CategoryId INT NOT NULL,
    KitchenId INT NOT NULL,
    CONSTRAINT FK_MenuItems_Categories FOREIGN KEY (CategoryId) REFERENCES Categories(CategoryId),
    CONSTRAINT FK_MenuItems_Kitchens FOREIGN KEY (KitchenId) REFERENCES Kitchens(KitchenId)
);
GO
INSERT INTO Categories (CategoryName) VALUES
(N'Starter'),
(N'Main Dish'),
(N'Dessert'),
(N'Drink'),
(N'Combo');
GO
INSERT INTO Kitchens (KitchenName, Email) VALUES
(N'Hot Kitchen', N'hot@restaurant.vn'),
(N'Cold Kitchen', N'cold@restaurant.vn'),
(N'Bakery', N'bakery@restaurant.vn'),
(N'Bar Counter', N'bar@restaurant.vn'),
(N'Combo Station', N'combo@restaurant.vn');
GO
INSERT INTO MenuItems (ItemName, ItemCode, Price, PreparationMinutes, CategoryId, KitchenId) VALUES
(N'Spring Rolls', N'M001', 45000, 10, 1, 1),
(N'Beef Noodles', N'M002', 75000, 15, 2, 1),
(N'Chocolate Cake', N'M003', 55000, 8, 3, 3),
(N'Lemon Tea', N'M004', 30000, 5, 4, 4),
(N'Lunch Combo', N'M005', 99000, 18, 5, 5),
(N'Chicken Rice', N'M006', 70000, 12, 2, 1),
(N'Fruit Salad', N'M007', 50000, 7, 3, 2),
(N'Coffee', N'M008', 35000, 5, 4, 4);
GO
SELECT * FROM Categories;
SELECT * FROM Kitchens;
SELECT * FROM MenuItems;
GO