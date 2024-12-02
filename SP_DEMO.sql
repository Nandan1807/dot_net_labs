CREATE DATABASE DOTNETLAB
--Table Creating Query
-- Create Product Table
CREATE TABLE [dbo].[Product] (
    [ProductID] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    [ProductName] VARCHAR(100) NOT NULL,
    [ProductPrice] DECIMAL(10,2) NOT NULL,
    [ProductCode] VARCHAR(100) NOT NULL,
    [Description] VARCHAR(100) NOT NULL,
    [UserID] INT NOT NULL FOREIGN KEY REFERENCES [dbo].[User]([UserID])
);

-- Create User Table
CREATE TABLE [dbo].[User] (
    [UserID] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    [UserName] VARCHAR(100) NOT NULL,
    [Email] VARCHAR(100) NOT NULL,
    [Password] VARCHAR(100) NOT NULL,
    [MobileNo] VARCHAR(15) NOT NULL,
    [Address] VARCHAR(100) NOT NULL,
    [IsActive] BIT NOT NULL
);

-- Create Order Table
CREATE TABLE [dbo].[Order] (
    [OrderID] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    [OrderDate] DATETIME NOT NULL,
    [CustomerID] INT NOT NULL FOREIGN KEY REFERENCES [dbo].[Customer]([CustomerID]),
    [PaymentMode] VARCHAR(100) NULL,
    [TotalAmount] DECIMAL(10,2) NULL,
    [ShippingAddress] VARCHAR(100) NOT NULL,
    [UserID] INT NOT NULL FOREIGN KEY REFERENCES [dbo].[User]([UserID])
);

-- Create OrderDetail Table
CREATE TABLE [dbo].[OrderDetail] (
    [OrderDetailID] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    [OrderID] INT NOT NULL FOREIGN KEY REFERENCES [dbo].[Order]([OrderID]),
    [ProductID] INT NOT NULL FOREIGN KEY REFERENCES [dbo].[Product]([ProductID]),
    [Quantity] INT NOT NULL,
    [Amount] DECIMAL(10,2) NOT NULL,
    [TotalAmount] DECIMAL(10,2) NOT NULL,
    [UserID] INT NOT NULL FOREIGN KEY REFERENCES [dbo].[User]([UserID])
);

-- Create Bills Table
CREATE TABLE [dbo].[Bills] (
    [BillID] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    [BillNumber] VARCHAR(100) NOT NULL,
    [BillDate] DATETIME NOT NULL,
    [OrderID] INT NOT NULL FOREIGN KEY REFERENCES [dbo].[Order]([OrderID]),
    [TotalAmount] DECIMAL(10,2) NOT NULL,
    [Discount] DECIMAL(10,2) NULL,
    [NetAmount] DECIMAL(10,2) NOT NULL,
    [UserID] INT NOT NULL FOREIGN KEY REFERENCES [dbo].[User]([UserID])
);

-- Create Customer Table
CREATE TABLE [dbo].[Customer] (
    [CustomerID] INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    [CustomerName] VARCHAR(100) NOT NULL,
    [HomeAddress] VARCHAR(100) NOT NULL,
    [Email] VARCHAR(100) NOT NULL,
    [MobileNo] VARCHAR(15) NOT NULL,
    [GST NO] VARCHAR(15) NOT NULL,
    [CityName] VARCHAR(100) NOT NULL,
    [PinCode] VARCHAR(15) NOT NULL,
    [NetAmount] DECIMAL(10,2) NOT NULL,
    [UserID] INT NOT NULL FOREIGN KEY REFERENCES [dbo].[User]([UserID])
);

-------------------------------------
--Stored Proc For Product
-------------------------------------
-- Select All Products
CREATE PROCEDURE [dbo].[sp_Product_SelectAll]
AS
BEGIN
    SELECT * FROM [dbo].[Product]
END

-- Select Product By ID
CREATE PROCEDURE [dbo].[sp_Product_SelectByID]
    @ProductID INT
AS
BEGIN
    SELECT * FROM [dbo].[Product] WHERE [ProductID] = @ProductID
END

-- Insert Product
CREATE PROCEDURE [dbo].[sp_Product_Insert]
    @ProductName VARCHAR(100),
    @ProductPrice DECIMAL(10,2),
    @ProductCode VARCHAR(100),
    @Description VARCHAR(100),
    @UserID INT
