USE [master]
GO
/****** Object:  Database [Accounting_DB]    Script Date: 06/20/2018 11:05:38 ******/
CREATE DATABASE [Accounting_DB] ON  PRIMARY 
( NAME = N'Accounting_DB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\Accounting_DB.mdf' , SIZE = 2048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Accounting_DB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\Accounting_DB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Accounting_DB] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Accounting_DB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Accounting_DB] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [Accounting_DB] SET ANSI_NULLS OFF
GO
ALTER DATABASE [Accounting_DB] SET ANSI_PADDING OFF
GO
ALTER DATABASE [Accounting_DB] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [Accounting_DB] SET ARITHABORT OFF
GO
ALTER DATABASE [Accounting_DB] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [Accounting_DB] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [Accounting_DB] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [Accounting_DB] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [Accounting_DB] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [Accounting_DB] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [Accounting_DB] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [Accounting_DB] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [Accounting_DB] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [Accounting_DB] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [Accounting_DB] SET  DISABLE_BROKER
GO
ALTER DATABASE [Accounting_DB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [Accounting_DB] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [Accounting_DB] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [Accounting_DB] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [Accounting_DB] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [Accounting_DB] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [Accounting_DB] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [Accounting_DB] SET  READ_WRITE
GO
ALTER DATABASE [Accounting_DB] SET RECOVERY FULL
GO
ALTER DATABASE [Accounting_DB] SET  MULTI_USER
GO
ALTER DATABASE [Accounting_DB] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [Accounting_DB] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'Accounting_DB', N'ON'
GO
USE [Accounting_DB]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 06/20/2018 11:05:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](300) NOT NULL,
	[Mobile] [nvarchar](150) NOT NULL,
	[Email] [nvarchar](150) NULL,
	[Address] [nvarchar](800) NULL,
	[CustomerImage] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AccountingTypes]    Script Date: 06/20/2018 11:05:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountingTypes](
	[TypeID] [int] NOT NULL,
	[TypeTitle] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_AccountingTypes] PRIMARY KEY CLUSTERED 
(
	[TypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Accounting]    Script Date: 06/20/2018 11:05:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounting](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CostomerID] [int] NOT NULL,
	[TypeID] [int] NOT NULL,
	[Amount] [int] NOT NULL,
	[Description] [nvarchar](800) NULL,
	[DateTitle] [datetime] NOT NULL,
 CONSTRAINT [PK_Accounting] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK_Accounting_AccountingTypes]    Script Date: 06/20/2018 11:05:38 ******/
ALTER TABLE [dbo].[Accounting]  WITH CHECK ADD  CONSTRAINT [FK_Accounting_AccountingTypes] FOREIGN KEY([TypeID])
REFERENCES [dbo].[AccountingTypes] ([TypeID])
GO
ALTER TABLE [dbo].[Accounting] CHECK CONSTRAINT [FK_Accounting_AccountingTypes]
GO
/****** Object:  ForeignKey [FK_Accounting_Customers]    Script Date: 06/20/2018 11:05:38 ******/
ALTER TABLE [dbo].[Accounting]  WITH CHECK ADD  CONSTRAINT [FK_Accounting_Customers] FOREIGN KEY([CostomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[Accounting] CHECK CONSTRAINT [FK_Accounting_Customers]
GO
