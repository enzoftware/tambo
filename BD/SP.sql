USE [tambo]
GO
/****** Object:  StoredProcedure [dbo].[SP_ELIMINARCATEGORIA]    Script Date: 11/19/2018 1:20:00 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_ELIMINARMARCA]    Script Date: 11/19/2018 1:20:00 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_ELIMINARPRODUCTO]    Script Date: 11/19/2018 1:20:00 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_LISTAR_CATEGORIAS]    Script Date: 11/19/2018 1:20:00 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_LISTAR_DETALLE_INVENTARIO]    Script Date: 11/19/2018 1:20:00 PM ******/
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
	@IDTIENDA as int
)
AS
BEGIN
	SELECT * from Inventario where id_tienda = @IDTIENDA
END



GO
/****** Object:  StoredProcedure [dbo].[SP_LISTAR_INVENTARIO_DIRECCION]    Script Date: 11/19/2018 1:20:00 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_LISTAR_INVENTARIOS]    Script Date: 11/19/2018 1:20:00 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_LISTAR_MARCAS]    Script Date: 11/19/2018 1:20:00 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_LISTAR_PRODUCTO_INVENTARIO]    Script Date: 11/19/2018 1:20:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_LISTAR_PRODUCTO_INVENTARIO]
AS
BEGIN
	SELECT * FROM Inventario
END
GO
/****** Object:  StoredProcedure [dbo].[SP_LISTAR_PRODUCTOS]    Script Date: 11/19/2018 1:20:00 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_LISTAR_PRODUCTOS_CATEGORIA]    Script Date: 11/19/2018 1:20:00 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_LISTAR_PRODUCTOS_MARCA]    Script Date: 11/19/2018 1:20:00 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_LISTAR_TIENDA_PRODUCTO]    Script Date: 11/19/2018 1:20:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_LISTAR_TIENDA_PRODUCTO](
	@ID_PRODUCTO AS INT
)
AS
BEGIN
	SELECT * FROM Tiendas WHERE id = (SELECT id_tienda FROM Inventario WHERE id_producto = @ID_PRODUCTO)
	GROUP BY id, nombre, telefono, direccion
END
GO
/****** Object:  StoredProcedure [dbo].[SP_LISTAR_TIENDAS]    Script Date: 11/19/2018 1:20:00 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_REGISTRAR_CATEGORIA]    Script Date: 11/19/2018 1:20:00 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_REGISTRAR_MARCA]    Script Date: 11/19/2018 1:20:00 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SP_REGISTRAR_PRODUCTO]    Script Date: 11/19/2018 1:20:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_REGISTRAR_PRODUCTO](@ID_MARCA AS INT, @NOMBRE AS VARCHAR(50), @DESCRIPCION AS VARCHAR(50), @PRECIO AS FLOAT, @FECHA_VENCIMIENTO AS DATE, @CODIGO AS VARCHAR(50), @ID_CATEGORIA AS INT, @URL as nvarchar(max))
AS
BEGIN
	INSERT INTO Productos VALUES (@ID_MARCA, @NOMBRE, @DESCRIPCION, @PRECIO, @FECHA_VENCIMIENTO, @CODIGO, @ID_CATEGORIA, @URL)
END



GO
/****** Object:  StoredProcedure [dbo].[SP_REGISTRAR_PRODUCTO_INVENTARIO]    Script Date: 11/19/2018 1:20:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_REGISTRAR_PRODUCTO_INVENTARIO](@ID_TIENDA AS INT, @ID_PRODUCTO AS INT, @STOCK AS INT)
AS
BEGIN
	INSERT INTO Inventario VALUES (@ID_TIENDA, @ID_PRODUCTO, @STOCK)
END
GO
/****** Object:  StoredProcedure [dbo].[SP_REGISTRAR_TIENDA]    Script Date: 11/19/2018 1:20:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_REGISTRAR_TIENDA](@NOMBRE AS VARCHAR(50), @TELEFONO AS VARCHAR(50), @DIRECCION AS VARCHAR(50), @URL as nvarchar(max))
AS
BEGIN
	INSERT INTO Tiendas VALUES (@NOMBRE, @TELEFONO, @DIRECCION, @URL)
END


GO
