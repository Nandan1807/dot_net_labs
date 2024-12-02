use [CoffeeShopManagementSystem]
GO
/****** Object:  Table [dbo].[Bills]    Script Date: 07-08-2024 13:14:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bills](
	[BillID] [int] IDENTITY(1,1) NOT NULL,
	[BillNumber] [varchar](100) NULL,
	[BillDate] [datetime] NULL,
	[OrderID] [int] NULL,
	[TotalAmount] [decimal](10, 2) NULL,
	[Discount] [decimal](10, 2) NULL,
	[NetAmount] [decimal](10, 2) NULL,
	[UserID] [int] NULL,
 CONSTRAINT [PK_Bills] PRIMARY KEY CLUSTERED 
(
	[BillID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 07-08-2024 13:14:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] [varchar](100) NULL,
	[HomeAddress] [varchar](100) NULL,
	[Email] [varchar](100) NULL,
	[MobileNo] [varchar](15) NULL,
	[GST_NO] [varchar](15) NULL,
	[CityName] [varchar](100) NULL,
	[PinCode] [varchar](15) NULL,
	[NetAmount] [decimal](10, 2) NULL,
	[UserID] [int] NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 07-08-2024 13:14:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[OrderDate] [datetime] NULL,
	[CustomerID] [int] NULL,
	[PaymentMode] [varchar](100) NULL,
	[TotalAmount] [decimal](10, 2) NULL,
	[ShippingAddress] [varchar](100) NULL,
	[UserID] [int] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 07-08-2024 13:14:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[OrderDetailID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NULL,
	[ProductID] [int] NULL,
	[Quantity] [int] NULL,
	[Amount] [decimal](10, 2) NULL,
	[TotalAmount] [decimal](10, 2) NULL,
	[UserID] [int] NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[OrderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 07-08-2024 13:14:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [varchar](100) NULL,
	[ProductPrice] [decimal](10, 2) NULL,
	[ProductCode] [varchar](100) NULL,
	[Description] [varchar](100) NULL,
	[UserID] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 07-08-2024 13:14:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](100) NULL,
	[Email] [varchar](100) NULL,
	[Password] [varchar](100) NULL,
	[MobileNo] [varchar](15) NULL,
	[Address] [varchar](100) NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Bills] ON 

INSERT [dbo].[Bills] ([BillID], [BillNumber], [BillDate], [OrderID], [TotalAmount], [Discount], [NetAmount], [UserID]) VALUES (3, N'BILL001', CAST(N'2024-07-01T00:00:00.000' AS DateTime), 4, CAST(100.00 AS Decimal(10, 2)), CAST(5.00 AS Decimal(10, 2)), CAST(95.00 AS Decimal(10, 2)), 4)
INSERT [dbo].[Bills] ([BillID], [BillNumber], [BillDate], [OrderID], [TotalAmount], [Discount], [NetAmount], [UserID]) VALUES (4, N'BILL002', CAST(N'2024-07-02T00:00:00.000' AS DateTime), 2, CAST(200.00 AS Decimal(10, 2)), CAST(10.00 AS Decimal(10, 2)), CAST(190.00 AS Decimal(10, 2)), 2)
INSERT [dbo].[Bills] ([BillID], [BillNumber], [BillDate], [OrderID], [TotalAmount], [Discount], [NetAmount], [UserID]) VALUES (5, N'BILL003', CAST(N'2024-07-03T00:00:00.000' AS DateTime), 3, CAST(300.00 AS Decimal(10, 2)), CAST(15.00 AS Decimal(10, 2)), CAST(285.00 AS Decimal(10, 2)), 3)
INSERT [dbo].[Bills] ([BillID], [BillNumber], [BillDate], [OrderID], [TotalAmount], [Discount], [NetAmount], [UserID]) VALUES (6, N'BILL004', CAST(N'2024-07-04T00:00:00.000' AS DateTime), 4, CAST(150.00 AS Decimal(10, 2)), NULL, CAST(150.00 AS Decimal(10, 2)), 5)
INSERT [dbo].[Bills] ([BillID], [BillNumber], [BillDate], [OrderID], [TotalAmount], [Discount], [NetAmount], [UserID]) VALUES (7, N'BILL005', CAST(N'2024-07-05T00:00:00.000' AS DateTime), 5, CAST(250.00 AS Decimal(10, 2)), CAST(12.50 AS Decimal(10, 2)), CAST(237.50 AS Decimal(10, 2)), 2)
INSERT [dbo].[Bills] ([BillID], [BillNumber], [BillDate], [OrderID], [TotalAmount], [Discount], [NetAmount], [UserID]) VALUES (8, N'BILL006', CAST(N'2024-07-06T00:00:00.000' AS DateTime), 6, CAST(120.00 AS Decimal(10, 2)), CAST(6.00 AS Decimal(10, 2)), CAST(114.00 AS Decimal(10, 2)), 4)
INSERT [dbo].[Bills] ([BillID], [BillNumber], [BillDate], [OrderID], [TotalAmount], [Discount], [NetAmount], [UserID]) VALUES (9, N'BILL007', CAST(N'2024-07-07T00:00:00.000' AS DateTime), 2, CAST(220.00 AS Decimal(10, 2)), CAST(11.00 AS Decimal(10, 2)), CAST(209.00 AS Decimal(10, 2)), 2)
INSERT [dbo].[Bills] ([BillID], [BillNumber], [BillDate], [OrderID], [TotalAmount], [Discount], [NetAmount], [UserID]) VALUES (10, N'BILL008', CAST(N'2024-07-08T00:00:00.000' AS DateTime), 3, CAST(320.00 AS Decimal(10, 2)), CAST(16.00 AS Decimal(10, 2)), CAST(304.00 AS Decimal(10, 2)), 3)
INSERT [dbo].[Bills] ([BillID], [BillNumber], [BillDate], [OrderID], [TotalAmount], [Discount], [NetAmount], [UserID]) VALUES (11, N'BILL009', CAST(N'2024-07-09T00:00:00.000' AS DateTime), 4, CAST(180.00 AS Decimal(10, 2)), CAST(9.00 AS Decimal(10, 2)), CAST(171.00 AS Decimal(10, 2)), 4)
INSERT [dbo].[Bills] ([BillID], [BillNumber], [BillDate], [OrderID], [TotalAmount], [Discount], [NetAmount], [UserID]) VALUES (12, N'BILL010', CAST(N'2024-07-10T00:00:00.000' AS DateTime), 5, CAST(270.00 AS Decimal(10, 2)), CAST(13.50 AS Decimal(10, 2)), CAST(256.50 AS Decimal(10, 2)), 2)
SET IDENTITY_INSERT [dbo].[Bills] OFF
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [HomeAddress], [Email], [MobileNo], [GST_NO], [CityName], [PinCode], [NetAmount], [UserID]) VALUES (1, N'Alice Green', N'789 Pine St', N'alice.green@example.com', N'1234567890', N'GST1234567890', N'Pine City', N'123456', CAST(1000.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [HomeAddress], [Email], [MobileNo], [GST_NO], [CityName], [PinCode], [NetAmount], [UserID]) VALUES (2, N'Bob White', N'321 Oak St', N'bob.white@example.com', N'0987654321', N'GST0987654321', N'Oak Town', N'654321', CAST(2000.00 AS Decimal(10, 2)), 2)
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [HomeAddress], [Email], [MobileNo], [GST_NO], [CityName], [PinCode], [NetAmount], [UserID]) VALUES (3, N'Charlie Black', N'456 Elm St', N'charlie.black@example.com', N'1122334455', N'GST1122334455', N'Elm Village', N'789012', CAST(1500.00 AS Decimal(10, 2)), 3)
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [HomeAddress], [Email], [MobileNo], [GST_NO], [CityName], [PinCode], [NetAmount], [UserID]) VALUES (4, N'David Blue', N'654 Cedar St', N'david.blue@example.com', N'2233445566', N'GST2233445566', N'Cedar Grove', N'345678', CAST(2500.00 AS Decimal(10, 2)), 4)
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [HomeAddress], [Email], [MobileNo], [GST_NO], [CityName], [PinCode], [NetAmount], [UserID]) VALUES (5, N'Emma Yellow', N'123 Main St', N'emma.yellow@example.com', N'3344556677', N'GST3344556677', N'Main City', N'567890', CAST(3000.00 AS Decimal(10, 2)), 5)
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [HomeAddress], [Email], [MobileNo], [GST_NO], [CityName], [PinCode], [NetAmount], [UserID]) VALUES (6, N'Frank Orange', N'789 Birch St', N'frank.orange@example.com', N'4455667788', N'GST4455667788', N'Birch Town', N'678901', CAST(1750.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [HomeAddress], [Email], [MobileNo], [GST_NO], [CityName], [PinCode], [NetAmount], [UserID]) VALUES (7, N'Grace Purple', N'321 Willow St', N'grace.purple@example.com', N'5566778899', N'GST5566778899', N'Willow Grove', N'890123', CAST(2250.00 AS Decimal(10, 2)), 2)
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [HomeAddress], [Email], [MobileNo], [GST_NO], [CityName], [PinCode], [NetAmount], [UserID]) VALUES (8, N'Henry Brown', N'456 Maple St', N'henry.brown@example.com', N'6677889900', N'GST6677889900', N'Maple Village', N'901234', CAST(2750.00 AS Decimal(10, 2)), 3)
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [HomeAddress], [Email], [MobileNo], [GST_NO], [CityName], [PinCode], [NetAmount], [UserID]) VALUES (9, N'Isabel Silver', N'654 Spruce St', N'isabel.silver@example.com', N'7788990011', N'GST7788990011', N'Spruce Town', N'123789', CAST(3250.00 AS Decimal(10, 2)), 4)
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [HomeAddress], [Email], [MobileNo], [GST_NO], [CityName], [PinCode], [NetAmount], [UserID]) VALUES (10, N'Jack Gold', N'123 Cedar St', N'jack.gold@example.com', N'8899001122', N'GST8899001122', N'Cedar City', N'345012', CAST(3500.00 AS Decimal(10, 2)), 5)
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([OrderID], [OrderDate], [CustomerID], [PaymentMode], [TotalAmount], [ShippingAddress], [UserID]) VALUES (2, CAST(N'2023-07-01T10:30:00.000' AS DateTime), 1, N'Credit Card', CAST(150.75 AS Decimal(10, 2)), N'123 Main St', 1)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [CustomerID], [PaymentMode], [TotalAmount], [ShippingAddress], [UserID]) VALUES (3, CAST(N'2023-07-02T14:00:00.000' AS DateTime), 2, N'PayPal', CAST(200.00 AS Decimal(10, 2)), N'456 Elm St', 2)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [CustomerID], [PaymentMode], [TotalAmount], [ShippingAddress], [UserID]) VALUES (4, CAST(N'2023-07-03T09:15:00.000' AS DateTime), 3, N'Credit Card', CAST(120.00 AS Decimal(10, 2)), N'789 Pine St', 3)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [CustomerID], [PaymentMode], [TotalAmount], [ShippingAddress], [UserID]) VALUES (5, CAST(N'2023-07-04T11:45:00.000' AS DateTime), 4, N'Cash', CAST(99.99 AS Decimal(10, 2)), N'321 Oak St', 4)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [CustomerID], [PaymentMode], [TotalAmount], [ShippingAddress], [UserID]) VALUES (6, CAST(N'2023-07-05T16:20:00.000' AS DateTime), 5, N'Debit Card', CAST(175.50 AS Decimal(10, 2)), N'654 Cedar St', 5)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [CustomerID], [PaymentMode], [TotalAmount], [ShippingAddress], [UserID]) VALUES (7, CAST(N'2023-07-06T12:00:00.000' AS DateTime), 1, N'Credit Card', CAST(220.75 AS Decimal(10, 2)), N'123 Main St', 1)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [CustomerID], [PaymentMode], [TotalAmount], [ShippingAddress], [UserID]) VALUES (8, CAST(N'2023-07-07T08:45:00.000' AS DateTime), 2, N'PayPal', CAST(300.00 AS Decimal(10, 2)), N'456 Elm St', 2)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [CustomerID], [PaymentMode], [TotalAmount], [ShippingAddress], [UserID]) VALUES (9, CAST(N'2023-07-08T17:30:00.000' AS DateTime), 3, N'Cash', CAST(180.25 AS Decimal(10, 2)), N'789 Pine St', 3)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [CustomerID], [PaymentMode], [TotalAmount], [ShippingAddress], [UserID]) VALUES (10, CAST(N'2023-07-09T13:10:00.000' AS DateTime), 4, N'Credit Card', CAST(210.00 AS Decimal(10, 2)), N'321 Oak St', 4)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [CustomerID], [PaymentMode], [TotalAmount], [ShippingAddress], [UserID]) VALUES (11, CAST(N'2023-07-10T10:50:00.000' AS DateTime), 5, N'Debit Card', CAST(250.00 AS Decimal(10, 2)), N'654 Cedar St', 5)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 

INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Amount], [TotalAmount], [UserID]) VALUES (2, 6, 6, 1, CAST(10.00 AS Decimal(10, 2)), CAST(10.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Amount], [TotalAmount], [UserID]) VALUES (3, 6, 2, 2, CAST(20.00 AS Decimal(10, 2)), CAST(40.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Amount], [TotalAmount], [UserID]) VALUES (4, 2, 3, 1, CAST(30.00 AS Decimal(10, 2)), CAST(30.00 AS Decimal(10, 2)), 2)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Amount], [TotalAmount], [UserID]) VALUES (5, 2, 4, 2, CAST(40.00 AS Decimal(10, 2)), CAST(80.00 AS Decimal(10, 2)), 2)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Amount], [TotalAmount], [UserID]) VALUES (6, 3, 5, 1, CAST(50.00 AS Decimal(10, 2)), CAST(50.00 AS Decimal(10, 2)), 3)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Amount], [TotalAmount], [UserID]) VALUES (7, 3, 6, 3, CAST(10.00 AS Decimal(10, 2)), CAST(30.00 AS Decimal(10, 2)), 3)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Amount], [TotalAmount], [UserID]) VALUES (8, 4, 2, 2, CAST(20.00 AS Decimal(10, 2)), CAST(40.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Amount], [TotalAmount], [UserID]) VALUES (9, 4, 3, 1, CAST(30.00 AS Decimal(10, 2)), CAST(30.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Amount], [TotalAmount], [UserID]) VALUES (10, 5, 4, 2, CAST(40.00 AS Decimal(10, 2)), CAST(80.00 AS Decimal(10, 2)), 2)
INSERT [dbo].[OrderDetail] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [Amount], [TotalAmount], [UserID]) VALUES (11, 5, 5, 1, CAST(50.00 AS Decimal(10, 2)), CAST(50.00 AS Decimal(10, 2)), 2)
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductPrice], [ProductCode], [Description], [UserID]) VALUES (1, N'Product A', CAST(10.00 AS Decimal(10, 2)), N'PRA100', N'Description of Product A', 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductPrice], [ProductCode], [Description], [UserID]) VALUES (2, N'Product B', CAST(20.00 AS Decimal(10, 2)), N'PRB200', N'Description of Product B', 2)
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductPrice], [ProductCode], [Description], [UserID]) VALUES (3, N'Product C', CAST(30.00 AS Decimal(10, 2)), N'PRC300', N'Description of Product C', 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductPrice], [ProductCode], [Description], [UserID]) VALUES (4, N'Product D', CAST(40.00 AS Decimal(10, 2)), N'PRD400', N'Description of Product D', 3)
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductPrice], [ProductCode], [Description], [UserID]) VALUES (5, N'Product E', CAST(50.00 AS Decimal(10, 2)), N'PRE500', N'Description of Product E', 2)
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductPrice], [ProductCode], [Description], [UserID]) VALUES (6, N'Product F', CAST(60.00 AS Decimal(10, 2)), N'PRF600', N'Description of Product F', 3)
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductPrice], [ProductCode], [Description], [UserID]) VALUES (7, N'Product G', CAST(70.00 AS Decimal(10, 2)), N'PRG700', N'Description of Product G', 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductPrice], [ProductCode], [Description], [UserID]) VALUES (8, N'Product H', CAST(80.00 AS Decimal(10, 2)), N'PRH800', N'Description of Product H', 2)
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductPrice], [ProductCode], [Description], [UserID]) VALUES (9, N'Product I', CAST(90.00 AS Decimal(10, 2)), N'PRI900', N'Description of Product I', 3)
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductPrice], [ProductCode], [Description], [UserID]) VALUES (10, N'Product J', CAST(100.00 AS Decimal(10, 2)), N'PRJ1000', N'Description of Product J', 1)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [UserName], [Email], [Password], [MobileNo], [Address], [IsActive]) VALUES (1, N'John Doe', N'john.doe@example.com', N'password123', N'1234567890', N'123 Main St', 1)
INSERT [dbo].[User] ([UserID], [UserName], [Email], [Password], [MobileNo], [Address], [IsActive]) VALUES (2, N'Jane Smith', N'jane.smith@example.com', N'password456', N'0987654321', N'456 Elm St', 1)
INSERT [dbo].[User] ([UserID], [UserName], [Email], [Password], [MobileNo], [Address], [IsActive]) VALUES (3, N'Alice Johnson', N'alice.johnson@example.com', N'password789', N'1122334455', N'789 Pine St', 0)
INSERT [dbo].[User] ([UserID], [UserName], [Email], [Password], [MobileNo], [Address], [IsActive]) VALUES (4, N'Bob Brown', N'bob.brown@example.com', N'password321', N'2233445566', N'321 Oak St', 1)
INSERT [dbo].[User] ([UserID], [UserName], [Email], [Password], [MobileNo], [Address], [IsActive]) VALUES (5, N'Charlie Davis', N'charlie.davis@example.com', N'password654', N'3344556677', N'654 Cedar St', 0)
INSERT [dbo].[User] ([UserID], [UserName], [Email], [Password], [MobileNo], [Address], [IsActive]) VALUES (6, N'David Evans', N'david.evans@example.com', N'password111', N'4455667788', N'111 Maple St', 1)
INSERT [dbo].[User] ([UserID], [UserName], [Email], [Password], [MobileNo], [Address], [IsActive]) VALUES (7, N'Eva Green', N'eva.green@example.com', N'password222', N'5566778899', N'222 Birch St', 0)
INSERT [dbo].[User] ([UserID], [UserName], [Email], [Password], [MobileNo], [Address], [IsActive]) VALUES (8, N'Frank Harris', N'frank.harris@example.com', N'password333', N'6677889900', N'333 Willow St', 1)
INSERT [dbo].[User] ([UserID], [UserName], [Email], [Password], [MobileNo], [Address], [IsActive]) VALUES (9, N'Grace Lee', N'grace.lee@example.com', N'password444', N'7788990011', N'444 Spruce St', 1)
INSERT [dbo].[User] ([UserID], [UserName], [Email], [Password], [MobileNo], [Address], [IsActive]) VALUES (10, N'Henry King', N'henry.king@example.com', N'password555', N'8899001122', N'555 Cherry St', 0)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Bills]  WITH CHECK ADD  CONSTRAINT [FK_Order_Bills] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[Bills] CHECK CONSTRAINT [FK_Order_Bills]
GO
ALTER TABLE [dbo].[Bills]  WITH CHECK ADD  CONSTRAINT [FK_User_Bills] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Bills] CHECK CONSTRAINT [FK_User_Bills]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_User_Customer] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_User_Customer]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Order] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Customer_Order]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_User_Order] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_User_Order]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_Order_OrderDetail] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_Order_OrderDetail]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_Product_OrderDetail] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_Product_OrderDetail]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_User_OrderDetail] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_User_OrderDetail]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_User_Product] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_User_Product]
GO
/****** Object:  StoredProcedure [dbo].[PR_Bills_Delete]    Script Date: 07-08-2024 13:14:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--for delete from Bills Table

CREATE PROCEDURE [dbo].[PR_Bills_Delete]
@BillID INT
AS
BEGIN
	DELETE FROM [dbo].[Bills]
	WHERE [dbo].[Bills].[BillID] = @BillID
END

GO
/****** Object:  StoredProcedure [dbo].[PR_Bills_Insert]    Script Date: 07-08-2024 13:14:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Bills_Insert]
@BillNumber VARCHAR(100),
@BillDate DATETIME,
@OrderID INT,
@TotalAmount DECIMAL(10,2),
@Discount DECIMAL(10,2),
@NetAmount DECIMAL(10,2),
@UserID INT
AS
BEGIN
	INSERT INTO [dbo].[Bills]
	(
		[dbo].[Bills].[BillNumber],
		[dbo].[Bills].[BillDate],
		[dbo].[Bills].[OrderID],
		[dbo].[Bills].[TotalAmount],
		[dbo].[Bills].[Discount],
		[dbo].[Bills].[NetAmount],
		[dbo].[Bills].[UserID]
	)
	VALUES
	(
		@BillNumber,
		@BillDate,
		@OrderID,
		@TotalAmount,
		@Discount,
		@NetAmount,
		@UserID
	)
END
GO
/****** Object:  StoredProcedure [dbo].[PR_Bills_SelectAll]    Script Date: 07-08-2024 13:14:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Bills_SelectAll]
AS
BEGIN
	SELECT 
		[dbo].[Bills].[BillID],
		[dbo].[Bills].[BillNumber],
		[dbo].[Bills].[BillDate],
		[dbo].[Bills].[OrderID],
		[dbo].[Order].[OrderDate],
		[dbo].[Order].[PaymentMode],
		[dbo].[Order].[ShippingAddress],
		[dbo].[Bills].[TotalAmount],
		[dbo].[Bills].[Discount],
		[dbo].[Bills].[NetAmount],
		[dbo].[Bills].[UserID],
		[dbo].[User].[UserName]
	FROM [dbo].[Bills] 
	INNER JOIN [dbo].[Order]
	ON [dbo].[Bills].[OrderID] = [dbo].[Order].[OrderID]
	INNER JOIN [dbo].[User]
	ON [dbo].[Bills].[UserID] = [dbo].[User].[UserID]
END
GO
/****** Object:  StoredProcedure [dbo].[PR_Bills_SelectByPK]    Script Date: 07-08-2024 13:14:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Bills_SelectByPK]
@BillID INT
AS
BEGIN
	SELECT
		[dbo].[Bills].[BillID],
		[dbo].[Bills].[BillNumber],
		[dbo].[Bills].[BillDate],
		[dbo].[Bills].[OrderID],
		[dbo].[Bills].[TotalAmount],
		[dbo].[Bills].[Discount],
		[dbo].[Bills].[NetAmount],
		[dbo].[Bills].[UserID]
	FROM
		[dbo].[Bills]
	WHERE
		[dbo].[Bills].[BillID] = @BillID
END
GO
/****** Object:  StoredProcedure [dbo].[PR_Bills_Update]    Script Date: 07-08-2024 13:14:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--For Update bills table
CREATE PROCEDURE [dbo].[PR_Bills_Update]
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
	SET
		[dbo].[Bills].[BillNumber] = @BillNumber,
		[dbo].[Bills].[BillDate] = @BillDate,
		[dbo].[Bills].[OrderID] = @OrderID,
		[dbo].[Bills].[TotalAmount] = @TotalAmount,
		[dbo].[Bills].[Discount] = @Discount,
		[dbo].[Bills].[NetAmount] = @NetAmount,
		[dbo].[Bills].[UserID] = @UserID
	WHERE
		[dbo].[Bills].[BillID] = @BillID
END
GO
/****** Object:  StoredProcedure [dbo].[PR_Customer_Delete]    Script Date: 07-08-2024 13:14:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Customer_Delete]
@CustomerID INT
AS
BEGIN
	DELETE FROM [dbo].[Customer]
	WHERE [dbo].[Customer].[CustomerID] = @CustomerID
END
GO
/****** Object:  StoredProcedure [dbo].[PR_Customer_Insert]    Script Date: 07-08-2024 13:14:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--For Insert Into Bills Table

CREATE PROCEDURE [dbo].[PR_Customer_Insert]
@CustomerName Varchar(100),
@HomeAddress Varchar(100),
@Email Varchar(100),
@MobileNo Varchar(15),
@GSTNO Varchar(15),
@CityName Varchar(100),
@PinCode Varchar(15),
@NetAmount Decimal(10,2),
@UserID Int
AS
BEGIN
	INSERT INTO [dbo].[Customer]
	(
		[dbo].[Customer].[CustomerName],
		[dbo].[Customer].[HomeAddress],
		[dbo].[Customer].[Email],
		[dbo].[Customer].[MobileNo],
		[dbo].[Customer].[GST_NO],
		[dbo].[Customer].[CityName],
		[dbo].[Customer].[PinCode],
		[dbo].[Customer].[NetAmount],
		[dbo].[Customer].[UserID]
	)
	VALUES
	(
		@CustomerName,
		@HomeAddress,
		@Email,
		@MobileNo,
		@GSTNO,
		@CityName,
		@PinCode,
		@NetAmount,
		@UserID
	)
END
GO
/****** Object:  StoredProcedure [dbo].[PR_Customer_SelectAll]    Script Date: 07-08-2024 13:14:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Customer_SelectAll]
AS
BEGIN
	SELECT 
		[dbo].[Customer].[CustomerID],
		[dbo].[Customer].[CustomerName],
		[dbo].[Customer].[HomeAddress],
		[dbo].[Customer].[Email],
		[dbo].[Customer].[MobileNo],
		[dbo].[Customer].[GST_NO],
		[dbo].[Customer].[CityName],
		[dbo].[Customer].[PinCode],
		[dbo].[Customer].[NetAmount],
		[dbo].[Customer].[UserID],
		[dbo].[User].[UserName]
	FROM  [dbo].[Customer]
	INNER JOIN [dbo].[User]
	ON [dbo].[Customer].[UserID] = [dbo].[User].[UserID]
END
GO
/****** Object:  StoredProcedure [dbo].[PR_Customer_SelectByPK]    Script Date: 07-08-2024 13:14:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--select by PK from customer table
CREATE PROCEDURE [dbo].[PR_Customer_SelectByPK]
@CustomerID INT
AS
BEGIN
	SELECT 
		[dbo].[Customer].[CustomerID],
		[dbo].[Customer].[CustomerName],
		[dbo].[Customer].[HomeAddress],
		[dbo].[Customer].[Email],
		[dbo].[Customer].[MobileNo],
		[dbo].[Customer].[GST_NO],
		[dbo].[Customer].[CityName],
		[dbo].[Customer].[PinCode],
		[dbo].[Customer].[NetAmount],
		[dbo].[Customer].[UserID]
	FROM 
		[dbo].[Customer]
	WHERE
		[dbo].[Customer].[CustomerID] = @CustomerID
END
		
GO
/****** Object:  StoredProcedure [dbo].[PR_Customer_Update]    Script Date: 07-08-2024 13:14:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Customer_Update]
@CustomerID INT,
@CustomerName Varchar(100),
@HomeAddress Varchar(100),
@Email Varchar(100),
@MobileNo Varchar(15),
@GSTNO Varchar(15),
@CityName Varchar(100),
@PinCode Varchar(15),
@NetAmount Decimal(10,2),
@UserID Int
AS
BEGIN
	UPDATE [dbo].[Customer]
	SET
		[dbo].[Customer].[CustomerName] = @CustomerName,
		[dbo].[Customer].[HomeAddress] = @HomeAddress,
		[dbo].[Customer].[Email] = @Email,
		[dbo].[Customer].[MobileNo] = @MobileNo,
		[dbo].[Customer].[GST_NO] = @GSTNO,
		[dbo].[Customer].[CityName] = @CityName,
		[dbo].[Customer].[PinCode] = @PinCode,
		[dbo].[Customer].[NetAmount] = @NetAmount,
		[dbo].[Customer].[UserID] = @UserID
	WHERE
		[dbo].[Customer].[CustomerID] = @CustomerID
END
GO
/****** Object:  StoredProcedure [dbo].[PR_Order_Delete]    Script Date: 07-08-2024 13:14:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Order_Delete]
@OrderID INT
AS
BEGIN
	DELETE FROM [dbo].[Order]
	WHERE
		[dbo].[Order].[OrderID] = @OrderID
END
GO
/****** Object:  StoredProcedure [dbo].[PR_Order_Insert]    Script Date: 07-08-2024 13:14:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Order_Insert]
@OrderDate DATETIME,
@CustomerID INT,
@PaymentMode VARCHAR(100),
@TotalAmount DECIMAL(10,2),
@ShippingAddress VARCHAR(100),
@UserID INT
AS
BEGIN
	INSERT INTO [dbo].[Order]
	(
		[dbo].[Order].[OrderDate],
		[dbo].[Order].[CustomerID],
		[dbo].[Order].[PaymentMode],
		[dbo].[Order].[TotalAmount],
		[dbo].[Order].[ShippingAddress],
		[dbo].[Order].[UserID]
	)
	VALUES
	(
		@OrderDate,
		@CustomerID,
		@PaymentMode,
		@TotalAmount,
		@ShippingAddress,
		@UserID
	)
END
GO
/****** Object:  StoredProcedure [dbo].[PR_Order_SelectAll]    Script Date: 07-08-2024 13:14:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Order_SelectAll]
AS
BEGIN
	SELECT
		[dbo].[Order].[OrderID],
		[dbo].[Order].[OrderDate],
		[dbo].[Order].[CustomerID],
		[dbo].[Customer].[CustomerName],
		[dbo].[Order].[PaymentMode],
		[dbo].[Order].[TotalAmount],
		[dbo].[Order].[ShippingAddress],
		[dbo].[Order].[UserID],
		[dbo].[User].[UserName]
	FROM [dbo].[Order]
	INNER JOIN [dbo].[Customer]
	ON [dbo].[Order].[CustomerID] = [dbo].[Customer].[CustomerID] 
	INNER JOIN [dbo].[User]
	ON [dbo].[Order].[UserID] = [dbo].[User].[UserID]
END
GO
/****** Object:  StoredProcedure [dbo].[PR_Order_SelectByPK]    Script Date: 07-08-2024 13:14:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Order_SelectByPK]
@OrderID INT
AS
BEGIN
	SELECT
		[dbo].[Order].[OrderID],
		[dbo].[Order].[OrderDate],
		[dbo].[Order].[CustomerID],
		[dbo].[Order].[PaymentMode],
		[dbo].[Order].[TotalAmount],
		[dbo].[Order].[ShippingAddress],
		[dbo].[Order].[UserID]
	FROM
		[dbo].[Order]
	WHERE 
		[dbo].[Order].[OrderID] = @OrderID
END
GO
/****** Object:  StoredProcedure [dbo].[PR_Order_Update]    Script Date: 07-08-2024 13:14:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--For Update Orders table
CREATE PROCEDURE [dbo].[PR_Order_Update]
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
	SET
		[dbo].[Order].[OrderDate] = @OrderDate,
		[dbo].[Order].[CustomerID] = @CustomerID,
		[dbo].[Order].[PaymentMode] = @PaymentMode,
		[dbo].[Order].[TotalAmount] = @TotalAmount,
		[dbo].[Order].[ShippingAddress] = @ShippingAddress,
		[dbo].[Order].[UserID] = @UserID
	WHERE
		[dbo].[Order].[OrderID] = @OrderID
END
GO
/****** Object:  StoredProcedure [dbo].[PR_OrderDetail_Delete]    Script Date: 07-08-2024 13:14:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--For Delete From OrderDetail table

CREATE PROCEDURE [dbo].[PR_OrderDetail_Delete]
@OrderDetailID INT
AS
BEGIN
	DELETE FROM [dbo].[OrderDetail]
	WHERE
		[dbo].[OrderDetail].[OrderDetailID] = @OrderDetailID
END
GO
/****** Object:  StoredProcedure [dbo].[PR_OrderDetail_Insert]    Script Date: 07-08-2024 13:14:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_OrderDetail_Insert]
@OrderID INT,
@ProductID INT,
@Quantity INT,
@Amount DECIMAL(10,2),
@TotalAmount DECIMAL(10,2),
@UserID INT
AS
BEGIN
	INSERT INTO [dbo].[PR_OrderDetail_Insert]
	(
		[dbo].[OrderDetai].[OrderID],
		[dbo].[OrderDetail].[ProductID],
		[dbo].[OrderDetail].[Quantity],
		[dbo].[OrderDetail].[Amount],
		[dbo].[OrderDetail].[TotalAmount],
		[dbo].[OrderDetail].[UserID]
	)
	VALUES
	(
		@OrderID,
		@ProductID,
		@Quantity,
		@Amount,
		@TotalAmount,
		@UserID
	)
END
GO
/****** Object:  StoredProcedure [dbo].[PR_OrderDetail_SelectAll]    Script Date: 07-08-2024 13:14:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_OrderDetail_SelectAll]
AS
BEGIN
	SELECT
		[dbo].[OrderDetail].[OrderDetailID],
		[dbo].[OrderDetail].[OrderID],
		[dbo].[Order].[OrderDate],
		[dbo].[Order].[PaymentMode],
		[dbo].[Order].[ShippingAddress],
		[dbo].[Order].[TotalAmount],
		[dbo].[OrderDetail].[ProductID],
		[dbo].[Product].[ProductName],
		[dbo].[OrderDetail].[Quantity],
		[dbo].[OrderDetail].[Amount],
		[dbo].[OrderDetail].[TotalAmount],
		[dbo].[OrderDetail].[UserID],
		[dbo].[User].[UserName]
	FROM [dbo].[OrderDetail]
	INNER JOIN [dbo].[Order]
	ON [dbo].[OrderDetail].[OrderID] = [dbo].[Order].[OrderID]
	INNER JOIN [dbo].[Product]
	ON [dbo].[OrderDetail].[ProductID] = [dbo].[Product].[ProductID]
	INNER JOIN [dbo].[User]
	ON [dbo].[OrderDetail].[UserID] = [dbo].[User].[UserID]
END
GO
/****** Object:  StoredProcedure [dbo].[PR_OrderDetail_SelectAllByPK]    Script Date: 07-08-2024 13:14:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--For Select All By PK From OrderDetail Table
CREATE PROCEDURE [dbo].[PR_OrderDetail_SelectAllByPK]
@OrderDetailID INT
AS
BEGIN
	SELECT
		[dbo].[OrderDetail].[OrderDetailID],
		[dbo].[OrderDetail].[OrderID],
		[dbo].[OrderDetail].[ProductID],
		[dbo].[OrderDetail].[Quantity],
		[dbo].[OrderDetail].[Amount],
		[dbo].[OrderDetail].[TotalAmount],
		[dbo].[OrderDetail].[UserID]
	FROM
		[dbo].[OrderDetail]
	WHERE 
		[dbo].[OrderDetail].[OrderDetailID] = @OrderDetailID
END


GO
/****** Object:  StoredProcedure [dbo].[PR_OrderDetail_Update]    Script Date: 07-08-2024 13:14:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_OrderDetail_Update]
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
	SET
		[dbo].[OrderDetail].[OrderID] = @OrderID,
		[dbo].[OrderDetail].[ProductID] = @ProductID,
		[dbo].[OrderDetail].[Quantity] = @Quantity,
		[dbo].[OrderDetail].[Amount] = @Amount,
		[dbo].[OrderDetail].[TotalAmount] = @TotalAmount,
		[dbo].[OrderDetail].[UserID] = @UserID
	WHERE
		[dbo].[OrderDetail].[OrderDetailID] = @OrderDetailID
END
GO
/****** Object:  StoredProcedure [dbo].[PR_Product_Delete]    Script Date: 07-08-2024 13:14:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Product_Delete]
@ProductID INT
AS
BEGIN
	DELETE 
	FROM 
		[dbo].[Product]
	WHERE 
		[dbo].[Product].[ProductID] = @ProductID
END
GO
/****** Object:  StoredProcedure [dbo].[PR_Product_Insert]    Script Date: 07-08-2024 13:14:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Product_Insert]
@ProductName VARCHAR(100),
@ProductPrice DECIMAL(10,2),
@ProductCode VARCHAR(100),
@Description VARCHAR(100),
@UserID INT
AS
BEGIN
	INSERT INTO [dbo].[Product]
	(
		[dbo].[Product].[ProductName],
		[dbo].[Product].[ProductPrice],
		[dbo].[Product].[ProductCode],
		[dbo].[Product].[Description],
		[dbo].[Product].[UserID]
	)
	VALUES
	(
			@ProductName,
			@ProductPrice,
			@ProductCode,
			@Description,
			@UserID
	)
END
GO
/****** Object:  StoredProcedure [dbo].[PR_Product_SelectAll]    Script Date: 07-08-2024 13:14:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Product_SelectAll]
AS
BEGIN
	SELECT 
		[dbo].[Product].[ProductID],
		[dbo].[Product].[ProductName], 
		[dbo].[Product].[ProductPrice],
		[dbo].[Product].[ProductCode], 
		[dbo].[Product].[Description], 
		[dbo].[Product].[UserID],
		[dbo].[User].[UserName]
	FROM
		[dbo].[Product]
	INNER JOIN [dbo].[User]
	ON [dbo].[Product].[UserID] = [dbo].[User].[UserID]
END
GO
/****** Object:  StoredProcedure [dbo].[PR_Product_SelectByPK]    Script Date: 07-08-2024 13:14:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Product_SelectByPK]
@ProductID INT
AS
BEGIN
	SELECT
		[dbo].[Product].[ProductID],
		[dbo].[Product].[ProductName],
		[dbo].[Product].[ProductPrice],
		[dbo].[Product].[ProductCode],
		[dbo].[Product].[Description],
		[dbo].[Product].[UserID]
	FROM
		[dbo].[Product]
	WHERE
		[dbo].[Product].[ProductID] = @ProductID
END
GO
/****** Object:  StoredProcedure [dbo].[PR_Product_Update]    Script Date: 07-08-2024 13:14:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Product_Update]
@ProductID INT,
@ProductName VARCHAR(100),
@ProductPrice DECIMAL(10,2),
@ProductCode VARCHAR(100),
@Description VARCHAR(100),
@UserID INT
AS
BEGIN
	UPDATE [dbo].[Product]
	SET 
		[dbo].[Product].[ProductName] = @ProductName,
		[dbo].[Product].[ProductPrice] = @ProductPrice,
		[dbo].[Product].[ProductCode] = @ProductCode,
		[dbo].[Product].[Description] = @Description,
		[dbo].[Product].[UserID] = @UserID
	WHERE
		[dbo].[Product].[ProductID] = @ProductID
END
GO
/****** Object:  StoredProcedure [dbo].[PR_User_Delete]    Script Date: 07-08-2024 13:14:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_User_Delete]
@UserID INT
AS
BEGIN
	DELETE FROM [dbo].[User]
	WHERE
		[dbo].[User].[UserID] = @UserID
END
GO
/****** Object:  StoredProcedure [dbo].[PR_User_Insert]    Script Date: 07-08-2024 13:14:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Insert Into User Table
CREATE PROCEDURE [dbo].[PR_User_Insert]
@UserName Varchar(100), 
@Email Varchar(100),
@Password Varchar(100), 
@MobileNo Varchar(15), 
@Address Varchar(100), 
@IsActive BIT
AS
BEGIN
	INSERT INTO [dbo].[User]
	(
		[dbo].[User].[UserName],
		[dbo].[User].[Email], 
		[dbo].[User].[Password], 
		[dbo].[User].[MobileNo],
		[dbo].[User].[Address], 
		[dbo].[User].[IsActive]
	)
	VALUES
	(
		@UserName,
		@Email,
		@Password,
		@MobileNo,
		@Address, 
		@IsActive
	)
END
GO
/****** Object:  StoredProcedure [dbo].[PR_User_SelectAll]    Script Date: 07-08-2024 13:14:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--For Select All From User Table
CREATE PROCEDURE [dbo].[PR_User_SelectAll]
AS
BEGIN
	SELECT 
		[dbo].[User].[UserID],
		[dbo].[User].[UserName],
		[dbo].[User].[Email], 
		[dbo].[User].[Password], 
		[dbo].[User].[MobileNo],
		[dbo].[User].[Address], 
		[dbo].[User].[IsActive]
	FROM
		[dbo].[User]
END
GO
/****** Object:  StoredProcedure [dbo].[PR_User_SelectByPK]    Script Date: 07-08-2024 13:14:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--For Select By PK From User Table
CREATE PROCEDURE [dbo].[PR_User_SelectByPK]
@UserID INT
AS
BEGIN
	SELECT 
		[dbo].[User].[UserID],
		[dbo].[User].[UserName],
		[dbo].[User].[Email], 
		[dbo].[User].[Password], 
		[dbo].[User].[MobileNo],
		[dbo].[User].[Address], 
		[dbo].[User].[IsActive]
	FROM
		[dbo].[User]
	WHERE
		[dbo].[User].[UserID] = @UserID
END
GO
/****** Object:  StoredProcedure [dbo].[PR_User_Update]    Script Date: 07-08-2024 13:14:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--FOR Update User Table
CREATE PROCEDURE [dbo].[PR_User_Update]
@UserID INT,
@UserName Varchar(100), 
@Email Varchar(100),
@Password Varchar(100), 
@MobileNo Varchar(15), 
@Address Varchar(100), 
@IsActive BIT
AS
BEGIN
	UPDATE [dbo].[User]
	SET
		[dbo].[User].[UserName]=@UserName,
		[dbo].[User].[Email]=@Email,
		[dbo].[User].[Password]=@Password,
		[dbo].[User].[MobileNo]=@MobileNo,
		[dbo].[User].[Address]=@Address,
		[dbo].[User].[IsActive]=@IsActive
	WHERE
		[dbo].[User].[UserID] = @UserID
END
GO

create PROCEDURE [dbo].[PR_Customer_DropDown]
AS
BEGIN
    SELECT
		[dbo].[Customer].[CustomerID],
        [dbo].[Customer].[CustomerName]
    FROM
        [dbo].[Customer]
END

create PROCEDURE [dbo].[PR_Order_DropDown]
AS
BEGIN
    SELECT
		[dbo].[Order].[OrderID]
    FROM
        [dbo].[Order]
END

create PROCEDURE [dbo].[PR_Product_DropDown]
AS
BEGIN
    SELECT
		[dbo].[Product].[ProductID],
        [dbo].[Product].[ProductName]
    FROM
        [dbo].[Product]
END

create PROCEDURE [dbo].[PR_User_DropDown]
AS
BEGIN
    SELECT
		[dbo].[User].[UserID],
        [dbo].[User].[UserName]
    FROM
        [dbo].[User]
END