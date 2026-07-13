IF DB_ID('OnlineStoreDB') IS NOT NULL
BEGIN
    ALTER DATABASE OnlineStoreDB SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE OnlineStoreDB;
END
GO

CREATE DATABASE OnlineStoreDB;
GO

USE OnlineStoreDB;
GO

CREATE TABLE Categories (
    CategoryId INT IDENTITY(1,1) PRIMARY KEY,
    CategoryName NVARCHAR(100) NOT NULL
);
GO

CREATE TABLE Products (
    ProductId INT IDENTITY(1,1) PRIMARY KEY,
    ProductName NVARCHAR(100) NOT NULL,
    Price DECIMAL(18,2) NOT NULL,
    Stock INT NOT NULL,
    CategoryId INT NOT NULL,
    CONSTRAINT FK_Products_Categories
        FOREIGN KEY (CategoryId) REFERENCES Categories(CategoryId)
);
GO

CREATE TABLE Suppliers (
    SupplierId INT IDENTITY(1,1) PRIMARY KEY,
    SupplierName NVARCHAR(100) NOT NULL,
    ContactEmail NVARCHAR(150) NOT NULL
);
GO

CREATE TABLE ProductSuppliers (
    ProductId INT NOT NULL,
    SupplierId INT NOT NULL,
    CONSTRAINT PK_ProductSuppliers PRIMARY KEY (ProductId, SupplierId),
    CONSTRAINT FK_ProductSuppliers_Products
        FOREIGN KEY (ProductId) REFERENCES Products(ProductId),
    CONSTRAINT FK_ProductSuppliers_Suppliers
        FOREIGN KEY (SupplierId) REFERENCES Suppliers(SupplierId)
);
GO

INSERT INTO Categories (CategoryName) VALUES
(N'Computer'),
(N'Phone'),
(N'Accessory'),
(N'Office');
GO

INSERT INTO Suppliers (SupplierName, ContactEmail) VALUES
(N'TechCorp', N'techcorp@supply.com'),
(N'GlobalSupply', N'globalsupply@supply.com'),
(N'FastTrade', N'fasttrade@supply.com'),
(N'OfficeHub', N'officehub@supply.com'),
(N'DigitalWorld', N'digitalworld@supply.com'),
(N'MegaSource', N'megasource@supply.com');
GO

INSERT INTO Products (ProductName, Price, Stock, CategoryId) VALUES
(N'Laptop Pro 15', 1200.00, 10, 1),
(N'Mechanical Keyboard', 80.00, 25, 3),
(N'Smartphone X', 900.00, 15, 2),
(N'Wireless Mouse', 25.00, 40, 3),
(N'Office Printer', 300.00, 8, 4),
(N'Gaming PC', 1500.00, 5, 1),
(N'Budget Phone', 400.00, 20, 2),
(N'USB-C Dock', 120.00, 18, 1);
GO

INSERT INTO ProductSuppliers (ProductId, SupplierId) VALUES
(1, 1), (1, 2),
(2, 1), (2, 6),
(3, 2), (3, 5),
(4, 1), (4, 4),
(5, 4), (5, 6),
(6, 1), (6, 5), (6, 6),
(7, 3), (7, 5),
(8, 2), (8, 6);
GO

-- Quick check after seeding
SELECT COUNT(*) AS CategoryCount FROM Categories;
SELECT COUNT(*) AS SupplierCount FROM Suppliers;
SELECT COUNT(*) AS ProductCount FROM Products;
GO
