USE [master]
GO
/****** Object:  Database [GreenMall]    Script Date: 2020/5/18 22:40:01 ******/
CREATE DATABASE [GreenMall]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GreenMall', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\GreenMall.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'GreenMall_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\GreenMall_log.ldf' , SIZE = 1040KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [GreenMall] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GreenMall].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GreenMall] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GreenMall] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GreenMall] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GreenMall] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GreenMall] SET ARITHABORT OFF 
GO
ALTER DATABASE [GreenMall] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [GreenMall] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [GreenMall] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GreenMall] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GreenMall] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GreenMall] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GreenMall] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GreenMall] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GreenMall] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GreenMall] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GreenMall] SET  ENABLE_BROKER 
GO
ALTER DATABASE [GreenMall] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GreenMall] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GreenMall] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GreenMall] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GreenMall] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GreenMall] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GreenMall] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GreenMall] SET RECOVERY FULL 
GO
ALTER DATABASE [GreenMall] SET  MULTI_USER 
GO
ALTER DATABASE [GreenMall] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GreenMall] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GreenMall] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GreenMall] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [GreenMall]
GO
/****** Object:  Table [dbo].[Administrators]    Script Date: 2020/5/18 22:40:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Administrators](
	[ManagerID] [int] IDENTITY(1,1) NOT NULL,
	[ManagerName] [nvarchar](50) NULL,
	[Managernumber] [nvarchar](50) NULL,
	[Managerloginnuber] [nvarchar](50) NULL,
	[ManagerrPwd] [nvarchar](50) NULL,
	[ManagerEmail] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ManagerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Billinfo]    Script Date: 2020/5/18 22:40:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Billinfo](
	[BillID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NULL,
	[BusinessPrice] [money] NULL,
	[Profits] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[BillID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Goodstype]    Script Date: 2020/5/18 22:40:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Goodstype](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Typename] [nvarchar](150) NULL,
	[Pid] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Orderinfo]    Script Date: 2020/5/18 22:40:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orderinfo](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[GoodsName] [nvarchar](50) NULL,
	[UserID] [int] NULL,
	[GoodsID] [int] NULL,
	[ManagerID] [int] NULL,
	[Ordertime] [datetime] NULL,
	[Oderstate] [int] NULL,
	[Payable] [money] NULL,
	[Hnrb] [money] NULL,
	[Tobepaid] [money] NULL,
	[Paymentmethod] [nvarchar](10) NULL,
	[Notes] [nvarchar](150) NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Recordsinfo]    Script Date: 2020/5/18 22:40:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recordsinfo](
	[Merchantsid] [int] IDENTITY(1,1) NOT NULL,
	[MerchantsName] [nvarchar](50) NULL,
	[MerchantsType] [int] NULL,
	[MerchantsPhon] [nvarchar](20) NULL,
	[MerPlantingShoping] [nvarchar](150) NULL,
PRIMARY KEY CLUSTERED 
(
	[Merchantsid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Shopinginfo]    Script Date: 2020/5/18 22:40:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shopinginfo](
	[GoodsID] [int] IDENTITY(1,1) NOT NULL,
	[GoodsName] [nvarchar](50) NULL,
	[GoodsPicLarge] [nvarchar](150) NULL,
	[GoodsPPicSmall] [nvarchar](150) NULL,
	[GoodsVideo] [nvarchar](150) NULL,
	[TyIpeD] [int] NULL,
	[AddTime] [datetime] NULL,
	[Price] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[GoodsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Useerinfo]    Script Date: 2020/5/18 22:40:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Useerinfo](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NULL,
	[Usernumber] [nvarchar](50) NULL,
	[Userloginnuber] [nvarchar](50) NULL,
	[UserPwd] [nvarchar](50) NULL,
	[Userphoto] [nvarchar](100) NULL,
	[UserEmail] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Billinfo]  WITH CHECK ADD FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orderinfo] ([OrderID])
GO
ALTER TABLE [dbo].[Goodstype]  WITH CHECK ADD FOREIGN KEY([Pid])
REFERENCES [dbo].[Goodstype] ([ID])
GO
ALTER TABLE [dbo].[Orderinfo]  WITH CHECK ADD FOREIGN KEY([GoodsID])
REFERENCES [dbo].[Shopinginfo] ([GoodsID])
GO
ALTER TABLE [dbo].[Orderinfo]  WITH CHECK ADD FOREIGN KEY([ManagerID])
REFERENCES [dbo].[Administrators] ([ManagerID])
GO
ALTER TABLE [dbo].[Orderinfo]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Useerinfo] ([UserID])
GO
ALTER TABLE [dbo].[Shopinginfo]  WITH CHECK ADD FOREIGN KEY([TyIpeD])
REFERENCES [dbo].[Goodstype] ([ID])
GO
USE [master]
GO
ALTER DATABASE [GreenMall] SET  READ_WRITE 
GO
