USE [master]
GO
/****** Object:  Database [CATALOGO_WEB_DB]    Script Date: 30/9/2024 15:08:41 ******/
CREATE DATABASE [CATALOGO_WEB_DB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CATALOGO_WEB_DB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\CATALOGO_WEB_DB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CATALOGO_WEB_DB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\CATALOGO_WEB_DB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [CATALOGO_WEB_DB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CATALOGO_WEB_DB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CATALOGO_WEB_DB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CATALOGO_WEB_DB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CATALOGO_WEB_DB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CATALOGO_WEB_DB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CATALOGO_WEB_DB] SET ARITHABORT OFF 
GO
ALTER DATABASE [CATALOGO_WEB_DB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [CATALOGO_WEB_DB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CATALOGO_WEB_DB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CATALOGO_WEB_DB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CATALOGO_WEB_DB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CATALOGO_WEB_DB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CATALOGO_WEB_DB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CATALOGO_WEB_DB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CATALOGO_WEB_DB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CATALOGO_WEB_DB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [CATALOGO_WEB_DB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CATALOGO_WEB_DB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CATALOGO_WEB_DB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CATALOGO_WEB_DB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CATALOGO_WEB_DB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CATALOGO_WEB_DB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CATALOGO_WEB_DB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CATALOGO_WEB_DB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CATALOGO_WEB_DB] SET  MULTI_USER 
GO
ALTER DATABASE [CATALOGO_WEB_DB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CATALOGO_WEB_DB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CATALOGO_WEB_DB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CATALOGO_WEB_DB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CATALOGO_WEB_DB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CATALOGO_WEB_DB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [CATALOGO_WEB_DB] SET QUERY_STORE = ON
GO
ALTER DATABASE [CATALOGO_WEB_DB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [CATALOGO_WEB_DB]
GO
/****** Object:  Table [dbo].[ARTICULOS]    Script Date: 30/9/2024 15:08:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ARTICULOS](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Codigo] [varchar](50) NULL,
	[Nombre] [varchar](50) NULL,
	[Descripcion] [varchar](150) NULL,
	[IdMarca] [int] NULL,
	[IdCategoria] [int] NULL,
	[ImagenUrl] [varchar](1000) NULL,
	[Precio] [money] NULL,
 CONSTRAINT [PK_ARTICULOS] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CATEGORIAS]    Script Date: 30/9/2024 15:08:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CATEGORIAS](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](50) NULL,
 CONSTRAINT [PK_CATEGORIAS] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FAVORITOS]    Script Date: 30/9/2024 15:08:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FAVORITOS](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdUser] [int] NOT NULL,
	[IdArticulo] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MARCAS]    Script Date: 30/9/2024 15:08:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MARCAS](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](50) NULL,
 CONSTRAINT [PK_MARCAS] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USERS]    Script Date: 30/9/2024 15:08:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USERS](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[email] [varchar](100) NOT NULL,
	[pass] [varchar](20) NOT NULL,
	[nombre] [varchar](50) NULL,
	[apellido] [varchar](50) NULL,
	[urlImagenPerfil] [varchar](500) NULL,
	[admin] [bit] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[USERS] ADD  DEFAULT ((0)) FOR [admin]
GO
/****** Object:  StoredProcedure [dbo].[agregarFavoritoSP]    Script Date: 30/9/2024 15:08:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[agregarFavoritoSP]
@idUser int,
@idArticulo int
AS
insert into FAVORITOS (IdUser, IdArticulo) output inserted.Id
values (@idUser, @idArticulo)
GO
/****** Object:  StoredProcedure [dbo].[agregarSP]    Script Date: 30/9/2024 15:08:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[agregarSP]
@Codigo varchar(50),
@Nombre varchar(50),
@Descripcion varchar(150),
@Precio money,
@IdMarca int,
@IdCategoria int,
@ImagenUrl varchar(1000)
AS
BEGIN
    INSERT INTO ARTICULOS (Codigo, Nombre, Descripcion, Precio, IdMarca, IdCategoria, ImagenUrl)
    VALUES (@Codigo, @Nombre, @Descripcion, @Precio, @IdMarca, @IdCategoria, @ImagenUrl);
END
GO
/****** Object:  StoredProcedure [dbo].[appleSP]    Script Date: 30/9/2024 15:08:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[appleSP] 
AS
SELECT 
        A.Codigo, 
        A.Nombre, 
        A.Descripcion, 
        A.ImagenUrl, 
        M.Descripcion AS Marca, 
        C.Descripcion AS Categoria, 
        A.IdCategoria, 
        A.IdMarca, 
        A.Id, 
        A.Precio
    FROM 
        ARTICULOS A
    INNER JOIN 
        CATEGORIAS C ON C.Id = A.IdCategoria
    INNER JOIN 
        MARCAS M ON M.Id = A.IdMarca
    WHERE 
        M.Id = 2
GO
/****** Object:  StoredProcedure [dbo].[eliminarFavoritoSP]    Script Date: 30/9/2024 15:08:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[eliminarFavoritoSP]
@idUser int,
@idArticulo int
AS
    DELETE FROM FAVORITOS 
    WHERE IdUser = @idUser AND IdArticulo = @idArticulo
GO
/****** Object:  StoredProcedure [dbo].[eliminarSP]    Script Date: 30/9/2024 15:08:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[eliminarSP]
@Id int
AS
DELETE FROM ARTICULOS WHERE Id = @Id
GO
/****** Object:  StoredProcedure [dbo].[huaweiSP]    Script Date: 30/9/2024 15:08:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[huaweiSP] 
AS
SELECT 
        A.Codigo, 
        A.Nombre, 
        A.Descripcion, 
        A.ImagenUrl, 
        M.Descripcion AS Marca, 
        C.Descripcion AS Categoria, 
        A.IdCategoria, 
        A.IdMarca, 
        A.Id, 
        A.Precio
    FROM 
        ARTICULOS A
    INNER JOIN 
        CATEGORIAS C ON C.Id = A.IdCategoria
    INNER JOIN 
        MARCAS M ON M.Id = A.IdMarca
    WHERE 
        M.Id = 4
GO
/****** Object:  StoredProcedure [dbo].[listaFavoritoSP]    Script Date: 30/9/2024 15:08:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[listaFavoritoSP]
@idUser int
AS
select Codigo, Nombre, A.Descripcion, ImagenUrl, M.Descripcion as Marca,
C.Descripcion as Categoria, A.Id, Precio 
from ARTICULOS A, CATEGORIAS C, MARCAS M, FAVORITOS F
where C.Id = A.IdCategoria and M.Id = A.IdMarca And F.IdArticulo = A.Id 
and F.IdUser = @idUser
GO
/****** Object:  StoredProcedure [dbo].[listarAudioSP]    Script Date: 30/9/2024 15:08:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[listarAudioSP]
as
SELECT  A.Codigo, 
        A.Nombre, 
        A.Descripcion, 
        A.ImagenUrl, 
        M.Descripcion AS Marca, 
        C.Descripcion AS Categoria, 
        A.IdCategoria, 
        A.IdMarca, 
        A.Id, 
        A.Precio from ARTICULOS A, MARCAS M, CATEGORIAS C where C.Id = A.IdCategoria
		and M.Id = a.IdMarca and C.Id = 4
GO
/****** Object:  StoredProcedure [dbo].[listarCelularesSP]    Script Date: 30/9/2024 15:08:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[listarCelularesSP]
as
SELECT  A.Codigo, 
        A.Nombre, 
        A.Descripcion, 
        A.ImagenUrl, 
        M.Descripcion AS Marca, 
        C.Descripcion AS Categoria, 
        A.IdCategoria, 
        A.IdMarca, 
        A.Id, 
        A.Precio from ARTICULOS A, MARCAS M, CATEGORIAS C where C.Id = A.IdCategoria
		and M.Id = a.IdMarca and C.Id = 1
GO
/****** Object:  StoredProcedure [dbo].[listarMediaSP]    Script Date: 30/9/2024 15:08:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[listarMediaSP]
as
SELECT  A.Codigo, 
        A.Nombre, 
        A.Descripcion, 
        A.ImagenUrl, 
        M.Descripcion AS Marca, 
        C.Descripcion AS Categoria, 
        A.IdCategoria, 
        A.IdMarca, 
        A.Id, 
        A.Precio from ARTICULOS A, MARCAS M, CATEGORIAS C where C.Id = A.IdCategoria
		and M.Id = a.IdMarca and C.Id = 3
GO
/****** Object:  StoredProcedure [dbo].[listarSP]    Script Date: 30/9/2024 15:08:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[listarSP] as select Codigo, Nombre, A.Descripcion, ImagenUrl, M.Descripcion as Marca, C.Descripcion as Categoria, A.IdCategoria, A.IdMarca, A.Id, Precio from ARTICULOS A, CATEGORIAS C, MARCAS M where C.Id = A.IdCategoria and M.Id = A.IdMarca
GO
/****** Object:  StoredProcedure [dbo].[listarTelevisoresSP]    Script Date: 30/9/2024 15:08:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[listarTelevisoresSP]
as
SELECT  A.Codigo, 
        A.Nombre, 
        A.Descripcion, 
        A.ImagenUrl, 
        M.Descripcion AS Marca, 
        C.Descripcion AS Categoria, 
        A.IdCategoria, 
        A.IdMarca, 
        A.Id, 
        A.Precio from ARTICULOS A, MARCAS M, CATEGORIAS C where C.Id = A.IdCategoria
		and M.Id = a.IdMarca and C.Id = 2
GO
/****** Object:  StoredProcedure [dbo].[modificarSP]    Script Date: 30/9/2024 15:08:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[modificarSP]
    @Id int,
    @Codigo varchar(50),
    @Nombre varchar(50),
    @Descripcion varchar(150),
    @Precio money,
    @IdMarca int,
    @IdCategoria int,
    @ImagenUrl varchar(1000)
AS
BEGIN
    UPDATE ARTICULOS
    SET Codigo = @Codigo, 
        Nombre = @Nombre, 
        Descripcion = @Descripcion, 
        IdMarca = @IdMarca, 
        IdCategoria = @IdCategoria, 
        ImagenUrl = @ImagenUrl, 
        Precio = @Precio
    WHERE Id = @Id;
END
GO
/****** Object:  StoredProcedure [dbo].[motorolaSP]    Script Date: 30/9/2024 15:08:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[motorolaSP] 
AS
SELECT 
        A.Codigo, 
        A.Nombre, 
        A.Descripcion, 
        A.ImagenUrl, 
        M.Descripcion AS Marca, 
        C.Descripcion AS Categoria, 
        A.IdCategoria, 
        A.IdMarca, 
        A.Id, 
        A.Precio
    FROM 
        ARTICULOS A
    INNER JOIN 
        CATEGORIAS C ON C.Id = A.IdCategoria
    INNER JOIN 
        MARCAS M ON M.Id = A.IdMarca
    WHERE 
        M.Id = 5
GO
/****** Object:  StoredProcedure [dbo].[nuevoUser]    Script Date: 30/9/2024 15:08:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[nuevoUser]
@nombre varchar(50),
@apellido varchar(50),
@email varchar(100),
@pass varchar(20)
AS
insert into USERS (nombre, apellido, email, pass, admin) 
output inserted.Id values (@nombre, @apellido, @email, @pass, 0)
GO
/****** Object:  StoredProcedure [dbo].[samsungSP]    Script Date: 30/9/2024 15:08:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[samsungSP] 
AS
SELECT 
        A.Codigo, 
        A.Nombre, 
        A.Descripcion, 
        A.ImagenUrl, 
        M.Descripcion AS Marca, 
        C.Descripcion AS Categoria, 
        A.IdCategoria, 
        A.IdMarca, 
        A.Id, 
        A.Precio
    FROM 
        ARTICULOS A
    INNER JOIN 
        CATEGORIAS C ON C.Id = A.IdCategoria
    INNER JOIN 
        MARCAS M ON M.Id = A.IdMarca
    WHERE 
        M.Id = 1
GO
/****** Object:  StoredProcedure [dbo].[sonySP]    Script Date: 30/9/2024 15:08:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sonySP] 
AS
SELECT 
        A.Codigo, 
        A.Nombre, 
        A.Descripcion, 
        A.ImagenUrl, 
        M.Descripcion AS Marca, 
        C.Descripcion AS Categoria, 
        A.IdCategoria, 
        A.IdMarca, 
        A.Id, 
        A.Precio
    FROM 
        ARTICULOS A
    INNER JOIN 
        CATEGORIAS C ON C.Id = A.IdCategoria
    INNER JOIN 
        MARCAS M ON M.Id = A.IdMarca
    WHERE 
        M.Id = 3
GO
USE [master]
GO
ALTER DATABASE [CATALOGO_WEB_DB] SET  READ_WRITE 
GO
