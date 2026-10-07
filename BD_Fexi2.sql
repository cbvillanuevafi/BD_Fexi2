USE [master]
GO
/****** Objeto: Database [BD_Fexi2] Fecha de script: 7/10/2026 12:16:51 ******/
CREATE DATABASE [BD_Fexi2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BD_Fexi2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS01\MSSQL\DATA\BD_Fexi2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BD_Fexi2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS01\MSSQL\DATA\BD_Fexi2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BD_Fexi2] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BD_Fexi2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BD_Fexi2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BD_Fexi2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BD_Fexi2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BD_Fexi2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BD_Fexi2] SET ARITHABORT OFF 
GO
ALTER DATABASE [BD_Fexi2] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [BD_Fexi2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BD_Fexi2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BD_Fexi2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BD_Fexi2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BD_Fexi2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BD_Fexi2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BD_Fexi2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BD_Fexi2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BD_Fexi2] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BD_Fexi2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BD_Fexi2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BD_Fexi2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BD_Fexi2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BD_Fexi2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BD_Fexi2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BD_Fexi2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BD_Fexi2] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BD_Fexi2] SET  MULTI_USER 
GO
ALTER DATABASE [BD_Fexi2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BD_Fexi2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BD_Fexi2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BD_Fexi2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BD_Fexi2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BD_Fexi2] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [BD_Fexi2] SET QUERY_STORE = OFF
GO
USE [BD_Fexi2]
GO
/****** Objeto: Table [dbo].[Credenciales] Fecha de script: 7/10/2026 12:16:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Credenciales](
	[IdCredencial] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[NombreUsuario] [varchar](50) NOT NULL,
	[Contrasena] [varchar](255) NOT NULL,
 CONSTRAINT [PK_Credenciales] PRIMARY KEY CLUSTERED 
(
	[IdCredencial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto: Table [dbo].[Generos] Fecha de script: 7/10/2026 12:16:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Generos](
	[IdGenero] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](30) NOT NULL,
 CONSTRAINT [PK_Generos] PRIMARY KEY CLUSTERED 
(
	[IdGenero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto: Table [dbo].[TiposUsuario] Fecha de script: 7/10/2026 12:16:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TiposUsuario](
	[IdTipoUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](30) NOT NULL,
 CONSTRAINT [PK_TiposUsuario] PRIMARY KEY CLUSTERED 
(
	[IdTipoUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Objeto: Table [dbo].[Usuarios] Fecha de script: 7/10/2026 12:16:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellido] [varchar](50) NOT NULL,
	[Dni] [varchar](20) NOT NULL,
	[Telefono] [varchar](20) NULL,
	[Email] [varchar](100) NOT NULL,
	[IdGenero] [int] NOT NULL,
	[FechaNacimiento] [date] NOT NULL,
	[IdTipoUsuario] [int] NOT NULL,
	[PrimerIngreso] [bit] NOT NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Credenciales] ON 

INSERT [dbo].[Credenciales] ([IdCredencial], [IdUsuario], [NombreUsuario], [Contrasena]) VALUES (1, 1, N'admin001', N'admin123')
INSERT [dbo].[Credenciales] ([IdCredencial], [IdUsuario], [NombreUsuario], [Contrasena]) VALUES (2, 2, N'empleado001', N'1234')
SET IDENTITY_INSERT [dbo].[Credenciales] OFF
GO
SET IDENTITY_INSERT [dbo].[Generos] ON 

INSERT [dbo].[Generos] ([IdGenero], [Nombre]) VALUES (1, N'Masculino')
INSERT [dbo].[Generos] ([IdGenero], [Nombre]) VALUES (2, N'Femenino')
INSERT [dbo].[Generos] ([IdGenero], [Nombre]) VALUES (3, N'Otro')
SET IDENTITY_INSERT [dbo].[Generos] OFF
GO
SET IDENTITY_INSERT [dbo].[TiposUsuario] ON 

INSERT [dbo].[TiposUsuario] ([IdTipoUsuario], [Nombre]) VALUES (1, N'Administrador')
INSERT [dbo].[TiposUsuario] ([IdTipoUsuario], [Nombre]) VALUES (2, N'Empleado')
SET IDENTITY_INSERT [dbo].[TiposUsuario] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([IdUsuario], [Nombre], [Apellido], [Dni], [Telefono], [Email], [IdGenero], [FechaNacimiento], [IdTipoUsuario], [PrimerIngreso]) VALUES (1, N'Administrador', N'Sistema', N'12345678', N'1123456789', N'admin@fexi.com', 1, CAST(N'1990-05-20' AS Date), 1, 1)
INSERT [dbo].[Usuarios] ([IdUsuario], [Nombre], [Apellido], [Dni], [Telefono], [Email], [IdGenero], [FechaNacimiento], [IdTipoUsuario], [PrimerIngreso]) VALUES (2, N'Juan', N'Perez', N'30123456', N'1198765432', N'juan@gmail.com', 1, CAST(N'1998-08-15' AS Date), 2, 1)
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
GO
/****** Objeto: Index [IX_Credenciales] Fecha de script: 7/10/2026 12:16:51 ******/
ALTER TABLE [dbo].[Credenciales] ADD  CONSTRAINT [IX_Credenciales] UNIQUE NONCLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Credenciales]  WITH CHECK ADD  CONSTRAINT [FK_Credenciales_Usuarios] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuarios] ([IdUsuario])
GO
ALTER TABLE [dbo].[Credenciales] CHECK CONSTRAINT [FK_Credenciales_Usuarios]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_Usuarios_Generos] FOREIGN KEY([IdGenero])
REFERENCES [dbo].[Generos] ([IdGenero])
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [FK_Usuarios_Generos]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_Usuarios_TiposUsuario] FOREIGN KEY([IdTipoUsuario])
REFERENCES [dbo].[TiposUsuario] ([IdTipoUsuario])
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [FK_Usuarios_TiposUsuario]
GO
USE [master]
GO
ALTER DATABASE [BD_Fexi2] SET  READ_WRITE 
GO
