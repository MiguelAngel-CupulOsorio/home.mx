USE [master]
GO
/****** Object:  Database [dbhomemx]    Script Date: 20/11/2021 02:37:36 p. m. ******/
CREATE DATABASE [dbhomemx]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dbhomemx', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\dbhomemx.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'dbhomemx_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\dbhomemx_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [dbhomemx] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dbhomemx].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dbhomemx] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dbhomemx] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dbhomemx] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dbhomemx] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dbhomemx] SET ARITHABORT OFF 
GO
ALTER DATABASE [dbhomemx] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [dbhomemx] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dbhomemx] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dbhomemx] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dbhomemx] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dbhomemx] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dbhomemx] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dbhomemx] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dbhomemx] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dbhomemx] SET  DISABLE_BROKER 
GO
ALTER DATABASE [dbhomemx] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dbhomemx] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dbhomemx] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dbhomemx] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dbhomemx] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dbhomemx] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dbhomemx] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dbhomemx] SET RECOVERY FULL 
GO
ALTER DATABASE [dbhomemx] SET  MULTI_USER 
GO
ALTER DATABASE [dbhomemx] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dbhomemx] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dbhomemx] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dbhomemx] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [dbhomemx] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [dbhomemx] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'dbhomemx', N'ON'
GO
ALTER DATABASE [dbhomemx] SET QUERY_STORE = OFF
GO
USE [dbhomemx]
GO
/****** Object:  Table [dbo].[direccion]    Script Date: 20/11/2021 02:37:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[direccion](
	[iddireccion] [int] IDENTITY(1,1) NOT NULL,
	[calle] [text] NOT NULL,
	[cruzamiento1] [text] NOT NULL,
	[cruzamiento2] [text] NULL,
	[noExterior] [varchar](20) NOT NULL,
	[localidad] [text] NOT NULL,
	[entidadFed] [text] NOT NULL,
	[cp] [int] NOT NULL,
	[ubicacion] [text] NOT NULL,
	[auxiliar] [text] NULL,
 CONSTRAINT [PK_direccion] PRIMARY KEY CLUSTERED 
(
	[iddireccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[mensaje]    Script Date: 20/11/2021 02:37:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mensaje](
	[idmensaje] [int] IDENTITY(1,1) NOT NULL,
	[mensaje] [text] NOT NULL,
	[idpropiedad] [int] NOT NULL,
	[idEmisor] [int] NULL,
	[idReceptor] [int] NULL,
	[fecha] [date] NULL,
	[status] [varchar](50) NULL,
	[auxiliar] [text] NULL,
 CONSTRAINT [PK_mensaje] PRIMARY KEY CLUSTERED 
(
	[idmensaje] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[propiedad]    Script Date: 20/11/2021 02:37:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[propiedad](
	[idpropiedad] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [text] NOT NULL,
	[numCuartos] [int] NOT NULL,
	[espacioPersonas] [int] NOT NULL,
	[precio] [int] NOT NULL,
	[deposito] [int] NOT NULL,
	[fechaAlta] [date] NULL,
	[status] [varchar](50) NULL,
	[contrato] [varchar](50) NULL,
	[image] [image] NULL,
	[image1] [image] NULL,
	[image2] [image] NULL,
	[iddireccion] [int] NOT NULL,
	[idservicios] [int] NOT NULL,
	[idusuario] [int] NOT NULL,
	[auxiliar] [text] NULL,
 CONSTRAINT [PK_propiedad] PRIMARY KEY CLUSTERED 
(
	[idpropiedad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[renta]    Script Date: 20/11/2021 02:37:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[renta](
	[idrenta] [int] IDENTITY(1,1) NOT NULL,
	[idusuario] [int] NULL,
	[idpropiedad] [int] NULL,
	[status] [varchar](30) NULL,
	[auxiliar] [text] NULL,
 CONSTRAINT [PK_renta] PRIMARY KEY CLUSTERED 
(
	[idrenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[servicios]    Script Date: 20/11/2021 02:37:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[servicios](
	[idservicios] [int] IDENTITY(1,1) NOT NULL,
	[internet] [bit] NULL,
	[comida] [bit] NULL,
	[limpieza] [bit] NULL,
	[amueblada] [bit] NULL,
	[parking] [bit] NULL,
	[alberca] [bit] NULL,
	[clima] [bit] NULL,
	[terraza] [bit] NULL,
	[lavanderia] [bit] NULL,
	[auxiliar] [text] NULL,
 CONSTRAINT [PK_servicios] PRIMARY KEY CLUSTERED 
(
	[idservicios] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuario]    Script Date: 20/11/2021 02:37:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuario](
	[idusuario] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](80) NOT NULL,
	[apellido] [varchar](80) NOT NULL,
	[correo] [varchar](100) NOT NULL,
	[contraseña] [varchar](16) NOT NULL,
	[telefono] [varchar](10) NOT NULL,
	[auxiliar] [text] NULL,
 CONSTRAINT [PK_usuario] PRIMARY KEY CLUSTERED 
(
	[idusuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [dbhomemx] SET  READ_WRITE 
GO
