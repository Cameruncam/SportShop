USE [master]
GO
/****** Object:  Database [VIKSportProduct]    Script Date: 27.04.2024 20:57:03 ******/
CREATE DATABASE [VIKSportProduct]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'VIKSportProduct', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\VIKSportProduct.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'VIKSportProduct_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\VIKSportProduct_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [VIKSportProduct] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [VIKSportProduct].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [VIKSportProduct] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [VIKSportProduct] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [VIKSportProduct] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [VIKSportProduct] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [VIKSportProduct] SET ARITHABORT OFF 
GO
ALTER DATABASE [VIKSportProduct] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [VIKSportProduct] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [VIKSportProduct] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [VIKSportProduct] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [VIKSportProduct] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [VIKSportProduct] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [VIKSportProduct] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [VIKSportProduct] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [VIKSportProduct] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [VIKSportProduct] SET  DISABLE_BROKER 
GO
ALTER DATABASE [VIKSportProduct] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [VIKSportProduct] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [VIKSportProduct] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [VIKSportProduct] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [VIKSportProduct] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [VIKSportProduct] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [VIKSportProduct] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [VIKSportProduct] SET RECOVERY FULL 
GO
ALTER DATABASE [VIKSportProduct] SET  MULTI_USER 
GO
ALTER DATABASE [VIKSportProduct] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [VIKSportProduct] SET DB_CHAINING OFF 
GO
ALTER DATABASE [VIKSportProduct] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [VIKSportProduct] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [VIKSportProduct] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'VIKSportProduct', N'ON'
GO
ALTER DATABASE [VIKSportProduct] SET QUERY_STORE = OFF
GO
USE [VIKSportProduct]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [VIKSportProduct]
GO
/****** Object:  Table [dbo].[products]    Script Date: 27.04.2024 20:57:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products](
	[article] [varchar](10) NOT NULL,
	[title] [varchar](50) NOT NULL,
	[decription] [varchar](255) NOT NULL,
	[unit_of_measurement] [varchar](10) NOT NULL,
	[price] [decimal](10, 2) NOT NULL,
	[max_discount] [tinyint] NOT NULL,
	[manufacturer] [varchar](30) NOT NULL,
	[supplier] [varchar](30) NOT NULL,
	[category] [varchar](30) NOT NULL,
	[current_discount] [tinyint] NOT NULL,
	[quantity_in_stock] [int] NOT NULL,
	[image_path] [varchar](20) NULL,
 CONSTRAINT [PK__products__8D48A898771EDCC0] PRIMARY KEY CLUSTERED 
(
	[article] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[ProductsV]    Script Date: 27.04.2024 20:57:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ProductsV]
AS
SELECT        TOP (100) PERCENT article AS Артикул, title AS [Наименование товара], decription AS Описание, unit_of_measurement AS [Ед. измерения], price AS Цена, max_discount AS [Максимальная скидка], 
                         manufacturer AS Производитель, supplier AS Поставщик, category AS Категория, current_discount AS [Текущая скидки], quantity_in_stock AS [Количество на складе], image_path AS Фото
FROM            dbo.products
ORDER BY Цена
GO
/****** Object:  Table [dbo].[order_details]    Script Date: 27.04.2024 20:57:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_details](
	[order_id] [int] NOT NULL,
	[article] [varchar](10) NOT NULL,
	[quantity] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 27.04.2024 20:57:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[order_date] [date] NOT NULL,
	[delivery_date] [date] NOT NULL,
	[user_id] [int] NULL,
	[pickup_point_id] [int] NOT NULL,
	[code] [int] NOT NULL,
	[status] [varchar](15) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pickup_points]    Script Date: 27.04.2024 20:57:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pickup_points](
	[pickup_point_id] [int] IDENTITY(1,1) NOT NULL,
	[postal_code] [varchar](20) NOT NULL,
	[city] [varchar](30) NOT NULL,
	[street] [varchar](30) NOT NULL,
	[build] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[pickup_point_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[roles]    Script Date: 27.04.2024 20:57:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[roles](
	[role_id] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 27.04.2024 20:57:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[last_name] [varchar](50) NOT NULL,
	[first_name] [varchar](50) NOT NULL,
	[patronymic] [varchar](50) NOT NULL,
	[login] [varchar](30) NOT NULL,
	[password] [varchar](30) NOT NULL,
	[role_id] [int] NOT NULL,
 CONSTRAINT [PK__users__B9BE370F19845002] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[order_details] ([order_id], [article], [quantity]) VALUES (1, N'А112Т4', 2)
GO
INSERT [dbo].[order_details] ([order_id], [article], [quantity]) VALUES (2, N'F746E6', 3)
GO
INSERT [dbo].[order_details] ([order_id], [article], [quantity]) VALUES (3, N'D648N7', 10)
GO
INSERT [dbo].[order_details] ([order_id], [article], [quantity]) VALUES (4, N'F937G4', 1)
GO
INSERT [dbo].[order_details] ([order_id], [article], [quantity]) VALUES (5, N'N483G5', 10)
GO
INSERT [dbo].[order_details] ([order_id], [article], [quantity]) VALUES (6, N'G480F5', 2)
GO
INSERT [dbo].[order_details] ([order_id], [article], [quantity]) VALUES (7, N'V312R4', 1)
GO
INSERT [dbo].[order_details] ([order_id], [article], [quantity]) VALUES (8, N'G522B5', 3)
GO
INSERT [dbo].[order_details] ([order_id], [article], [quantity]) VALUES (9, N'F047J7', 1)
GO
INSERT [dbo].[order_details] ([order_id], [article], [quantity]) VALUES (10, N'N836R5', 5)
GO
INSERT [dbo].[order_details] ([order_id], [article], [quantity]) VALUES (1, N'G598Y6', 2)
GO
INSERT [dbo].[order_details] ([order_id], [article], [quantity]) VALUES (2, N'D830R5', 3)
GO
INSERT [dbo].[order_details] ([order_id], [article], [quantity]) VALUES (3, N'F735B6', 10)
GO
INSERT [dbo].[order_details] ([order_id], [article], [quantity]) VALUES (4, N'E324U7', 1)
GO
INSERT [dbo].[order_details] ([order_id], [article], [quantity]) VALUES (5, N'D038G6', 10)
GO
INSERT [dbo].[order_details] ([order_id], [article], [quantity]) VALUES (6, N'C324S5', 2)
GO
INSERT [dbo].[order_details] ([order_id], [article], [quantity]) VALUES (7, N'J4DF5E', 1)
GO
INSERT [dbo].[order_details] ([order_id], [article], [quantity]) VALUES (8, N'K432G6', 3)
GO
INSERT [dbo].[order_details] ([order_id], [article], [quantity]) VALUES (9, N'S374B5', 1)
GO
INSERT [dbo].[order_details] ([order_id], [article], [quantity]) VALUES (10, N'D927K3', 5)
GO
SET IDENTITY_INSERT [dbo].[orders] ON 
GO
INSERT [dbo].[orders] ([order_id], [order_date], [delivery_date], [user_id], [pickup_point_id], [code], [status]) VALUES (1, CAST(N'2022-05-15' AS Date), CAST(N'2022-05-21' AS Date), 7, 18, 401, N'Новый ')
GO
INSERT [dbo].[orders] ([order_id], [order_date], [delivery_date], [user_id], [pickup_point_id], [code], [status]) VALUES (2, CAST(N'2022-05-16' AS Date), CAST(N'2022-05-22' AS Date), 8, 20, 402, N'Новый ')
GO
INSERT [dbo].[orders] ([order_id], [order_date], [delivery_date], [user_id], [pickup_point_id], [code], [status]) VALUES (3, CAST(N'2022-05-17' AS Date), CAST(N'2022-05-23' AS Date), 9, 20, 403, N'Завершен')
GO
INSERT [dbo].[orders] ([order_id], [order_date], [delivery_date], [user_id], [pickup_point_id], [code], [status]) VALUES (4, CAST(N'2022-05-18' AS Date), CAST(N'2022-05-24' AS Date), 10, 22, 404, N'Новый ')
GO
INSERT [dbo].[orders] ([order_id], [order_date], [delivery_date], [user_id], [pickup_point_id], [code], [status]) VALUES (5, CAST(N'2022-05-19' AS Date), CAST(N'2022-05-25' AS Date), NULL, 22, 405, N'Новый ')
GO
INSERT [dbo].[orders] ([order_id], [order_date], [delivery_date], [user_id], [pickup_point_id], [code], [status]) VALUES (6, CAST(N'2022-05-19' AS Date), CAST(N'2022-05-25' AS Date), NULL, 16, 406, N'Новый ')
GO
INSERT [dbo].[orders] ([order_id], [order_date], [delivery_date], [user_id], [pickup_point_id], [code], [status]) VALUES (7, CAST(N'2022-05-21' AS Date), CAST(N'2022-05-27' AS Date), NULL, 16, 407, N'Завершен')
GO
INSERT [dbo].[orders] ([order_id], [order_date], [delivery_date], [user_id], [pickup_point_id], [code], [status]) VALUES (8, CAST(N'2022-05-22' AS Date), CAST(N'2022-05-28' AS Date), NULL, 18, 408, N'Завершен')
GO
INSERT [dbo].[orders] ([order_id], [order_date], [delivery_date], [user_id], [pickup_point_id], [code], [status]) VALUES (9, CAST(N'2022-05-23' AS Date), CAST(N'2022-05-29' AS Date), NULL, 24, 409, N'Новый ')
GO
INSERT [dbo].[orders] ([order_id], [order_date], [delivery_date], [user_id], [pickup_point_id], [code], [status]) VALUES (10, CAST(N'2022-05-24' AS Date), CAST(N'2022-05-30' AS Date), NULL, 24, 410, N'Завершен')
GO
SET IDENTITY_INSERT [dbo].[orders] OFF
GO
SET IDENTITY_INSERT [dbo].[pickup_points] ON 
GO
INSERT [dbo].[pickup_points] ([pickup_point_id], [postal_code], [city], [street], [build]) VALUES (1, N'344288', N'г. Дубна', N'ул. Чехова', 1)
GO
INSERT [dbo].[pickup_points] ([pickup_point_id], [postal_code], [city], [street], [build]) VALUES (2, N'614164', N'г.Дубна', N'ул. Степная', 30)
GO
INSERT [dbo].[pickup_points] ([pickup_point_id], [postal_code], [city], [street], [build]) VALUES (3, N'394242', N'г. Дубна', N'ул. Коммунистическая', 43)
GO
INSERT [dbo].[pickup_points] ([pickup_point_id], [postal_code], [city], [street], [build]) VALUES (4, N'660540', N'г. Дубна', N'ул. Солнечная', 25)
GO
INSERT [dbo].[pickup_points] ([pickup_point_id], [postal_code], [city], [street], [build]) VALUES (5, N'125837', N'г. Дубна', N'ул. Шоссейная', 40)
GO
INSERT [dbo].[pickup_points] ([pickup_point_id], [postal_code], [city], [street], [build]) VALUES (6, N'125703', N'г. Дубна', N'ул. Партизанская', 49)
GO
INSERT [dbo].[pickup_points] ([pickup_point_id], [postal_code], [city], [street], [build]) VALUES (7, N'625283', N'г. Дубна', N'ул. Победы', 46)
GO
INSERT [dbo].[pickup_points] ([pickup_point_id], [postal_code], [city], [street], [build]) VALUES (8, N'614611', N'г. Дубна', N'ул. Молодежная', 50)
GO
INSERT [dbo].[pickup_points] ([pickup_point_id], [postal_code], [city], [street], [build]) VALUES (9, N'454311', N'г.Дубна', N'ул. Новая', 19)
GO
INSERT [dbo].[pickup_points] ([pickup_point_id], [postal_code], [city], [street], [build]) VALUES (10, N'660007', N'г.Дубна', N'ул. Октябрьская', 19)
GO
INSERT [dbo].[pickup_points] ([pickup_point_id], [postal_code], [city], [street], [build]) VALUES (11, N'603036', N'г. Дубна', N'ул. Садовая', 4)
GO
INSERT [dbo].[pickup_points] ([pickup_point_id], [postal_code], [city], [street], [build]) VALUES (12, N'450983', N'г. Дубна', N'ул. Комсомольская', 26)
GO
INSERT [dbo].[pickup_points] ([pickup_point_id], [postal_code], [city], [street], [build]) VALUES (13, N'394782', N'г. Дубна', N'ул. Чехова', 3)
GO
INSERT [dbo].[pickup_points] ([pickup_point_id], [postal_code], [city], [street], [build]) VALUES (14, N'603002', N'г. Дубна', N'ул. Дзержинского', 28)
GO
INSERT [dbo].[pickup_points] ([pickup_point_id], [postal_code], [city], [street], [build]) VALUES (15, N'450558', N'г. Дубна', N'ул. Набережная', 30)
GO
INSERT [dbo].[pickup_points] ([pickup_point_id], [postal_code], [city], [street], [build]) VALUES (16, N'394060', N'г.Дубна', N'ул. Фрунзе', 43)
GO
INSERT [dbo].[pickup_points] ([pickup_point_id], [postal_code], [city], [street], [build]) VALUES (17, N'410661', N'г. Дубна', N'ул. Школьная', 50)
GO
INSERT [dbo].[pickup_points] ([pickup_point_id], [postal_code], [city], [street], [build]) VALUES (18, N'625590', N'г. Дубна', N'ул. Коммунистическая', 20)
GO
INSERT [dbo].[pickup_points] ([pickup_point_id], [postal_code], [city], [street], [build]) VALUES (19, N'625683', N'г. Дубна', N'ул. 8 Марта', NULL)
GO
INSERT [dbo].[pickup_points] ([pickup_point_id], [postal_code], [city], [street], [build]) VALUES (20, N'400562', N'г. Дубна', N'ул. Зеленая', 32)
GO
INSERT [dbo].[pickup_points] ([pickup_point_id], [postal_code], [city], [street], [build]) VALUES (21, N'614510', N'г. Дубна', N'ул. Маяковского', 47)
GO
INSERT [dbo].[pickup_points] ([pickup_point_id], [postal_code], [city], [street], [build]) VALUES (22, N'410542', N'г. Дубна', N'ул. Светлая', 46)
GO
INSERT [dbo].[pickup_points] ([pickup_point_id], [postal_code], [city], [street], [build]) VALUES (23, N'620839', N'г. Дубна', N'ул. Цветочная', 8)
GO
INSERT [dbo].[pickup_points] ([pickup_point_id], [postal_code], [city], [street], [build]) VALUES (24, N'443890', N'г. Дубна', N'ул. Коммунистическая', 1)
GO
INSERT [dbo].[pickup_points] ([pickup_point_id], [postal_code], [city], [street], [build]) VALUES (25, N'603379', N'г. Дубна', N'ул. Спортивная', 46)
GO
INSERT [dbo].[pickup_points] ([pickup_point_id], [postal_code], [city], [street], [build]) VALUES (26, N'603721', N'г. Дубна', N'ул. Гоголя', 41)
GO
INSERT [dbo].[pickup_points] ([pickup_point_id], [postal_code], [city], [street], [build]) VALUES (27, N'410172', N'г. Дубна', N'ул. Северная', 13)
GO
INSERT [dbo].[pickup_points] ([pickup_point_id], [postal_code], [city], [street], [build]) VALUES (28, N'420151', N'г. Дубна', N'ул. Вишневая', 32)
GO
INSERT [dbo].[pickup_points] ([pickup_point_id], [postal_code], [city], [street], [build]) VALUES (29, N'125061', N'г. Дубна', N'ул. Подгорная', 8)
GO
INSERT [dbo].[pickup_points] ([pickup_point_id], [postal_code], [city], [street], [build]) VALUES (30, N'630370', N'г. Дубна', N'ул. Шоссейная', 24)
GO
INSERT [dbo].[pickup_points] ([pickup_point_id], [postal_code], [city], [street], [build]) VALUES (31, N'614753', N'г. Дубна', N'ул. Полевая', 35)
GO
INSERT [dbo].[pickup_points] ([pickup_point_id], [postal_code], [city], [street], [build]) VALUES (32, N'426030', N'г. Дубна', N'ул. Маяковского', 44)
GO
INSERT [dbo].[pickup_points] ([pickup_point_id], [postal_code], [city], [street], [build]) VALUES (33, N'450375', N'г. Дубна', N'ул. Клубная', 44)
GO
INSERT [dbo].[pickup_points] ([pickup_point_id], [postal_code], [city], [street], [build]) VALUES (34, N'625560', N'г. Дубна', N'ул. Некрасова', 12)
GO
INSERT [dbo].[pickup_points] ([pickup_point_id], [postal_code], [city], [street], [build]) VALUES (35, N'630201', N'г. Дубна', N'ул. Комсомольская', 17)
GO
INSERT [dbo].[pickup_points] ([pickup_point_id], [postal_code], [city], [street], [build]) VALUES (36, N'190949', N'г. Дубна', N'ул. Мичурина', 26)
GO
SET IDENTITY_INSERT [dbo].[pickup_points] OFF
GO
INSERT [dbo].[products] ([article], [title], [decription], [unit_of_measurement], [price], [max_discount], [manufacturer], [supplier], [category], [current_discount], [quantity_in_stock], [image_path]) VALUES (N'B538G6', N'Спортивный костюм', N'Спортивный костюм playToday (футболка + шорты)', N'шт.', CAST(839.00 AS Decimal(10, 2)), 5, N'playToday', N'Спортмастер', N'Одежда', 3, 17, N'B538G6.jpg')
GO
INSERT [dbo].[products] ([article], [title], [decription], [unit_of_measurement], [price], [max_discount], [manufacturer], [supplier], [category], [current_discount], [quantity_in_stock], [image_path]) VALUES (N'C324S5', N'Шлем', N'Шлем г.л./сноуб. Salomon Grom р.:KS черный (L40836800)', N'шт.', CAST(4000.00 AS Decimal(10, 2)), 10, N'Salomon', N'Декатлон', N'Спортивный инвентарь', 5, 16, NULL)
GO
INSERT [dbo].[products] ([article], [title], [decription], [unit_of_measurement], [price], [max_discount], [manufacturer], [supplier], [category], [current_discount], [quantity_in_stock], [image_path]) VALUES (N'D038G6', N'Лыжный комплект', N'Лыжный комплект беговые NORDWAY XC Classic, 45-45-45мм, 160см', N'шт.', CAST(3000.00 AS Decimal(10, 2)), 30, N'Nordway', N'Декатлон', N'Спортивный инвентарь', 4, 23, NULL)
GO
INSERT [dbo].[products] ([article], [title], [decription], [unit_of_measurement], [price], [max_discount], [manufacturer], [supplier], [category], [current_discount], [quantity_in_stock], [image_path]) VALUES (N'D648N7', N'Набор для хоккея', N'Набор для хоккея Совтехстром', N'шт.', CAST(350.00 AS Decimal(10, 2)), 10, N'Совтехстром', N'Декатлон', N'Спортивный инвентарь', 4, 7, N'D648N7.jpg')
GO
INSERT [dbo].[products] ([article], [title], [decription], [unit_of_measurement], [price], [max_discount], [manufacturer], [supplier], [category], [current_discount], [quantity_in_stock], [image_path]) VALUES (N'D830R5', N'Тренажер прыжков', N'Тренажер для прыжков Moby Kids Moby-Jumper со счетчиком', N'шт.', CAST(1120.00 AS Decimal(10, 2)), 15, N'Moby Kids', N'Спортмастер', N'Спортивный инвентарь', 4, 8, N'D830R5.jpg')
GO
INSERT [dbo].[products] ([article], [title], [decription], [unit_of_measurement], [price], [max_discount], [manufacturer], [supplier], [category], [current_discount], [quantity_in_stock], [image_path]) VALUES (N'D893W4', N'Мяч', N'Мяч футбольный DEMIX 1STLS1JWWW, универсальный, 4-й размер, белый/зеленый', N'шт.', CAST(900.00 AS Decimal(10, 2)), 5, N'Demix', N'Спортмастер', N'Спортивный инвентарь', 2, 5, NULL)
GO
INSERT [dbo].[products] ([article], [title], [decription], [unit_of_measurement], [price], [max_discount], [manufacturer], [supplier], [category], [current_discount], [quantity_in_stock], [image_path]) VALUES (N'D927K3', N'Перчатки ', N'Перчатки Starfit SU-125 атлетические S черный', N'шт.', CAST(660.00 AS Decimal(10, 2)), 15, N'Starfit', N'Декатлон', N'Спортивный инвентарь', 4, 3, NULL)
GO
INSERT [dbo].[products] ([article], [title], [decription], [unit_of_measurement], [price], [max_discount], [manufacturer], [supplier], [category], [current_discount], [quantity_in_stock], [image_path]) VALUES (N'E324U7', N'Велотренажер', N'Велотренажер двойной DFC B804 dual bike', N'шт.', CAST(6480.00 AS Decimal(10, 2)), 25, N'DFC', N'Спортмастер', N'Спортивный инвентарь', 5, 5, N'E324U7.jpg')
GO
INSERT [dbo].[products] ([article], [title], [decription], [unit_of_measurement], [price], [max_discount], [manufacturer], [supplier], [category], [current_discount], [quantity_in_stock], [image_path]) VALUES (N'F047J7', N'Коврик', N'Коврик Bradex для мягкой йоги дл.:1730мм ш.:610мм т.:3мм серый', N'шт.', CAST(720.00 AS Decimal(10, 2)), 15, N'Bradex', N'Спортмастер', N'Спортивный инвентарь', 5, 11, NULL)
GO
INSERT [dbo].[products] ([article], [title], [decription], [unit_of_measurement], [price], [max_discount], [manufacturer], [supplier], [category], [current_discount], [quantity_in_stock], [image_path]) VALUES (N'F687G5', N'Защита голени', N'Защита голени GREEN HILL Panther, L, синий/черный', N'шт.', CAST(1900.00 AS Decimal(10, 2)), 15, N'Green Hill', N'Спортмастер', N'Спортивный инвентарь', 4, 6, NULL)
GO
INSERT [dbo].[products] ([article], [title], [decription], [unit_of_measurement], [price], [max_discount], [manufacturer], [supplier], [category], [current_discount], [quantity_in_stock], [image_path]) VALUES (N'F735B6', N'Игровой набор', N'Игровой набор Совтехстром Кегли и шары', N'шт.', CAST(320.00 AS Decimal(10, 2)), 15, N'Совтехстром', N'Декатлон', N'Спортивный инвентарь', 2, 9, N'F735B6.jpg')
GO
INSERT [dbo].[products] ([article], [title], [decription], [unit_of_measurement], [price], [max_discount], [manufacturer], [supplier], [category], [current_discount], [quantity_in_stock], [image_path]) VALUES (N'F746E6', N'Шведская стенка', N'Шведская стенка ROMANA Next, pastel', N'шт.', CAST(9900.00 AS Decimal(10, 2)), 10, N'ROMANA Next', N'Декатлон', N'Спортивный инвентарь', 3, 5, N'F746E6.jpg')
GO
INSERT [dbo].[products] ([article], [title], [decription], [unit_of_measurement], [price], [max_discount], [manufacturer], [supplier], [category], [current_discount], [quantity_in_stock], [image_path]) VALUES (N'F937G4', N'Игровой набор', N'Набор Abtoys Бадминтон и теннис ', N'шт.', CAST(480.00 AS Decimal(10, 2)), 10, N'Abtoys', N'Спортмастер', N'Спортивный инвентарь', 4, 12, N'F937G4.jpg')
GO
INSERT [dbo].[products] ([article], [title], [decription], [unit_of_measurement], [price], [max_discount], [manufacturer], [supplier], [category], [current_discount], [quantity_in_stock], [image_path]) VALUES (N'G403T5', N'Тюбинг', N'Тюбинг Nordway, 73 см', N'шт.', CAST(1450.00 AS Decimal(10, 2)), 15, N'Nordway', N'Спортмастер', N'Спортивный инвентарь', 4, 13, N'G403T5.jpg')
GO
INSERT [dbo].[products] ([article], [title], [decription], [unit_of_measurement], [price], [max_discount], [manufacturer], [supplier], [category], [current_discount], [quantity_in_stock], [image_path]) VALUES (N'G480F5', N'Ролики', N'Коньки роликовые Ridex Cricket жен. ABEC 3 кол.:72мм р.:39-42 синий', N'шт.', CAST(1600.00 AS Decimal(10, 2)), 15, N'Ridex', N'Спортмастер', N'Спортивный инвентарь', 4, 7, NULL)
GO
INSERT [dbo].[products] ([article], [title], [decription], [unit_of_measurement], [price], [max_discount], [manufacturer], [supplier], [category], [current_discount], [quantity_in_stock], [image_path]) VALUES (N'G522B5', N'Ласты', N'Ласты Colton CF-02 для плавания р.:33-34 серый/голубой', N'шт.', CAST(1980.00 AS Decimal(10, 2)), 15, N'Colton', N'Декатлон', N'Спортивный инвентарь', 3, 6, NULL)
GO
INSERT [dbo].[products] ([article], [title], [decription], [unit_of_measurement], [price], [max_discount], [manufacturer], [supplier], [category], [current_discount], [quantity_in_stock], [image_path]) VALUES (N'G598Y6', N'Спортивный мат', N'Спортивный мат 100x100x10 см Perfetto Sport № 3 бежевый', N'шт.', CAST(2390.00 AS Decimal(10, 2)), 15, N'Perfetto Sport', N'Декатлон', N'Спортивный инвентарь', 2, 16, N'G598Y6.jpg')
GO
INSERT [dbo].[products] ([article], [title], [decription], [unit_of_measurement], [price], [max_discount], [manufacturer], [supplier], [category], [current_discount], [quantity_in_stock], [image_path]) VALUES (N'G873H4', N'Велосипед', N'Велосипед SKIF 29 Disc (2021), горный (взрослый), рама: 17", колеса: 29", темно-серый', N'шт.', CAST(14930.00 AS Decimal(10, 2)), 5, N'SKIF', N'Спортмастер', N'Спортивный инвентарь', 4, 6, NULL)
GO
INSERT [dbo].[products] ([article], [title], [decription], [unit_of_measurement], [price], [max_discount], [manufacturer], [supplier], [category], [current_discount], [quantity_in_stock], [image_path]) VALUES (N'J4DF5E', N'Насос', N'Насос Molten HP-18-B для мячей мультиколор', N'шт.', CAST(300.00 AS Decimal(10, 2)), 5, N'Molten', N'Спортмастер', N'Спортивный инвентарь', 4, 12, NULL)
GO
INSERT [dbo].[products] ([article], [title], [decription], [unit_of_measurement], [price], [max_discount], [manufacturer], [supplier], [category], [current_discount], [quantity_in_stock], [image_path]) VALUES (N'J532D4', N'Перчатки для карате', N'Перчатки для каратэ Green Hill KMС-6083 L красный', N'шт.', CAST(1050.00 AS Decimal(10, 2)), 15, N'Green Hill', N'Спортмастер', N'Спортивный инвентарь', 3, 5, NULL)
GO
INSERT [dbo].[products] ([article], [title], [decription], [unit_of_measurement], [price], [max_discount], [manufacturer], [supplier], [category], [current_discount], [quantity_in_stock], [image_path]) VALUES (N'K432G6', N'Шапочка для плавания', N'Шапочка для плавания Atemi PU 140 ткань с покрытием желтый', N'шт.', CAST(440.00 AS Decimal(10, 2)), 25, N'Atemi', N'Декатлон', N'Спортивный инвентарь', 5, 17, NULL)
GO
INSERT [dbo].[products] ([article], [title], [decription], [unit_of_measurement], [price], [max_discount], [manufacturer], [supplier], [category], [current_discount], [quantity_in_stock], [image_path]) VALUES (N'K937A5', N'Гиря', N'Гиря Starfit ГМБ4 мягкое 4кг синий/оранжевый', N'шт.', CAST(890.00 AS Decimal(10, 2)), 5, N'Starfit', N'Декатлон', N'Спортивный инвентарь', 4, 10, NULL)
GO
INSERT [dbo].[products] ([article], [title], [decription], [unit_of_measurement], [price], [max_discount], [manufacturer], [supplier], [category], [current_discount], [quantity_in_stock], [image_path]) VALUES (N'N483G5', N'Клюшка', N'Клюшка Nordway NDW300 (2019/2020) SR лев. 19 150см', N'шт.', CAST(1299.00 AS Decimal(10, 2)), 10, N'Nordway', N'Декатлон', N'Спортивный инвентарь', 3, 4, NULL)
GO
INSERT [dbo].[products] ([article], [title], [decription], [unit_of_measurement], [price], [max_discount], [manufacturer], [supplier], [category], [current_discount], [quantity_in_stock], [image_path]) VALUES (N'N836R5', N'Коньки', N'Коньки ATEMI AKSK01DXS, раздвижные, прогулочные, унисекс, 27-30, черный/зеленый', N'шт.', CAST(2000.00 AS Decimal(10, 2)), 10, N'Atemi', N'Декатлон', N'Спортивный инвентарь', 3, 16, NULL)
GO
INSERT [dbo].[products] ([article], [title], [decription], [unit_of_measurement], [price], [max_discount], [manufacturer], [supplier], [category], [current_discount], [quantity_in_stock], [image_path]) VALUES (N'N892G6', N'Очки для плавания', N'Очки для плавания Atemi N8401 синий', N'шт.', CAST(500.00 AS Decimal(10, 2)), 5, N'Atemi', N'Декатлон', N'Спортивный инвентарь', 5, 14, NULL)
GO
INSERT [dbo].[products] ([article], [title], [decription], [unit_of_measurement], [price], [max_discount], [manufacturer], [supplier], [category], [current_discount], [quantity_in_stock], [image_path]) VALUES (N'S374B5', N'Ролик для йоги', N'Ролик для йоги Bradex Туба d=14см ш.:33см оранжевый', N'шт.', CAST(700.00 AS Decimal(10, 2)), 10, N'Bradex', N'Спортмастер', N'Спортивный инвентарь', 3, 12, NULL)
GO
INSERT [dbo].[products] ([article], [title], [decription], [unit_of_measurement], [price], [max_discount], [manufacturer], [supplier], [category], [current_discount], [quantity_in_stock], [image_path]) VALUES (N'V312R4', N'Мяч', N'Мяч волейбольный MIKASA VT370W, для зала, 5-й размер, желтый/синий', N'шт.', CAST(4150.00 AS Decimal(10, 2)), 20, N'Mikasa', N'Декатлон', N'Спортивный инвентарь', 2, 5, NULL)
GO
INSERT [dbo].[products] ([article], [title], [decription], [unit_of_measurement], [price], [max_discount], [manufacturer], [supplier], [category], [current_discount], [quantity_in_stock], [image_path]) VALUES (N'V392H7', N'Степ-платформа', N'Степ-платформа Starfit SP-204 серый/черный', N'шт.', CAST(4790.00 AS Decimal(10, 2)), 10, N'Starfit', N'Спортмастер', N'Спортивный инвентарь', 3, 15, NULL)
GO
INSERT [dbo].[products] ([article], [title], [decription], [unit_of_measurement], [price], [max_discount], [manufacturer], [supplier], [category], [current_discount], [quantity_in_stock], [image_path]) VALUES (N'V423D4', N'Штанга', N'Штанга Starfit BB-401 30кг пласт. черный ', N'шт.', CAST(5600.00 AS Decimal(10, 2)), 10, N'Starfit', N'Декатлон', N'Спортивный инвентарь', 3, 8, NULL)
GO
INSERT [dbo].[products] ([article], [title], [decription], [unit_of_measurement], [price], [max_discount], [manufacturer], [supplier], [category], [current_discount], [quantity_in_stock], [image_path]) VALUES (N'А112Т4', N'Боксерская груша', N'Боксерская груша X-Match черная', N'шт.', CAST(778.00 AS Decimal(10, 2)), 30, N'X-Match', N'Спортмастер', N'Спортивный инвентарь', 5, 6, N'А112Т4.jpg')
GO
SET IDENTITY_INSERT [dbo].[roles] ON 
GO
INSERT [dbo].[roles] ([role_id], [title]) VALUES (1, N'Администратор')
GO
INSERT [dbo].[roles] ([role_id], [title]) VALUES (2, N'Менеджер')
GO
INSERT [dbo].[roles] ([role_id], [title]) VALUES (3, N'Клиент')
GO
SET IDENTITY_INSERT [dbo].[roles] OFF
GO
SET IDENTITY_INSERT [dbo].[users] ON 
GO
INSERT [dbo].[users] ([user_id], [last_name], [first_name], [patronymic], [login], [password], [role_id]) VALUES (1, N'Пахомова', N'Аиша', N'Анатольевна', N'm4ic8j5qgstw@gmail.com', N'2L6KZG', 1)
GO
INSERT [dbo].[users] ([user_id], [last_name], [first_name], [patronymic], [login], [password], [role_id]) VALUES (2, N'Жуков', N'Роман', N'Богданович', N'd43zfg9tlsyv@gmail.com', N'uzWC67', 1)
GO
INSERT [dbo].[users] ([user_id], [last_name], [first_name], [patronymic], [login], [password], [role_id]) VALUES (3, N'Киселева', N'Анастасия', N'Максимовна', N'8ohgisf6k45w@outlook.com', N'8ntwUp', 1)
GO
INSERT [dbo].[users] ([user_id], [last_name], [first_name], [patronymic], [login], [password], [role_id]) VALUES (4, N'Григорьева', N'Арина', N'Арсентьевна', N'hi1brwj46czx@mail.com', N'YOyhfR', 2)
GO
INSERT [dbo].[users] ([user_id], [last_name], [first_name], [patronymic], [login], [password], [role_id]) VALUES (5, N'Иванов', N'Лев', N'Михайлович', N'fvkbcamhlj52@gmail.com', N'RSbvHv', 2)
GO
INSERT [dbo].[users] ([user_id], [last_name], [first_name], [patronymic], [login], [password], [role_id]) VALUES (6, N'Григорьев', N'Лев', N'Давидович', N'9qxnce8jwruv@gmail.com', N'rwVDh9', 2)
GO
INSERT [dbo].[users] ([user_id], [last_name], [first_name], [patronymic], [login], [password], [role_id]) VALUES (7, N'Поляков', N'Степан', N'Егорович', N'dotiex942p1r@gmail.com', N'LdNyos', 3)
GO
INSERT [dbo].[users] ([user_id], [last_name], [first_name], [patronymic], [login], [password], [role_id]) VALUES (8, N'Леонова', N'Алиса', N'Кирилловна', N'n0bmi2h1xral@tutanota.com', N'gynQMT', 3)
GO
INSERT [dbo].[users] ([user_id], [last_name], [first_name], [patronymic], [login], [password], [role_id]) VALUES (9, N'Яковлев', N'Платон', N'Константинович', N'sfm3t278kdvz@yahoo.com', N'AtnDjr', 3)
GO
INSERT [dbo].[users] ([user_id], [last_name], [first_name], [patronymic], [login], [password], [role_id]) VALUES (10, N'Ковалева', N'Ева', N'Яковлевна', N'ilb8rdut0v7e@mail.com', N'JlFRCZ', 3)
GO
SET IDENTITY_INSERT [dbo].[users] OFF
GO
ALTER TABLE [dbo].[orders] ADD  DEFAULT (getdate()) FOR [order_date]
GO
ALTER TABLE [dbo].[order_details]  WITH CHECK ADD  CONSTRAINT [FK__order_det__artic__33D4B598] FOREIGN KEY([article])
REFERENCES [dbo].[products] ([article])
GO
ALTER TABLE [dbo].[order_details] CHECK CONSTRAINT [FK__order_det__artic__33D4B598]
GO
ALTER TABLE [dbo].[order_details]  WITH CHECK ADD FOREIGN KEY([order_id])
REFERENCES [dbo].[orders] ([order_id])
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD FOREIGN KEY([pickup_point_id])
REFERENCES [dbo].[pickup_points] ([pickup_point_id])
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK__orders__user_id__300424B4] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK__orders__user_id__300424B4]
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [FK__users__role_id__25869641] FOREIGN KEY([role_id])
REFERENCES [dbo].[roles] ([role_id])
GO
ALTER TABLE [dbo].[users] CHECK CONSTRAINT [FK__users__role_id__25869641]
GO
/****** Object:  StoredProcedure [dbo].[DELETE_Product]    Script Date: 27.04.2024 20:57:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[DELETE_Product]
@ProductAticle varchar(30)
AS
BEGIN
	Delete FROM products WHERE article=@ProductAticle
END
GO
/****** Object:  StoredProcedure [dbo].[Login]    Script Date: 27.04.2024 20:57:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Login]
@login varchar(30),
@password varchar(30)
AS
BEGIN
	SELECT * FROM users WHERE BINARY_CHECKSUM([login]) = BINARY_CHECKSUM(@login) AND BINARY_CHECKSUM([password]) = BINARY_CHECKSUM(@password)
END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = -96
         Left = 0
      End
      Begin Tables = 
         Begin Table = "products"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 8
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ProductsV'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ProductsV'
GO
USE [master]
GO
ALTER DATABASE [VIKSportProduct] SET  READ_WRITE 
GO