AS
BEGIN
    INSERT INTO [dbo].[Product] ([ProductName], [ProductPrice], [ProductCode], [Description], [UserID])
    VALUES (@ProductName, @ProductPrice, @ProductCode, @Description, @UserID)
END

-- Update Product
CREATE PROCEDURE [dbo].[sp_Product_Update]
    @ProductID INT,
    @ProductName VARCHAR(100),
    @ProductPrice DECIMAL(10,2),
    @ProductCode VARCHAR(100),
    @Description VARCHAR(100),
    @UserID INT
AS
BEGIN
    UPDATE [dbo].[Product]
    SET [ProductName] = @ProductName,
        [ProductPrice] = @ProductPrice,
        [ProductCode] = @ProductCode,
        [Description] = @Description,
        [UserID] = @UserID
    WHERE [ProductID] = @ProductID
END

-- Delete Product
CREATE PROCEDURE [dbo].[sp_Product_Delete]
    @ProductID INT
AS
BEGIN
    DELETE FROM [dbo].[Product] WHERE [ProductID] = @ProductID
END

-----------------------------------
--User Table
-----------------------------------
-- Select All Users
CREATE PROCEDURE [dbo].[sp_User_SelectAll]
AS
BEGIN
    SELECT * FROM [dbo].[User]
END

-- Select User By ID
CREATE PROCEDURE [dbo].[sp_User_SelectByID]
    @UserID INT
AS
BEGIN
    SELECT * FROM [dbo].[User] WHERE [UserID] = @UserID
END

-- Insert User
CREATE PROCEDURE [dbo].[sp_User_Insert]
    @UserName VARCHAR(100),
    @Email VARCHAR(100),
    @Password VARCHAR(100),
    @MobileNo VARCHAR(15),
    @Address VARCHAR(100),
    @IsActive BIT
AS
BEGIN
    INSERT INTO [dbo].[User] ([UserName], [Email], [Password], [MobileNo], [Address], [IsActive])
    VALUES (@UserName, @Email, @Password, @MobileNo, @Address, @IsActive)
END

-- Update User
CREATE PROCEDURE [dbo].[sp_User_Update]
    @UserID INT,
    @UserName VARCHAR(100),
    @Email VARCHAR(100),
    @Password VARCHAR(100),
    @MobileNo VARCHAR(15),
    @Address VARCHAR(100),
    @IsActive BIT
AS
BEGIN
    UPDATE [dbo].[User]
    SET [UserName] = @UserName,
        [Email] = @Email,
        [Password] = @Password,
        [MobileNo] = @MobileNo,
        [Address] = @Address,
        [IsActive] = @IsActive
    WHERE [UserID] = @UserID
END

-- Delete User
CREATE PROCEDURE [dbo].[sp_User_Delete]
    @UserID INT
AS
BEGIN
    DELETE FROM [dbo].[User] WHERE [UserID] = @UserID
END


-------------------------------------------
--Order Table
-------------------------------------------
-- Select All Orders
CREATE PROCEDURE [dbo].[sp_Order_SelectAll]
AS
BEGIN
    SELECT * FROM [dbo].[Order]
END

-- Select Order By ID
CREATE PROCEDURE [dbo].[sp_Order_SelectByID]
    @OrderID INT
AS
BEGIN
    SELECT * FROM [dbo].[Order] WHERE [OrderID] = @OrderID
END

-- Insert Order
CREATE PROCEDURE [dbo].[sp_Order_Insert]
    @OrderDate DATETIME,
    @CustomerID INT,
    @PaymentMode VARCHAR(100),
    @TotalAmount DECIMAL(10,2),
    @ShippingAddress VARCHAR(100),
    @UserID INT
AS
BEGIN
    INSERT INTO [dbo].[Order] ([OrderDate], [CustomerID], [PaymentMode], [TotalAmount], [ShippingAddress], [UserID])
    VALUES (@OrderDate, @CustomerID, @PaymentMode, @TotalAmount, @ShippingAddress, @UserID)
END

-- Update Order
CREATE PROCEDURE [dbo].[sp_Order_Update]
    @OrderID INT,
    @OrderDate DATETIME,
    @CustomerID INT,
    @PaymentMode VARCHAR(100),
    @TotalAmount DECIMAL(10,2),
    @ShippingAddress VARCHAR(100),
    @UserID INT
