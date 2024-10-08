USE [master]
GO
/****** Object:  Database [FastFoodDB]    Script Date: 8/29/2024 4:29:41 PM ******/
CREATE DATABASE [FastFoodDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FastFoodDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\FastFoodDB.mdf' , SIZE = 270336KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FastFoodDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\FastFoodDB_log.ldf' , SIZE = 270336KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [FastFoodDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FastFoodDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FastFoodDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FastFoodDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FastFoodDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FastFoodDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FastFoodDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [FastFoodDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FastFoodDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FastFoodDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FastFoodDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FastFoodDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FastFoodDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FastFoodDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FastFoodDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FastFoodDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FastFoodDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [FastFoodDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FastFoodDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FastFoodDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FastFoodDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FastFoodDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FastFoodDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FastFoodDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FastFoodDB] SET RECOVERY FULL 
GO
ALTER DATABASE [FastFoodDB] SET  MULTI_USER 
GO
ALTER DATABASE [FastFoodDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FastFoodDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FastFoodDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FastFoodDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FastFoodDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FastFoodDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'FastFoodDB', N'ON'
GO
ALTER DATABASE [FastFoodDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [FastFoodDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [FastFoodDB]
GO
/****** Object:  User [leeroy]    Script Date: 8/29/2024 4:29:41 PM ******/
CREATE USER [leeroy] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Ingredients]    Script Date: 8/29/2024 4:29:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ingredients](
	[IngredientName] [varchar](100) NULL,
	[IngredientShortDescription] [varchar](200) NULL,
	[IngredientID] [int] NOT NULL,
	[PortionUOMTypeID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IngredientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IngredientsAudit]    Script Date: 8/29/2024 4:29:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IngredientsAudit](
	[AuditID] [int] IDENTITY(1,1) NOT NULL,
	[IngredientID] [int] NULL,
	[IngredientName] [varchar](100) NULL,
	[IngredientShortDescription] [varchar](200) NULL,
	[PortionUOMTypeID] [int] NULL,
	[ChangeType] [varchar](10) NULL,
	[ChangeDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[AuditID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MenuItems]    Script Date: 8/29/2024 4:29:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuItems](
	[MenuItemName] [varchar](100) NULL,
	[MenuItemDescription] [varchar](200) NULL,
	[PLU] [int] NULL,
	[MenuItemID] [int] NOT NULL,
	[RecipeID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MenuItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MenuItemsAudit]    Script Date: 8/29/2024 4:29:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuItemsAudit](
	[AuditID] [int] IDENTITY(1,1) NOT NULL,
	[MenuItemID] [int] NULL,
	[MenuItemName] [varchar](100) NULL,
	[MenuItemDescription] [varchar](200) NULL,
	[PLU] [int] NULL,
	[RecipeID] [int] NULL,
	[ChangeType] [varchar](10) NULL,
	[ChangeDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[AuditID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderTransactions]    Script Date: 8/29/2024 4:29:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderTransactions](
	[MD5KEY_ORDERSALE] [varchar](100) NULL,
	[ChangeReceived] [decimal](10, 2) NULL,
	[OrderNumber] [int] NULL,
	[TaxInclusiveAmount] [decimal](10, 2) NULL,
	[TaxAmount] [decimal](10, 2) NULL,
	[MealLocation] [int] NULL,
	[TransactionID] [int] NULL,
	[StoreNumber] [int] NULL,
	[date] [varchar](15) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderTransactionsAudit]    Script Date: 8/29/2024 4:29:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderTransactionsAudit](
	[AuditID] [int] IDENTITY(1,1) NOT NULL,
	[TransactionID] [int] NULL,
	[MD5KEY_ORDERSALE] [varchar](100) NULL,
	[ChangeReceived] [decimal](10, 2) NULL,
	[OrderNumber] [int] NULL,
	[TaxInclusiveAmount] [decimal](10, 2) NULL,
	[TaxAmount] [decimal](10, 2) NULL,
	[MealLocation] [int] NULL,
	[StoreNumber] [int] NULL,
	[date] [varchar](15) NULL,
	[ChangeType] [varchar](10) NULL,
	[ChangeDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[AuditID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PortionTypes]    Script Date: 8/29/2024 4:29:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PortionTypes](
	[PortionTypeDescription] [varchar](20) NULL,
	[PortionUOMTypeID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PortionUOMTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PortionTypesAudit]    Script Date: 8/29/2024 4:29:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PortionTypesAudit](
	[AuditID] [int] IDENTITY(1,1) NOT NULL,
	[PortionUOMTypeID] [int] NULL,
	[PortionTypeDescription] [varchar](20) NULL,
	[ChangeType] [varchar](10) NULL,
	[ChangeDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[AuditID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Recipes]    Script Date: 8/29/2024 4:29:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recipes](
	[RecipeName] [varchar](100) NULL,
	[RecipeDescription] [varchar](200) NULL,
	[RecipeID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RecipeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RecipesAudit]    Script Date: 8/29/2024 4:29:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecipesAudit](
	[AuditID] [int] IDENTITY(1,1) NOT NULL,
	[RecipeID] [int] NULL,
	[RecipeName] [varchar](100) NULL,
	[RecipeDescription] [varchar](200) NULL,
	[ChangeType] [varchar](10) NULL,
	[ChangeDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[AuditID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SalesDetails]    Script Date: 8/29/2024 4:29:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesDetails](
	[MD5KEY_MENUITEM] [varchar](100) NULL,
	[MD5KEY_ORDERSALE] [varchar](100) NULL,
	[CategoryDescription] [varchar](200) NULL,
	[DepartmentDescription] [varchar](200) NULL,
	[Description] [varchar](200) NULL,
	[StoreNumber] [int] NULL,
	[TaxInclusiveAmount] [int] NULL,
	[TaxAmount] [decimal](10, 2) NULL,
	[AdjustedPrice] [decimal](10, 2) NULL,
	[DiscountAmount] [decimal](10, 2) NULL,
	[Price] [decimal](10, 2) NULL,
	[Quantity] [int] NULL,
	[PLU] [int] NULL,
	[MenuItemsID] [int] NULL,
	[date] [varchar](15) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SalesDetailsAudit]    Script Date: 8/29/2024 4:29:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesDetailsAudit](
	[AuditID] [int] IDENTITY(1,1) NOT NULL,
	[MD5KEY_ORDERSALE] [varchar](100) NULL,
	[MD5KEY_MENUITEM] [varchar](100) NULL,
	[CategoryDescription] [varchar](200) NULL,
	[DepartmentDescription] [varchar](200) NULL,
	[Description] [varchar](200) NULL,
	[StoreNumber] [int] NULL,
	[TaxInclusiveAmount] [int] NULL,
	[TaxAmount] [decimal](10, 2) NULL,
	[AdjustedPrice] [decimal](10, 2) NULL,
	[DiscountAmount] [decimal](10, 2) NULL,
	[Price] [decimal](10, 2) NULL,
	[Quantity] [int] NULL,
	[PLU] [int] NULL,
	[MenuItemsID] [int] NULL,
	[date] [varchar](15) NULL,
	[ChangeType] [varchar](10) NULL,
	[ChangeDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[AuditID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stores]    Script Date: 8/29/2024 4:29:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stores](
	[StoreAddress] [varchar](50) NULL,
	[DistributionRegion] [varchar](20) NULL,
	[StoreState] [varchar](50) NULL,
	[StoreCity] [varchar](50) NULL,
	[StoreZip] [int] NULL,
	[StoreType] [varchar](50) NULL,
	[StoreLoyaltyFlag] [char](1) NULL,
	[StoreNumber] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[StoreNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StoresAudit]    Script Date: 8/29/2024 4:29:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StoresAudit](
	[AuditID] [int] IDENTITY(1,1) NOT NULL,
	[StoreNumber] [int] NULL,
	[StoreAddress] [varchar](50) NULL,
	[DistributionRegion] [varchar](20) NULL,
	[StoreState] [varchar](50) NULL,
	[StoreCity] [varchar](50) NULL,
	[StoreZip] [int] NULL,
	[StoreType] [varchar](50) NULL,
	[StoreLoyaltyFlag] [char](1) NULL,
	[ChangeType] [varchar](10) NULL,
	[ChangeDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[AuditID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubRecipeAudit]    Script Date: 8/29/2024 4:29:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubRecipeAudit](
	[AuditID] [int] IDENTITY(1,1) NOT NULL,
	[SubRecipeID] [int] NULL,
	[SubRecipeName] [varchar](100) NULL,
	[SubRecipeDescription] [varchar](200) NULL,
	[ChangeType] [varchar](10) NULL,
	[ChangeDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[AuditID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubRecipeIngredientAssignments]    Script Date: 8/29/2024 4:29:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubRecipeIngredientAssignments](
	[SubRecipeID] [int] NULL,
	[IngredientID] [int] NULL,
	[Quantity] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubRecipeIngredientAssignmentsAudit]    Script Date: 8/29/2024 4:29:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubRecipeIngredientAssignmentsAudit](
	[AuditID] [int] IDENTITY(1,1) NOT NULL,
	[SubRecipeID] [int] NULL,
	[IngredientID] [int] NULL,
	[Quantity] [int] NULL,
	[ChangeType] [varchar](10) NULL,
	[ChangeDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[AuditID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubRecipes]    Script Date: 8/29/2024 4:29:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubRecipes](
	[SubRecipeName] [varchar](100) NULL,
	[SubRecipeDescription] [varchar](200) NULL,
	[SubRecipeID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SubRecipeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [FastFoodDB] SET  READ_WRITE 
GO
