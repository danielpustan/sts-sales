USE [danpus21]
GO
/****** Object:  Table [dbo].[DimContact]    Script Date: 2022-03-03 12:42:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimContact](
	[contactID] [bigint] IDENTITY(1,1) NOT NULL,
	[phone] [nvarchar](50) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[address] [nvarchar](50) NOT NULL,
	[zipcode] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[customerNumber] [bigint] NULL,
 CONSTRAINT [PK_DimContact] PRIMARY KEY CLUSTERED 
(
	[contactID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimLocation]    Script Date: 2022-03-03 12:42:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimLocation](
	[LocationID] [bigint] IDENTITY(1,1) NOT NULL,
	[City] [nvarchar](50) NOT NULL,
	[Country] [nvarchar](50) NOT NULL,
	[Region] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_DimLocation] PRIMARY KEY CLUSTERED 
(
	[LocationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimOrder]    Script Date: 2022-03-03 12:42:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimOrder](
	[orderSK] [bigint] IDENTITY(1,1) NOT NULL,
	[orderID] [bigint] NOT NULL,
	[orderRowNumber] [int] NOT NULL,
 CONSTRAINT [PK_DimOrder] PRIMARY KEY CLUSTERED 
(
	[orderSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimProduct]    Script Date: 2022-03-03 12:42:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimProduct](
	[ProductID] [bigint] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](50) NOT NULL,
	[Category] [nvarchar](50) NOT NULL,
	[Line] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_DimProduct] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimTime]    Script Date: 2022-03-03 12:42:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimTime](
	[TimeID] [bigint] IDENTITY(1,1) NOT NULL,
	[Year] [int] NOT NULL,
	[MonthNo] [int] NOT NULL,
	[MonthText] [nvarchar](10) NULL,
	[QuarterNo] [int] NULL,
	[QuarterText] [nvarchar](10) NULL,
	[Day] [int] NOT NULL,
	[DayText] [nvarchar](10) NULL,
	[date] [date] NOT NULL,
 CONSTRAINT [PK_DimTime] PRIMARY KEY CLUSTERED 
(
	[TimeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FactSales]    Script Date: 2022-03-03 12:42:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactSales](
	[TimeID] [bigint] NOT NULL,
	[LocationID] [bigint] NOT NULL,
	[ProductID] [bigint] NOT NULL,
	[SalesCount] [float] NOT NULL,
	[Cost] [money] NOT NULL,
	[Profit] [money] NOT NULL,
	[QuantitySold] [float] NOT NULL,
	[AverageShipmentDelay] [float] NOT NULL,
	[orderSK] [bigint] NOT NULL,
	[contactID] [bigint] NOT NULL,
	[orderRowNumber] [int] NULL,
 CONSTRAINT [PK_FactSales] PRIMARY KEY CLUSTERED 
(
	[TimeID] ASC,
	[LocationID] ASC,
	[ProductID] ASC,
	[orderSK] ASC,
	[contactID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staging]    Script Date: 2022-03-03 12:42:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staging](
	[stagingID] [bigint] IDENTITY(1,1) NOT NULL,
	[LocationID] [bigint] NULL,
	[TimeID] [bigint] NULL,
	[ProductID] [bigint] NULL,
	[SalesCount] [float] NULL,
	[Cost] [money] NULL,
	[Profit] [money] NULL,
	[QuantitySold] [float] NULL,
	[AverageShipmentDelay] [float] NULL,
	[Year] [int] NULL,
	[MonthNo] [int] NULL,
	[MonthText] [nvarchar](10) NULL,
	[QuarterNo] [int] NULL,
	[QuarterText] [nvarchar](10) NULL,
	[City] [nvarchar](255) NULL,
	[Country] [nvarchar](255) NULL,
	[Region] [nvarchar](255) NULL,
	[ProductName] [nvarchar](255) NULL,
	[Category] [nvarchar](255) NULL,
	[Line] [nvarchar](255) NULL,
	[Day] [int] NULL,
	[DayText] [nvarchar](10) NULL,
	[orderID] [bigint] NULL,
	[orderRowNumber] [int] NULL,
	[customerNumber] [bigint] NULL,
	[date] [date] NULL,
	[AvgSaleProcessing] [float] NULL,
	[PercentDeliquentSales] [float] NULL,
	[AvgUnitPrice] [money] NULL,
	[AvgPercentDiscount] [float] NULL,
	[Discount] [money] NULL,
	[GrossSales] [money] NULL,
	[NetSales] [money] NULL,
	[DelinquentSalesCount] [float] NULL,
	[orderSK] [bigint] NULL,
	[contactid] [bigint] NULL,
	[phone] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[address] [nvarchar](50) NULL,
	[zipcode] [nvarchar](50) NULL,
	[name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Staging] PRIMARY KEY CLUSTERED 
(
	[stagingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FactSales]  WITH CHECK ADD  CONSTRAINT [FK_FactSales_DimContact] FOREIGN KEY([contactID])
REFERENCES [dbo].[DimContact] ([contactID])
GO
ALTER TABLE [dbo].[FactSales] CHECK CONSTRAINT [FK_FactSales_DimContact]
GO
ALTER TABLE [dbo].[FactSales]  WITH CHECK ADD  CONSTRAINT [FK_FactSales_DimLocation] FOREIGN KEY([LocationID])
REFERENCES [dbo].[DimLocation] ([LocationID])
GO
ALTER TABLE [dbo].[FactSales] CHECK CONSTRAINT [FK_FactSales_DimLocation]
GO
ALTER TABLE [dbo].[FactSales]  WITH CHECK ADD  CONSTRAINT [FK_FactSales_DimOrder] FOREIGN KEY([orderSK])
REFERENCES [dbo].[DimOrder] ([orderSK])
GO
ALTER TABLE [dbo].[FactSales] CHECK CONSTRAINT [FK_FactSales_DimOrder]
GO
ALTER TABLE [dbo].[FactSales]  WITH CHECK ADD  CONSTRAINT [FK_FactSales_DimProduct] FOREIGN KEY([ProductID])
REFERENCES [dbo].[DimProduct] ([ProductID])
GO
ALTER TABLE [dbo].[FactSales] CHECK CONSTRAINT [FK_FactSales_DimProduct]
GO
ALTER TABLE [dbo].[FactSales]  WITH CHECK ADD  CONSTRAINT [FK_FactSales_DimTime] FOREIGN KEY([TimeID])
REFERENCES [dbo].[DimTime] ([TimeID])
GO
ALTER TABLE [dbo].[FactSales] CHECK CONSTRAINT [FK_FactSales_DimTime]
GO