AS
BEGIN
    UPDATE [dbo].[Order]
    SET [OrderDate] = @OrderDate,
        [CustomerID] = @CustomerID,
        [PaymentMode] = @PaymentMode,
        [TotalAmount] = @TotalAmount,
        [ShippingAddress] = @ShippingAddress,
        [UserID] = @UserID
    WHERE [OrderID] = @OrderID
END

-- Delete Order
CREATE PROCEDURE [dbo].[sp_Order_Delete]
    @OrderID INT
AS
BEGIN
    DELETE FROM [dbo].[Order] WHERE [OrderID] = @OrderID
END

------------------------------------
--OrderDetails Table
------------------------------------

-- Select All OrderDetails
CREATE PROCEDURE [dbo].[sp_OrderDetail_SelectAll]
AS
BEGIN
    SELECT * FROM [dbo].[OrderDetail]
END

-- Select OrderDetail By ID
CREATE PROCEDURE [dbo].[sp_OrderDetail_SelectByID]
    @OrderDetailID INT
AS
BEGIN
    SELECT * FROM [dbo].[OrderDetail] WHERE [OrderDetailID] = @OrderDetailID
END

-- Insert OrderDetail
CREATE PROCEDURE [dbo].[sp_OrderDetail_Insert]
    @OrderID INT,
    @ProductID INT,
    @Quantity INT,
    @Amount DECIMAL(10,2),
    @TotalAmount DECIMAL(10,2),
    @UserID INT
AS
BEGIN
    INSERT INTO [dbo].[OrderDetail] ([OrderID], [ProductID], [Quantity], [Amount], [TotalAmount], [UserID])
    VALUES (@OrderID, @ProductID, @Quantity, @Amount, @TotalAmount, @UserID)
END

-- Update OrderDetail
CREATE PROCEDURE [dbo].[sp_OrderDetail_Update]
    @OrderDetailID INT,
    @OrderID INT,
    @ProductID INT,
    @Quantity INT,
    @Amount DECIMAL(10,2),
    @TotalAmount DECIMAL(10,2),
    @UserID INT
AS
BEGIN
    UPDATE [dbo].[OrderDetail]
    SET [OrderID] = @OrderID,
        [ProductID] = @ProductID,
        [Quantity] = @Quantity,
        [Amount] = @Amount,
        [TotalAmount] = @TotalAmount,
        [UserID] = @UserID
    WHERE [OrderDetailID] = @OrderDetailID
END

-- Delete OrderDetail
CREATE PROCEDURE [dbo].[sp_OrderDetail_Delete]
    @OrderDetailID INT
AS
BEGIN
    DELETE FROM [dbo].[OrderDetail] WHERE [OrderDetailID] = @OrderDetailID
END


---------------------------------------
--Bills Table 
---------------------------------------
-- Select All Bills
CREATE PROCEDURE [dbo].[sp_Bills_SelectAll]
AS
BEGIN
    SELECT * FROM [dbo].[Bills]
END

-- Select Bill By ID
CREATE PROCEDURE [dbo].[sp_Bills_SelectByID]
    @BillID INT
AS
BEGIN
    SELECT * FROM [dbo].[Bills] WHERE [BillID] = @BillID
END

-- Insert Bill
CREATE PROCEDURE [dbo].[sp_Bills_Insert]
    @BillNumber VARCHAR(100),
    @BillDate DATETIME,
    @OrderID INT,
    @TotalAmount DECIMAL(10,2),
    @Discount DECIMAL(10,2),
    @NetAmount DECIMAL(10,2),
    @UserID INT
AS
BEGIN
    INSERT INTO [dbo].[Bills] ([BillNumber], [BillDate], [OrderID], [TotalAmount], [Discount], [NetAmount], [UserID])
    VALUES (@BillNumber, @BillDate, @OrderID, @TotalAmount, @Discount, @NetAmount, @UserID)
END

-- Update Bill
CREATE PROCEDURE [dbo].[sp_Bills_Update]
    @BillID INT,
    @BillNumber VARCHAR(100),
    @BillDate DATETIME,
    @OrderID INT,
    @TotalAmount DECIMAL(10,2),
    @Discount DECIMAL(10,2),
    @NetAmount DECIMAL(10,2),
    @UserID INT
