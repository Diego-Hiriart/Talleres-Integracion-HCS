USE [master]
GO
/****** Object:  Database [EUREKABANK]    Script Date: 20/6/2023 23:56:05 ******/
CREATE DATABASE [EUREKABANK]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EUREKABANK', FILENAME = N'C:\SQLData\Data\EUREKABANK.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'EUREKABANK_log', FILENAME = N'C:\SQLData\Data\EUREKABANK_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [EUREKABANK] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EUREKABANK].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EUREKABANK] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EUREKABANK] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EUREKABANK] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EUREKABANK] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EUREKABANK] SET ARITHABORT OFF 
GO
ALTER DATABASE [EUREKABANK] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [EUREKABANK] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EUREKABANK] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EUREKABANK] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EUREKABANK] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EUREKABANK] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EUREKABANK] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EUREKABANK] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EUREKABANK] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EUREKABANK] SET  ENABLE_BROKER 
GO
ALTER DATABASE [EUREKABANK] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EUREKABANK] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EUREKABANK] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EUREKABANK] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EUREKABANK] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EUREKABANK] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EUREKABANK] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EUREKABANK] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [EUREKABANK] SET  MULTI_USER 
GO
ALTER DATABASE [EUREKABANK] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EUREKABANK] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EUREKABANK] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EUREKABANK] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [EUREKABANK] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [EUREKABANK] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [EUREKABANK] SET QUERY_STORE = ON
GO
ALTER DATABASE [EUREKABANK] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [EUREKABANK]
GO
/****** Object:  Table [dbo].[Asignado]    Script Date: 20/6/2023 23:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Asignado](
	[chr_asigcodigo] [char](6) NOT NULL,
	[chr_sucucodigo] [char](3) NOT NULL,
	[chr_emplcodigo] [char](4) NOT NULL,
	[dtt_asigfechaalta] [datetime] NOT NULL,
	[dtt_asigfechabaja] [datetime] NULL,
 CONSTRAINT [PK_Asignado] PRIMARY KEY CLUSTERED 
(
	[chr_asigcodigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CargoMantenimiento]    Script Date: 20/6/2023 23:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CargoMantenimiento](
	[chr_monecodigo] [char](2) NOT NULL,
	[dec_cargMontoMaximo] [money] NOT NULL,
	[dec_cargImporte] [money] NOT NULL,
 CONSTRAINT [PK_CargoMantenimiento] PRIMARY KEY CLUSTERED 
(
	[chr_monecodigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 20/6/2023 23:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[chr_cliecodigo] [char](5) NOT NULL,
	[vch_cliepaterno] [varchar](25) NOT NULL,
	[vch_cliematerno] [varchar](25) NOT NULL,
	[vch_clienombre] [varchar](30) NOT NULL,
	[chr_cliedni] [char](8) NOT NULL,
	[vch_clieciudad] [varchar](30) NOT NULL,
	[vch_cliedireccion] [varchar](50) NOT NULL,
	[vch_clietelefono] [varchar](20) NULL,
	[vch_clieemail] [varchar](50) NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[chr_cliecodigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contador]    Script Date: 20/6/2023 23:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contador](
	[vch_conttabla] [varchar](30) NOT NULL,
	[int_contitem] [int] NOT NULL,
	[int_contlongitud] [int] NOT NULL,
 CONSTRAINT [PK_Contador] PRIMARY KEY CLUSTERED 
(
	[vch_conttabla] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CostoMovimiento]    Script Date: 20/6/2023 23:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CostoMovimiento](
	[chr_monecodigo] [char](2) NOT NULL,
	[dec_costimporte] [money] NOT NULL,
 CONSTRAINT [PK_CostoMovimiento] PRIMARY KEY CLUSTERED 
(
	[chr_monecodigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cuenta]    Script Date: 20/6/2023 23:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cuenta](
	[chr_cuencodigo] [char](8) NOT NULL,
	[chr_monecodigo] [char](2) NOT NULL,
	[chr_sucucodigo] [char](3) NOT NULL,
	[chr_emplcreacuenta] [char](4) NOT NULL,
	[chr_cliecodigo] [char](5) NOT NULL,
	[dec_cuensaldo] [money] NOT NULL,
	[dtt_cuenfechacreacion] [datetime] NOT NULL,
	[vch_cuenestado] [varchar](15) NOT NULL,
	[int_cuencontmov] [int] NOT NULL,
	[chr_cuenclave] [char](6) NOT NULL,
 CONSTRAINT [PK_Cuenta] PRIMARY KEY CLUSTERED 
(
	[chr_cuencodigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleado]    Script Date: 20/6/2023 23:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleado](
	[chr_emplcodigo] [char](4) NOT NULL,
	[vch_emplpaterno] [varchar](25) NOT NULL,
	[vch_emplmaterno] [varchar](25) NOT NULL,
	[vch_emplnombre] [varchar](30) NOT NULL,
	[vch_emplciudad] [varchar](30) NOT NULL,
	[vch_empldireccion] [varchar](50) NULL,
	[vch_emplusuario] [varchar](15) NOT NULL,
	[vch_emplclave] [varchar](15) NOT NULL,
 CONSTRAINT [PK_Empleado] PRIMARY KEY CLUSTERED 
(
	[chr_emplcodigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [U_Empleado_vch_emplusuario] UNIQUE NONCLUSTERED 
(
	[vch_emplusuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InteresMensual]    Script Date: 20/6/2023 23:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InteresMensual](
	[chr_monecodigo] [char](2) NOT NULL,
	[dec_inteimporte] [decimal](12, 2) NOT NULL,
 CONSTRAINT [PK_InteresMensual] PRIMARY KEY CLUSTERED 
(
	[chr_monecodigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Moneda]    Script Date: 20/6/2023 23:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Moneda](
	[chr_monecodigo] [char](2) NOT NULL,
	[vch_monedescripcion] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Moneda] PRIMARY KEY CLUSTERED 
(
	[chr_monecodigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Movimiento]    Script Date: 20/6/2023 23:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movimiento](
	[chr_cuencodigo] [char](8) NOT NULL,
	[int_movinumero] [int] NOT NULL,
	[dtt_movifecha] [datetime] NOT NULL,
	[chr_emplcodigo] [char](4) NOT NULL,
	[chr_tipocodigo] [char](3) NOT NULL,
	[dec_moviimporte] [money] NOT NULL,
	[chr_cuenreferencia] [char](8) NULL,
 CONSTRAINT [PK_Movimiento] PRIMARY KEY CLUSTERED 
(
	[chr_cuencodigo] ASC,
	[int_movinumero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Parametro]    Script Date: 20/6/2023 23:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Parametro](
	[chr_paracodigo] [char](3) NOT NULL,
	[vch_paradescripcion] [varchar](50) NOT NULL,
	[vch_paravalor] [varchar](70) NOT NULL,
	[vch_paraestado] [varchar](15) NOT NULL,
 CONSTRAINT [PK_Parametro] PRIMARY KEY CLUSTERED 
(
	[chr_paracodigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sucursal]    Script Date: 20/6/2023 23:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sucursal](
	[chr_sucucodigo] [char](3) NOT NULL,
	[vch_sucunombre] [varchar](50) NOT NULL,
	[vch_sucuciudad] [varchar](30) NOT NULL,
	[vch_sucudireccion] [varchar](50) NULL,
	[int_sucucontcuenta] [int] NOT NULL,
 CONSTRAINT [PK_Sucursal] PRIMARY KEY CLUSTERED 
(
	[chr_sucucodigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoMovimiento]    Script Date: 20/6/2023 23:56:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoMovimiento](
	[chr_tipocodigo] [char](3) NOT NULL,
	[vch_tipodescripcion] [varchar](40) NOT NULL,
	[vch_tipoaccion] [varchar](10) NOT NULL,
	[vch_tipoestado] [varchar](15) NOT NULL,
 CONSTRAINT [PK_TipoMovimiento] PRIMARY KEY CLUSTERED 
(
	[chr_tipocodigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cuenta] ADD  DEFAULT ('ACTIVO') FOR [vch_cuenestado]
GO
ALTER TABLE [dbo].[Parametro] ADD  DEFAULT ('ACTIVO') FOR [vch_paraestado]
GO
ALTER TABLE [dbo].[TipoMovimiento] ADD  DEFAULT ('ACTIVO') FOR [vch_tipoestado]
GO
ALTER TABLE [dbo].[Asignado]  WITH CHECK ADD  CONSTRAINT [fk_asignado_empleado] FOREIGN KEY([chr_emplcodigo])
REFERENCES [dbo].[Empleado] ([chr_emplcodigo])
GO
ALTER TABLE [dbo].[Asignado] CHECK CONSTRAINT [fk_asignado_empleado]
GO
ALTER TABLE [dbo].[Asignado]  WITH CHECK ADD  CONSTRAINT [fk_asignado_sucursal] FOREIGN KEY([chr_sucucodigo])
REFERENCES [dbo].[Sucursal] ([chr_sucucodigo])
GO
ALTER TABLE [dbo].[Asignado] CHECK CONSTRAINT [fk_asignado_sucursal]
GO
ALTER TABLE [dbo].[CargoMantenimiento]  WITH CHECK ADD  CONSTRAINT [fk_cargomantenimiento_moneda] FOREIGN KEY([chr_monecodigo])
REFERENCES [dbo].[Moneda] ([chr_monecodigo])
GO
ALTER TABLE [dbo].[CargoMantenimiento] CHECK CONSTRAINT [fk_cargomantenimiento_moneda]
GO
ALTER TABLE [dbo].[CostoMovimiento]  WITH CHECK ADD  CONSTRAINT [fk_costomovimiento_moneda] FOREIGN KEY([chr_monecodigo])
REFERENCES [dbo].[Moneda] ([chr_monecodigo])
GO
ALTER TABLE [dbo].[CostoMovimiento] CHECK CONSTRAINT [fk_costomovimiento_moneda]
GO
ALTER TABLE [dbo].[Cuenta]  WITH CHECK ADD  CONSTRAINT [fk_cuenta_cliente] FOREIGN KEY([chr_cliecodigo])
REFERENCES [dbo].[Cliente] ([chr_cliecodigo])
GO
ALTER TABLE [dbo].[Cuenta] CHECK CONSTRAINT [fk_cuenta_cliente]
GO
ALTER TABLE [dbo].[Cuenta]  WITH CHECK ADD  CONSTRAINT [fk_cuenta_moneda] FOREIGN KEY([chr_monecodigo])
REFERENCES [dbo].[Moneda] ([chr_monecodigo])
GO
ALTER TABLE [dbo].[Cuenta] CHECK CONSTRAINT [fk_cuenta_moneda]
GO
ALTER TABLE [dbo].[Cuenta]  WITH CHECK ADD  CONSTRAINT [fk_cuenta_sucursal] FOREIGN KEY([chr_sucucodigo])
REFERENCES [dbo].[Sucursal] ([chr_sucucodigo])
GO
ALTER TABLE [dbo].[Cuenta] CHECK CONSTRAINT [fk_cuenta_sucursal]
GO
ALTER TABLE [dbo].[Cuenta]  WITH CHECK ADD  CONSTRAINT [fk_cuente_empleado] FOREIGN KEY([chr_emplcreacuenta])
REFERENCES [dbo].[Empleado] ([chr_emplcodigo])
GO
ALTER TABLE [dbo].[Cuenta] CHECK CONSTRAINT [fk_cuente_empleado]
GO
ALTER TABLE [dbo].[InteresMensual]  WITH CHECK ADD  CONSTRAINT [fk_interesmensual_moneda] FOREIGN KEY([chr_monecodigo])
REFERENCES [dbo].[Moneda] ([chr_monecodigo])
GO
ALTER TABLE [dbo].[InteresMensual] CHECK CONSTRAINT [fk_interesmensual_moneda]
GO
ALTER TABLE [dbo].[Movimiento]  WITH CHECK ADD  CONSTRAINT [fk_movimiento_cuenta] FOREIGN KEY([chr_cuencodigo])
REFERENCES [dbo].[Cuenta] ([chr_cuencodigo])
GO
ALTER TABLE [dbo].[Movimiento] CHECK CONSTRAINT [fk_movimiento_cuenta]
GO
ALTER TABLE [dbo].[Movimiento]  WITH CHECK ADD  CONSTRAINT [fk_movimiento_empleado] FOREIGN KEY([chr_emplcodigo])
REFERENCES [dbo].[Empleado] ([chr_emplcodigo])
GO
ALTER TABLE [dbo].[Movimiento] CHECK CONSTRAINT [fk_movimiento_empleado]
GO
ALTER TABLE [dbo].[Movimiento]  WITH CHECK ADD  CONSTRAINT [fk_movimiento_tipomovimiento] FOREIGN KEY([chr_tipocodigo])
REFERENCES [dbo].[TipoMovimiento] ([chr_tipocodigo])
GO
ALTER TABLE [dbo].[Movimiento] CHECK CONSTRAINT [fk_movimiento_tipomovimiento]
GO
ALTER TABLE [dbo].[Cuenta]  WITH CHECK ADD  CONSTRAINT [chk_cuenta_chr_cuenestado] CHECK  (([vch_cuenestado]='CANCELADO' OR [vch_cuenestado]='ANULADO' OR [vch_cuenestado]='ACTIVO'))
GO
ALTER TABLE [dbo].[Cuenta] CHECK CONSTRAINT [chk_cuenta_chr_cuenestado]
GO
ALTER TABLE [dbo].[Movimiento]  WITH CHECK ADD  CONSTRAINT [chk_Movimiento_importe] CHECK  (([dec_moviimporte]>=(0.0)))
GO
ALTER TABLE [dbo].[Movimiento] CHECK CONSTRAINT [chk_Movimiento_importe]
GO
ALTER TABLE [dbo].[Parametro]  WITH CHECK ADD  CONSTRAINT [chk_parametro_vch_paraestado] CHECK  (([vch_paraestado]='CANCELADO' OR [vch_paraestado]='ANULADO' OR [vch_paraestado]='ACTIVO'))
GO
ALTER TABLE [dbo].[Parametro] CHECK CONSTRAINT [chk_parametro_vch_paraestado]
GO
ALTER TABLE [dbo].[TipoMovimiento]  WITH CHECK ADD  CONSTRAINT [chk_tipomovimiento_vch_tipoaccion] CHECK  (([vch_tipoaccion]='SALIDA' OR [vch_tipoaccion]='INGRESO'))
GO
ALTER TABLE [dbo].[TipoMovimiento] CHECK CONSTRAINT [chk_tipomovimiento_vch_tipoaccion]
GO
ALTER TABLE [dbo].[TipoMovimiento]  WITH CHECK ADD  CONSTRAINT [chk_tipomovimiento_vch_tipoestado] CHECK  (([vch_tipoestado]='CANCELADO' OR [vch_tipoestado]='ANULADO' OR [vch_tipoestado]='ACTIVO'))
GO
ALTER TABLE [dbo].[TipoMovimiento] CHECK CONSTRAINT [chk_tipomovimiento_vch_tipoestado]
GO
USE [master]
GO
ALTER DATABASE [EUREKABANK] SET  READ_WRITE 
GO
