USE [master]
GO
/****** Object:  Database [tambo]    Script Date: 10/11/2018 3:30:40 AM ******/
CREATE DATABASE [tambo]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'tambo', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\tambo.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'tambo_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\tambo_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [tambo] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [tambo].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [tambo] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [tambo] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [tambo] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [tambo] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [tambo] SET ARITHABORT OFF 
GO
ALTER DATABASE [tambo] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [tambo] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [tambo] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [tambo] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [tambo] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [tambo] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [tambo] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [tambo] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [tambo] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [tambo] SET  DISABLE_BROKER 
GO
ALTER DATABASE [tambo] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [tambo] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [tambo] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [tambo] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [tambo] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [tambo] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [tambo] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [tambo] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [tambo] SET  MULTI_USER 
GO
ALTER DATABASE [tambo] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [tambo] SET DB_CHAINING OFF 
GO
ALTER DATABASE [tambo] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [tambo] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [tambo] SET DELAYED_DURABILITY = DISABLED 
GO
USE [tambo]
GO
/****** Object:  Table [dbo].[Categorias]    Script Date: 10/11/2018 3:30:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Categorias](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Categorias] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Inventarios]    Script Date: 10/11/2018 3:30:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Inventarios](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Inventarios] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Marcas]    Script Date: 10/11/2018 3:30:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Marcas](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[descripcion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Marcas] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Producto_Inventario]    Script Date: 10/11/2018 3:30:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto_Inventario](
	[id_inventario] [int] NOT NULL,
	[id_producto] [int] NOT NULL,
	[stock] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Productos]    Script Date: 10/11/2018 3:30:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Productos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_marca] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[descripcion] [varchar](50) NOT NULL,
	[precio] [float] NOT NULL,
	[fecha_vencimiento] [date] NOT NULL,
	[codigo] [varchar](50) NOT NULL,
	[id_categoria] [int] NOT NULL,
 CONSTRAINT [PK_Productos] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tiendas]    Script Date: 10/11/2018 3:30:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tiendas](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[telefono] [varchar](50) NOT NULL,
	[direccion] [varchar](50) NOT NULL,
	[id_inventario] [int] NOT NULL,
 CONSTRAINT [PK_Tiendas] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Producto_Inventario]  WITH CHECK ADD  CONSTRAINT [FK_Producto_Inventario_Inventarios] FOREIGN KEY([id_inventario])
REFERENCES [dbo].[Inventarios] ([id])
GO
ALTER TABLE [dbo].[Producto_Inventario] CHECK CONSTRAINT [FK_Producto_Inventario_Inventarios]
GO
ALTER TABLE [dbo].[Producto_Inventario]  WITH CHECK ADD  CONSTRAINT [FK_Producto_Inventario_Productos] FOREIGN KEY([id_producto])
REFERENCES [dbo].[Productos] ([id])
GO
ALTER TABLE [dbo].[Producto_Inventario] CHECK CONSTRAINT [FK_Producto_Inventario_Productos]
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD  CONSTRAINT [FK_Productos_Categorias] FOREIGN KEY([id_categoria])
REFERENCES [dbo].[Categorias] ([id])
GO
ALTER TABLE [dbo].[Productos] CHECK CONSTRAINT [FK_Productos_Categorias]
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD  CONSTRAINT [FK_Productos_Marcas] FOREIGN KEY([id_marca])
REFERENCES [dbo].[Marcas] ([id])
GO
ALTER TABLE [dbo].[Productos] CHECK CONSTRAINT [FK_Productos_Marcas]
GO
ALTER TABLE [dbo].[Tiendas]  WITH CHECK ADD  CONSTRAINT [FK_Tiendas_Inventarios] FOREIGN KEY([id_inventario])
REFERENCES [dbo].[Inventarios] ([id])
GO
ALTER TABLE [dbo].[Tiendas] CHECK CONSTRAINT [FK_Tiendas_Inventarios]
GO
/****** Object:  StoredProcedure [dbo].[SP_ELIMINARCATEGORIA]    Script Date: 10/11/2018 3:30:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_ELIMINARCATEGORIA]
	(@COD int
)
AS
BEGIN
	SET NOCOUNT ON;

  
	DELETE Categorias WHERE id=@COD
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ELIMINARMARCA]    Script Date: 10/11/2018 3:30:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_ELIMINARMARCA]
	(@COD int
)
AS
BEGIN
	SET NOCOUNT ON;

  
	DELETE Marcas WHERE id=@COD
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ELIMINARPRODUCTO]    Script Date: 10/11/2018 3:30:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_ELIMINARPRODUCTO]
	(@COD int
)
AS
BEGIN
	SET NOCOUNT ON;

  
	DELETE Productos WHERE id=@COD
END
GO
/****** Object:  StoredProcedure [dbo].[SP_LISTAR_CATEGORIAS]    Script Date: 10/11/2018 3:30:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_LISTAR_CATEGORIAS]
AS
BEGIN
	SELECT * FROM Categorias
END


GO
/****** Object:  StoredProcedure [dbo].[SP_LISTAR_DETALLE_INVENTARIO]    Script Date: 10/11/2018 3:30:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_LISTAR_DETALLE_INVENTARIO](
	@IDINVENTARIO as int
)
AS
BEGIN
	SELECT * from Producto_Inventario where id_inventario = @IDINVENTARIO
END


GO
/****** Object:  StoredProcedure [dbo].[SP_LISTAR_INVENTARIO_DIRECCION]    Script Date: 10/11/2018 3:30:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_LISTAR_INVENTARIO_DIRECCION](
	@DIRECCION as varchar(50)
)
AS
BEGIN
	SELECT * FROM Inventarios where descripcion = @DIRECCION
END

GO
/****** Object:  StoredProcedure [dbo].[SP_LISTAR_INVENTARIOS]    Script Date: 10/11/2018 3:30:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_LISTAR_INVENTARIOS]
AS
BEGIN
	SELECT * FROM Inventarios
END


GO
/****** Object:  StoredProcedure [dbo].[SP_LISTAR_MARCAS]    Script Date: 10/11/2018 3:30:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_LISTAR_MARCAS]
AS
BEGIN
	SELECT * FROM Marcas
END


GO
/****** Object:  StoredProcedure [dbo].[SP_LISTAR_PRODUCTO_INVENTARIO]    Script Date: 10/11/2018 3:30:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_LISTAR_PRODUCTO_INVENTARIO]
AS
BEGIN
	SELECT * FROM Producto_Inventario
END


GO
/****** Object:  StoredProcedure [dbo].[SP_LISTAR_PRODUCTOS]    Script Date: 10/11/2018 3:30:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_LISTAR_PRODUCTOS]
AS
BEGIN
	SELECT * FROM Productos
END


GO
/****** Object:  StoredProcedure [dbo].[SP_LISTAR_PRODUCTOS_CATEGORIA]    Script Date: 10/11/2018 3:30:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_LISTAR_PRODUCTOS_CATEGORIA](
	@ID_CATEGORIA AS INT
)
AS
BEGIN
	SELECT * FROM Productos WHERE id_categoria = @ID_CATEGORIA
END


GO
/****** Object:  StoredProcedure [dbo].[SP_LISTAR_PRODUCTOS_MARCA]    Script Date: 10/11/2018 3:30:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_LISTAR_PRODUCTOS_MARCA](
	@ID_MARCA AS INT
)
AS
BEGIN
	SELECT * FROM Productos WHERE id_marca = @ID_MARCA
END


GO
/****** Object:  StoredProcedure [dbo].[SP_LISTAR_TIENDA_PRODUCTO]    Script Date: 10/11/2018 3:30:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_LISTAR_TIENDA_PRODUCTO](
	@ID_PRODUCTO AS INT
)
AS
BEGIN
	SELECT * FROM Tiendas WHERE id_inventario = (SELECT id_inventario FROM Producto_Inventario WHERE id_producto = @ID_PRODUCTO)
	GROUP BY id, nombre, telefono, direccion, id_inventario
END


GO
/****** Object:  StoredProcedure [dbo].[SP_LISTAR_TIENDAS]    Script Date: 10/11/2018 3:30:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_LISTAR_TIENDAS]
AS
BEGIN
	SELECT * FROM Tiendas
END


GO
/****** Object:  StoredProcedure [dbo].[SP_REGISTRAR_CATEGORIA]    Script Date: 10/11/2018 3:30:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_REGISTRAR_CATEGORIA](@NOMBRE AS VARCHAR(50))
AS
BEGIN
	INSERT INTO Categorias VALUES(@NOMBRE)
END


GO
/****** Object:  StoredProcedure [dbo].[SP_REGISTRAR_INVENTARIO]    Script Date: 10/11/2018 3:30:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_REGISTRAR_INVENTARIO](@DESCRIPCION AS VARCHAR(50))
AS
BEGIN
	INSERT INTO Inventarios VALUES (@DESCRIPCION)
END


GO
/****** Object:  StoredProcedure [dbo].[SP_REGISTRAR_MARCA]    Script Date: 10/11/2018 3:30:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_REGISTRAR_MARCA](@NOMBRE AS VARCHAR(50), @DESCRIPCION AS VARCHAR(50))
AS
BEGIN
	INSERT INTO Marcas VALUES (@NOMBRE, @DESCRIPCION)
END


GO
/****** Object:  StoredProcedure [dbo].[SP_REGISTRAR_PRODUCTO]    Script Date: 10/11/2018 3:30:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_REGISTRAR_PRODUCTO](@ID_MARCA AS INT, @NOMBRE AS VARCHAR(50), @DESCRIPCION AS VARCHAR(50), @PRECIO AS FLOAT, @FECHA_VENCIMIENTO AS DATE, @CODIGO AS VARCHAR(50), @ID_CATEGORIA AS INT)
AS
BEGIN
	INSERT INTO Productos VALUES (@ID_MARCA, @NOMBRE, @DESCRIPCION, @PRECIO, @FECHA_VENCIMIENTO, @CODIGO, @ID_CATEGORIA)
END


GO
/****** Object:  StoredProcedure [dbo].[SP_REGISTRAR_PRODUCTO_INVENTARIO]    Script Date: 10/11/2018 3:30:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_REGISTRAR_PRODUCTO_INVENTARIO](@ID_INVENTARIO AS INT, @ID_PRODUCTO AS INT, @STOCK AS INT)
AS
BEGIN
	INSERT INTO Producto_Inventario VALUES (@ID_INVENTARIO, @ID_PRODUCTO, @STOCK)
END


GO
/****** Object:  StoredProcedure [dbo].[SP_REGISTRAR_TIENDA]    Script Date: 10/11/2018 3:30:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_REGISTRAR_TIENDA](@NOMBRE AS VARCHAR(50), @TELEFONO AS VARCHAR(50), @DIRECCION AS VARCHAR(50), @ID_INVENTARIO AS INT)
AS
BEGIN
	INSERT INTO Tiendas VALUES (@NOMBRE, @TELEFONO, @DIRECCION, @ID_INVENTARIO)
END


GO
USE [master]
GO
ALTER DATABASE [tambo] SET  READ_WRITE 
GO
