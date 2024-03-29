USE [master]
GO
/****** Object:  Database [UfimtsevBanc]    Script Date: 04.10.2023 21:51:05 ******/
CREATE DATABASE [UfimtsevBanc]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'UfimtsevBanc', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\UfimtsevBanc.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'UfimtsevBanc_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\UfimtsevBanc_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [UfimtsevBanc] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [UfimtsevBanc].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [UfimtsevBanc] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [UfimtsevBanc] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [UfimtsevBanc] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [UfimtsevBanc] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [UfimtsevBanc] SET ARITHABORT OFF 
GO
ALTER DATABASE [UfimtsevBanc] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [UfimtsevBanc] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [UfimtsevBanc] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [UfimtsevBanc] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [UfimtsevBanc] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [UfimtsevBanc] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [UfimtsevBanc] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [UfimtsevBanc] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [UfimtsevBanc] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [UfimtsevBanc] SET  DISABLE_BROKER 
GO
ALTER DATABASE [UfimtsevBanc] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [UfimtsevBanc] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [UfimtsevBanc] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [UfimtsevBanc] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [UfimtsevBanc] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [UfimtsevBanc] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [UfimtsevBanc] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [UfimtsevBanc] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [UfimtsevBanc] SET  MULTI_USER 
GO
ALTER DATABASE [UfimtsevBanc] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [UfimtsevBanc] SET DB_CHAINING OFF 
GO
ALTER DATABASE [UfimtsevBanc] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [UfimtsevBanc] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [UfimtsevBanc] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [UfimtsevBanc] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [UfimtsevBanc] SET QUERY_STORE = ON
GO
ALTER DATABASE [UfimtsevBanc] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [UfimtsevBanc]
GO
/****** Object:  Table [dbo].[Bank account]    Script Date: 04.10.2023 21:51:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bank account](
	[NumberAccount] [bigint] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[DateOpen] [date] NOT NULL,
	[Balance] [float] NOT NULL,
	[TypeID] [int] NOT NULL,
 CONSTRAINT [PK_Bank account] PRIMARY KEY CLUSTERED 
(
	[NumberAccount] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contract]    Script Date: 04.10.2023 21:51:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contract](
	[IDContract] [int] IDENTITY(1,1) NOT NULL,
	[NumberAccount] [bigint] NOT NULL,
	[UserID] [int] NOT NULL,
	[Amount] [float] NOT NULL,
	[Period] [int] NOT NULL,
	[ExpirationDate] [date] NOT NULL,
	[Percent] [float] NOT NULL,
 CONSTRAINT [PK_Contract] PRIMARY KEY CLUSTERED 
(
	[IDContract] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[History]    Script Date: 04.10.2023 21:51:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[History](
	[IDOperation] [int] IDENTITY(1,1) NOT NULL,
	[NameOperation] [varchar](10) NOT NULL,
	[DateTime] [datetime] NOT NULL,
	[Amount] [float] NOT NULL,
	[Account] [bigint] NOT NULL,
 CONSTRAINT [PK_History] PRIMARY KEY CLUSTERED 
(
	[IDOperation] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Type]    Script Date: 04.10.2023 21:51:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Type](
	[IDType] [int] IDENTITY(1,1) NOT NULL,
	[NameType] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Type] PRIMARY KEY CLUSTERED 
(
	[IDType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 04.10.2023 21:51:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[IDUser] [int] IDENTITY(1,1) NOT NULL,
	[Login] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Surname] [varchar](50) NOT NULL,
	[Patronymic] [varchar](50) NULL,
	[Series] [varchar](50) NOT NULL,
	[Number] [varchar](50) NOT NULL,
	[Phone] [varchar](11) NOT NULL,
	[Adress] [varchar](60) NOT NULL,
	[E-Mail] [varchar](25) NOT NULL,
	[DateOfIssue] [date] NOT NULL,
	[Issued] [varchar](max) NOT NULL,
	[DateOfBirth] [date] NOT NULL,
	[PlaceOfBirth] [varchar](50) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[IDUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Bank account] ON 

INSERT [dbo].[Bank account] ([NumberAccount], [UserID], [DateOpen], [Balance], [TypeID]) VALUES (7465986898, 5, CAST(N'2017-07-27' AS Date), 274425.13, 2)
INSERT [dbo].[Bank account] ([NumberAccount], [UserID], [DateOpen], [Balance], [TypeID]) VALUES (7465986948, 11, CAST(N'2017-08-17' AS Date), 8171.69, 2)
INSERT [dbo].[Bank account] ([NumberAccount], [UserID], [DateOpen], [Balance], [TypeID]) VALUES (7465986998, 1, CAST(N'2017-06-09' AS Date), 63795.98, 2)
INSERT [dbo].[Bank account] ([NumberAccount], [UserID], [DateOpen], [Balance], [TypeID]) VALUES (7465987048, 4, CAST(N'2017-08-16' AS Date), 512933.89, 3)
INSERT [dbo].[Bank account] ([NumberAccount], [UserID], [DateOpen], [Balance], [TypeID]) VALUES (7465987098, 10, CAST(N'2017-08-10' AS Date), 73263.89, 3)
INSERT [dbo].[Bank account] ([NumberAccount], [UserID], [DateOpen], [Balance], [TypeID]) VALUES (7465987148, 2, CAST(N'2018-01-01' AS Date), 763774.34, 2)
INSERT [dbo].[Bank account] ([NumberAccount], [UserID], [DateOpen], [Balance], [TypeID]) VALUES (7465987198, 15, CAST(N'2017-09-05' AS Date), 54427.29, 1)
INSERT [dbo].[Bank account] ([NumberAccount], [UserID], [DateOpen], [Balance], [TypeID]) VALUES (7465987248, 18, CAST(N'2018-03-05' AS Date), 29173.36, 1)
INSERT [dbo].[Bank account] ([NumberAccount], [UserID], [DateOpen], [Balance], [TypeID]) VALUES (7465987298, 13, CAST(N'2017-09-04' AS Date), 25469.09, 3)
INSERT [dbo].[Bank account] ([NumberAccount], [UserID], [DateOpen], [Balance], [TypeID]) VALUES (7465987348, 19, CAST(N'2017-10-20' AS Date), 52846.89, 1)
INSERT [dbo].[Bank account] ([NumberAccount], [UserID], [DateOpen], [Balance], [TypeID]) VALUES (7465987398, 12, CAST(N'2018-03-23' AS Date), 49382.92, 3)
INSERT [dbo].[Bank account] ([NumberAccount], [UserID], [DateOpen], [Balance], [TypeID]) VALUES (7465987448, 14, CAST(N'2017-05-30' AS Date), 94527.5, 2)
INSERT [dbo].[Bank account] ([NumberAccount], [UserID], [DateOpen], [Balance], [TypeID]) VALUES (7465987498, 25, CAST(N'2018-01-04' AS Date), 98093.11, 1)
INSERT [dbo].[Bank account] ([NumberAccount], [UserID], [DateOpen], [Balance], [TypeID]) VALUES (7465987548, 24, CAST(N'2017-11-08' AS Date), 28868.08, 2)
INSERT [dbo].[Bank account] ([NumberAccount], [UserID], [DateOpen], [Balance], [TypeID]) VALUES (7465987598, 29, CAST(N'2017-09-07' AS Date), 95517.95, 2)
INSERT [dbo].[Bank account] ([NumberAccount], [UserID], [DateOpen], [Balance], [TypeID]) VALUES (7465987648, 40, CAST(N'2017-09-11' AS Date), 45680.02, 2)
INSERT [dbo].[Bank account] ([NumberAccount], [UserID], [DateOpen], [Balance], [TypeID]) VALUES (7465987698, 1, CAST(N'2018-03-06' AS Date), 226214.67, 2)
INSERT [dbo].[Bank account] ([NumberAccount], [UserID], [DateOpen], [Balance], [TypeID]) VALUES (7465987748, 16, CAST(N'2017-10-19' AS Date), 960290.92, 2)
INSERT [dbo].[Bank account] ([NumberAccount], [UserID], [DateOpen], [Balance], [TypeID]) VALUES (7465987798, 26, CAST(N'2017-09-18' AS Date), 84092.25, 1)
INSERT [dbo].[Bank account] ([NumberAccount], [UserID], [DateOpen], [Balance], [TypeID]) VALUES (7465987848, 21, CAST(N'2017-05-17' AS Date), 55103.53, 3)
INSERT [dbo].[Bank account] ([NumberAccount], [UserID], [DateOpen], [Balance], [TypeID]) VALUES (7465987898, 48, CAST(N'2017-06-06' AS Date), 69675.67, 1)
INSERT [dbo].[Bank account] ([NumberAccount], [UserID], [DateOpen], [Balance], [TypeID]) VALUES (7465987948, 50, CAST(N'2017-06-23' AS Date), 30578.58, 3)
INSERT [dbo].[Bank account] ([NumberAccount], [UserID], [DateOpen], [Balance], [TypeID]) VALUES (7465987998, 6, CAST(N'2017-10-25' AS Date), 74349.78, 3)
INSERT [dbo].[Bank account] ([NumberAccount], [UserID], [DateOpen], [Balance], [TypeID]) VALUES (7465988048, 34, CAST(N'2017-08-08' AS Date), 19419.86, 3)
INSERT [dbo].[Bank account] ([NumberAccount], [UserID], [DateOpen], [Balance], [TypeID]) VALUES (7465988098, 3, CAST(N'2017-11-15' AS Date), 870368.31, 3)
INSERT [dbo].[Bank account] ([NumberAccount], [UserID], [DateOpen], [Balance], [TypeID]) VALUES (7465988148, 28, CAST(N'2017-09-27' AS Date), 919979.74, 2)
INSERT [dbo].[Bank account] ([NumberAccount], [UserID], [DateOpen], [Balance], [TypeID]) VALUES (7465988198, 9, CAST(N'2018-02-16' AS Date), 405047.48, 3)
INSERT [dbo].[Bank account] ([NumberAccount], [UserID], [DateOpen], [Balance], [TypeID]) VALUES (7465988248, 33, CAST(N'2018-02-05' AS Date), 979076.86, 2)
INSERT [dbo].[Bank account] ([NumberAccount], [UserID], [DateOpen], [Balance], [TypeID]) VALUES (7465988298, 16, CAST(N'2018-02-08' AS Date), 680618.21, 1)
INSERT [dbo].[Bank account] ([NumberAccount], [UserID], [DateOpen], [Balance], [TypeID]) VALUES (7465988348, 8, CAST(N'2017-03-24' AS Date), 929954.87, 3)
INSERT [dbo].[Bank account] ([NumberAccount], [UserID], [DateOpen], [Balance], [TypeID]) VALUES (7465988398, 43, CAST(N'2017-11-13' AS Date), 55257.66, 2)
INSERT [dbo].[Bank account] ([NumberAccount], [UserID], [DateOpen], [Balance], [TypeID]) VALUES (7465988448, 30, CAST(N'2018-02-27' AS Date), 86201.13, 3)
INSERT [dbo].[Bank account] ([NumberAccount], [UserID], [DateOpen], [Balance], [TypeID]) VALUES (7465988498, 7, CAST(N'2017-06-30' AS Date), 65878.24, 2)
INSERT [dbo].[Bank account] ([NumberAccount], [UserID], [DateOpen], [Balance], [TypeID]) VALUES (7465988548, 17, CAST(N'2017-06-15' AS Date), 22562.29, 1)
INSERT [dbo].[Bank account] ([NumberAccount], [UserID], [DateOpen], [Balance], [TypeID]) VALUES (7465988598, 40, CAST(N'2017-10-16' AS Date), 62945.19, 3)
INSERT [dbo].[Bank account] ([NumberAccount], [UserID], [DateOpen], [Balance], [TypeID]) VALUES (7465988648, 35, CAST(N'2017-09-12' AS Date), 70773.29, 2)
INSERT [dbo].[Bank account] ([NumberAccount], [UserID], [DateOpen], [Balance], [TypeID]) VALUES (7465988698, 38, CAST(N'2017-04-19' AS Date), 42070.02, 3)
INSERT [dbo].[Bank account] ([NumberAccount], [UserID], [DateOpen], [Balance], [TypeID]) VALUES (7465988748, 45, CAST(N'2017-11-07' AS Date), 21932.71, 1)
INSERT [dbo].[Bank account] ([NumberAccount], [UserID], [DateOpen], [Balance], [TypeID]) VALUES (7465988798, 48, CAST(N'2017-06-19' AS Date), 4765.38, 1)
INSERT [dbo].[Bank account] ([NumberAccount], [UserID], [DateOpen], [Balance], [TypeID]) VALUES (7465988848, 36, CAST(N'2017-04-21' AS Date), 29367.11, 3)
INSERT [dbo].[Bank account] ([NumberAccount], [UserID], [DateOpen], [Balance], [TypeID]) VALUES (7465988898, 41, CAST(N'2017-12-26' AS Date), 96385.93, 3)
INSERT [dbo].[Bank account] ([NumberAccount], [UserID], [DateOpen], [Balance], [TypeID]) VALUES (7465988948, 16, CAST(N'2017-04-06' AS Date), 9113.2, 1)
INSERT [dbo].[Bank account] ([NumberAccount], [UserID], [DateOpen], [Balance], [TypeID]) VALUES (7465988998, 49, CAST(N'2017-09-22' AS Date), 5815.74, 2)
INSERT [dbo].[Bank account] ([NumberAccount], [UserID], [DateOpen], [Balance], [TypeID]) VALUES (7465989048, 32, CAST(N'2017-06-22' AS Date), 26922.7, 2)
INSERT [dbo].[Bank account] ([NumberAccount], [UserID], [DateOpen], [Balance], [TypeID]) VALUES (7465989098, 47, CAST(N'2017-09-20' AS Date), 83449.99, 3)
INSERT [dbo].[Bank account] ([NumberAccount], [UserID], [DateOpen], [Balance], [TypeID]) VALUES (7465989148, 20, CAST(N'2017-10-30' AS Date), 73140.58, 3)
INSERT [dbo].[Bank account] ([NumberAccount], [UserID], [DateOpen], [Balance], [TypeID]) VALUES (7465989198, 44, CAST(N'2018-03-20' AS Date), 20087.88, 1)
INSERT [dbo].[Bank account] ([NumberAccount], [UserID], [DateOpen], [Balance], [TypeID]) VALUES (7465989248, 37, CAST(N'2018-01-30' AS Date), 96037.7, 1)
INSERT [dbo].[Bank account] ([NumberAccount], [UserID], [DateOpen], [Balance], [TypeID]) VALUES (7465989298, 35, CAST(N'2017-05-25' AS Date), 69828.51, 2)
INSERT [dbo].[Bank account] ([NumberAccount], [UserID], [DateOpen], [Balance], [TypeID]) VALUES (7465989348, 44, CAST(N'2017-12-29' AS Date), 97814.04, 3)
INSERT [dbo].[Bank account] ([NumberAccount], [UserID], [DateOpen], [Balance], [TypeID]) VALUES (7465989398, 39, CAST(N'2017-06-16' AS Date), 87722.01, 3)
INSERT [dbo].[Bank account] ([NumberAccount], [UserID], [DateOpen], [Balance], [TypeID]) VALUES (7465989448, 46, CAST(N'2017-06-29' AS Date), 29980.55, 2)
INSERT [dbo].[Bank account] ([NumberAccount], [UserID], [DateOpen], [Balance], [TypeID]) VALUES (7465989498, 22, CAST(N'2018-01-29' AS Date), 4936.04, 2)
INSERT [dbo].[Bank account] ([NumberAccount], [UserID], [DateOpen], [Balance], [TypeID]) VALUES (7465989548, 47, CAST(N'2018-03-16' AS Date), 77326.57, 3)
INSERT [dbo].[Bank account] ([NumberAccount], [UserID], [DateOpen], [Balance], [TypeID]) VALUES (7465989598, 41, CAST(N'2018-01-05' AS Date), 79631.95, 3)
INSERT [dbo].[Bank account] ([NumberAccount], [UserID], [DateOpen], [Balance], [TypeID]) VALUES (7465989648, 23, CAST(N'2017-08-02' AS Date), 69382.8, 3)
INSERT [dbo].[Bank account] ([NumberAccount], [UserID], [DateOpen], [Balance], [TypeID]) VALUES (7465989698, 43, CAST(N'2017-05-23' AS Date), 53609.02, 3)
INSERT [dbo].[Bank account] ([NumberAccount], [UserID], [DateOpen], [Balance], [TypeID]) VALUES (7465989748, 42, CAST(N'2017-10-11' AS Date), 40371.4, 2)
INSERT [dbo].[Bank account] ([NumberAccount], [UserID], [DateOpen], [Balance], [TypeID]) VALUES (7465989798, 31, CAST(N'2018-03-19' AS Date), 47.87, 1)
INSERT [dbo].[Bank account] ([NumberAccount], [UserID], [DateOpen], [Balance], [TypeID]) VALUES (7465989848, 27, CAST(N'2018-01-24' AS Date), 14421.26, 3)
INSERT [dbo].[Bank account] ([NumberAccount], [UserID], [DateOpen], [Balance], [TypeID]) VALUES (7465989849, 1, CAST(N'2022-12-20' AS Date), 600000, 3)
INSERT [dbo].[Bank account] ([NumberAccount], [UserID], [DateOpen], [Balance], [TypeID]) VALUES (7465989850, 1, CAST(N'2022-12-20' AS Date), 600000, 3)
INSERT [dbo].[Bank account] ([NumberAccount], [UserID], [DateOpen], [Balance], [TypeID]) VALUES (7465989851, 1, CAST(N'2022-12-20' AS Date), 600000, 3)
INSERT [dbo].[Bank account] ([NumberAccount], [UserID], [DateOpen], [Balance], [TypeID]) VALUES (7465989852, 1, CAST(N'2022-12-20' AS Date), 600000, 3)
INSERT [dbo].[Bank account] ([NumberAccount], [UserID], [DateOpen], [Balance], [TypeID]) VALUES (7465989853, 2, CAST(N'2022-12-20' AS Date), 600000, 3)
INSERT [dbo].[Bank account] ([NumberAccount], [UserID], [DateOpen], [Balance], [TypeID]) VALUES (7465989854, 2, CAST(N'2022-12-20' AS Date), 600000, 3)
INSERT [dbo].[Bank account] ([NumberAccount], [UserID], [DateOpen], [Balance], [TypeID]) VALUES (7465989855, 2, CAST(N'2022-12-20' AS Date), 600000, 3)
INSERT [dbo].[Bank account] ([NumberAccount], [UserID], [DateOpen], [Balance], [TypeID]) VALUES (7465989856, 2, CAST(N'2022-12-20' AS Date), 600000, 3)
INSERT [dbo].[Bank account] ([NumberAccount], [UserID], [DateOpen], [Balance], [TypeID]) VALUES (7465989857, 2, CAST(N'2022-12-20' AS Date), 600000, 3)
INSERT [dbo].[Bank account] ([NumberAccount], [UserID], [DateOpen], [Balance], [TypeID]) VALUES (7465989858, 25, CAST(N'2022-12-20' AS Date), 600000, 3)
INSERT [dbo].[Bank account] ([NumberAccount], [UserID], [DateOpen], [Balance], [TypeID]) VALUES (7465989859, 25, CAST(N'2022-12-20' AS Date), 600000, 3)
INSERT [dbo].[Bank account] ([NumberAccount], [UserID], [DateOpen], [Balance], [TypeID]) VALUES (7465989860, 25, CAST(N'2022-12-20' AS Date), 600000, 3)
INSERT [dbo].[Bank account] ([NumberAccount], [UserID], [DateOpen], [Balance], [TypeID]) VALUES (7465989861, 4, CAST(N'2022-12-20' AS Date), 4274400, 3)
INSERT [dbo].[Bank account] ([NumberAccount], [UserID], [DateOpen], [Balance], [TypeID]) VALUES (7465989862, 4, CAST(N'2022-12-20' AS Date), 3689500, 3)
INSERT [dbo].[Bank account] ([NumberAccount], [UserID], [DateOpen], [Balance], [TypeID]) VALUES (7465989863, 1, CAST(N'2023-01-11' AS Date), 600000, 3)
INSERT [dbo].[Bank account] ([NumberAccount], [UserID], [DateOpen], [Balance], [TypeID]) VALUES (7465989864, 32, CAST(N'2023-01-11' AS Date), 600000, 3)
INSERT [dbo].[Bank account] ([NumberAccount], [UserID], [DateOpen], [Balance], [TypeID]) VALUES (7465989865, 32, CAST(N'2023-01-11' AS Date), 600000, 3)
INSERT [dbo].[Bank account] ([NumberAccount], [UserID], [DateOpen], [Balance], [TypeID]) VALUES (7465989866, 32, CAST(N'2023-01-11' AS Date), 600000, 3)
INSERT [dbo].[Bank account] ([NumberAccount], [UserID], [DateOpen], [Balance], [TypeID]) VALUES (7465989867, 32, CAST(N'2023-01-11' AS Date), 600000, 3)
INSERT [dbo].[Bank account] ([NumberAccount], [UserID], [DateOpen], [Balance], [TypeID]) VALUES (7465989868, 3, CAST(N'2023-01-15' AS Date), 600000, 3)
INSERT [dbo].[Bank account] ([NumberAccount], [UserID], [DateOpen], [Balance], [TypeID]) VALUES (7465989869, 3, CAST(N'2023-01-16' AS Date), 4574600, 3)
INSERT [dbo].[Bank account] ([NumberAccount], [UserID], [DateOpen], [Balance], [TypeID]) VALUES (7465989870, 1, CAST(N'2023-01-18' AS Date), 600000, 3)
INSERT [dbo].[Bank account] ([NumberAccount], [UserID], [DateOpen], [Balance], [TypeID]) VALUES (7465989871, 1, CAST(N'2023-01-19' AS Date), 6779400, 3)
INSERT [dbo].[Bank account] ([NumberAccount], [UserID], [DateOpen], [Balance], [TypeID]) VALUES (7465989872, 1, CAST(N'2023-01-19' AS Date), 5159000, 3)
INSERT [dbo].[Bank account] ([NumberAccount], [UserID], [DateOpen], [Balance], [TypeID]) VALUES (7465989873, 1, CAST(N'2023-04-11' AS Date), 6010500, 3)
SET IDENTITY_INSERT [dbo].[Bank account] OFF
GO
SET IDENTITY_INSERT [dbo].[Contract] ON 

INSERT [dbo].[Contract] ([IDContract], [NumberAccount], [UserID], [Amount], [Period], [ExpirationDate], [Percent]) VALUES (1, 7465987048, 4, 9243406, 514, CAST(N'2018-12-23' AS Date), 5.45)
INSERT [dbo].[Contract] ([IDContract], [NumberAccount], [UserID], [Amount], [Period], [ExpirationDate], [Percent]) VALUES (2, 7465987098, 10, 9262312, 1806, CAST(N'2022-07-28' AS Date), 7.01)
INSERT [dbo].[Contract] ([IDContract], [NumberAccount], [UserID], [Amount], [Period], [ExpirationDate], [Percent]) VALUES (3, 7465987298, 13, 7674776, 538, CAST(N'2018-11-29' AS Date), 7.24)
INSERT [dbo].[Contract] ([IDContract], [NumberAccount], [UserID], [Amount], [Period], [ExpirationDate], [Percent]) VALUES (4, 7465987398, 12, 4300921, 1158, CAST(N'2020-10-17' AS Date), 7.09)
INSERT [dbo].[Contract] ([IDContract], [NumberAccount], [UserID], [Amount], [Period], [ExpirationDate], [Percent]) VALUES (5, 7465987848, 21, 5930501, 1404, CAST(N'2021-06-14' AS Date), 7.72)
INSERT [dbo].[Contract] ([IDContract], [NumberAccount], [UserID], [Amount], [Period], [ExpirationDate], [Percent]) VALUES (6, 7465987948, 50, 8768245, 1757, CAST(N'2022-10-24' AS Date), 5.26)
INSERT [dbo].[Contract] ([IDContract], [NumberAccount], [UserID], [Amount], [Period], [ExpirationDate], [Percent]) VALUES (7, 7465987998, 6, 9636413, 1415, CAST(N'2021-07-21' AS Date), 7.91)
INSERT [dbo].[Contract] ([IDContract], [NumberAccount], [UserID], [Amount], [Period], [ExpirationDate], [Percent]) VALUES (8, 7465988048, 34, 4846960, 1776, CAST(N'2023-01-14' AS Date), 7.66)
INSERT [dbo].[Contract] ([IDContract], [NumberAccount], [UserID], [Amount], [Period], [ExpirationDate], [Percent]) VALUES (9, 7465988098, 3, 2264676, 1292, CAST(N'2021-03-19' AS Date), 5.02)
INSERT [dbo].[Contract] ([IDContract], [NumberAccount], [UserID], [Amount], [Period], [ExpirationDate], [Percent]) VALUES (10, 7465988198, 9, 3246609, 850, CAST(N'2020-02-17' AS Date), 6.07)
INSERT [dbo].[Contract] ([IDContract], [NumberAccount], [UserID], [Amount], [Period], [ExpirationDate], [Percent]) VALUES (11, 7465988348, 8, 8065098, 1233, CAST(N'2021-08-07' AS Date), 5.3)
INSERT [dbo].[Contract] ([IDContract], [NumberAccount], [UserID], [Amount], [Period], [ExpirationDate], [Percent]) VALUES (12, 7465988448, 30, 2503709, 1491, CAST(N'2021-06-29' AS Date), 7.61)
INSERT [dbo].[Contract] ([IDContract], [NumberAccount], [UserID], [Amount], [Period], [ExpirationDate], [Percent]) VALUES (13, 7465988598, 40, 2063445, 1525, CAST(N'2022-03-09' AS Date), 5.66)
INSERT [dbo].[Contract] ([IDContract], [NumberAccount], [UserID], [Amount], [Period], [ExpirationDate], [Percent]) VALUES (14, 7465988698, 38, 3887739, 361, CAST(N'2018-11-04' AS Date), 7.95)
INSERT [dbo].[Contract] ([IDContract], [NumberAccount], [UserID], [Amount], [Period], [ExpirationDate], [Percent]) VALUES (15, 7465988848, 36, 1648472, 272, CAST(N'2018-06-06' AS Date), 7.74)
INSERT [dbo].[Contract] ([IDContract], [NumberAccount], [UserID], [Amount], [Period], [ExpirationDate], [Percent]) VALUES (16, 7465988898, 41, 4565138, 608, CAST(N'2019-05-12' AS Date), 6.85)
INSERT [dbo].[Contract] ([IDContract], [NumberAccount], [UserID], [Amount], [Period], [ExpirationDate], [Percent]) VALUES (17, 7465989098, 47, 3207607, 530, CAST(N'2019-08-18' AS Date), 5.8)
INSERT [dbo].[Contract] ([IDContract], [NumberAccount], [UserID], [Amount], [Period], [ExpirationDate], [Percent]) VALUES (18, 7465989148, 20, 1730227, 1784, CAST(N'2022-09-07' AS Date), 7.86)
INSERT [dbo].[Contract] ([IDContract], [NumberAccount], [UserID], [Amount], [Period], [ExpirationDate], [Percent]) VALUES (19, 7465989348, 44, 6069953, 646, CAST(N'2019-06-26' AS Date), 7.14)
INSERT [dbo].[Contract] ([IDContract], [NumberAccount], [UserID], [Amount], [Period], [ExpirationDate], [Percent]) VALUES (20, 7465989398, 39, 8073914, 1003, CAST(N'2020-02-14' AS Date), 6.48)
INSERT [dbo].[Contract] ([IDContract], [NumberAccount], [UserID], [Amount], [Period], [ExpirationDate], [Percent]) VALUES (21, 7465989548, 47, 6581384, 732, CAST(N'2019-06-08' AS Date), 5.48)
INSERT [dbo].[Contract] ([IDContract], [NumberAccount], [UserID], [Amount], [Period], [ExpirationDate], [Percent]) VALUES (22, 7465989598, 41, 4124064, 1799, CAST(N'2022-05-27' AS Date), 7.66)
INSERT [dbo].[Contract] ([IDContract], [NumberAccount], [UserID], [Amount], [Period], [ExpirationDate], [Percent]) VALUES (23, 7465989648, 23, 6078127, 1774, CAST(N'2022-09-03' AS Date), 5.97)
INSERT [dbo].[Contract] ([IDContract], [NumberAccount], [UserID], [Amount], [Period], [ExpirationDate], [Percent]) VALUES (24, 7465989698, 43, 8432956, 1007, CAST(N'2020-05-11' AS Date), 7.18)
INSERT [dbo].[Contract] ([IDContract], [NumberAccount], [UserID], [Amount], [Period], [ExpirationDate], [Percent]) VALUES (25, 7465989848, 27, 7252815, 1482, CAST(N'2021-12-06' AS Date), 7.83)
INSERT [dbo].[Contract] ([IDContract], [NumberAccount], [UserID], [Amount], [Period], [ExpirationDate], [Percent]) VALUES (26, 7465989849, 1, 600000, 12, CAST(N'2023-12-20' AS Date), 9.85)
INSERT [dbo].[Contract] ([IDContract], [NumberAccount], [UserID], [Amount], [Period], [ExpirationDate], [Percent]) VALUES (27, 7465989849, 1, 600000, 12, CAST(N'2023-12-20' AS Date), 9.85)
INSERT [dbo].[Contract] ([IDContract], [NumberAccount], [UserID], [Amount], [Period], [ExpirationDate], [Percent]) VALUES (28, 7465989849, 1, 600000, 12, CAST(N'2023-12-20' AS Date), 9.85)
INSERT [dbo].[Contract] ([IDContract], [NumberAccount], [UserID], [Amount], [Period], [ExpirationDate], [Percent]) VALUES (29, 7465989849, 1, 600000, 12, CAST(N'2023-12-20' AS Date), 9.85)
INSERT [dbo].[Contract] ([IDContract], [NumberAccount], [UserID], [Amount], [Period], [ExpirationDate], [Percent]) VALUES (30, 7465989853, 2, 600000, 12, CAST(N'2023-12-20' AS Date), 9.85)
INSERT [dbo].[Contract] ([IDContract], [NumberAccount], [UserID], [Amount], [Period], [ExpirationDate], [Percent]) VALUES (31, 7465989853, 2, 600000, 12, CAST(N'2023-12-20' AS Date), 9.85)
INSERT [dbo].[Contract] ([IDContract], [NumberAccount], [UserID], [Amount], [Period], [ExpirationDate], [Percent]) VALUES (32, 7465989853, 2, 600000, 12, CAST(N'2023-12-20' AS Date), 9.85)
INSERT [dbo].[Contract] ([IDContract], [NumberAccount], [UserID], [Amount], [Period], [ExpirationDate], [Percent]) VALUES (33, 7465989853, 2, 600000, 12, CAST(N'2023-12-20' AS Date), 9.85)
INSERT [dbo].[Contract] ([IDContract], [NumberAccount], [UserID], [Amount], [Period], [ExpirationDate], [Percent]) VALUES (34, 7465989853, 2, 600000, 12, CAST(N'2023-12-20' AS Date), 9.85)
INSERT [dbo].[Contract] ([IDContract], [NumberAccount], [UserID], [Amount], [Period], [ExpirationDate], [Percent]) VALUES (35, 7465989858, 25, 600000, 12, CAST(N'2023-12-20' AS Date), 9.85)
INSERT [dbo].[Contract] ([IDContract], [NumberAccount], [UserID], [Amount], [Period], [ExpirationDate], [Percent]) VALUES (36, 7465989858, 25, 600000, 12, CAST(N'2023-12-20' AS Date), 9.85)
INSERT [dbo].[Contract] ([IDContract], [NumberAccount], [UserID], [Amount], [Period], [ExpirationDate], [Percent]) VALUES (37, 7465989858, 25, 600000, 12, CAST(N'2023-12-20' AS Date), 9.85)
INSERT [dbo].[Contract] ([IDContract], [NumberAccount], [UserID], [Amount], [Period], [ExpirationDate], [Percent]) VALUES (38, 7465989861, 4, 4274400, 12, CAST(N'2023-12-20' AS Date), 6.1)
INSERT [dbo].[Contract] ([IDContract], [NumberAccount], [UserID], [Amount], [Period], [ExpirationDate], [Percent]) VALUES (39, 7465989862, 4, 3689500, 26, CAST(N'2025-02-20' AS Date), 6.55)
INSERT [dbo].[Contract] ([IDContract], [NumberAccount], [UserID], [Amount], [Period], [ExpirationDate], [Percent]) VALUES (40, 7465989863, 1, 600000, 12, CAST(N'2024-01-11' AS Date), 6.55)
INSERT [dbo].[Contract] ([IDContract], [NumberAccount], [UserID], [Amount], [Period], [ExpirationDate], [Percent]) VALUES (41, 7465989864, 32, 600000, 12, CAST(N'2024-01-11' AS Date), 6.55)
INSERT [dbo].[Contract] ([IDContract], [NumberAccount], [UserID], [Amount], [Period], [ExpirationDate], [Percent]) VALUES (42, 7465989864, 32, 600000, 12, CAST(N'2024-01-11' AS Date), 6.55)
INSERT [dbo].[Contract] ([IDContract], [NumberAccount], [UserID], [Amount], [Period], [ExpirationDate], [Percent]) VALUES (43, 7465989864, 32, 600000, 12, CAST(N'2024-01-11' AS Date), 6.55)
INSERT [dbo].[Contract] ([IDContract], [NumberAccount], [UserID], [Amount], [Period], [ExpirationDate], [Percent]) VALUES (44, 7465989864, 32, 600000, 12, CAST(N'2024-01-11' AS Date), 9.85)
INSERT [dbo].[Contract] ([IDContract], [NumberAccount], [UserID], [Amount], [Period], [ExpirationDate], [Percent]) VALUES (45, 7465989868, 3, 600000, 12, CAST(N'2024-01-15' AS Date), 9.85)
INSERT [dbo].[Contract] ([IDContract], [NumberAccount], [UserID], [Amount], [Period], [ExpirationDate], [Percent]) VALUES (46, 7465989869, 3, 4574600, 12, CAST(N'2024-01-16' AS Date), 6.1)
INSERT [dbo].[Contract] ([IDContract], [NumberAccount], [UserID], [Amount], [Period], [ExpirationDate], [Percent]) VALUES (47, 7465989870, 1, 600000, 19, CAST(N'2024-08-18' AS Date), 9.85)
INSERT [dbo].[Contract] ([IDContract], [NumberAccount], [UserID], [Amount], [Period], [ExpirationDate], [Percent]) VALUES (48, 7465989871, 1, 6779400, 12, CAST(N'2024-01-19' AS Date), 9.85)
INSERT [dbo].[Contract] ([IDContract], [NumberAccount], [UserID], [Amount], [Period], [ExpirationDate], [Percent]) VALUES (49, 7465989872, 1, 5159000, 14, CAST(N'2024-03-19' AS Date), 9.85)
INSERT [dbo].[Contract] ([IDContract], [NumberAccount], [UserID], [Amount], [Period], [ExpirationDate], [Percent]) VALUES (50, 7465989873, 1, 6010500, 19, CAST(N'2024-11-11' AS Date), 9.85)
SET IDENTITY_INSERT [dbo].[Contract] OFF
GO
SET IDENTITY_INSERT [dbo].[History] ON 

INSERT [dbo].[History] ([IDOperation], [NameOperation], [DateTime], [Amount], [Account]) VALUES (41, N'Снятие', CAST(N'2018-04-07T00:00:00.000' AS DateTime), 3084, 7465986898)
INSERT [dbo].[History] ([IDOperation], [NameOperation], [DateTime], [Amount], [Account]) VALUES (42, N'Пополнение', CAST(N'2018-04-11T00:00:00.000' AS DateTime), 5600, 7465986948)
INSERT [dbo].[History] ([IDOperation], [NameOperation], [DateTime], [Amount], [Account]) VALUES (43, N'Снятие', CAST(N'2018-03-24T00:00:00.000' AS DateTime), 338, 7465986898)
INSERT [dbo].[History] ([IDOperation], [NameOperation], [DateTime], [Amount], [Account]) VALUES (44, N'Снятие', CAST(N'2018-04-10T00:00:00.000' AS DateTime), 3559, 7465987448)
INSERT [dbo].[History] ([IDOperation], [NameOperation], [DateTime], [Amount], [Account]) VALUES (45, N'Снятие', CAST(N'2018-04-03T00:00:00.000' AS DateTime), 2267, 7465987198)
INSERT [dbo].[History] ([IDOperation], [NameOperation], [DateTime], [Amount], [Account]) VALUES (46, N'Пополнение', CAST(N'2018-03-29T00:00:00.000' AS DateTime), 5700, 7465986998)
INSERT [dbo].[History] ([IDOperation], [NameOperation], [DateTime], [Amount], [Account]) VALUES (47, N'Пополнение', CAST(N'2018-04-04T00:00:00.000' AS DateTime), 8700, 7465987048)
INSERT [dbo].[History] ([IDOperation], [NameOperation], [DateTime], [Amount], [Account]) VALUES (48, N'Пополнение', CAST(N'2018-04-09T00:00:00.000' AS DateTime), 5550, 7465987098)
INSERT [dbo].[History] ([IDOperation], [NameOperation], [DateTime], [Amount], [Account]) VALUES (49, N'Снятие', CAST(N'2018-03-28T00:00:00.000' AS DateTime), 820, 7465987148)
INSERT [dbo].[History] ([IDOperation], [NameOperation], [DateTime], [Amount], [Account]) VALUES (50, N'Снятие', CAST(N'2018-04-06T00:00:00.000' AS DateTime), 7476, 7465987398)
INSERT [dbo].[History] ([IDOperation], [NameOperation], [DateTime], [Amount], [Account]) VALUES (51, N'Пополнение', CAST(N'2018-03-29T00:00:00.000' AS DateTime), 3600, 7465987248)
INSERT [dbo].[History] ([IDOperation], [NameOperation], [DateTime], [Amount], [Account]) VALUES (52, N'Снятие', CAST(N'2018-04-06T00:00:00.000' AS DateTime), 9267, 7465987248)
INSERT [dbo].[History] ([IDOperation], [NameOperation], [DateTime], [Amount], [Account]) VALUES (53, N'Снятие', CAST(N'2018-03-24T00:00:00.000' AS DateTime), 6321, 7465987298)
INSERT [dbo].[History] ([IDOperation], [NameOperation], [DateTime], [Amount], [Account]) VALUES (54, N'Снятие', CAST(N'2018-03-30T00:00:00.000' AS DateTime), 5949, 7465987348)
INSERT [dbo].[History] ([IDOperation], [NameOperation], [DateTime], [Amount], [Account]) VALUES (55, N'Пополнение', CAST(N'2018-03-26T00:00:00.000' AS DateTime), 8500, 7465987398)
INSERT [dbo].[History] ([IDOperation], [NameOperation], [DateTime], [Amount], [Account]) VALUES (56, N'Пополнение', CAST(N'2018-04-09T00:00:00.000' AS DateTime), 6050, 7465987848)
INSERT [dbo].[History] ([IDOperation], [NameOperation], [DateTime], [Amount], [Account]) VALUES (57, N'Пополнение', CAST(N'2018-04-10T00:00:00.000' AS DateTime), 8200, 7465987498)
INSERT [dbo].[History] ([IDOperation], [NameOperation], [DateTime], [Amount], [Account]) VALUES (58, N'Снятие', CAST(N'2018-03-27T00:00:00.000' AS DateTime), 5013, 7465987548)
INSERT [dbo].[History] ([IDOperation], [NameOperation], [DateTime], [Amount], [Account]) VALUES (59, N'Снятие', CAST(N'2018-04-02T00:00:00.000' AS DateTime), 8571, 7465987598)
INSERT [dbo].[History] ([IDOperation], [NameOperation], [DateTime], [Amount], [Account]) VALUES (60, N'Снятие', CAST(N'2018-03-25T00:00:00.000' AS DateTime), 9569, 7465987648)
INSERT [dbo].[History] ([IDOperation], [NameOperation], [DateTime], [Amount], [Account]) VALUES (61, N'Пополнение', CAST(N'2018-04-09T00:00:00.000' AS DateTime), 7900, 7465987698)
INSERT [dbo].[History] ([IDOperation], [NameOperation], [DateTime], [Amount], [Account]) VALUES (62, N'Пополнение', CAST(N'2018-04-10T00:00:00.000' AS DateTime), 1700, 7465987748)
INSERT [dbo].[History] ([IDOperation], [NameOperation], [DateTime], [Amount], [Account]) VALUES (63, N'Снятие', CAST(N'2018-03-29T00:00:00.000' AS DateTime), 7441, 7465987798)
INSERT [dbo].[History] ([IDOperation], [NameOperation], [DateTime], [Amount], [Account]) VALUES (64, N'Пополнение', CAST(N'2018-03-27T00:00:00.000' AS DateTime), 9750, 7465987848)
INSERT [dbo].[History] ([IDOperation], [NameOperation], [DateTime], [Amount], [Account]) VALUES (65, N'Снятие', CAST(N'2018-03-25T00:00:00.000' AS DateTime), 1112, 7465987898)
INSERT [dbo].[History] ([IDOperation], [NameOperation], [DateTime], [Amount], [Account]) VALUES (66, N'Пополнение', CAST(N'2018-04-03T00:00:00.000' AS DateTime), 9400, 7465987948)
INSERT [dbo].[History] ([IDOperation], [NameOperation], [DateTime], [Amount], [Account]) VALUES (67, N'Пополнение', CAST(N'2018-03-24T00:00:00.000' AS DateTime), 4550, 7465987998)
INSERT [dbo].[History] ([IDOperation], [NameOperation], [DateTime], [Amount], [Account]) VALUES (68, N'Пополнение', CAST(N'2018-03-28T00:00:00.000' AS DateTime), 300, 7465988048)
INSERT [dbo].[History] ([IDOperation], [NameOperation], [DateTime], [Amount], [Account]) VALUES (69, N'Снятие', CAST(N'2018-03-30T00:00:00.000' AS DateTime), 8414, 7465988098)
INSERT [dbo].[History] ([IDOperation], [NameOperation], [DateTime], [Amount], [Account]) VALUES (70, N'Снятие', CAST(N'2018-04-07T00:00:00.000' AS DateTime), 474, 7465988148)
INSERT [dbo].[History] ([IDOperation], [NameOperation], [DateTime], [Amount], [Account]) VALUES (71, N'Пополнение', CAST(N'2018-04-05T00:00:00.000' AS DateTime), 7400, 7465988198)
INSERT [dbo].[History] ([IDOperation], [NameOperation], [DateTime], [Amount], [Account]) VALUES (72, N'Снятие', CAST(N'2018-04-09T00:00:00.000' AS DateTime), 6955, 7465988248)
INSERT [dbo].[History] ([IDOperation], [NameOperation], [DateTime], [Amount], [Account]) VALUES (73, N'Пополнение', CAST(N'2018-03-24T00:00:00.000' AS DateTime), 1000, 7465988298)
INSERT [dbo].[History] ([IDOperation], [NameOperation], [DateTime], [Amount], [Account]) VALUES (74, N'Пополнение', CAST(N'2018-04-08T00:00:00.000' AS DateTime), 9200, 7465988348)
INSERT [dbo].[History] ([IDOperation], [NameOperation], [DateTime], [Amount], [Account]) VALUES (75, N'Снятие', CAST(N'2018-04-07T00:00:00.000' AS DateTime), 9254, 7465988398)
INSERT [dbo].[History] ([IDOperation], [NameOperation], [DateTime], [Amount], [Account]) VALUES (76, N'Пополнение', CAST(N'2018-03-27T00:00:00.000' AS DateTime), 9800, 7465988448)
INSERT [dbo].[History] ([IDOperation], [NameOperation], [DateTime], [Amount], [Account]) VALUES (77, N'Пополнение', CAST(N'2018-03-25T00:00:00.000' AS DateTime), 6000, 7465988498)
INSERT [dbo].[History] ([IDOperation], [NameOperation], [DateTime], [Amount], [Account]) VALUES (78, N'Снятие', CAST(N'2018-04-01T00:00:00.000' AS DateTime), 7754, 7465988548)
INSERT [dbo].[History] ([IDOperation], [NameOperation], [DateTime], [Amount], [Account]) VALUES (79, N'Пополнение', CAST(N'2018-04-04T00:00:00.000' AS DateTime), 4200, 7465988398)
INSERT [dbo].[History] ([IDOperation], [NameOperation], [DateTime], [Amount], [Account]) VALUES (80, N'Снятие', CAST(N'2018-03-28T00:00:00.000' AS DateTime), 8257, 7465987848)
SET IDENTITY_INSERT [dbo].[History] OFF
GO
SET IDENTITY_INSERT [dbo].[Type] ON 

INSERT [dbo].[Type] ([IDType], [NameType]) VALUES (1, N'Кредитный')
INSERT [dbo].[Type] ([IDType], [NameType]) VALUES (2, N'Дебетовый')
INSERT [dbo].[Type] ([IDType], [NameType]) VALUES (3, N'Депозитный')
SET IDENTITY_INSERT [dbo].[Type] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([IDUser], [Login], [Password], [Name], [Surname], [Patronymic], [Series], [Number], [Phone], [Adress], [E-Mail], [DateOfIssue], [Issued], [DateOfBirth], [PlaceOfBirth]) VALUES (1, N'11198151', N'3QjGHM', N'Александр ', N'Смирнов', N'Иванович', N'4513', N'989722', N'88005353535', N'Площадь Соловецких Юнг, дом № 25, квартира 8', N'smirnov@qwer.ty', CAST(N'2014-12-01' AS Date), N'Отделение по району Арбат ОУФМС России по городу Москве в ЦАО', CAST(N'1987-02-16' AS Date), N'Гор. Приморск Калининградской обл.')
INSERT [dbo].[User] ([IDUser], [Login], [Password], [Name], [Surname], [Patronymic], [Series], [Number], [Phone], [Adress], [E-Mail], [DateOfIssue], [Issued], [DateOfBirth], [PlaceOfBirth]) VALUES (2, N'11198201', N'6RElM44FHBa4g5S2VJ', N'Максим ', N'Иванов', N'Петрович', N'4511', N'267981', N'85003296574', N'Улица 1905 Года, дом 1, квартира 56', N'ivanovmi@qwer.ty', CAST(N'2012-03-25' AS Date), N'Отделение по району Таганский ОУФМС России по городу Москве в ЦАО', CAST(N'1997-06-13' AS Date), N'Гор. Киров Калужской области')
INSERT [dbo].[User] ([IDUser], [Login], [Password], [Name], [Surname], [Patronymic], [Series], [Number], [Phone], [Adress], [E-Mail], [DateOfIssue], [Issued], [DateOfBirth], [PlaceOfBirth]) VALUES (3, N'11198251', N'7vvOdp', N'Дарья', N'Кузнецова', N'Николаевна', N'9852', N'161662', N'89004685299', N'3-й Автозаводский проезд, дом 9, квартира 168', N'kuzn@qwer.ty', CAST(N'2003-06-06' AS Date), N'Отделение по району Тверской ОУФМС России по городу Москве в ЦАО', CAST(N'1974-08-13' AS Date), N'Гор. Радужный Владимирской обл.')
INSERT [dbo].[User] ([IDUser], [Login], [Password], [Name], [Surname], [Patronymic], [Series], [Number], [Phone], [Adress], [E-Mail], [DateOfIssue], [Issued], [DateOfBirth], [PlaceOfBirth]) VALUES (4, N'11198301', N'9OzMPyhHqTbvHMg3Y0', N'Артём', N'Соколов', N'Алексеевич', N'7542', N'230521', N'84569852365', N'Улица Академика Янгеля, дом 52, корп. 2, квартира 52', N'sokolov@qwer.ty', CAST(N'2007-11-08' AS Date), N'Отделение по району Беговой ОУФМС России по городу Москве в САО', CAST(N'1995-03-24' AS Date), N'Гор. Красноармейск Московской обл.')
INSERT [dbo].[User] ([IDUser], [Login], [Password], [Name], [Surname], [Patronymic], [Series], [Number], [Phone], [Adress], [E-Mail], [DateOfIssue], [Issued], [DateOfBirth], [PlaceOfBirth]) VALUES (5, N'11198351', N'a58JH1bxD5BN0mhfxM', N'Никита', N'Попов', N'Кириллович', N'4523', N'589923', N'84598523675', N'Алтуфьевское шоссе, дом 78, квартира 63', N'popov@qwer.ty', CAST(N'2010-01-30' AS Date), N'Отделение по району Бескудниковский ОУФМС России по городу Москве в САО', CAST(N'1970-09-10' AS Date), N'Гор. Краснознаменск Калининградской обл.')
INSERT [dbo].[User] ([IDUser], [Login], [Password], [Name], [Surname], [Patronymic], [Series], [Number], [Phone], [Adress], [E-Mail], [DateOfIssue], [Issued], [DateOfBirth], [PlaceOfBirth]) VALUES (6, N'11198401', N'aJBTahvyRnOJlnl85g', N'Дмитрий', N'Лебедев', N'Анатольевич', N'6321', N'169845', N'87596542365', N'Староватутинский проезд, дом 20, квартира 45', N'lebedev@qwer.ty', CAST(N'2009-04-29' AS Date), N'Отделение по району Коптево ОУФМС России по городу Москве в САО', CAST(N'1983-04-27' AS Date), N'Гор. Краснослободск Волгоградской обл.')
INSERT [dbo].[User] ([IDUser], [Login], [Password], [Name], [Surname], [Patronymic], [Series], [Number], [Phone], [Adress], [E-Mail], [DateOfIssue], [Issued], [DateOfBirth], [PlaceOfBirth]) VALUES (7, N'11198451', N'CiYKA519tAMlqktBk7', N'Егор ', N'Козлов', N'Александрович', N'1259', N'468520', N'84236985642', N'Андроньевская площадь, дом 7, квартира 36', N'kozlov@qwer.ty', CAST(N'2013-08-15' AS Date), N'Отделение по району Левобережный ОУФМС России по городу Москве в САО', CAST(N'1983-07-26' AS Date), N'Гор. Благовещенск Амурской области')
INSERT [dbo].[User] ([IDUser], [Login], [Password], [Name], [Surname], [Patronymic], [Series], [Number], [Phone], [Adress], [E-Mail], [DateOfIssue], [Issued], [DateOfBirth], [PlaceOfBirth]) VALUES (8, N'11198501', N'CTtpfJgrLszusmfKiS', N'Даниил', N'Новиков', N'Сергеевич', N'6784', N'989604', N'89423015895', N'Староорловская улица, дом 12, квартира 157', N'novikov@qwer.ty', CAST(N'2006-05-22' AS Date), N'Отделение по району Молжаниновский ОУФМС России по городу Москве в САО', CAST(N'1993-09-29' AS Date), N'Гор. Сергиев Посад Московской обл.')
INSERT [dbo].[User] ([IDUser], [Login], [Password], [Name], [Surname], [Patronymic], [Series], [Number], [Phone], [Adress], [E-Mail], [DateOfIssue], [Issued], [DateOfBirth], [PlaceOfBirth]) VALUES (9, N'11198551', N'd6WYQjwinVWkTpm2xr', N'Михаил', N'Морозов', N'Павлович', N'7842', N'132588', N'84572268745', N'Анненская улица, дом 85, квартира 69', N'morozov@qwer.ty', CAST(N'2016-10-23' AS Date), N'Отделение по району Савёловский ОУФМС России по городу Москве в САО', CAST(N'1978-10-24' AS Date), N'Гор. Советск Тульской области')
INSERT [dbo].[User] ([IDUser], [Login], [Password], [Name], [Surname], [Patronymic], [Series], [Number], [Phone], [Adress], [E-Mail], [DateOfIssue], [Issued], [DateOfBirth], [PlaceOfBirth]) VALUES (10, N'11198601', N'egNPSVZbahCw9eGN7h', N'Андрей', N'Петров', N'Владимирович', N'3685', N'597875', N'84215875215', N'Улица Старый Гай, дом 45, квартира 49', N'petrov@qwer.ty', CAST(N'2004-07-25' AS Date), N'Отделение по району Тимирязевский ОУФМС России по городу Москве в САО', CAST(N'1981-11-20' AS Date), N'Гор. Ставрополь')
INSERT [dbo].[User] ([IDUser], [Login], [Password], [Name], [Surname], [Patronymic], [Series], [Number], [Phone], [Adress], [E-Mail], [DateOfIssue], [Issued], [DateOfBirth], [PlaceOfBirth]) VALUES (11, N'11198651', N'eU1oxIwjZnfChSbMFT', N'Алексей', N'Волков', N'Романович', N'4653', N'498532', N'88452625254', N'Бабаевская улица, дом 2, корп. 3, квартира 74', N'volkov@qwer.ty', CAST(N'2003-09-05' AS Date), N'Отделение по району Ховрино ОУФМС России по городу Москве в САО', CAST(N'1977-03-01' AS Date), N'Гор. Лобня Московской обл.')
INSERT [dbo].[User] ([IDUser], [Login], [Password], [Name], [Surname], [Patronymic], [Series], [Number], [Phone], [Adress], [E-Mail], [DateOfIssue], [Issued], [DateOfBirth], [PlaceOfBirth]) VALUES (12, N'11198701', N'EzpJHEq1w1EVwXSvgO', N'Илья', N'Соловьёв', N'Константинович', N'2156', N'164582', N'84526825526', N'Улица Строителей, дом 74, квартира 175', N'soloviev@qwer.ty', CAST(N'2012-01-10' AS Date), N'Отделение по району Хорошёвский ОУФМС России по городу Москве в САО', CAST(N'1985-10-08' AS Date), N'Г. Тюмень')
INSERT [dbo].[User] ([IDUser], [Login], [Password], [Name], [Surname], [Patronymic], [Series], [Number], [Phone], [Adress], [E-Mail], [DateOfIssue], [Issued], [DateOfBirth], [PlaceOfBirth]) VALUES (13, N'11198751', N'fGxtshkeKdK0qUWojz', N'Кирилл', N'Васильев', N'Владиславович', N'9865', N'312654', N'86138420555', N'Барабанный переулок, дом 4, корп. 5, квартира 95', N'vasiliev@qwer.ty', CAST(N'2013-11-15' AS Date), N'Отделение по району Алексеевский ОУФМС России по городу Москве в СВАО', CAST(N'1975-05-28' AS Date), N'Гор. Никольск Вологодской области')
INSERT [dbo].[User] ([IDUser], [Login], [Password], [Name], [Surname], [Patronymic], [Series], [Number], [Phone], [Adress], [E-Mail], [DateOfIssue], [Issued], [DateOfBirth], [PlaceOfBirth]) VALUES (14, N'11198801', N'gdbKuitHoZddoTPucD', N'Сергей', N'Зайцев', N'Игоревич', N'2326', N'789582', N'84654851686', N'Улица Судакова, дом 13, квартира 198', N'zaycev@qwer.ty', CAST(N'2015-09-28' AS Date), N'Отделение по району Бабушкинский ОУФМС России по городу Москве в СВАО', CAST(N'1989-05-15' AS Date), N'Гор. Заречный Пензенской области')
INSERT [dbo].[User] ([IDUser], [Login], [Password], [Name], [Surname], [Patronymic], [Series], [Number], [Phone], [Adress], [E-Mail], [DateOfIssue], [Issued], [DateOfBirth], [PlaceOfBirth]) VALUES (15, N'11198851', N'GgvL9nMWcyHgHyMwxY', N'Владислав', N'Павлов', N'Викторович', N'9862', N'659874', N'85532875267', N'Сходненский проезд, дом 10, квартира 216', N'pavlov@qwer.ty', CAST(N'2008-06-12' AS Date), N'Отделение по району Марфино ОУФМС России по городу Москве в СВАО', CAST(N'1988-10-31' AS Date), N'Гор. Озёрск Калининградской области')
INSERT [dbo].[User] ([IDUser], [Login], [Password], [Name], [Surname], [Patronymic], [Series], [Number], [Phone], [Adress], [E-Mail], [DateOfIssue], [Issued], [DateOfBirth], [PlaceOfBirth]) VALUES (16, N'11198901', N'GRWAnx5BgWVsvH5A57', N'Роман', N'Семёнов', N'Васильевич', N'3232', N'201265', N'82457157525', N'Площадь Белы Куна, дом 32, корп. 2, квартира 42', N'semenov@qwer.ty', CAST(N'2005-10-03' AS Date), N'Отделение по району Бибирево ОУФМС России по городу Москве в СВАО', CAST(N'1973-08-17' AS Date), N'Г. Орёл')
INSERT [dbo].[User] ([IDUser], [Login], [Password], [Name], [Surname], [Patronymic], [Series], [Number], [Phone], [Adress], [E-Mail], [DateOfIssue], [Issued], [DateOfBirth], [PlaceOfBirth]) VALUES (17, N'11198951', N'hVfU4jfWLhuGKBqjKG', N'Владимир', N'Голубев', N'Петрович', N'1328', N'745956', N'86459524585', N'Тамбовская улица, дом 8, квартира 15', N'golubev@qwer.ty', CAST(N'2012-03-23' AS Date), N'Отделение по району Бутырский ОУФМС России по городу Москве в СВАО', CAST(N'1999-06-21' AS Date), N'Гор. Дмитров')
INSERT [dbo].[User] ([IDUser], [Login], [Password], [Name], [Surname], [Patronymic], [Series], [Number], [Phone], [Adress], [E-Mail], [DateOfIssue], [Issued], [DateOfBirth], [PlaceOfBirth]) VALUES (18, N'11199001', N'HW75uK9wGv64XVj00F', N'Тимофей', N'Виноградов', N'Тимофеевич', N'6892', N'302123', N'84572252989', N'Улица Берзарина, дом 9, квартира 85', N'vinogradov@qwer.ty', CAST(N'2018-02-16' AS Date), N'Отделение по району Останкинский ОУФМС России по городу Москве в СВАО', CAST(N'1987-01-28' AS Date), N'Гор. Волгоград')
INSERT [dbo].[User] ([IDUser], [Login], [Password], [Name], [Surname], [Patronymic], [Series], [Number], [Phone], [Adress], [E-Mail], [DateOfIssue], [Issued], [DateOfBirth], [PlaceOfBirth]) VALUES (19, N'11199051', N'iBQKgxitWVia1UcZLc', N'Матвей', N'Богданов', N'Антонович', N'5986', N'656963', N'86482157555', N'Бесединский мост, дом 6, квартира 47', N'bogdanov@qwer.ty', CAST(N'2007-12-28' AS Date), N'Отделение по району Отрадное ОУФМС России по городу Москве в СВАО', CAST(N'1988-06-07' AS Date), N'Г.  Санкт-Петербург')
INSERT [dbo].[User] ([IDUser], [Login], [Password], [Name], [Surname], [Patronymic], [Series], [Number], [Phone], [Adress], [E-Mail], [DateOfIssue], [Issued], [DateOfBirth], [PlaceOfBirth]) VALUES (20, N'11199101', N'Ih4bcxT0G6fYXmA7aC', N'Георгий', N'Воробьёв', N'Валерьевич', N'7964', N'154825', N'84688822852', N'Тверской бульвар, дом 2, квартира 75', N'vorobiev@qwer.ty', CAST(N'2002-10-10' AS Date), N'Отделение по району Свиблово ОУФМС России по городу Москве в СВАО', CAST(N'1979-04-09' AS Date), N'Гор.  Новосибирск')
INSERT [dbo].[User] ([IDUser], [Login], [Password], [Name], [Surname], [Patronymic], [Series], [Number], [Phone], [Adress], [E-Mail], [DateOfIssue], [Issued], [DateOfBirth], [PlaceOfBirth]) VALUES (21, N'11199151', N'itRLonnM6Qx3ClPIXb', N'Николай', N'Фёдоров', N'Иванович', N'2394', N'743657', N'86459215585', N'Улица Улофа Пальме, дом 6, квартира 65', N'phedorov@qwer.ty', CAST(N'2003-11-25' AS Date), N'Отделение по району Северное Медведково ОУФМС России по городу Москве в СВАО', CAST(N'1998-12-03' AS Date), N'Гор. Екатеринбург')
INSERT [dbo].[User] ([IDUser], [Login], [Password], [Name], [Surname], [Patronymic], [Series], [Number], [Phone], [Adress], [E-Mail], [DateOfIssue], [Issued], [DateOfBirth], [PlaceOfBirth]) VALUES (22, N'11199201', N'J05dxx2uXzYsbFtOiz', N'Павел', N'Михайлов', N'Петрович', N'8623', N'953684', N'84589221015', N'Устьинский проезд, дом 16, квартира 167', N'michailov@qwer.ty', CAST(N'2011-04-26' AS Date), N'Отделение по району Северный ОУФМС России по городу Москве в СВАО', CAST(N'1978-01-18' AS Date), N'Гор. Москва')
INSERT [dbo].[User] ([IDUser], [Login], [Password], [Name], [Surname], [Patronymic], [Series], [Number], [Phone], [Adress], [E-Mail], [DateOfIssue], [Issued], [DateOfBirth], [PlaceOfBirth]) VALUES (23, N'11199251', N'j1UuMqx1ntqJkif42S', N'Арсений ', N'Беляев', N'Николаевич', N'2986', N'213025', N'85497522542', N'Бурцевская улица, дом 36, корп. 3, квартира 45', N'belyaev@qwer.ty', CAST(N'2016-01-05' AS Date), N'Отделение по району Южное Медведково ОУФМС России по городу Москве в СВАО', CAST(N'1998-08-11' AS Date), N'Гор. Казань')
INSERT [dbo].[User] ([IDUser], [Login], [Password], [Name], [Surname], [Patronymic], [Series], [Number], [Phone], [Adress], [E-Mail], [DateOfIssue], [Issued], [DateOfBirth], [PlaceOfBirth]) VALUES (24, N'11199301', N'jdVOqCHWxaNi6NkzSt', N'Денис', N'Тарасов', N'Алексеевич', N'2966', N'956420', N'85485112358', N'Улица Фадеева, дом 3, квартира 115', N'tarasov@qwer.ty', CAST(N'2017-11-24' AS Date), N'Отделение по району Ярославский ОУФМС России по городу Москве в СВАО', CAST(N'1984-11-13' AS Date), N'Гор. Самара')
INSERT [dbo].[User] ([IDUser], [Login], [Password], [Name], [Surname], [Patronymic], [Series], [Number], [Phone], [Adress], [E-Mail], [DateOfIssue], [Issued], [DateOfBirth], [PlaceOfBirth]) VALUES (25, N'11199351', N'jFXpiR7K6sRZFLg2s1', N'Степан', N'Белов', N'Кириллович', N'2368', N'369785', N'86596620154', N'Улица Вавилова, дом 42, квартира 128', N'belov@qwer.ty', CAST(N'2007-08-03' AS Date), N'Отделение по району Богородское ОУФМС России по городу Москве в ВАО', CAST(N'1987-01-22' AS Date), N'Г. Челябинск')
INSERT [dbo].[User] ([IDUser], [Login], [Password], [Name], [Surname], [Patronymic], [Series], [Number], [Phone], [Adress], [E-Mail], [DateOfIssue], [Issued], [DateOfBirth], [PlaceOfBirth]) VALUES (26, N'11199401', N'k2TVAonWmrFnYiKNiX', N'Фёдор', N'Комаров', N'Анатольевич', N'1359', N'546798', N'82156225962', N'Варшавское шоссе, дом 168, квартира 42', N'komarov@qwer.ty', CAST(N'2003-01-07' AS Date), N'Отделение по району Восточное Измайлово ОУФМС России по городу Москве в ВАО', CAST(N'1998-02-25' AS Date), N'Гор. Омск')
INSERT [dbo].[User] ([IDUser], [Login], [Password], [Name], [Surname], [Patronymic], [Series], [Number], [Phone], [Adress], [E-Mail], [DateOfIssue], [Issued], [DateOfBirth], [PlaceOfBirth]) VALUES (27, N'11199451', N'Kk3Qd78OhyRa4opQU7', N'Данила', N'Орлов', N'Александрович', N'6795', N'132560', N'86520756586', N'Гаврикова улица, дом 1, квартира 95', N'orlov@qwer.ty', CAST(N'2010-05-03' AS Date), N'Отделение по району Восточный ОУФМС России по городу Москве в ВАО', CAST(N'1986-04-03' AS Date), N'Г. Ростов-на-Дону')
INSERT [dbo].[User] ([IDUser], [Login], [Password], [Name], [Surname], [Patronymic], [Series], [Number], [Phone], [Adress], [E-Mail], [DateOfIssue], [Issued], [DateOfBirth], [PlaceOfBirth]) VALUES (28, N'11199501', N'kp7tugUy3HsKCmmtlc', N'Антон', N'Киселёв', N'Сергеевич', N'2386', N'258645', N'87549854856', N'Фруктовая улица, дом 6, квартира 53', N'kisilev@qwer.ty', CAST(N'2005-05-16' AS Date), N'Отделение по району Гольяново ОУФМС России по городу Москве в ВАО', CAST(N'1997-09-09' AS Date), N'Гор. Уфа')
INSERT [dbo].[User] ([IDUser], [Login], [Password], [Name], [Surname], [Patronymic], [Series], [Number], [Phone], [Adress], [E-Mail], [DateOfIssue], [Issued], [DateOfBirth], [PlaceOfBirth]) VALUES (29, N'11199551', N'L983dBgTDQ1tGerWCq', N'Константин', N'Макаров', N'Павлович', N'2376', N'752346', N'84689522545', N'Давыдковская улица, дом 74, квартира 132', N'makarov@qwer.ty', CAST(N'2010-06-17' AS Date), N'Отделение по району Ивановское ОУФМС России по городу Москве в ВАО', CAST(N'1994-02-15' AS Date), N'Гор. Советск Тульской области')
INSERT [dbo].[User] ([IDUser], [Login], [Password], [Name], [Surname], [Patronymic], [Series], [Number], [Phone], [Adress], [E-Mail], [DateOfIssue], [Issued], [DateOfBirth], [PlaceOfBirth]) VALUES (30, N'11199601', N'LhS2dykZ2OTAscYf1g', N'Глеб', N'Андреев', N'Владимирович', N'5985', N'213577', N'85498659855', N'Хвалынский бульвар, дом 65, квартира 32', N'andreev@qwer.ty', CAST(N'2002-09-11' AS Date), N'Отделение по району Метрогородок ОУФМС России по городу Москве в ВАО', CAST(N'1994-12-01' AS Date), N'Гор. Ставрополь')
INSERT [dbo].[User] ([IDUser], [Login], [Password], [Name], [Surname], [Patronymic], [Series], [Number], [Phone], [Adress], [E-Mail], [DateOfIssue], [Issued], [DateOfBirth], [PlaceOfBirth]) VALUES (31, N'11199651', N'M0JgTAhYpTmWUErWm7', N'Ярослав', N'Ковалёв', N'Романович', N'2354', N'543258', N'82487628982', N'Егорьевская улица, дом 42, квартира 213', N'kovalev@qwer.ty', CAST(N'2017-11-15' AS Date), N'Отделение по району Новокосино ОУФМС России по городу Москве в ВАО', CAST(N'1986-02-05' AS Date), N'Гор. Лобня Московской обл.')
INSERT [dbo].[User] ([IDUser], [Login], [Password], [Name], [Surname], [Patronymic], [Series], [Number], [Phone], [Adress], [E-Mail], [DateOfIssue], [Issued], [DateOfBirth], [PlaceOfBirth]) VALUES (32, N'11199701', N'm6KjH5EZqxSkNqv1bk', N'Григорий', N'Ильин', N'Константинович', N'7528', N'699505', N'82598525558', N'Хордовый проезд, дом 2, квартира 52', N'ilin@qwer.ty', CAST(N'2012-01-25' AS Date), N'Отделение по району Преображенское ОУФМС России по городу Москве в ВАО', CAST(N'1990-11-30' AS Date), N'Г. Тюмень')
INSERT [dbo].[User] ([IDUser], [Login], [Password], [Name], [Surname], [Patronymic], [Series], [Number], [Phone], [Adress], [E-Mail], [DateOfIssue], [Issued], [DateOfBirth], [PlaceOfBirth]) VALUES (33, N'11199751', N'87235890123', N'Игорь', N'Гусев', N'Владиславович', N'8087', N'321456', N'82265525855', N'Жебрунова улица, дом 3, корп. 4, квартира 154', N'gusev@qwer.ty', CAST(N'2009-02-26' AS Date), N'Отделение по району Соколиная гора ОУФМС России по городу Москве в ВАО', CAST(N'1980-07-10' AS Date), N'Гор. Никольск Вологодской области')
INSERT [dbo].[User] ([IDUser], [Login], [Password], [Name], [Surname], [Patronymic], [Series], [Number], [Phone], [Adress], [E-Mail], [DateOfIssue], [Issued], [DateOfBirth], [PlaceOfBirth]) VALUES (34, N'11199801', N'mcqGZcEu3uORGiX3gw', N'Евгений', N'Титов', N'Игоревич', N'3057', N'275264', N'87897956626', N'Улица Цандера, дом 62, квартира 123', N'titov@qwer.ty', CAST(N'2007-11-06' AS Date), N'Отделение по району Выхино ОУФМС России по городу Москве в ЮВАО', CAST(N'1989-10-24' AS Date), N'Гор. Заречный Пензенской области')
INSERT [dbo].[User] ([IDUser], [Login], [Password], [Name], [Surname], [Patronymic], [Series], [Number], [Phone], [Adress], [E-Mail], [DateOfIssue], [Issued], [DateOfBirth], [PlaceOfBirth]) VALUES (35, N'11199851', N'n06XQfr9xIglyRxoBw', N'Тимур', N'Кузьмин', N'Викторович', N'9731', N'579524', N'82058220820', N'Улица Цюрупы, дом 52, квартира 32', N'kuzmin@qwer.ty', CAST(N'2001-03-16' AS Date), N'Отделение по району Жулебино ОУФМС России по городу Москве в ЮВАО', CAST(N'1988-08-12' AS Date), N'Гор. Озёрск Калининградской области')
INSERT [dbo].[User] ([IDUser], [Login], [Password], [Name], [Surname], [Patronymic], [Series], [Number], [Phone], [Adress], [E-Mail], [DateOfIssue], [Issued], [DateOfBirth], [PlaceOfBirth]) VALUES (36, N'11199901', N'O8NmOA27AH5lrD7pck', N'Руслан', N'Кудрявцев', N'Васильевич', N'1388', N'698852', N'81358622258', N'Чагинская улица, дом 2, квартира 16', N'kudryavcev@qwer.ty', CAST(N'2009-06-10' AS Date), N'Отделение по району Капотня ОУФМС России по городу Москве в ЮВАО', CAST(N'1992-11-11' AS Date), N'Г. Орёл')
INSERT [dbo].[User] ([IDUser], [Login], [Password], [Name], [Surname], [Patronymic], [Series], [Number], [Phone], [Adress], [E-Mail], [DateOfIssue], [Issued], [DateOfBirth], [PlaceOfBirth]) VALUES (37, N'11199951', N'o9ReQIVwl7dO4xXo8A', N'Пётр', N'Баранов', N'Петрович', N'5582', N'859856', N'83524988562', N'Саратовская улица, дом 6, квартира 28', N'baranov@qwer.ty', CAST(N'2014-08-11' AS Date), N'Отделение по району Лефортово ОУФМС России по городу Москве в ЮВАО', CAST(N'1972-10-25' AS Date), N'Гор. Дмитров')
INSERT [dbo].[User] ([IDUser], [Login], [Password], [Name], [Surname], [Patronymic], [Series], [Number], [Phone], [Adress], [E-Mail], [DateOfIssue], [Issued], [DateOfBirth], [PlaceOfBirth]) VALUES (38, N'11200001', N'ot2V54rFnT3FZa6ken', N'Олег', N'Куликов', N'Тимофеевич', N'8642', N'446852', N'89756982585', N'Улица Чкалова, дом 34, квартира 79', N'kulikov@qwer.ty', CAST(N'2010-12-20' AS Date), N'Отделение по району Марьино ОУФМС России по городу Москве в ЮВАО', CAST(N'1977-01-03' AS Date), N'Гор. Москва')
INSERT [dbo].[User] ([IDUser], [Login], [Password], [Name], [Surname], [Patronymic], [Series], [Number], [Phone], [Adress], [E-Mail], [DateOfIssue], [Issued], [DateOfBirth], [PlaceOfBirth]) VALUES (39, N'11200051', N'Yt9CfHzuIzKd1QtbGQ', N'Вадим', N'Алексеев', N'Антонович', N'2383', N'659798', N'82475285598', N'Шелепихинское шоссе, дом 165, квартира 82', N'alekseev@qwer.ty', CAST(N'2016-03-02' AS Date), N'Отделение по району Марьинский парк ОУФМС России по городу Москве в ЮВАО', CAST(N'1978-09-29' AS Date), N'Гор. Озёрск Челябинской области')
INSERT [dbo].[User] ([IDUser], [Login], [Password], [Name], [Surname], [Patronymic], [Series], [Number], [Phone], [Adress], [E-Mail], [DateOfIssue], [Issued], [DateOfBirth], [PlaceOfBirth]) VALUES (40, N'11200101', N'pGoOH61p8NM6LfEmAT', N'Василий', N'Степанов', N'Валерьевич', N'3345', N'659887', N'81418569894', N'Северянинский проезд, дом 19, квартира 94', N'stepanov@qwer.ty', CAST(N'2000-11-23' AS Date), N'Отделение по району Нижегородский ОУФМС России по городу Москве в ЮВАО', CAST(N'1995-09-28' AS Date), N'Гор. Уфа')
INSERT [dbo].[User] ([IDUser], [Login], [Password], [Name], [Surname], [Patronymic], [Series], [Number], [Phone], [Adress], [E-Mail], [DateOfIssue], [Issued], [DateOfBirth], [PlaceOfBirth]) VALUES (41, N'11200151', N'pRPYLY0fJYyUw9OCiY', N'Вячеслав', N'Яковлев', N'Иванович', N'7057', N'2013456', N'86245225745', N'Улица Шишкина, дом 40, квартира 95', N'yakovlev@qwer.ty', CAST(N'2002-01-04' AS Date), N'Отделение по району Рязанский ОУФМС России по городу Москве в ЮВАО', CAST(N'1992-03-02' AS Date), N'Гор. Советск Тульской области')
INSERT [dbo].[User] ([IDUser], [Login], [Password], [Name], [Surname], [Patronymic], [Series], [Number], [Phone], [Adress], [E-Mail], [DateOfIssue], [Issued], [DateOfBirth], [PlaceOfBirth]) VALUES (42, N'11200201', N'PrwWUvnFbwJ6JBgGiU', N'Виктор', N'Сорокин', N'Петрович', N'8080', N'976431', N'84575298740', N'Семёновский проезд, дом 31, квартира 4', N'sorokin@qwer.ty', CAST(N'2003-07-08' AS Date), N'Отделение по району Текстильщики ОУФМС России по городу Москве в ЮВАО', CAST(N'1970-10-28' AS Date), N'Гор. Ставрополь')
INSERT [dbo].[User] ([IDUser], [Login], [Password], [Name], [Surname], [Patronymic], [Series], [Number], [Phone], [Adress], [E-Mail], [DateOfIssue], [Issued], [DateOfBirth], [PlaceOfBirth]) VALUES (43, N'11200251', N'pvNJlnOJBrGltsZLXQ', N'Юрий', N'Сергеев', N'Алексеевич', N'7953', N'6478024', N'85082588625', N'Школьная улица, дом 75, квартира 165', N'sergeev@qwer.ty', CAST(N'2009-08-26' AS Date), N'Отделение по району Южнопортовый ОУФМС России по городу Москве в ЮВАО', CAST(N'1985-04-15' AS Date), N'Гор. Лобня Московской обл.')
INSERT [dbo].[User] ([IDUser], [Login], [Password], [Name], [Surname], [Patronymic], [Series], [Number], [Phone], [Adress], [E-Mail], [DateOfIssue], [Issued], [DateOfBirth], [PlaceOfBirth]) VALUES (44, N'11200301', N'PY2HtuVHtJ46zA7kkO', N'Артемий', N'Романов', N'Кириллович', N'2398', N'9761320', N'82862078528', N'Славянский бульвар, дом 46, квартира 69', N'romanov@qwer.ty', CAST(N'2015-10-15' AS Date), N'Отделение по району Братеево ОУФМС России по городу Москве в ЮАО', CAST(N'1996-04-29' AS Date), N'Гор. Приморск Ленинградской обл.')
INSERT [dbo].[User] ([IDUser], [Login], [Password], [Name], [Surname], [Patronymic], [Series], [Number], [Phone], [Adress], [E-Mail], [DateOfIssue], [Issued], [DateOfBirth], [PlaceOfBirth]) VALUES (45, N'11200351', N'qDsF9DRzfIBoa9sKHp', N'Леонид', N'Захаров', N'Анатольевич', N'2525', N'764513', N'84579652112', N'Сумской проезд, дом 3, корп. 1, квартира 177', N'zaharov@qwer.ty', CAST(N'2004-04-14' AS Date), N'Отделение по району Донской ОУФМС России по городу Москве в ЮАО', CAST(N'1974-04-19' AS Date), N'Гор. Москва')
INSERT [dbo].[User] ([IDUser], [Login], [Password], [Name], [Surname], [Patronymic], [Series], [Number], [Phone], [Adress], [E-Mail], [DateOfIssue], [Issued], [DateOfBirth], [PlaceOfBirth]) VALUES (46, N'11200401', N'QjkB8vTJLKhXxLF84Q', N'Давид', N'Борисов', N'Александрович', N'1348', N'794682', N'89564628528', N'Банный проезд, дом 5, квартира 132', N'borisov@qwer.ty', CAST(N'2009-10-22' AS Date), N'Отделение по району Нагатино-Садовники ОУФМС России по городу Москве в ЮАО', CAST(N'1980-12-18' AS Date), N'Гор. Москва')
INSERT [dbo].[User] ([IDUser], [Login], [Password], [Name], [Surname], [Patronymic], [Series], [Number], [Phone], [Adress], [E-Mail], [DateOfIssue], [Issued], [DateOfBirth], [PlaceOfBirth]) VALUES (47, N'11200451', N'qqFHTtDNu06HVD6RWS', N'Марк', N'Королёв', N'Сергеевич', N'1346', N'497256', N'87952826852', N'Сурский проезд, дом 3, квартира 28', N'korolev@qwer.ty', CAST(N'2013-11-12' AS Date), N'Отделение по району Нагорный ОУФМС России по городу Москве в ЮАО', CAST(N'1994-02-08' AS Date), N'Гор. Заречный Свердловской области')
INSERT [dbo].[User] ([IDUser], [Login], [Password], [Name], [Surname], [Patronymic], [Series], [Number], [Phone], [Adress], [E-Mail], [DateOfIssue], [Issued], [DateOfBirth], [PlaceOfBirth]) VALUES (48, N'11200501', N'qt7fm17taYOjWQmrPD', N'Лев', N'Герасимов', N'Павлович', N'8643', N'498536', N'89752368520', N'Тарный проезд, дом 6, квартира 30', N'gerasimov@qwer.ty', CAST(N'2009-05-07' AS Date), N'Отделение по району Орехово-Борисово Северное ОУФМС России по городу Москве в ЮАО', CAST(N'1988-09-07' AS Date), N'Гор. Москва')
INSERT [dbo].[User] ([IDUser], [Login], [Password], [Name], [Surname], [Patronymic], [Series], [Number], [Phone], [Adress], [E-Mail], [DateOfIssue], [Issued], [DateOfBirth], [PlaceOfBirth]) VALUES (49, N'11200551', N'R8NOISmTE1Fv2LWNPU', N'Семён', N'Пономарёв', N'Владимирович', N'2597', N'187562', N'87525878556', N'Бескудниковский проезд, дом 9, квартира 74', N'ponomarev@qwer.ty', CAST(N'2016-03-16' AS Date), N'Отделение по району Чертаново Северное ОУФМС России по городу Москве в ЮАО', CAST(N'1985-02-22' AS Date), N'Гор. Москва')
INSERT [dbo].[User] ([IDUser], [Login], [Password], [Name], [Surname], [Patronymic], [Series], [Number], [Phone], [Adress], [E-Mail], [DateOfIssue], [Issued], [DateOfBirth], [PlaceOfBirth]) VALUES (50, N'11200601', N'RczPSf3qZx6DRvXhzs', N'Артур', N'Григорьев', N'Романович', N'1380', N'986458', N'85274163412', N'Улица Татьяны Макаровой, дом 7, квартира 36', N'grigoriev@qwer.ty', CAST(N'2014-12-14' AS Date), N'Отделение по району Академический ОУФМС России по городу Москве в ЮЗАО', CAST(N'1998-10-15' AS Date), N'Гор. Киров Кировской области')
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Bank account]  WITH CHECK ADD  CONSTRAINT [FK_Bank account_Type] FOREIGN KEY([TypeID])
REFERENCES [dbo].[Type] ([IDType])
GO
ALTER TABLE [dbo].[Bank account] CHECK CONSTRAINT [FK_Bank account_Type]
GO
ALTER TABLE [dbo].[Bank account]  WITH CHECK ADD  CONSTRAINT [FK_Bank account_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([IDUser])
GO
ALTER TABLE [dbo].[Bank account] CHECK CONSTRAINT [FK_Bank account_User]
GO
ALTER TABLE [dbo].[Contract]  WITH CHECK ADD  CONSTRAINT [FK_Contract_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([IDUser])
GO
ALTER TABLE [dbo].[Contract] CHECK CONSTRAINT [FK_Contract_User]
GO
ALTER TABLE [dbo].[History]  WITH CHECK ADD  CONSTRAINT [FK_History_Bank account] FOREIGN KEY([Account])
REFERENCES [dbo].[Bank account] ([NumberAccount])
GO
ALTER TABLE [dbo].[History] CHECK CONSTRAINT [FK_History_Bank account]
GO
USE [master]
GO
ALTER DATABASE [UfimtsevBanc] SET  READ_WRITE 
GO
