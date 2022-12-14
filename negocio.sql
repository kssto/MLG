USE [master]
GO
/****** Object:  Database [negocio]    Script Date: 09/12/2022 6:04:06 ******/
CREATE DATABASE [negocio]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'negocio', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\negocio.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'negocio_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\negocio_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [negocio] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [negocio].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [negocio] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [negocio] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [negocio] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [negocio] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [negocio] SET ARITHABORT OFF 
GO
ALTER DATABASE [negocio] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [negocio] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [negocio] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [negocio] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [negocio] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [negocio] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [negocio] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [negocio] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [negocio] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [negocio] SET  DISABLE_BROKER 
GO
ALTER DATABASE [negocio] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [negocio] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [negocio] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [negocio] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [negocio] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [negocio] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [negocio] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [negocio] SET RECOVERY FULL 
GO
ALTER DATABASE [negocio] SET  MULTI_USER 
GO
ALTER DATABASE [negocio] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [negocio] SET DB_CHAINING OFF 
GO
ALTER DATABASE [negocio] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [negocio] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [negocio] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [negocio] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'negocio', N'ON'
GO
ALTER DATABASE [negocio] SET QUERY_STORE = OFF
GO
USE [negocio]
GO
/****** Object:  Table [dbo].[Articulo]    Script Date: 09/12/2022 6:04:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Articulo](
	[ID_Articulo] [int] IDENTITY(1,1) NOT NULL,
	[codigo] [varchar](50) NOT NULL,
	[descripcion] [varchar](max) NOT NULL,
	[precio] [decimal](18, 0) NOT NULL,
	[stock] [int] NULL,
 CONSTRAINT [PK_Articulo] PRIMARY KEY CLUSTERED 
(
	[ID_Articulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Articulo_Tienda]    Script Date: 09/12/2022 6:04:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Articulo_Tienda](
	[ID_Articulo] [int] NOT NULL,
	[ID_Sucursal] [int] NOT NULL,
	[fecha] [datetime] NOT NULL,
	[ID_Articulo_Tienda] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Articulo_Tienda] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 09/12/2022 6:04:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[ID_Cliente] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[aP] [varchar](150) NOT NULL,
	[aM] [varchar](150) NOT NULL,
	[direccion] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[ID_Cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cliente_Articulo]    Script Date: 09/12/2022 6:04:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente_Articulo](
	[ID_Cliente] [int] NOT NULL,
	[ID_Articulo] [int] NOT NULL,
	[fecha] [datetime] NOT NULL,
	[ID_Cliente_Articulo] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Cliente_Articulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tienda]    Script Date: 09/12/2022 6:04:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tienda](
	[ID_Sucursal] [int] IDENTITY(1,1) NOT NULL,
	[sucursal] [varchar](150) NOT NULL,
	[direccion] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Tienda] PRIMARY KEY CLUSTERED 
(
	[ID_Sucursal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 09/12/2022 6:04:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[ID_Cliente] [int] NOT NULL,
	[usuario] [varchar](50) NOT NULL,
	[pass] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Articulo_Tienda]  WITH CHECK ADD  CONSTRAINT [FK_Articulo_Tienda_Articulo] FOREIGN KEY([ID_Articulo])
REFERENCES [dbo].[Articulo] ([ID_Articulo])
GO
ALTER TABLE [dbo].[Articulo_Tienda] CHECK CONSTRAINT [FK_Articulo_Tienda_Articulo]
GO
ALTER TABLE [dbo].[Articulo_Tienda]  WITH CHECK ADD  CONSTRAINT [FK_Articulo_Tienda_Tienda] FOREIGN KEY([ID_Sucursal])
REFERENCES [dbo].[Tienda] ([ID_Sucursal])
GO
ALTER TABLE [dbo].[Articulo_Tienda] CHECK CONSTRAINT [FK_Articulo_Tienda_Tienda]
GO
ALTER TABLE [dbo].[Cliente_Articulo]  WITH CHECK ADD  CONSTRAINT [FK_Cliente_Articulo_Articulo] FOREIGN KEY([ID_Articulo])
REFERENCES [dbo].[Articulo] ([ID_Articulo])
GO
ALTER TABLE [dbo].[Cliente_Articulo] CHECK CONSTRAINT [FK_Cliente_Articulo_Articulo]
GO
ALTER TABLE [dbo].[Cliente_Articulo]  WITH CHECK ADD  CONSTRAINT [FK_Cliente_Articulo_Cliente] FOREIGN KEY([ID_Cliente])
REFERENCES [dbo].[Cliente] ([ID_Cliente])
GO
ALTER TABLE [dbo].[Cliente_Articulo] CHECK CONSTRAINT [FK_Cliente_Articulo_Cliente]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Cliente] FOREIGN KEY([ID_Cliente])
REFERENCES [dbo].[Cliente] ([ID_Cliente])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_Cliente]
GO
/****** Object:  StoredProcedure [dbo].[Actualizar_Articulo]    Script Date: 09/12/2022 6:04:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[Actualizar_Articulo]
	@ID_Articulo int,
	@codigo varchar(50),
	@descripcion varchar(MAX),
	@precio decimal(10,2),
	@stock int
as
	begin
		update Articulo set codigo = @codigo,
						    descripcion = @descripcion,
							precio = @precio,
							stock =  @stock
						   where ID_Articulo = @ID_Articulo
	end 
GO
/****** Object:  StoredProcedure [dbo].[Actualizar_Cliente]    Script Date: 09/12/2022 6:04:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Actualizar_Cliente] 
	@ID_Cliente int,
	@nombre varchar(100),
	@aP varchar(150),
	@aM varchar(150),
	@direccion varchar(MAX)
as
	begin
		update Cliente set nombre = @nombre,
						   aP = @aP,
						   aM = @aM,
						   direccion = @direccion
						   where ID_Cliente = @ID_Cliente
	end 
GO
/****** Object:  StoredProcedure [dbo].[Actualizar_Cliente_Articulo]    Script Date: 09/12/2022 6:04:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[Actualizar_Cliente_Articulo]
	@ID_Cliente int,
	@ID_Articulo int,
	@fecha datetime,
	@ID_Cliente_Articulo int
as
	begin
		update Cliente_Articulo set ID_Cliente =@ID_Cliente, 
									ID_Articulo=@ID_Articulo,
									fecha =@fecha
						   where ID_Cliente_Articulo = @ID_Cliente_Articulo 
	end 
GO
/****** Object:  StoredProcedure [dbo].[Actualizar_Tienda]    Script Date: 09/12/2022 6:04:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[Actualizar_Tienda]
	@ID_Sucursal int,
	@sucursal varchar(150),
	@direccion varchar(MAX)
as
	begin
		update Tienda set sucursal=@sucursal,
						  direccion = @direccion
						   where ID_Sucursal = @ID_Sucursal
	end 
GO
/****** Object:  StoredProcedure [dbo].[Actualizar_Tienda_Articulo]    Script Date: 09/12/2022 6:04:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[Actualizar_Tienda_Articulo]
	@ID_Articulo int,
	@ID_Sucursal int,
	@fecha datetime,
	@ID_Articulo_Tienda int
as
	begin
		update Articulo_Tienda set ID_Articulo=@ID_Articulo,
									ID_Sucursal=@ID_Sucursal,
									fecha =@fecha
						   where ID_Articulo_Tienda = @ID_Articulo_Tienda 
	end 
GO
/****** Object:  StoredProcedure [dbo].[Articulos_Comprados]    Script Date: 09/12/2022 6:04:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Articulos_Comprados]
as
begin
	select ca.ID_Cliente_Articulo,ca.ID_Cliente,c.nombre,c.aP,c.aM,c.direccion,ca.ID_Articulo,a.codigo,a.descripcion,a.precio, ca.fecha
	from Cliente_Articulo ca 
	inner join Cliente c on ca.ID_Cliente = c.ID_Cliente
	inner join Articulo a on ca.ID_Articulo=a.ID_Articulo
end 
GO
/****** Object:  StoredProcedure [dbo].[Comprar_Articulo]    Script Date: 09/12/2022 6:04:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Comprar_Articulo]
@ID_Cliente int,
@ID_Articulo int
as
begin
	insert into Cliente_Articulo (ID_Cliente,ID_Articulo,fecha) values (@ID_Cliente,@ID_Articulo,GETDATE())
end
GO
/****** Object:  StoredProcedure [dbo].[Eliminar_Articulo]    Script Date: 09/12/2022 6:04:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[Eliminar_Articulo]
	@ID_Articulo int
as
	begin
		Delete from Articulo where ID_Articulo = @ID_Articulo
	end 
GO
/****** Object:  StoredProcedure [dbo].[Eliminar_Cliente]    Script Date: 09/12/2022 6:04:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Eliminar_Cliente] 
	@ID_Cliente int
as
	begin
		Delete from Cliente where ID_Cliente = @ID_Cliente
	end 
GO
/****** Object:  StoredProcedure [dbo].[Eliminar_Cliente_Articulo]    Script Date: 09/12/2022 6:04:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[Eliminar_Cliente_Articulo]
	@ID_Cliente_Articulo int
as
	begin
		Delete from Cliente_Articulo where ID_Cliente_Articulo = @ID_Cliente_Articulo
	end 
GO
/****** Object:  StoredProcedure [dbo].[Eliminar_Tienda]    Script Date: 09/12/2022 6:04:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[Eliminar_Tienda]
	@ID_Sucursal int
as
	begin
		Delete from Tienda where ID_Sucursal = @ID_Sucursal
	end 
GO
/****** Object:  StoredProcedure [dbo].[Eliminar_Tienda_Articulo]    Script Date: 09/12/2022 6:04:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[Eliminar_Tienda_Articulo]
	@ID_Articulo_Tienda int
as
	begin
		Delete from Articulo_Tienda where ID_Articulo_Tienda = @ID_Articulo_Tienda
	end 
GO
/****** Object:  StoredProcedure [dbo].[Insertar_Articulo]    Script Date: 09/12/2022 6:04:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Insertar_Articulo] 
	@codigo varchar(50),
	@descripcion varchar(MAX),
	@precio decimal(10,2),
	@stock int

as
	begin
		insert into Articulo(codigo,descripcion,precio,stock) 
		values (@codigo,@descripcion,@precio,@stock)
	end 
GO
/****** Object:  StoredProcedure [dbo].[Insertar_Cliente]    Script Date: 09/12/2022 6:04:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Insertar_Cliente] 
	@nombre varchar(100),
	@aP varchar(150),
	@aM varchar(150),
	@direccion varchar(MAX)
as
	begin
		insert into Cliente (nombre,aP,aM,direccion) 
		values (@nombre,@aP,@aM,@direccion)
	end 
GO
/****** Object:  StoredProcedure [dbo].[Insertar_Cliente_Articulo]    Script Date: 09/12/2022 6:04:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Insertar_Cliente_Articulo]
	@ID_Cliente int,
	@ID_Articulo int,
	@fecha datetime
as
	begin
		insert into Cliente_Articulo(ID_Cliente,ID_Articulo,fecha) 
		values (@ID_Cliente,@ID_Articulo,@fecha)
	end 
GO
/****** Object:  StoredProcedure [dbo].[Insertar_Tienda]    Script Date: 09/12/2022 6:04:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Insertar_Tienda]
	@sucursal varchar(150),
	@direccion varchar(MAX)
as
	begin
		insert into Tienda(sucursal,direccion) 
		values (@sucursal,@direccion)
	end 
GO
/****** Object:  StoredProcedure [dbo].[Insertar_Tienda_Articulo]    Script Date: 09/12/2022 6:04:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Insertar_Tienda_Articulo]
	@ID_Articulo int,
	@ID_Sucursal int,
	@fecha datetime
as
	begin
		insert into Articulo_Tienda(ID_Articulo,ID_Sucursal,fecha) 
		values (@ID_Articulo,@ID_Sucursal,@fecha)
	end 
GO
/****** Object:  StoredProcedure [dbo].[Mostrar_Articulo]    Script Date: 09/12/2022 6:04:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[Mostrar_Articulo]
as
	begin
		select * from Articulo
	end 
GO
/****** Object:  StoredProcedure [dbo].[Mostrar_Cliente]    Script Date: 09/12/2022 6:04:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Mostrar_Cliente] 
	
as
	begin
		select * from Cliente
	end 
GO
/****** Object:  StoredProcedure [dbo].[Mostrar_Cliente_Articulo]    Script Date: 09/12/2022 6:04:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[Mostrar_Cliente_Articulo]
as
	begin
		select * from Cliente_Articulo
	end 
GO
/****** Object:  StoredProcedure [dbo].[Mostrar_Compra]    Script Date: 09/12/2022 6:04:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[Mostrar_Compra]
as
begin
select * from Cliente_Articulo
end
GO
/****** Object:  StoredProcedure [dbo].[Mostrar_Tienda]    Script Date: 09/12/2022 6:04:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[Mostrar_Tienda]
as
	begin
		select * from Tienda
	end 
GO
/****** Object:  StoredProcedure [dbo].[Mostrar_Tienda_Articulo]    Script Date: 09/12/2022 6:04:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[Mostrar_Tienda_Articulo]
as
	begin
		select * from Articulo_Tienda
	end 
GO
USE [master]
GO
ALTER DATABASE [negocio] SET  READ_WRITE 
GO
