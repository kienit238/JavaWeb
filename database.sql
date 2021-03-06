USE [master]
GO
/****** Object:  Database [PS05194_Business]    Script Date: 14/10/2017 10:00:20 SA ******/
CREATE DATABASE [PS05194_Business]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PS05194_Business', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\PS05194_Business.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'PS05194_Business_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\PS05194_Business_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [PS05194_Business] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PS05194_Business].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PS05194_Business] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PS05194_Business] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PS05194_Business] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PS05194_Business] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PS05194_Business] SET ARITHABORT OFF 
GO
ALTER DATABASE [PS05194_Business] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PS05194_Business] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [PS05194_Business] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PS05194_Business] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PS05194_Business] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PS05194_Business] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PS05194_Business] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PS05194_Business] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PS05194_Business] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PS05194_Business] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PS05194_Business] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PS05194_Business] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PS05194_Business] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PS05194_Business] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PS05194_Business] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PS05194_Business] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PS05194_Business] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PS05194_Business] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PS05194_Business] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PS05194_Business] SET  MULTI_USER 
GO
ALTER DATABASE [PS05194_Business] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PS05194_Business] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PS05194_Business] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PS05194_Business] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [PS05194_Business]
GO
/****** Object:  Table [dbo].[Depart]    Script Date: 14/10/2017 10:00:20 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Depart](
	[ID] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Depart] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Record]    Script Date: 14/10/2017 10:00:20 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Record](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Staffid] [int] NOT NULL,
	[Type] [bit] NULL,
	[Reason] [nvarchar](200) NULL,
	[Date] [date] NULL,
 CONSTRAINT [PK_Record] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Staff]    Script Date: 14/10/2017 10:00:20 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Gender] [bit] NULL,
	[Birthday] [date] NULL,
	[Photo] [nvarchar](300) NULL,
	[Email] [nvarchar](50) NULL,
	[Phone] [nvarchar](20) NULL,
	[Salary] [int] NULL,
	[Notes] [ntext] NULL,
	[Departid] [nvarchar](50) NULL,
	[Username] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[Count] [int] NULL,
	[Role] [bit] NULL,
	[Avatar] [nvarchar](200) NULL,
	[isRemove] [bit] NULL,
 CONSTRAINT [PK_Staff] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
INSERT [dbo].[Depart] ([ID], [Name]) VALUES (N'KD', N'Phòng Kinh Doanh')
INSERT [dbo].[Depart] ([ID], [Name]) VALUES (N'KT', N'Phòng Kế Toán')
INSERT [dbo].[Depart] ([ID], [Name]) VALUES (N'NS', N'Phòng Nhân Sự')
INSERT [dbo].[Depart] ([ID], [Name]) VALUES (N'PT', N'Phòng Phát Triển')
INSERT [dbo].[Depart] ([ID], [Name]) VALUES (N'SX', N'Phòng Sản Xuất')
INSERT [dbo].[Depart] ([ID], [Name]) VALUES (N'TN', N'Phòng Thu Ngân')
SET IDENTITY_INSERT [dbo].[Record] ON 

INSERT [dbo].[Record] ([ID], [Staffid], [Type], [Reason], [Date]) VALUES (1, 1, 1, N'Good', CAST(N'2017-10-09' AS Date))
INSERT [dbo].[Record] ([ID], [Staffid], [Type], [Reason], [Date]) VALUES (2, 1, 1, N'Best', CAST(N'2017-10-09' AS Date))
INSERT [dbo].[Record] ([ID], [Staffid], [Type], [Reason], [Date]) VALUES (3, 2, 1, N'XXX', CAST(N'2017-10-08' AS Date))
INSERT [dbo].[Record] ([ID], [Staffid], [Type], [Reason], [Date]) VALUES (4, 4, 0, N'XXX', CAST(N'2017-10-09' AS Date))
INSERT [dbo].[Record] ([ID], [Staffid], [Type], [Reason], [Date]) VALUES (5, 5, 0, N'Uống rượu', CAST(N'2017-10-09' AS Date))
INSERT [dbo].[Record] ([ID], [Staffid], [Type], [Reason], [Date]) VALUES (6, 4, 0, N'Hút thuốc', CAST(N'2017-10-09' AS Date))
INSERT [dbo].[Record] ([ID], [Staffid], [Type], [Reason], [Date]) VALUES (7, 2, 0, N'Ăn chơi.', NULL)
INSERT [dbo].[Record] ([ID], [Staffid], [Type], [Reason], [Date]) VALUES (8, 4, 1, N'Chăm chỉ', NULL)
SET IDENTITY_INSERT [dbo].[Record] OFF
SET IDENTITY_INSERT [dbo].[Staff] ON 

INSERT [dbo].[Staff] ([ID], [Name], [Gender], [Birthday], [Photo], [Email], [Phone], [Salary], [Notes], [Departid], [Username], [Password], [Count], [Role], [Avatar], [isRemove]) VALUES (1, N'Phạm Huỳnh Vũ Kiên', 1, CAST(N'1993-08-23' AS Date), N'/sources/Avatar/av1.jpg', N'kienphvps05194@fpt.edu.vn', N'01688668503', 8000000, NULL, N'KD', N'admin', N'123', 0, 1, N'/sources/Avatar/av1.jpg', 0)
INSERT [dbo].[Staff] ([ID], [Name], [Gender], [Birthday], [Photo], [Email], [Phone], [Salary], [Notes], [Departid], [Username], [Password], [Count], [Role], [Avatar], [isRemove]) VALUES (2, N'Đỗ Quang Khôi ', 1, CAST(N'1994-01-01' AS Date), N'/sources/Avatar/av2.jpg', N'khoidqps05131@fpt.edu.vn', N'0932497932', 10000000, NULL, N'PT', N'khoidq', N'123', 0, 0, N'/sources/Avatar/av2.jpg', 0)
INSERT [dbo].[Staff] ([ID], [Name], [Gender], [Birthday], [Photo], [Email], [Phone], [Salary], [Notes], [Departid], [Username], [Password], [Count], [Role], [Avatar], [isRemove]) VALUES (3, N'Phạm Quốc Khánh', 1, CAST(N'1994-02-03' AS Date), N'/sources/Avatar/av3.jpg', N'khanhpqps05162@fpt.edu.vn', N'0906658162', 10000000, NULL, N'KT', N'khanhpq', N'123', 0, 0, N'/sources/Avatar/av3.jpg', 0)
INSERT [dbo].[Staff] ([ID], [Name], [Gender], [Birthday], [Photo], [Email], [Phone], [Salary], [Notes], [Departid], [Username], [Password], [Count], [Role], [Avatar], [isRemove]) VALUES (4, N'Nguyễn Trọng Tín', 1, CAST(N'1994-04-06' AS Date), N'/sources/Avatar/av4.jpg', N'tinntps05163@fpt.edu.vn', N'0987470465', 10000000, NULL, N'NS', N'tinnt', N'123', 0, 0, N'/sources/Avatar/av4.jpg', 0)
INSERT [dbo].[Staff] ([ID], [Name], [Gender], [Birthday], [Photo], [Email], [Phone], [Salary], [Notes], [Departid], [Username], [Password], [Count], [Role], [Avatar], [isRemove]) VALUES (5, N'Nguyễn Vũ Hòa', 1, CAST(N'1995-02-03' AS Date), N'/sources/Avatar/av5.jpg', N'hoanvps05132@fpt.edu.vn', N'0924500806', 12000000, NULL, N'PT', N'hoanv', N'123', 0, 0, N'/sources/Avatar/av5.jpg', 0)
INSERT [dbo].[Staff] ([ID], [Name], [Gender], [Birthday], [Photo], [Email], [Phone], [Salary], [Notes], [Departid], [Username], [Password], [Count], [Role], [Avatar], [isRemove]) VALUES (6, N'Nguyễn Lê Khánh', 1, CAST(N'1990-04-04' AS Date), N'/sources/Avatar/av6.jpg', N'khanhnlps05142@fpt.edu.vn', N'0999111222', 8200000, NULL, N'SX', N'khanhnl', N'123', 0, 0, N'/sources/Avatar/av6.jpg', 0)
INSERT [dbo].[Staff] ([ID], [Name], [Gender], [Birthday], [Photo], [Email], [Phone], [Salary], [Notes], [Departid], [Username], [Password], [Count], [Role], [Avatar], [isRemove]) VALUES (7, N'Nguyễn Thành Long', 1, CAST(N'1990-09-06' AS Date), N'/sources/Avatar/av7.jpg', N'longntps05115', N'0979222333', 7000000, NULL, N'KD', N'longnt', N'123', 0, 0, N'/sources/Avatar/av7.jpg', 0)
INSERT [dbo].[Staff] ([ID], [Name], [Gender], [Birthday], [Photo], [Email], [Phone], [Salary], [Notes], [Departid], [Username], [Password], [Count], [Role], [Avatar], [isRemove]) VALUES (8, N'Trương Bông Lai', 1, CAST(N'1997-05-03' AS Date), N'/sources/Avatar/av8.jpg', N'laitbps05110@fpt.edu.vn', N'0168222111', 8000000, NULL, N'SX', N'laitb', N'123', 0, 0, N'/sources/Avatar/av8.jpg', 0)
INSERT [dbo].[Staff] ([ID], [Name], [Gender], [Birthday], [Photo], [Email], [Phone], [Salary], [Notes], [Departid], [Username], [Password], [Count], [Role], [Avatar], [isRemove]) VALUES (9, N'Trần Bình Minh', 1, CAST(N'1995-02-02' AS Date), N'/sources/Avatar/av9.jpg', N'minhtbps05100@fpt.edu.vn', N'0167777666', 7000000, NULL, N'KT', N'minhtb', N'123', 0, 0, N'/sources/Avatar/av9.jpg', 0)
INSERT [dbo].[Staff] ([ID], [Name], [Gender], [Birthday], [Photo], [Email], [Phone], [Salary], [Notes], [Departid], [Username], [Password], [Count], [Role], [Avatar], [isRemove]) VALUES (10, N'Hà Quyết Chiến', 1, CAST(N'1990-05-05' AS Date), N'/sources/Avatar/av10.jpg', N'chienhqps05197@fpt.edu.vn', N'0186333444', 6000000, NULL, N'KD', N'chienhq', N'123', 0, 0, N'/sources/Avatar/av10.jpg', 0)
INSERT [dbo].[Staff] ([ID], [Name], [Gender], [Birthday], [Photo], [Email], [Phone], [Salary], [Notes], [Departid], [Username], [Password], [Count], [Role], [Avatar], [isRemove]) VALUES (11, N'Phạm Thúy An', 0, CAST(N'1995-09-08' AS Date), N'/sources/Avatar/av11.jpg', N'anptps05182@fpt.edu.vn', N'0199565623', 8000000, NULL, N'KT', N'anpt', N'123', 0, 0, N'/sources/Avatar/av11.jpg', 0)
INSERT [dbo].[Staff] ([ID], [Name], [Gender], [Birthday], [Photo], [Email], [Phone], [Salary], [Notes], [Departid], [Username], [Password], [Count], [Role], [Avatar], [isRemove]) VALUES (12, N'Thái Thị Kim Chi', 0, CAST(N'1999-01-06' AS Date), N'/sources/Avatar/av12.jpg', N'chittkps07956@fpt.edu.vn', N'0123456789', 6000000, NULL, N'NS', N'chittk', N'123', 0, 0, N'/sources/Avatar/av12.jpg', 0)
SET IDENTITY_INSERT [dbo].[Staff] OFF
ALTER TABLE [dbo].[Record]  WITH CHECK ADD  CONSTRAINT [FK_Record_Staff] FOREIGN KEY([Staffid])
REFERENCES [dbo].[Staff] ([ID])
GO
ALTER TABLE [dbo].[Record] CHECK CONSTRAINT [FK_Record_Staff]
GO
ALTER TABLE [dbo].[Staff]  WITH CHECK ADD  CONSTRAINT [FK_Staff_Depart] FOREIGN KEY([Departid])
REFERENCES [dbo].[Depart] ([ID])
GO
ALTER TABLE [dbo].[Staff] CHECK CONSTRAINT [FK_Staff_Depart]
GO
USE [master]
GO
ALTER DATABASE [PS05194_Business] SET  READ_WRITE 
GO
