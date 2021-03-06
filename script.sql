USE [master]
GO
/****** Object:  Database [Vacunacion]    Script Date: 7/14/2021 4:17:28 PM ******/
CREATE DATABASE [Vacunacion]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Vacunacion', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Vacunacion.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Vacunacion_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Vacunacion_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Vacunacion] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Vacunacion].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Vacunacion] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Vacunacion] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Vacunacion] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Vacunacion] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Vacunacion] SET ARITHABORT OFF 
GO
ALTER DATABASE [Vacunacion] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Vacunacion] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Vacunacion] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Vacunacion] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Vacunacion] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Vacunacion] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Vacunacion] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Vacunacion] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Vacunacion] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Vacunacion] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Vacunacion] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Vacunacion] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Vacunacion] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Vacunacion] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Vacunacion] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Vacunacion] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Vacunacion] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Vacunacion] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Vacunacion] SET  MULTI_USER 
GO
ALTER DATABASE [Vacunacion] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Vacunacion] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Vacunacion] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Vacunacion] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Vacunacion] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Vacunacion] SET QUERY_STORE = OFF
GO
USE [Vacunacion]
GO
/****** Object:  Table [dbo].[Centro]    Script Date: 7/14/2021 4:17:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Centro](
	[cod_cen] [char](13) NOT NULL,
	[nombre] [varchar](40) NULL,
	[cod_cor] [int] NULL,
 CONSTRAINT [Centro_cod_cen_pk] PRIMARY KEY CLUSTERED 
(
	[cod_cen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Centro_Colaborador]    Script Date: 7/14/2021 4:17:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Centro_Colaborador](
	[cod_cen] [char](13) NOT NULL,
	[cedula_col] [char](11) NOT NULL,
	[fecha] [date] NOT NULL,
 CONSTRAINT [Centro_Colaborador_cod_cen_cedula_col_fecha_pk] PRIMARY KEY CLUSTERED 
(
	[cod_cen] ASC,
	[cedula_col] ASC,
	[fecha] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Colaborador]    Script Date: 7/14/2021 4:17:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Colaborador](
	[cedula_col] [char](11) NOT NULL,
	[nombre] [varchar](20) NULL,
	[apellido] [varchar](20) NULL,
	[rol] [char](1) NULL,
	[cod_int] [int] NULL,
 CONSTRAINT [Colaborador_cedula_col_pk] PRIMARY KEY CLUSTERED 
(
	[cedula_col] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Corregimiento]    Script Date: 7/14/2021 4:17:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Corregimiento](
	[cod_cor] [int] NOT NULL,
	[nombre] [varchar](25) NOT NULL,
	[cod_dist] [int] NULL,
 CONSTRAINT [Corregimiento_cod_corr_pk] PRIMARY KEY CLUSTERED 
(
	[cod_cor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Distrito]    Script Date: 7/14/2021 4:17:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Distrito](
	[cod_dist] [int] NOT NULL,
	[nombre] [varchar](25) NOT NULL,
	[cod_prov] [char](2) NULL,
 CONSTRAINT [Distrito_cod_dist_pk] PRIMARY KEY CLUSTERED 
(
	[cod_dist] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Institucion]    Script Date: 7/14/2021 4:17:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Institucion](
	[cod_int] [int] IDENTITY(1000,1) NOT NULL,
	[nombre] [varchar](25) NOT NULL,
 CONSTRAINT [Institucion_cod_int_pk] PRIMARY KEY CLUSTERED 
(
	[cod_int] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Paciente]    Script Date: 7/14/2021 4:17:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Paciente](
	[cedula_pac] [char](11) NOT NULL,
	[nombre] [varchar](20) NULL,
	[apellido] [varchar](20) NULL,
	[fecha_nac] [date] NULL,
	[cod_cor] [int] NULL,
 CONSTRAINT [Paciente_cedula_pac_pk] PRIMARY KEY CLUSTERED 
(
	[cedula_pac] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Paciente_Vacuna_Centro]    Script Date: 7/14/2021 4:17:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Paciente_Vacuna_Centro](
	[cedula_pac] [char](11) NOT NULL,
	[cod_vac] [varchar](3) NOT NULL,
	[cod_cen] [char](13) NOT NULL,
	[dosis] [int] NOT NULL,
	[fecha_cita] [date] NOT NULL,
	[fecha_vacuna] [date] NULL,
 CONSTRAINT [Paciente_Vacuna_Centro_cedula_pac_cod_vac_cod_cen_dosis_pk] PRIMARY KEY CLUSTERED 
(
	[cedula_pac] ASC,
	[cod_vac] ASC,
	[cod_cen] ASC,
	[dosis] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Provincia]    Script Date: 7/14/2021 4:17:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provincia](
	[cod_prov] [char](2) NOT NULL,
	[nombre] [varchar](25) NOT NULL,
 CONSTRAINT [Provincia_cod_prov_pk] PRIMARY KEY CLUSTERED 
(
	[cod_prov] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Telefono]    Script Date: 7/14/2021 4:17:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Telefono](
	[cedula_pac] [char](11) NOT NULL,
	[telefono] [varchar](9) NOT NULL,
 CONSTRAINT [Telefono_cedula_pac_telefono_pk] PRIMARY KEY CLUSTERED 
(
	[cedula_pac] ASC,
	[telefono] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vacuna]    Script Date: 7/14/2021 4:17:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vacuna](
	[cod_vac]  AS (upper(left([nombre],(3)))) PERSISTED NOT NULL,
	[nombre] [varchar](25) NOT NULL,
	[cant_dosis] [int] NOT NULL,
	[TiempoEntreDosis] [int] NULL,
 CONSTRAINT [Vacuna_cod_vac_pk] PRIMARY KEY CLUSTERED 
(
	[cod_vac] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Centro] ([cod_cen], [nombre], [cod_cor]) VALUES (N'CV-08-ES-1111', N'Escuela José María Torrijos', 7)
INSERT [dbo].[Centro] ([cod_cen], [nombre], [cod_cor]) VALUES (N'CV-08-ES-1112', N'Ciudad Jardín Las Mañanitas', 8)
INSERT [dbo].[Centro] ([cod_cen], [nombre], [cod_cor]) VALUES (N'CV-08-ES-1113', N'Colegio José Antonio Remón Cantera', 5)
INSERT [dbo].[Centro] ([cod_cen], [nombre], [cod_cor]) VALUES (N'CV-08-ES-1114', N'Instituto América', 4)
INSERT [dbo].[Centro] ([cod_cen], [nombre], [cod_cor]) VALUES (N'CV-08-ES-1115', N'Instituto José Dolores Moscote', 11)
INSERT [dbo].[Centro] ([cod_cen], [nombre], [cod_cor]) VALUES (N'CV-08-HO-1115', N'Manuel Maria Valdés', 11)
INSERT [dbo].[Centro] ([cod_cen], [nombre], [cod_cor]) VALUES (N'CV-08-HO-1120', N'Espedializada', 5)
GO
INSERT [dbo].[Centro_Colaborador] ([cod_cen], [cedula_col], [fecha]) VALUES (N'CV-08-ES-1113', N'03-111-1124', CAST(N'2021-07-15' AS Date))
INSERT [dbo].[Centro_Colaborador] ([cod_cen], [cedula_col], [fecha]) VALUES (N'CV-08-ES-1113', N'04-111-1125', CAST(N'2021-07-15' AS Date))
INSERT [dbo].[Centro_Colaborador] ([cod_cen], [cedula_col], [fecha]) VALUES (N'CV-08-ES-1113', N'04-111-1125', CAST(N'2021-07-16' AS Date))
INSERT [dbo].[Centro_Colaborador] ([cod_cen], [cedula_col], [fecha]) VALUES (N'CV-08-ES-1113', N'05-111-1126', CAST(N'2021-07-15' AS Date))
INSERT [dbo].[Centro_Colaborador] ([cod_cen], [cedula_col], [fecha]) VALUES (N'CV-08-ES-1113', N'05-111-1126', CAST(N'2021-07-16' AS Date))
INSERT [dbo].[Centro_Colaborador] ([cod_cen], [cedula_col], [fecha]) VALUES (N'CV-08-ES-1113', N'05-111-1127', CAST(N'2021-07-16' AS Date))
INSERT [dbo].[Centro_Colaborador] ([cod_cen], [cedula_col], [fecha]) VALUES (N'CV-08-ES-1113', N'08-111-1139', CAST(N'2021-07-15' AS Date))
INSERT [dbo].[Centro_Colaborador] ([cod_cen], [cedula_col], [fecha]) VALUES (N'CV-08-ES-1113', N'08-111-1140', CAST(N'2021-07-15' AS Date))
INSERT [dbo].[Centro_Colaborador] ([cod_cen], [cedula_col], [fecha]) VALUES (N'CV-08-ES-1113', N'08-111-1141', CAST(N'2021-07-15' AS Date))
INSERT [dbo].[Centro_Colaborador] ([cod_cen], [cedula_col], [fecha]) VALUES (N'CV-08-ES-1113', N'08-111-1142', CAST(N'2021-07-16' AS Date))
INSERT [dbo].[Centro_Colaborador] ([cod_cen], [cedula_col], [fecha]) VALUES (N'CV-08-ES-1113', N'08-111-1143', CAST(N'2021-07-16' AS Date))
INSERT [dbo].[Centro_Colaborador] ([cod_cen], [cedula_col], [fecha]) VALUES (N'CV-08-ES-1113', N'08-111-1145', CAST(N'2021-07-16' AS Date))
INSERT [dbo].[Centro_Colaborador] ([cod_cen], [cedula_col], [fecha]) VALUES (N'CV-08-ES-1113', N'08-111-1146', CAST(N'2021-07-15' AS Date))
INSERT [dbo].[Centro_Colaborador] ([cod_cen], [cedula_col], [fecha]) VALUES (N'CV-08-ES-1113', N'08-111-1146', CAST(N'2021-07-16' AS Date))
INSERT [dbo].[Centro_Colaborador] ([cod_cen], [cedula_col], [fecha]) VALUES (N'CV-08-ES-1113', N'08-111-1147', CAST(N'2021-07-15' AS Date))
INSERT [dbo].[Centro_Colaborador] ([cod_cen], [cedula_col], [fecha]) VALUES (N'CV-08-ES-1113', N'08-111-1147', CAST(N'2021-07-16' AS Date))
INSERT [dbo].[Centro_Colaborador] ([cod_cen], [cedula_col], [fecha]) VALUES (N'CV-08-ES-1113', N'08-111-1148', CAST(N'2021-07-15' AS Date))
INSERT [dbo].[Centro_Colaborador] ([cod_cen], [cedula_col], [fecha]) VALUES (N'CV-08-HO-1115', N'03-111-1123', CAST(N'2021-07-15' AS Date))
INSERT [dbo].[Centro_Colaborador] ([cod_cen], [cedula_col], [fecha]) VALUES (N'CV-08-HO-1115', N'03-111-1123', CAST(N'2021-07-16' AS Date))
INSERT [dbo].[Centro_Colaborador] ([cod_cen], [cedula_col], [fecha]) VALUES (N'CV-08-HO-1115', N'03-111-1124', CAST(N'2021-07-16' AS Date))
INSERT [dbo].[Centro_Colaborador] ([cod_cen], [cedula_col], [fecha]) VALUES (N'CV-08-HO-1115', N'05-111-1127', CAST(N'2021-07-15' AS Date))
INSERT [dbo].[Centro_Colaborador] ([cod_cen], [cedula_col], [fecha]) VALUES (N'CV-08-HO-1115', N'08-111-1136', CAST(N'2021-07-15' AS Date))
INSERT [dbo].[Centro_Colaborador] ([cod_cen], [cedula_col], [fecha]) VALUES (N'CV-08-HO-1115', N'08-111-1136', CAST(N'2021-07-16' AS Date))
INSERT [dbo].[Centro_Colaborador] ([cod_cen], [cedula_col], [fecha]) VALUES (N'CV-08-HO-1115', N'08-111-1137', CAST(N'2021-07-15' AS Date))
INSERT [dbo].[Centro_Colaborador] ([cod_cen], [cedula_col], [fecha]) VALUES (N'CV-08-HO-1115', N'08-111-1137', CAST(N'2021-07-16' AS Date))
INSERT [dbo].[Centro_Colaborador] ([cod_cen], [cedula_col], [fecha]) VALUES (N'CV-08-HO-1115', N'08-111-1138', CAST(N'2021-07-15' AS Date))
INSERT [dbo].[Centro_Colaborador] ([cod_cen], [cedula_col], [fecha]) VALUES (N'CV-08-HO-1115', N'08-111-1138', CAST(N'2021-07-16' AS Date))
INSERT [dbo].[Centro_Colaborador] ([cod_cen], [cedula_col], [fecha]) VALUES (N'CV-08-HO-1115', N'08-111-1139', CAST(N'2021-07-16' AS Date))
INSERT [dbo].[Centro_Colaborador] ([cod_cen], [cedula_col], [fecha]) VALUES (N'CV-08-HO-1115', N'08-111-1140', CAST(N'2021-07-16' AS Date))
INSERT [dbo].[Centro_Colaborador] ([cod_cen], [cedula_col], [fecha]) VALUES (N'CV-08-HO-1115', N'08-111-1141', CAST(N'2021-07-16' AS Date))
INSERT [dbo].[Centro_Colaborador] ([cod_cen], [cedula_col], [fecha]) VALUES (N'CV-08-HO-1115', N'08-111-1142', CAST(N'2021-07-15' AS Date))
INSERT [dbo].[Centro_Colaborador] ([cod_cen], [cedula_col], [fecha]) VALUES (N'CV-08-HO-1115', N'08-111-1143', CAST(N'2021-07-15' AS Date))
INSERT [dbo].[Centro_Colaborador] ([cod_cen], [cedula_col], [fecha]) VALUES (N'CV-08-HO-1115', N'08-111-1144', CAST(N'2021-07-15' AS Date))
INSERT [dbo].[Centro_Colaborador] ([cod_cen], [cedula_col], [fecha]) VALUES (N'CV-08-HO-1115', N'08-111-1144', CAST(N'2021-07-16' AS Date))
INSERT [dbo].[Centro_Colaborador] ([cod_cen], [cedula_col], [fecha]) VALUES (N'CV-08-HO-1115', N'08-111-1145', CAST(N'2021-07-15' AS Date))
INSERT [dbo].[Centro_Colaborador] ([cod_cen], [cedula_col], [fecha]) VALUES (N'CV-08-HO-1115', N'08-111-1148', CAST(N'2021-07-16' AS Date))
INSERT [dbo].[Centro_Colaborador] ([cod_cen], [cedula_col], [fecha]) VALUES (N'CV-08-HO-1115', N'08-111-1149', CAST(N'2021-07-15' AS Date))
INSERT [dbo].[Centro_Colaborador] ([cod_cen], [cedula_col], [fecha]) VALUES (N'CV-08-HO-1115', N'08-111-1149', CAST(N'2021-07-16' AS Date))
INSERT [dbo].[Centro_Colaborador] ([cod_cen], [cedula_col], [fecha]) VALUES (N'CV-08-HO-1115', N'08-111-1150', CAST(N'2021-07-15' AS Date))
INSERT [dbo].[Centro_Colaborador] ([cod_cen], [cedula_col], [fecha]) VALUES (N'CV-08-HO-1115', N'08-111-1150', CAST(N'2021-07-16' AS Date))
GO
INSERT [dbo].[Colaborador] ([cedula_col], [nombre], [apellido], [rol], [cod_int]) VALUES (N'03-111-1123', N'Helen', N'Bennett', N'E', 1000)
INSERT [dbo].[Colaborador] ([cedula_col], [nombre], [apellido], [rol], [cod_int]) VALUES (N'03-111-1124', N'Lesley', N'Brown', N'E', 1000)
INSERT [dbo].[Colaborador] ([cedula_col], [nombre], [apellido], [rol], [cod_int]) VALUES (N'04-111-1125', N'Francisco', N'Chang', N'E', 1000)
INSERT [dbo].[Colaborador] ([cedula_col], [nombre], [apellido], [rol], [cod_int]) VALUES (N'05-111-1126', N'Philip', N'Cramer', N'E', 1000)
INSERT [dbo].[Colaborador] ([cedula_col], [nombre], [apellido], [rol], [cod_int]) VALUES (N'05-111-1127', N'Aria', N'Cruz', N'D', 1001)
INSERT [dbo].[Colaborador] ([cedula_col], [nombre], [apellido], [rol], [cod_int]) VALUES (N'08-111-1136', N'Matti', N'Karttunen', N'D', 1003)
INSERT [dbo].[Colaborador] ([cedula_col], [nombre], [apellido], [rol], [cod_int]) VALUES (N'08-111-1137', N'Pirkko', N'Koskitalo', N'E', 1001)
INSERT [dbo].[Colaborador] ([cedula_col], [nombre], [apellido], [rol], [cod_int]) VALUES (N'08-111-1138', N'Janine', N'Labrune', N'E', 1001)
INSERT [dbo].[Colaborador] ([cedula_col], [nombre], [apellido], [rol], [cod_int]) VALUES (N'08-111-1139', N'Maria', N'Larsson', N'E', 1001)
INSERT [dbo].[Colaborador] ([cedula_col], [nombre], [apellido], [rol], [cod_int]) VALUES (N'08-111-1140', N'Yoshi', N'Latimer', N'A', 1004)
INSERT [dbo].[Colaborador] ([cedula_col], [nombre], [apellido], [rol], [cod_int]) VALUES (N'08-111-1141', N'Laurence', N'Lebihan', N'A', 1004)
INSERT [dbo].[Colaborador] ([cedula_col], [nombre], [apellido], [rol], [cod_int]) VALUES (N'08-111-1142', N'Elizabeth', N'Lincoln', N'A', 1005)
INSERT [dbo].[Colaborador] ([cedula_col], [nombre], [apellido], [rol], [cod_int]) VALUES (N'08-111-1143', N'Patricia', N'McKenna', N'A', 1006)
INSERT [dbo].[Colaborador] ([cedula_col], [nombre], [apellido], [rol], [cod_int]) VALUES (N'08-111-1144', N'Roland', N'Mendel', N'E', 1000)
INSERT [dbo].[Colaborador] ([cedula_col], [nombre], [apellido], [rol], [cod_int]) VALUES (N'08-111-1145', N'Rita', N'Muller', N'E', 1000)
INSERT [dbo].[Colaborador] ([cedula_col], [nombre], [apellido], [rol], [cod_int]) VALUES (N'08-111-1146', N'Helvetius', N'Nagy', N'E', 1000)
INSERT [dbo].[Colaborador] ([cedula_col], [nombre], [apellido], [rol], [cod_int]) VALUES (N'08-111-1147', N'Timothy', N'O''Rourke', N'E', 1001)
INSERT [dbo].[Colaborador] ([cedula_col], [nombre], [apellido], [rol], [cod_int]) VALUES (N'08-111-1148', N'Sven', N'Ottlieb', N'E', 1001)
INSERT [dbo].[Colaborador] ([cedula_col], [nombre], [apellido], [rol], [cod_int]) VALUES (N'08-111-1149', N'Miguel', N'Paolino', N'D', 1001)
INSERT [dbo].[Colaborador] ([cedula_col], [nombre], [apellido], [rol], [cod_int]) VALUES (N'08-111-1150', N'Paula', N'Parente', N'A', 1007)
GO
INSERT [dbo].[Corregimiento] ([cod_cor], [nombre], [cod_dist]) VALUES (1, N'San Miguel', 1)
INSERT [dbo].[Corregimiento] ([cod_cor], [nombre], [cod_dist]) VALUES (2, N'Pedro Gonzales', 1)
INSERT [dbo].[Corregimiento] ([cod_cor], [nombre], [cod_dist]) VALUES (3, N'Saboga', 1)
INSERT [dbo].[Corregimiento] ([cod_cor], [nombre], [cod_dist]) VALUES (4, N'Betania', 2)
INSERT [dbo].[Corregimiento] ([cod_cor], [nombre], [cod_dist]) VALUES (5, N'Chorrillo', 2)
INSERT [dbo].[Corregimiento] ([cod_cor], [nombre], [cod_dist]) VALUES (6, N'Bella Vista', 2)
INSERT [dbo].[Corregimiento] ([cod_cor], [nombre], [cod_dist]) VALUES (7, N'Tocumen', 2)
INSERT [dbo].[Corregimiento] ([cod_cor], [nombre], [cod_dist]) VALUES (8, N'Las Mananitas', 2)
INSERT [dbo].[Corregimiento] ([cod_cor], [nombre], [cod_dist]) VALUES (9, N'24 de Diciembre', 2)
INSERT [dbo].[Corregimiento] ([cod_cor], [nombre], [cod_dist]) VALUES (10, N'Omar Torrijos', 3)
INSERT [dbo].[Corregimiento] ([cod_cor], [nombre], [cod_dist]) VALUES (11, N'Jose Domingo Espinar', 3)
INSERT [dbo].[Corregimiento] ([cod_cor], [nombre], [cod_dist]) VALUES (12, N'Belisario Porras', 3)
GO
INSERT [dbo].[Distrito] ([cod_dist], [nombre], [cod_prov]) VALUES (1, N'Balboa', N'08')
INSERT [dbo].[Distrito] ([cod_dist], [nombre], [cod_prov]) VALUES (2, N'Panama', N'08')
INSERT [dbo].[Distrito] ([cod_dist], [nombre], [cod_prov]) VALUES (3, N'San Miguelito', N'08')
GO
SET IDENTITY_INSERT [dbo].[Institucion] ON 

INSERT [dbo].[Institucion] ([cod_int], [nombre]) VALUES (1000, N'Ministerio de Salud')
INSERT [dbo].[Institucion] ([cod_int], [nombre]) VALUES (1001, N'Caja de Seguro Social')
INSERT [dbo].[Institucion] ([cod_int], [nombre]) VALUES (1002, N'Bene. Cuerpo de Bomb. RP.')
INSERT [dbo].[Institucion] ([cod_int], [nombre]) VALUES (1003, N'S. Nac. de Protec. Civil')
INSERT [dbo].[Institucion] ([cod_int], [nombre]) VALUES (1004, N'Cruz Roja')
INSERT [dbo].[Institucion] ([cod_int], [nombre]) VALUES (1005, N'Club Activo 20-30')
INSERT [dbo].[Institucion] ([cod_int], [nombre]) VALUES (1006, N'Gobiernos Municipales')
INSERT [dbo].[Institucion] ([cod_int], [nombre]) VALUES (1007, N'Policia Nacional')
SET IDENTITY_INSERT [dbo].[Institucion] OFF
GO
INSERT [dbo].[Paciente] ([cedula_pac], [nombre], [apellido], [fecha_nac], [cod_cor]) VALUES (N'01-111-1111', N'Nancy', N'Davolio', CAST(N'1948-12-08' AS Date), 4)
INSERT [dbo].[Paciente] ([cedula_pac], [nombre], [apellido], [fecha_nac], [cod_cor]) VALUES (N'01-111-1112', N'Andrew', N'Fuller', CAST(N'1952-02-19' AS Date), 9)
INSERT [dbo].[Paciente] ([cedula_pac], [nombre], [apellido], [fecha_nac], [cod_cor]) VALUES (N'01-111-1113', N'Janet', N'Leverling', CAST(N'1963-08-30' AS Date), 3)
INSERT [dbo].[Paciente] ([cedula_pac], [nombre], [apellido], [fecha_nac], [cod_cor]) VALUES (N'01-111-1114', N'Margaret', N'Peacock', CAST(N'1937-09-19' AS Date), 8)
INSERT [dbo].[Paciente] ([cedula_pac], [nombre], [apellido], [fecha_nac], [cod_cor]) VALUES (N'01-111-1115', N'Steven', N'Buchanan', CAST(N'1955-03-04' AS Date), 11)
INSERT [dbo].[Paciente] ([cedula_pac], [nombre], [apellido], [fecha_nac], [cod_cor]) VALUES (N'02-111-1116', N'Michael', N'Suyama', CAST(N'1963-07-02' AS Date), 7)
INSERT [dbo].[Paciente] ([cedula_pac], [nombre], [apellido], [fecha_nac], [cod_cor]) VALUES (N'02-111-1117', N'Robert', N'King', CAST(N'1960-05-29' AS Date), 8)
INSERT [dbo].[Paciente] ([cedula_pac], [nombre], [apellido], [fecha_nac], [cod_cor]) VALUES (N'02-111-1118', N'Laura', N'Callahan', CAST(N'1958-01-09' AS Date), 7)
INSERT [dbo].[Paciente] ([cedula_pac], [nombre], [apellido], [fecha_nac], [cod_cor]) VALUES (N'02-111-1119', N'Anne', N'Dodsworth', CAST(N'1966-01-27' AS Date), 11)
INSERT [dbo].[Paciente] ([cedula_pac], [nombre], [apellido], [fecha_nac], [cod_cor]) VALUES (N'03-111-1120', N'Paolo', N'Accorti', CAST(N'1992-08-27' AS Date), 7)
INSERT [dbo].[Paciente] ([cedula_pac], [nombre], [apellido], [fecha_nac], [cod_cor]) VALUES (N'03-111-1121', N'Pedro', N'Afonso', CAST(N'1990-12-24' AS Date), 3)
INSERT [dbo].[Paciente] ([cedula_pac], [nombre], [apellido], [fecha_nac], [cod_cor]) VALUES (N'03-111-1122', N'Victoria', N'Ashworth', CAST(N'1990-09-13' AS Date), 9)
INSERT [dbo].[Paciente] ([cedula_pac], [nombre], [apellido], [fecha_nac], [cod_cor]) VALUES (N'05-111-1128', N'Ann', N'Devon', CAST(N'1991-07-16' AS Date), 5)
INSERT [dbo].[Paciente] ([cedula_pac], [nombre], [apellido], [fecha_nac], [cod_cor]) VALUES (N'06-111-1129', N'Anabela', N'Domingues', CAST(N'1993-01-27' AS Date), 5)
INSERT [dbo].[Paciente] ([cedula_pac], [nombre], [apellido], [fecha_nac], [cod_cor]) VALUES (N'06-111-1130', N'Peter', N'Franken', CAST(N'1992-05-17' AS Date), 5)
INSERT [dbo].[Paciente] ([cedula_pac], [nombre], [apellido], [fecha_nac], [cod_cor]) VALUES (N'06-111-1131', N'Paul', N'Henriot', CAST(N'1993-08-19' AS Date), 5)
INSERT [dbo].[Paciente] ([cedula_pac], [nombre], [apellido], [fecha_nac], [cod_cor]) VALUES (N'06-111-1132', N'Carlos', N'Hernadez', CAST(N'1989-04-21' AS Date), 8)
INSERT [dbo].[Paciente] ([cedula_pac], [nombre], [apellido], [fecha_nac], [cod_cor]) VALUES (N'07-111-1133', N'Palle', N'Ibsen', CAST(N'1993-05-09' AS Date), 8)
INSERT [dbo].[Paciente] ([cedula_pac], [nombre], [apellido], [fecha_nac], [cod_cor]) VALUES (N'07-111-1134', N'Karla', N'Jablonski', CAST(N'1994-03-11' AS Date), 1)
INSERT [dbo].[Paciente] ([cedula_pac], [nombre], [apellido], [fecha_nac], [cod_cor]) VALUES (N'07-111-1135', N'Karin', N'Josephs', CAST(N'1992-10-17' AS Date), 1)
INSERT [dbo].[Paciente] ([cedula_pac], [nombre], [apellido], [fecha_nac], [cod_cor]) VALUES (N'08-111-1151', N'Manuel', N'Pereira', CAST(N'1989-01-09' AS Date), 5)
INSERT [dbo].[Paciente] ([cedula_pac], [nombre], [apellido], [fecha_nac], [cod_cor]) VALUES (N'08-111-1152', N'Maria', N'Pontes', CAST(N'1989-03-01' AS Date), 7)
INSERT [dbo].[Paciente] ([cedula_pac], [nombre], [apellido], [fecha_nac], [cod_cor]) VALUES (N'08-111-1153', N'Martine', N'Rance', CAST(N'1992-02-05' AS Date), 7)
INSERT [dbo].[Paciente] ([cedula_pac], [nombre], [apellido], [fecha_nac], [cod_cor]) VALUES (N'08-111-1154', N'Diego', N'Roel', CAST(N'1991-12-16' AS Date), 7)
INSERT [dbo].[Paciente] ([cedula_pac], [nombre], [apellido], [fecha_nac], [cod_cor]) VALUES (N'08-111-1155', N'Annette', N'Roulet', CAST(N'1990-02-21' AS Date), 7)
INSERT [dbo].[Paciente] ([cedula_pac], [nombre], [apellido], [fecha_nac], [cod_cor]) VALUES (N'08-111-1156', N'Mary', N'Saveley', CAST(N'1993-06-29' AS Date), 7)
INSERT [dbo].[Paciente] ([cedula_pac], [nombre], [apellido], [fecha_nac], [cod_cor]) VALUES (N'09-111-1157', N'Carine', N'Schmitt', CAST(N'1992-07-07' AS Date), 7)
INSERT [dbo].[Paciente] ([cedula_pac], [nombre], [apellido], [fecha_nac], [cod_cor]) VALUES (N'09-111-1158', N'Margaret', N'Smith', CAST(N'1988-09-29' AS Date), 1)
INSERT [dbo].[Paciente] ([cedula_pac], [nombre], [apellido], [fecha_nac], [cod_cor]) VALUES (N'09-111-1159', N'Howard', N'Snyder', CAST(N'1988-11-19' AS Date), 1)
INSERT [dbo].[Paciente] ([cedula_pac], [nombre], [apellido], [fecha_nac], [cod_cor]) VALUES (N'09-111-1160', N'Martin', N'Sommer', CAST(N'1990-04-13' AS Date), 5)
INSERT [dbo].[Paciente] ([cedula_pac], [nombre], [apellido], [fecha_nac], [cod_cor]) VALUES (N'09-111-1161', N'Gary', N'Thomas', CAST(N'1988-08-09' AS Date), 3)
INSERT [dbo].[Paciente] ([cedula_pac], [nombre], [apellido], [fecha_nac], [cod_cor]) VALUES (N'09-111-1162', N'Daniel', N'Tonini', CAST(N'1990-01-01' AS Date), 8)
GO
INSERT [dbo].[Paciente_Vacuna_Centro] ([cedula_pac], [cod_vac], [cod_cen], [dosis], [fecha_cita], [fecha_vacuna]) VALUES (N'01-111-1111', N'SIN', N'CV-08-ES-1111', 1, CAST(N'2021-07-14' AS Date), CAST(N'2021-07-14' AS Date))
INSERT [dbo].[Paciente_Vacuna_Centro] ([cedula_pac], [cod_vac], [cod_cen], [dosis], [fecha_cita], [fecha_vacuna]) VALUES (N'01-111-1111', N'SIN', N'CV-08-ES-1111', 2, CAST(N'2021-08-04' AS Date), NULL)
INSERT [dbo].[Paciente_Vacuna_Centro] ([cedula_pac], [cod_vac], [cod_cen], [dosis], [fecha_cita], [fecha_vacuna]) VALUES (N'01-111-1112', N'SPU', N'CV-08-ES-1112', 1, CAST(N'2021-07-15' AS Date), NULL)
INSERT [dbo].[Paciente_Vacuna_Centro] ([cedula_pac], [cod_vac], [cod_cen], [dosis], [fecha_cita], [fecha_vacuna]) VALUES (N'01-111-1113', N'JOH', N'CV-08-ES-1113', 1, CAST(N'2021-07-14' AS Date), CAST(N'2021-07-14' AS Date))
INSERT [dbo].[Paciente_Vacuna_Centro] ([cedula_pac], [cod_vac], [cod_cen], [dosis], [fecha_cita], [fecha_vacuna]) VALUES (N'01-111-1114', N'SPU', N'CV-08-ES-1114', 1, CAST(N'2021-07-15' AS Date), NULL)
INSERT [dbo].[Paciente_Vacuna_Centro] ([cedula_pac], [cod_vac], [cod_cen], [dosis], [fecha_cita], [fecha_vacuna]) VALUES (N'01-111-1115', N'PFI', N'CV-08-ES-1115', 1, CAST(N'2021-07-15' AS Date), NULL)
INSERT [dbo].[Paciente_Vacuna_Centro] ([cedula_pac], [cod_vac], [cod_cen], [dosis], [fecha_cita], [fecha_vacuna]) VALUES (N'02-111-1116', N'AST', N'CV-08-HO-1115', 1, CAST(N'2021-07-14' AS Date), CAST(N'2021-07-14' AS Date))
INSERT [dbo].[Paciente_Vacuna_Centro] ([cedula_pac], [cod_vac], [cod_cen], [dosis], [fecha_cita], [fecha_vacuna]) VALUES (N'02-111-1116', N'AST', N'CV-08-HO-1115', 2, CAST(N'2021-09-08' AS Date), NULL)
INSERT [dbo].[Paciente_Vacuna_Centro] ([cedula_pac], [cod_vac], [cod_cen], [dosis], [fecha_cita], [fecha_vacuna]) VALUES (N'02-111-1117', N'JOH', N'CV-08-HO-1120', 1, CAST(N'2021-07-15' AS Date), NULL)
INSERT [dbo].[Paciente_Vacuna_Centro] ([cedula_pac], [cod_vac], [cod_cen], [dosis], [fecha_cita], [fecha_vacuna]) VALUES (N'02-111-1118', N'PFI', N'CV-08-ES-1111', 1, CAST(N'2021-07-15' AS Date), NULL)
INSERT [dbo].[Paciente_Vacuna_Centro] ([cedula_pac], [cod_vac], [cod_cen], [dosis], [fecha_cita], [fecha_vacuna]) VALUES (N'02-111-1119', N'PFI', N'CV-08-ES-1112', 1, CAST(N'2021-07-16' AS Date), NULL)
INSERT [dbo].[Paciente_Vacuna_Centro] ([cedula_pac], [cod_vac], [cod_cen], [dosis], [fecha_cita], [fecha_vacuna]) VALUES (N'03-111-1120', N'AST', N'CV-08-ES-1113', 1, CAST(N'2021-07-15' AS Date), NULL)
INSERT [dbo].[Paciente_Vacuna_Centro] ([cedula_pac], [cod_vac], [cod_cen], [dosis], [fecha_cita], [fecha_vacuna]) VALUES (N'03-111-1121', N'MOD', N'CV-08-ES-1114', 1, CAST(N'2021-07-16' AS Date), NULL)
INSERT [dbo].[Paciente_Vacuna_Centro] ([cedula_pac], [cod_vac], [cod_cen], [dosis], [fecha_cita], [fecha_vacuna]) VALUES (N'03-111-1122', N'SPU', N'CV-08-ES-1115', 1, CAST(N'2021-07-15' AS Date), NULL)
INSERT [dbo].[Paciente_Vacuna_Centro] ([cedula_pac], [cod_vac], [cod_cen], [dosis], [fecha_cita], [fecha_vacuna]) VALUES (N'05-111-1128', N'MOD', N'CV-08-HO-1115', 1, CAST(N'2021-07-14' AS Date), CAST(N'2021-07-14' AS Date))
INSERT [dbo].[Paciente_Vacuna_Centro] ([cedula_pac], [cod_vac], [cod_cen], [dosis], [fecha_cita], [fecha_vacuna]) VALUES (N'05-111-1128', N'MOD', N'CV-08-HO-1115', 2, CAST(N'2021-08-11' AS Date), NULL)
INSERT [dbo].[Paciente_Vacuna_Centro] ([cedula_pac], [cod_vac], [cod_cen], [dosis], [fecha_cita], [fecha_vacuna]) VALUES (N'06-111-1129', N'PFI', N'CV-08-HO-1120', 1, CAST(N'2021-07-15' AS Date), NULL)
INSERT [dbo].[Paciente_Vacuna_Centro] ([cedula_pac], [cod_vac], [cod_cen], [dosis], [fecha_cita], [fecha_vacuna]) VALUES (N'06-111-1130', N'PFI', N'CV-08-ES-1111', 1, CAST(N'2021-07-15' AS Date), NULL)
INSERT [dbo].[Paciente_Vacuna_Centro] ([cedula_pac], [cod_vac], [cod_cen], [dosis], [fecha_cita], [fecha_vacuna]) VALUES (N'06-111-1131', N'AST', N'CV-08-ES-1112', 1, CAST(N'2021-07-16' AS Date), NULL)
INSERT [dbo].[Paciente_Vacuna_Centro] ([cedula_pac], [cod_vac], [cod_cen], [dosis], [fecha_cita], [fecha_vacuna]) VALUES (N'06-111-1132', N'MOD', N'CV-08-ES-1112', 1, CAST(N'2021-07-16' AS Date), NULL)
INSERT [dbo].[Paciente_Vacuna_Centro] ([cedula_pac], [cod_vac], [cod_cen], [dosis], [fecha_cita], [fecha_vacuna]) VALUES (N'07-111-1133', N'JOH', N'CV-08-ES-1114', 1, CAST(N'2021-07-15' AS Date), NULL)
INSERT [dbo].[Paciente_Vacuna_Centro] ([cedula_pac], [cod_vac], [cod_cen], [dosis], [fecha_cita], [fecha_vacuna]) VALUES (N'07-111-1134', N'SPU', N'CV-08-ES-1115', 1, CAST(N'2021-07-14' AS Date), NULL)
INSERT [dbo].[Paciente_Vacuna_Centro] ([cedula_pac], [cod_vac], [cod_cen], [dosis], [fecha_cita], [fecha_vacuna]) VALUES (N'07-111-1135', N'JOH', N'CV-08-HO-1115', 1, CAST(N'2021-07-16' AS Date), NULL)
INSERT [dbo].[Paciente_Vacuna_Centro] ([cedula_pac], [cod_vac], [cod_cen], [dosis], [fecha_cita], [fecha_vacuna]) VALUES (N'08-111-1151', N'PFI', N'CV-08-HO-1120', 1, CAST(N'2021-07-14' AS Date), CAST(N'2021-07-14' AS Date))
INSERT [dbo].[Paciente_Vacuna_Centro] ([cedula_pac], [cod_vac], [cod_cen], [dosis], [fecha_cita], [fecha_vacuna]) VALUES (N'08-111-1151', N'PFI', N'CV-08-HO-1120', 2, CAST(N'2021-08-04' AS Date), NULL)
INSERT [dbo].[Paciente_Vacuna_Centro] ([cedula_pac], [cod_vac], [cod_cen], [dosis], [fecha_cita], [fecha_vacuna]) VALUES (N'08-111-1152', N'PFI', N'CV-08-HO-1115', 1, CAST(N'2021-07-16' AS Date), NULL)
INSERT [dbo].[Paciente_Vacuna_Centro] ([cedula_pac], [cod_vac], [cod_cen], [dosis], [fecha_cita], [fecha_vacuna]) VALUES (N'08-111-1153', N'AST', N'CV-08-ES-1113', 1, CAST(N'2021-07-15' AS Date), NULL)
INSERT [dbo].[Paciente_Vacuna_Centro] ([cedula_pac], [cod_vac], [cod_cen], [dosis], [fecha_cita], [fecha_vacuna]) VALUES (N'08-111-1154', N'MOD', N'CV-08-HO-1115', 1, CAST(N'2021-07-16' AS Date), NULL)
INSERT [dbo].[Paciente_Vacuna_Centro] ([cedula_pac], [cod_vac], [cod_cen], [dosis], [fecha_cita], [fecha_vacuna]) VALUES (N'08-111-1155', N'SPU', N'CV-08-ES-1113', 1, CAST(N'2021-07-14' AS Date), NULL)
INSERT [dbo].[Paciente_Vacuna_Centro] ([cedula_pac], [cod_vac], [cod_cen], [dosis], [fecha_cita], [fecha_vacuna]) VALUES (N'08-111-1156', N'JOH', N'CV-08-ES-1114', 1, CAST(N'2021-07-15' AS Date), NULL)
INSERT [dbo].[Paciente_Vacuna_Centro] ([cedula_pac], [cod_vac], [cod_cen], [dosis], [fecha_cita], [fecha_vacuna]) VALUES (N'09-111-1157', N'PFI', N'CV-08-ES-1115', 1, CAST(N'2021-07-15' AS Date), NULL)
INSERT [dbo].[Paciente_Vacuna_Centro] ([cedula_pac], [cod_vac], [cod_cen], [dosis], [fecha_cita], [fecha_vacuna]) VALUES (N'09-111-1158', N'PFI', N'CV-08-HO-1115', 1, CAST(N'2021-07-16' AS Date), NULL)
INSERT [dbo].[Paciente_Vacuna_Centro] ([cedula_pac], [cod_vac], [cod_cen], [dosis], [fecha_cita], [fecha_vacuna]) VALUES (N'09-111-1159', N'AST', N'CV-08-HO-1120', 1, CAST(N'2021-07-15' AS Date), NULL)
INSERT [dbo].[Paciente_Vacuna_Centro] ([cedula_pac], [cod_vac], [cod_cen], [dosis], [fecha_cita], [fecha_vacuna]) VALUES (N'09-111-1160', N'MOD', N'CV-08-HO-1115', 1, CAST(N'2021-07-15' AS Date), NULL)
INSERT [dbo].[Paciente_Vacuna_Centro] ([cedula_pac], [cod_vac], [cod_cen], [dosis], [fecha_cita], [fecha_vacuna]) VALUES (N'09-111-1161', N'SPU', N'CV-08-ES-1113', 1, CAST(N'2021-07-15' AS Date), NULL)
INSERT [dbo].[Paciente_Vacuna_Centro] ([cedula_pac], [cod_vac], [cod_cen], [dosis], [fecha_cita], [fecha_vacuna]) VALUES (N'09-111-1162', N'JOH', N'CV-08-HO-1115', 1, CAST(N'2021-07-14' AS Date), NULL)
GO
INSERT [dbo].[Provincia] ([cod_prov], [nombre]) VALUES (N'01', N'Bocas del Toro')
INSERT [dbo].[Provincia] ([cod_prov], [nombre]) VALUES (N'02', N'Coclé')
INSERT [dbo].[Provincia] ([cod_prov], [nombre]) VALUES (N'03', N'Colón')
INSERT [dbo].[Provincia] ([cod_prov], [nombre]) VALUES (N'04', N'Chiriquí')
INSERT [dbo].[Provincia] ([cod_prov], [nombre]) VALUES (N'05', N'Darién')
INSERT [dbo].[Provincia] ([cod_prov], [nombre]) VALUES (N'06', N'Herrera')
INSERT [dbo].[Provincia] ([cod_prov], [nombre]) VALUES (N'07', N'Los Santos')
INSERT [dbo].[Provincia] ([cod_prov], [nombre]) VALUES (N'08', N'Panamá')
INSERT [dbo].[Provincia] ([cod_prov], [nombre]) VALUES (N'09', N'VeraguaS')
INSERT [dbo].[Provincia] ([cod_prov], [nombre]) VALUES (N'10', N'GunaYala, Madugan, Wargan')
INSERT [dbo].[Provincia] ([cod_prov], [nombre]) VALUES (N'11', N'Emberá Wounaan')
INSERT [dbo].[Provincia] ([cod_prov], [nombre]) VALUES (N'12', N'Ngäbe-Buglé')
INSERT [dbo].[Provincia] ([cod_prov], [nombre]) VALUES (N'13', N'Panamá Oeste')
GO
INSERT [dbo].[Vacuna] ([nombre], [cant_dosis], [TiempoEntreDosis]) VALUES (N'AstraZeneca', 2, 56)
INSERT [dbo].[Vacuna] ([nombre], [cant_dosis], [TiempoEntreDosis]) VALUES (N'Johnson&Johnson', 1, 0)
INSERT [dbo].[Vacuna] ([nombre], [cant_dosis], [TiempoEntreDosis]) VALUES (N'Moderna', 2, 28)
INSERT [dbo].[Vacuna] ([nombre], [cant_dosis], [TiempoEntreDosis]) VALUES (N'Pfizer-BioNTech', 2, 21)
INSERT [dbo].[Vacuna] ([nombre], [cant_dosis], [TiempoEntreDosis]) VALUES (N'Sinopharm', 2, 21)
INSERT [dbo].[Vacuna] ([nombre], [cant_dosis], [TiempoEntreDosis]) VALUES (N'Sputnik', 2, 21)
GO
ALTER TABLE [dbo].[Colaborador] ADD  CONSTRAINT [Colaborador_rol_df]  DEFAULT ('A') FOR [rol]
GO
ALTER TABLE [dbo].[Distrito] ADD  CONSTRAINT [Distrito_cod_prov_df]  DEFAULT ('08') FOR [cod_prov]
GO
ALTER TABLE [dbo].[Centro]  WITH CHECK ADD  CONSTRAINT [Centro_cod_cor_fk] FOREIGN KEY([cod_cor])
REFERENCES [dbo].[Corregimiento] ([cod_cor])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Centro] CHECK CONSTRAINT [Centro_cod_cor_fk]
GO
ALTER TABLE [dbo].[Centro_Colaborador]  WITH CHECK ADD  CONSTRAINT [Centro_Colaborador_cedula_col_fk] FOREIGN KEY([cedula_col])
REFERENCES [dbo].[Colaborador] ([cedula_col])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Centro_Colaborador] CHECK CONSTRAINT [Centro_Colaborador_cedula_col_fk]
GO
ALTER TABLE [dbo].[Centro_Colaborador]  WITH CHECK ADD  CONSTRAINT [Centro_Colaborador_cod_cen_fk] FOREIGN KEY([cod_cen])
REFERENCES [dbo].[Centro] ([cod_cen])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Centro_Colaborador] CHECK CONSTRAINT [Centro_Colaborador_cod_cen_fk]
GO
ALTER TABLE [dbo].[Colaborador]  WITH CHECK ADD  CONSTRAINT [Colaborador_cod_int_fk] FOREIGN KEY([cod_int])
REFERENCES [dbo].[Institucion] ([cod_int])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Colaborador] CHECK CONSTRAINT [Colaborador_cod_int_fk]
GO
ALTER TABLE [dbo].[Corregimiento]  WITH CHECK ADD  CONSTRAINT [Corregimiento_cod_dist_fk] FOREIGN KEY([cod_dist])
REFERENCES [dbo].[Distrito] ([cod_dist])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Corregimiento] CHECK CONSTRAINT [Corregimiento_cod_dist_fk]
GO
ALTER TABLE [dbo].[Distrito]  WITH CHECK ADD  CONSTRAINT [Distrito_cod_prov_fk] FOREIGN KEY([cod_prov])
REFERENCES [dbo].[Provincia] ([cod_prov])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Distrito] CHECK CONSTRAINT [Distrito_cod_prov_fk]
GO
ALTER TABLE [dbo].[Paciente]  WITH CHECK ADD  CONSTRAINT [Paciente_cod_cor_fk] FOREIGN KEY([cod_cor])
REFERENCES [dbo].[Corregimiento] ([cod_cor])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Paciente] CHECK CONSTRAINT [Paciente_cod_cor_fk]
GO
ALTER TABLE [dbo].[Paciente_Vacuna_Centro]  WITH CHECK ADD  CONSTRAINT [Paciente_Vacuna_Centro_cedula_pac_fk] FOREIGN KEY([cedula_pac])
REFERENCES [dbo].[Paciente] ([cedula_pac])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Paciente_Vacuna_Centro] CHECK CONSTRAINT [Paciente_Vacuna_Centro_cedula_pac_fk]
GO
ALTER TABLE [dbo].[Paciente_Vacuna_Centro]  WITH CHECK ADD  CONSTRAINT [Paciente_Vacuna_Centro_cod_cen_fk] FOREIGN KEY([cod_cen])
REFERENCES [dbo].[Centro] ([cod_cen])
GO
ALTER TABLE [dbo].[Paciente_Vacuna_Centro] CHECK CONSTRAINT [Paciente_Vacuna_Centro_cod_cen_fk]
GO
ALTER TABLE [dbo].[Paciente_Vacuna_Centro]  WITH CHECK ADD  CONSTRAINT [Paciente_Vacuna_Centro_cod_vac_fk] FOREIGN KEY([cod_vac])
REFERENCES [dbo].[Vacuna] ([cod_vac])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Paciente_Vacuna_Centro] CHECK CONSTRAINT [Paciente_Vacuna_Centro_cod_vac_fk]
GO
ALTER TABLE [dbo].[Telefono]  WITH CHECK ADD  CONSTRAINT [Telefono_cedula_pac_fk] FOREIGN KEY([cedula_pac])
REFERENCES [dbo].[Paciente] ([cedula_pac])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Telefono] CHECK CONSTRAINT [Telefono_cedula_pac_fk]
GO
ALTER TABLE [dbo].[Centro]  WITH CHECK ADD  CONSTRAINT [Centro_cod_cent_ch] CHECK  (([cod_cen] like 'CV-0[1-9]-ES-[0-9][0-9][0-9][0-9]' OR [cod_cen] like 'CV-1[0-3]-ES-[0-9][0-9][0-9][0-9]' OR [cod_cen] like 'CV-0[1-9]-HO-[0-9][0-9][0-9][0-9]' OR [cod_cen] like 'CV-1[0-3]-HO-[0-9][0-9][0-9][0-9]' OR [cod_cen] like 'CV-0[1-9]-CS-[0-9][0-9][0-9][0-9]' OR [cod_cen] like 'CV-1[0-3]-CS-[0-9][0-9][0-9][0-9]'))
GO
ALTER TABLE [dbo].[Centro] CHECK CONSTRAINT [Centro_cod_cent_ch]
GO
ALTER TABLE [dbo].[Colaborador]  WITH CHECK ADD  CONSTRAINT [Colaborador_cedula_col_ch] CHECK  (([cedula_col] like '[1][0-3]-[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]' OR [cedula_col] like '[0][0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]'))
GO
ALTER TABLE [dbo].[Colaborador] CHECK CONSTRAINT [Colaborador_cedula_col_ch]
GO
ALTER TABLE [dbo].[Colaborador]  WITH CHECK ADD  CONSTRAINT [Colaborador_rol_ch] CHECK  (([rol]='A' OR [rol]='E' OR [rol]='D'))
GO
ALTER TABLE [dbo].[Colaborador] CHECK CONSTRAINT [Colaborador_rol_ch]
GO
ALTER TABLE [dbo].[Paciente]  WITH CHECK ADD  CONSTRAINT [Paciente_cedula_pac_ch] CHECK  (([cedula_pac] like '[1][0-3]-[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]' OR [cedula_pac] like '[0][0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]'))
GO
ALTER TABLE [dbo].[Paciente] CHECK CONSTRAINT [Paciente_cedula_pac_ch]
GO
ALTER TABLE [dbo].[Paciente]  WITH CHECK ADD  CONSTRAINT [Paciente_fech_nac_ch] CHECK  ((datediff(year,getdate(),[fecha_nac])<(110)))
GO
ALTER TABLE [dbo].[Paciente] CHECK CONSTRAINT [Paciente_fech_nac_ch]
GO
ALTER TABLE [dbo].[Paciente_Vacuna_Centro]  WITH CHECK ADD  CONSTRAINT [Paciente_Vacuna_Centro_fecha_cita_ch] CHECK  ((datediff(day,getdate(),[fecha_cita])>=(0)))
GO
ALTER TABLE [dbo].[Paciente_Vacuna_Centro] CHECK CONSTRAINT [Paciente_Vacuna_Centro_fecha_cita_ch]
GO
ALTER TABLE [dbo].[Provincia]  WITH CHECK ADD  CONSTRAINT [Provincia_cod_prov_ch] CHECK  (([cod_prov] like '0[1-9]' OR [cod_prov] like '1[0-3]'))
GO
ALTER TABLE [dbo].[Provincia] CHECK CONSTRAINT [Provincia_cod_prov_ch]
GO
/****** Object:  StoredProcedure [dbo].[Pacientes_Fecha]    Script Date: 7/14/2021 4:17:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Pacientes_Fecha]
    (
        @fecha DATE
    )
AS
    DECLARE @paciente VARCHAR(50);
    DECLARE @centro VARCHAR(40);
	DECLARE @total INT = 0;
    DECLARE cursor_centro CURSOR FOR
        SELECT
            cen.nombre
        FROM Centro AS cen
    
    OPEN cursor_centro;

    FETCH NEXT FROM cursor_centro
        INTO @centro
    WHILE @@FETCH_STATUS = 0
        BEGIN
			PRINT @centro + ' / ' + CAST(@fecha as varchar(20))
			DECLARE cursor_paciente CURSOR FOR
				SELECT
					pac.nombre + ' ' + pac.apellido
				FROM Paciente as pac
				JOIN Paciente_Vacuna_Centro as pvc ON pvc.cedula_pac = pac.cedula_pac
				JOIN Centro as cen ON cen.cod_cen = pvc.cod_cen
				WHERE pvc.fecha_cita = @fecha
				AND cen.nombre = @centro

			OPEN cursor_paciente;

			FETCH NEXT FROM cursor_paciente
				INTO @paciente
			WHILE @@FETCH_STATUS = 0
				BEGIN
					PRINT @paciente

					SET @total = @total+1
					FETCH NEXT FROM cursor_paciente 
						INTO @paciente
				END
			DEALLOCATE cursor_paciente

			PRINT CHAR(13)+CHAR(10)
            FETCH NEXT FROM cursor_centro
                INTO @centro
        END
    DEALLOCATE cursor_centro
	PRINT CHAR(13)+CHAR(10)
	PRINT 'TOTAL DE PACIENTES: ' + CAST(@total as VARCHAR)
RETURN
GO
/****** Object:  StoredProcedure [dbo].[Personal]    Script Date: 7/14/2021 4:17:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Personal]
	(
		@fecha date,
		@centro char(13),
		@cant_doctores int output,
		@cant_enfermeras int output,
		@cant_logistico int output
	)
as
	select
		@cant_doctores = COUNT(cen.cedula_col)
	from Colaborador as col
	join Centro_Colaborador as cen on cen.cedula_col = col.cedula_col
	where 
		@fecha = cen.fecha and
		@centro = cen.cod_cen and
		col.rol = 'D'
	select
		@cant_enfermeras = COUNT(cen.cedula_col)
	from Colaborador as col
	join Centro_Colaborador as cen on cen.cedula_col = col.cedula_col
	where 
		@fecha = cen.fecha and
		@centro = cen.cod_cen and
		col.rol = 'E'
	select
		@cant_logistico = COUNT(cen.cedula_col)
	from Colaborador as col
	join Centro_Colaborador as cen on cen.cedula_col = col.cedula_col
	where 
		@fecha = cen.fecha and
		@centro = cen.cod_cen and
		col.rol = 'A'
return
GO
USE [master]
GO
ALTER DATABASE [Vacunacion] SET  READ_WRITE 
GO
