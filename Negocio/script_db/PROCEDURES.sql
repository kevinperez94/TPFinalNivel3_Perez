USE [CATALOGO_WEB_DB]
GO
/****** Object:  StoredProcedure [dbo].[agregarFavoritoSP]    Script Date: 30/9/2024 15:23:33 ******/
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
/****** Object:  StoredProcedure [dbo].[agregarSP]    Script Date: 30/9/2024 15:23:33 ******/
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
/****** Object:  StoredProcedure [dbo].[appleSP]    Script Date: 30/9/2024 15:23:33 ******/
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
/****** Object:  StoredProcedure [dbo].[eliminarFavoritoSP]    Script Date: 30/9/2024 15:23:33 ******/
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
/****** Object:  StoredProcedure [dbo].[eliminarSP]    Script Date: 30/9/2024 15:23:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[eliminarSP]
@Id int
AS
DELETE FROM ARTICULOS WHERE Id = @Id
GO
/****** Object:  StoredProcedure [dbo].[huaweiSP]    Script Date: 30/9/2024 15:23:33 ******/
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
/****** Object:  StoredProcedure [dbo].[listaFavoritoSP]    Script Date: 30/9/2024 15:23:33 ******/
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
/****** Object:  StoredProcedure [dbo].[listarAudioSP]    Script Date: 30/9/2024 15:23:33 ******/
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
/****** Object:  StoredProcedure [dbo].[listarCelularesSP]    Script Date: 30/9/2024 15:23:33 ******/
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
/****** Object:  StoredProcedure [dbo].[listarMediaSP]    Script Date: 30/9/2024 15:23:33 ******/
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
/****** Object:  StoredProcedure [dbo].[listarSP]    Script Date: 30/9/2024 15:23:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[listarSP] as select Codigo, Nombre, A.Descripcion, ImagenUrl, M.Descripcion as Marca, C.Descripcion as Categoria, A.IdCategoria, A.IdMarca, A.Id, Precio from ARTICULOS A, CATEGORIAS C, MARCAS M where C.Id = A.IdCategoria and M.Id = A.IdMarca
GO
/****** Object:  StoredProcedure [dbo].[listarTelevisoresSP]    Script Date: 30/9/2024 15:23:33 ******/
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
/****** Object:  StoredProcedure [dbo].[modificarSP]    Script Date: 30/9/2024 15:23:33 ******/
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
/****** Object:  StoredProcedure [dbo].[motorolaSP]    Script Date: 30/9/2024 15:23:33 ******/
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
/****** Object:  StoredProcedure [dbo].[nuevoUser]    Script Date: 30/9/2024 15:23:33 ******/
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
/****** Object:  StoredProcedure [dbo].[samsungSP]    Script Date: 30/9/2024 15:23:33 ******/
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
/****** Object:  StoredProcedure [dbo].[sonySP]    Script Date: 30/9/2024 15:23:33 ******/
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