AS
BEGIN
    UPDATE [dbo].[Bills]
    SET [BillNumber] = @BillNumber,
        [BillDate] = @BillDate,
        [OrderID] = @OrderID,
        [TotalAmount] = @TotalAmount,
        [Discount] = @Discount,
        [NetAmount] = @NetAmount,
        [UserID] = @UserID
    WHERE [BillID] = @BillID
END

-- Delete Bill
CREATE PROCEDURE [dbo].[sp_Bills_Delete]
    @BillID INT
AS
BEGIN
    DELETE FROM [dbo].[Bills] WHERE [BillID] = @BillID
END


-----------------------------------------
--Customer Table
-----------------------------------------
-- Select All Customers
CREATE PROCEDURE [dbo].[sp_Customer_SelectAll]
AS
BEGIN
    SELECT * FROM [dbo].[Customer]
END

-- Select Customer By ID
CREATE PROCEDURE [dbo].[sp_Customer_SelectByID]
    @CustomerID INT
AS
BEGIN
    SELECT * FROM [dbo].[Customer] WHERE [CustomerID] = @CustomerID
END

-- Insert Customer
CREATE PROCEDURE [dbo].[sp_Customer_Insert]
    @CustomerName VARCHAR(100),
    @HomeAddress VARCHAR(100),
    @Email VARCHAR(100),
    @MobileNo VARCHAR(15),
    @GSTNO VARCHAR(15),
    @CityName VARCHAR(100),
    @PinCode VARCHAR(15),
    @NetAmount DECIMAL(10,2),
    @UserID INT
AS
BEGIN
    INSERT INTO [dbo].[Customer] ([CustomerName], [HomeAddress], [Email], [MobileNo], [GST NO], [CityName], [PinCode], [NetAmount], [UserID])
    VALUES (@CustomerName, @HomeAddress, @Email, @MobileNo, @GSTNO, @CityName, @PinCode, @NetAmount, @UserID)
END

-- Update Customer
CREATE PROCEDURE [dbo].[sp_Customer_Update]
    @CustomerID INT,
    @CustomerName VARCHAR(100),
    @HomeAddress VARCHAR(100),
    @Email VARCHAR(100),
    @MobileNo VARCHAR(15),
    @GSTNO VARCHAR(15),
    @CityName VARCHAR(100),
    @PinCode VARCHAR(15),
    @NetAmount DECIMAL(10,2),
    @UserID INT
AS
BEGIN
    UPDATE [dbo].[Customer]
    SET [CustomerName] = @CustomerName,
        [HomeAddress] = @HomeAddress,
        [Email] = @Email,
        [MobileNo] = @MobileNo,
        [GST NO] = @GSTNO,
        [CityName] = @CityName,
        [PinCode] = @PinCode,
        [NetAmount] = @NetAmount,
        [UserID] = @UserID
    WHERE [CustomerID] = @CustomerID
END

-- Delete Customer
CREATE PROCEDURE [dbo].[sp_Customer_Delete]
    @CustomerID INT
AS
BEGIN
    DELETE FROM [dbo].[Customer] WHERE [CustomerID] = @CustomerID
END


--login
CREATE PROCEDURE [dbo].[PR_User_Login]
@UserName VARCHAR(100),
@Password VARCHAR(100)
AS
BEGIN
    SELECT UserID,UserName,[Password] from [dbo].[User]
    WHERE UserName = @UserName
    AND [Password] = @Password
END

--sp_Customer_DropDown
create PROCEDURE [dbo].[sp_Customer_DropDown]
AS
BEGIN
    SELECT
		[dbo].[Customer].[CustomerID],
        [dbo].[Customer].[CustomerName]
    FROM
        [dbo].[Customer]
END

--Order_DropDown
create PROCEDURE [dbo].[sp_Order_DropDown]
AS
BEGIN
    SELECT
		[dbo].[Order].[OrderID]
    FROM
        [dbo].[Order]
END

--sp_Product_DropDown
create PROCEDURE [dbo].[sp_Product_DropDown]
AS
BEGIN
    SELECT
		[dbo].[Product].[ProductID],
        [dbo].[Product].[ProductName]
    FROM
        [dbo].[Product]
END

--sp_User_DropDown
create PROCEDURE [dbo].[sp_User_DropDown]
AS
BEGIN
    SELECT
		[dbo].[User].[UserID],
        [dbo].[User].[UserName]
    FROM
        [dbo].[User]
END