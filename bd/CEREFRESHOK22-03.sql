USE [CEREFRESH]
GO
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPaneCount' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_detalles_plan'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_detalles_plan'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_detalles_plan'

GO
/****** Object:  Trigger [tg_plan_nutricional]    Script Date: 22/3/2019 12:38:47 p. m. ******/
DROP TRIGGER [dbo].[tg_plan_nutricional]
GO
ALTER TABLE [dbo].[PLAN_NUTRICIONAL_PORCION] DROP CONSTRAINT [FK_PLAN_NUTRICIONAL_PORCION_PLAN_NUTRICIONAL_TIPO_COMIDA]
GO
ALTER TABLE [dbo].[PLAN_NUTRICIONAL_PORCION] DROP CONSTRAINT [FK_PLAN_NUTRICIONAL_PORCION_PLAN_NUTRICIONAL]
GO
ALTER TABLE [dbo].[PLAN_NUTRICIONAL_CONDICION] DROP CONSTRAINT [FK_PLAN_NUTRICIONAL_CONDICION_PLAN_NUTRICIONAL_CONDICION_ESPECIAL]
GO
ALTER TABLE [dbo].[PLAN_NUTRICIONAL_CONDICION] DROP CONSTRAINT [FK_PLAN_NUTRICIONAL_CONDICION_PLAN_NUTRICIONAL_ACT_FISICA]
GO
ALTER TABLE [dbo].[PLAN_NUTRICIONAL_CONDICION] DROP CONSTRAINT [FK_PLAN_NUTRICIONAL_CONDICION_PLAN_NUTRICIONAL]
GO
ALTER TABLE [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] DROP CONSTRAINT [FK_PLAN_NUTRICIONAL_ALIMENTOS_PLAN_NUTRICIONAL]
GO
ALTER TABLE [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] DROP CONSTRAINT [FK_PLAN_NUTRICIONAL_ALIMENTOS_MA_ALIMENTOS]
GO
ALTER TABLE [dbo].[PAGO_TR] DROP CONSTRAINT [FK_pago_tr_PAGO_MA]
GO
ALTER TABLE [dbo].[ORDERS_PAYMENTMETHOD] DROP CONSTRAINT [FK_ORDERS_PAYMENTMETHOD_ORDERS_PAYMENTMETHOD_TYPES]
GO
ALTER TABLE [dbo].[MA_ALIMENTOS] DROP CONSTRAINT [FK_MA_ALIMENTOS_TIPO_ALIMENTO1]
GO
ALTER TABLE [dbo].[ESTATUS_REGISTRO_MA] DROP CONSTRAINT [FK_ESTATUS_REGISTRO_MA_PROCESO_REGISTRO_MA]
GO
ALTER TABLE [dbo].[PAGO_TR] DROP CONSTRAINT [DF_PAGO_TR_Date]
GO
ALTER TABLE [dbo].[PAGO_MA] DROP CONSTRAINT [DF_PAGO_MA_Paid]
GO
ALTER TABLE [dbo].[PAGO_MA] DROP CONSTRAINT [DF_PAGO_MA_Observation]
GO
ALTER TABLE [dbo].[PAGO_MA] DROP CONSTRAINT [DF_PAGO_MA_TransactionInvalid]
GO
ALTER TABLE [dbo].[PAGO_MA] DROP CONSTRAINT [DF_PAGO_MA_fecha]
GO
ALTER TABLE [dbo].[ORDERS_PAYMENTMETHOD] DROP CONSTRAINT [DF_ORDERS_PAYMENTMETHOD_BancoEmisor1]
GO
ALTER TABLE [dbo].[ORDERS_PAYMENTMETHOD] DROP CONSTRAINT [DF_ORDERS_PAYMENTMETHOD_Banco_em]
GO
ALTER TABLE [dbo].[ORDERS_PAYMENTMETHOD] DROP CONSTRAINT [DF_ORDERS_PAYMENTMETHOD_CDCNumber]
GO
ALTER TABLE [dbo].[ORDERS_PAYMENTMETHOD] DROP CONSTRAINT [DF_ORDERS_PAYMENTMETHOD_PersonCedula]
GO
ALTER TABLE [dbo].[ORDERS_PAYMENTMETHOD] DROP CONSTRAINT [DF_ORDERS_PAYMENTMETHOD_PersonLastname]
GO
ALTER TABLE [dbo].[ORDERS_PAYMENTMETHOD] DROP CONSTRAINT [DF_ORDERS_PAYMENTMETHOD_PersonName]
GO
ALTER TABLE [dbo].[ORDERS_PAYMENTMETHOD] DROP CONSTRAINT [DF_ORDERS_PAYMENTMETHOD_Date]
GO
ALTER TABLE [dbo].[ORDERS_PAYMENTMETHOD] DROP CONSTRAINT [ORDERS_PAYMENTMETHOD_DEFAULT_TransactionID]
GO
ALTER TABLE [dbo].[ORDERS_PAYMENTMETHOD] DROP CONSTRAINT [DF_ORDERS_PAYMENTMETHOD_TransactionReference]
GO
ALTER TABLE [dbo].[ORDERS_PAYMENTMETHOD] DROP CONSTRAINT [DF_ORDERS_PAYMENTMETHOD_Amount]
GO
ALTER TABLE [dbo].[ORDERS_PAYMENTMETHOD] DROP CONSTRAINT [DF_ORDERS_PAYMENTMETHOD_Type]
GO
ALTER TABLE [dbo].[ORDERS_DELIVERYMETHOD] DROP CONSTRAINT [DF_ORDERS_DELIVERYMETHOD_PersonState1]
GO
ALTER TABLE [dbo].[ORDERS_DELIVERYMETHOD] DROP CONSTRAINT [DF_ORDERS_DELIVERYMETHOD_DateDeliveryIni1]
GO
ALTER TABLE [dbo].[ORDERS_DELIVERYMETHOD] DROP CONSTRAINT [DF_ORDERS_DELIVERYMETHOD_DateDelivery]
GO
ALTER TABLE [dbo].[ORDERS_DELIVERYMETHOD] DROP CONSTRAINT [DF_ORDERS_DELIVERYMETHOD_PersonBenchmark]
GO
ALTER TABLE [dbo].[ORDERS_DELIVERYMETHOD] DROP CONSTRAINT [DF_ORDERS_DELIVERYMETHOD_PersonMunicipality]
GO
ALTER TABLE [dbo].[ORDERS_DELIVERYMETHOD] DROP CONSTRAINT [DF_ORDERS_DELIVERYMETHOD_PersonState]
GO
ALTER TABLE [dbo].[ORDERS_DELIVERYMETHOD] DROP CONSTRAINT [DF_ORDERS_DELIVERYMETHOD_PersonCity]
GO
ALTER TABLE [dbo].[ORDERS_DELIVERYMETHOD] DROP CONSTRAINT [DF_ORDERS_DELIVERYMETHOD_PersonAddress]
GO
ALTER TABLE [dbo].[ORDERS_DELIVERYMETHOD] DROP CONSTRAINT [DF_ORDERS_DELIVERYMETHOD_PersonAdditionalPhone]
GO
ALTER TABLE [dbo].[ORDERS_DELIVERYMETHOD] DROP CONSTRAINT [DF_ORDERS_DELIVERYMETHOD_Date]
GO
ALTER TABLE [dbo].[ORDERS_DELIVERYMETHOD] DROP CONSTRAINT [DF_ORDERS_DELIVERYMETHOD_PersonCedula]
GO
ALTER TABLE [dbo].[ORDERS_DELIVERYMETHOD] DROP CONSTRAINT [DF_ORDERS_DELIVERYMETHOD_Type]
GO
ALTER TABLE [dbo].[NOTIFICACIONES] DROP CONSTRAINT [DF_NOTIFICACIONES_fecha_notificacion]
GO
ALTER TABLE [dbo].[MA_LOGIN] DROP CONSTRAINT [DF_MA_LOGIN_FechaRegistro]
GO
ALTER TABLE [dbo].[MA_FACTURACION] DROP CONSTRAINT [DF_MA_FACTURACION_phone]
GO
ALTER TABLE [dbo].[LOG_ORDER_ERROR] DROP CONSTRAINT [DF_LOG_ORDER_ERROR_OrderNumber]
GO
ALTER TABLE [dbo].[LOG_ORDER_ERROR] DROP CONSTRAINT [DF_LOG_ORDER_ERROR_Fecha]
GO
ALTER TABLE [dbo].[LOG_INSTAPAGO] DROP CONSTRAINT [DF_LOG_INSTAPAGO_OrdenNumber]
GO
ALTER TABLE [dbo].[LOG_INSTAPAGO] DROP CONSTRAINT [DF_LOG_INSTAPAGO_InternoWeb_ErrorDescription]
GO
ALTER TABLE [dbo].[LOG_INSTAPAGO] DROP CONSTRAINT [DF_LOG_INSTAPAGO_InternoWeb_ErrorNumber]
GO
ALTER TABLE [dbo].[LOG_INSTAPAGO] DROP CONSTRAINT [DF_LOG_INSTAPAGO_Fecha]
GO
ALTER TABLE [dbo].[CARRITO] DROP CONSTRAINT [DF_CARRITO_productcode]
GO
ALTER TABLE [dbo].[CARRITO] DROP CONSTRAINT [DF_CARRITO_ListCode]
GO
ALTER TABLE [dbo].[AFILIADOS] DROP CONSTRAINT [DF_AFILIADOS_sector1]
GO
ALTER TABLE [dbo].[AFILIADOS] DROP CONSTRAINT [DF_AFILIADOS_Sector]
GO
ALTER TABLE [dbo].[AFILIADOS] DROP CONSTRAINT [DF_AFILIADOS_ZipCode]
GO
ALTER TABLE [dbo].[AFILIADOS] DROP CONSTRAINT [DF_AFILIADOS_State]
GO
ALTER TABLE [dbo].[AFILIADOS] DROP CONSTRAINT [DF_AFILIADOS_City]
GO
ALTER TABLE [dbo].[AFILIADOS] DROP CONSTRAINT [DF_AFILIADOS_Address]
GO
ALTER TABLE [dbo].[AFILIADOS] DROP CONSTRAINT [DF_AFILIADOS_Phone]
GO
/****** Object:  View [dbo].[vw_detalles_plan]    Script Date: 22/3/2019 12:38:47 p. m. ******/
DROP VIEW [dbo].[vw_detalles_plan]
GO
/****** Object:  Table [dbo].[TIPO_NOTIFICACIONES]    Script Date: 22/3/2019 12:38:47 p. m. ******/
DROP TABLE [dbo].[TIPO_NOTIFICACIONES]
GO
/****** Object:  Table [dbo].[TIPO_ALIMENTO]    Script Date: 22/3/2019 12:38:47 p. m. ******/
DROP TABLE [dbo].[TIPO_ALIMENTO]
GO
/****** Object:  Table [dbo].[SYSTEM_CORRELATIVES]    Script Date: 22/3/2019 12:38:47 p. m. ******/
DROP TABLE [dbo].[SYSTEM_CORRELATIVES]
GO
/****** Object:  Table [dbo].[SECTORES]    Script Date: 22/3/2019 12:38:47 p. m. ******/
DROP TABLE [dbo].[SECTORES]
GO
/****** Object:  Table [dbo].[REGLASDENEGOCIO]    Script Date: 22/3/2019 12:38:47 p. m. ******/
DROP TABLE [dbo].[REGLASDENEGOCIO]
GO
/****** Object:  Table [dbo].[PROCESO_REGISTRO_MA]    Script Date: 22/3/2019 12:38:47 p. m. ******/
DROP TABLE [dbo].[PROCESO_REGISTRO_MA]
GO
/****** Object:  Table [dbo].[PLANES_SUSCRIPCION]    Script Date: 22/3/2019 12:38:47 p. m. ******/
DROP TABLE [dbo].[PLANES_SUSCRIPCION]
GO
/****** Object:  Table [dbo].[PLAN_NUTRICIONAL_TIPO_COMIDA]    Script Date: 22/3/2019 12:38:47 p. m. ******/
DROP TABLE [dbo].[PLAN_NUTRICIONAL_TIPO_COMIDA]
GO
/****** Object:  Table [dbo].[PLAN_NUTRICIONAL_PORCION]    Script Date: 22/3/2019 12:38:47 p. m. ******/
DROP TABLE [dbo].[PLAN_NUTRICIONAL_PORCION]
GO
/****** Object:  Table [dbo].[PLAN_NUTRICIONAL_CONDICION_ESPECIAL]    Script Date: 22/3/2019 12:38:47 p. m. ******/
DROP TABLE [dbo].[PLAN_NUTRICIONAL_CONDICION_ESPECIAL]
GO
/****** Object:  Table [dbo].[PLAN_NUTRICIONAL_CONDICION]    Script Date: 22/3/2019 12:38:47 p. m. ******/
DROP TABLE [dbo].[PLAN_NUTRICIONAL_CONDICION]
GO
/****** Object:  Table [dbo].[PLAN_NUTRICIONAL_ALIMENTOS]    Script Date: 22/3/2019 12:38:47 p. m. ******/
DROP TABLE [dbo].[PLAN_NUTRICIONAL_ALIMENTOS]
GO
/****** Object:  Table [dbo].[PLAN_NUTRICIONAL_ACT_FISICA]    Script Date: 22/3/2019 12:38:47 p. m. ******/
DROP TABLE [dbo].[PLAN_NUTRICIONAL_ACT_FISICA]
GO
/****** Object:  Table [dbo].[PLAN_NUTRICIONAL]    Script Date: 22/3/2019 12:38:47 p. m. ******/
DROP TABLE [dbo].[PLAN_NUTRICIONAL]
GO
/****** Object:  Table [dbo].[PAIS]    Script Date: 22/3/2019 12:38:47 p. m. ******/
DROP TABLE [dbo].[PAIS]
GO
/****** Object:  Table [dbo].[PAGO_TR]    Script Date: 22/3/2019 12:38:47 p. m. ******/
DROP TABLE [dbo].[PAGO_TR]
GO
/****** Object:  Table [dbo].[PAGO_MA]    Script Date: 22/3/2019 12:38:47 p. m. ******/
DROP TABLE [dbo].[PAGO_MA]
GO
/****** Object:  Table [dbo].[ORDERS_PAYMENTMETHOD_TYPES]    Script Date: 22/3/2019 12:38:47 p. m. ******/
DROP TABLE [dbo].[ORDERS_PAYMENTMETHOD_TYPES]
GO
/****** Object:  Table [dbo].[ORDERS_PAYMENTMETHOD]    Script Date: 22/3/2019 12:38:47 p. m. ******/
DROP TABLE [dbo].[ORDERS_PAYMENTMETHOD]
GO
/****** Object:  Table [dbo].[ORDERS_DELIVERYMETHOD_TYPES]    Script Date: 22/3/2019 12:38:47 p. m. ******/
DROP TABLE [dbo].[ORDERS_DELIVERYMETHOD_TYPES]
GO
/****** Object:  Table [dbo].[ORDERS_DELIVERYMETHOD]    Script Date: 22/3/2019 12:38:47 p. m. ******/
DROP TABLE [dbo].[ORDERS_DELIVERYMETHOD]
GO
/****** Object:  Table [dbo].[NOTIFICACIONES]    Script Date: 22/3/2019 12:38:47 p. m. ******/
DROP TABLE [dbo].[NOTIFICACIONES]
GO
/****** Object:  Table [dbo].[MA_PRODUCTOS]    Script Date: 22/3/2019 12:38:47 p. m. ******/
DROP TABLE [dbo].[MA_PRODUCTOS]
GO
/****** Object:  Table [dbo].[MA_LOGIN]    Script Date: 22/3/2019 12:38:47 p. m. ******/
DROP TABLE [dbo].[MA_LOGIN]
GO
/****** Object:  Table [dbo].[MA_FACTURACION]    Script Date: 22/3/2019 12:38:47 p. m. ******/
DROP TABLE [dbo].[MA_FACTURACION]
GO
/****** Object:  Table [dbo].[MA_ALIMENTOS]    Script Date: 22/3/2019 12:38:47 p. m. ******/
DROP TABLE [dbo].[MA_ALIMENTOS]
GO
/****** Object:  Table [dbo].[LOG_ORDER_ERROR]    Script Date: 22/3/2019 12:38:47 p. m. ******/
DROP TABLE [dbo].[LOG_ORDER_ERROR]
GO
/****** Object:  Table [dbo].[LOG_INSTAPAGO]    Script Date: 22/3/2019 12:38:47 p. m. ******/
DROP TABLE [dbo].[LOG_INSTAPAGO]
GO
/****** Object:  Table [dbo].[ESTATUS_REGISTRO_MA]    Script Date: 22/3/2019 12:38:47 p. m. ******/
DROP TABLE [dbo].[ESTATUS_REGISTRO_MA]
GO
/****** Object:  Table [dbo].[ESTADOS]    Script Date: 22/3/2019 12:38:47 p. m. ******/
DROP TABLE [dbo].[ESTADOS]
GO
/****** Object:  Table [dbo].[CIUDADES]    Script Date: 22/3/2019 12:38:47 p. m. ******/
DROP TABLE [dbo].[CIUDADES]
GO
/****** Object:  Table [dbo].[ci_sessions]    Script Date: 22/3/2019 12:38:47 p. m. ******/
DROP TABLE [dbo].[ci_sessions]
GO
/****** Object:  Table [dbo].[CARRITO]    Script Date: 22/3/2019 12:38:47 p. m. ******/
DROP TABLE [dbo].[CARRITO]
GO
/****** Object:  Table [dbo].[CARDS_MA]    Script Date: 22/3/2019 12:38:47 p. m. ******/
DROP TABLE [dbo].[CARDS_MA]
GO
/****** Object:  Table [dbo].[AFILIADOS]    Script Date: 22/3/2019 12:38:47 p. m. ******/
DROP TABLE [dbo].[AFILIADOS]
GO
/****** Object:  Table [dbo].[AFILIADOS]    Script Date: 22/3/2019 12:38:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AFILIADOS](
	[num_registro] [nvarchar](50) NOT NULL,
	[id_afiliacion] [nvarchar](50) NOT NULL,
	[apellido] [nvarchar](50) NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
	[edad] [int] NOT NULL,
	[sexo] [nvarchar](20) NOT NULL,
	[peso] [numeric](5, 2) NOT NULL,
	[estatura] [numeric](5, 2) NOT NULL,
	[act_fisica] [nvarchar](5) NOT NULL,
	[condicion_esp] [nvarchar](5) NOT NULL,
	[plan_nut] [nvarchar](200) NULL,
	[correo] [nvarchar](200) NOT NULL,
	[phone] [nvarchar](50) NOT NULL,
	[address] [nvarchar](max) NOT NULL,
	[city] [nvarchar](50) NOT NULL,
	[state] [nvarchar](50) NOT NULL,
	[zipcode] [nvarchar](50) NOT NULL,
	[sector] [nvarchar](50) NOT NULL,
	[pais] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_AFILIADOS] PRIMARY KEY CLUSTERED 
(
	[correo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CARDS_MA]    Script Date: 22/3/2019 12:38:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CARDS_MA](
	[Code] [nvarchar](50) NOT NULL,
	[num_registro] [nvarchar](50) NOT NULL,
	[CardNumber] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Lastname] [nvarchar](50) NOT NULL,
	[Cedula] [nvarchar](50) NOT NULL,
	[Month] [nvarchar](50) NOT NULL,
	[Year] [nvarchar](50) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CARRITO]    Script Date: 22/3/2019 12:38:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CARRITO](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[correo] [nvarchar](200) NOT NULL,
	[cantidad] [nvarchar](50) NOT NULL,
	[num_registro] [nvarchar](200) NOT NULL,
	[codeorder] [nvarchar](50) NOT NULL,
	[listcode] [nvarchar](50) NOT NULL,
	[productcode] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_CARRITO] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ci_sessions]    Script Date: 22/3/2019 12:38:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ci_sessions](
	[id] [varchar](128) NOT NULL,
	[ip_address] [varchar](45) NOT NULL,
	[timestamp] [bigint] NOT NULL DEFAULT ((0)),
	[data] [text] NOT NULL DEFAULT ('')
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CIUDADES]    Script Date: 22/3/2019 12:38:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CIUDADES](
	[id_ciudad] [int] NOT NULL,
	[id_estado] [int] NOT NULL,
	[ciudad] [nvarchar](200) NOT NULL,
	[capital] [bit] NOT NULL CONSTRAINT [DF__CIUDADES__capita__2B2A60FE]  DEFAULT ('0'),
 CONSTRAINT [PK_CIUDADES] PRIMARY KEY CLUSTERED 
(
	[id_ciudad] ASC,
	[id_estado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ESTADOS]    Script Date: 22/3/2019 12:38:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ESTADOS](
	[id_estado] [int] NOT NULL,
	[estado] [nvarchar](250) NOT NULL,
	[iso] [nvarchar](4) NOT NULL,
	[id_pais] [nvarchar](4) NOT NULL CONSTRAINT [DF_ESTADOS_id_pais]  DEFAULT (N'VE'),
 CONSTRAINT [PK_ESTADOS] PRIMARY KEY CLUSTERED 
(
	[iso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ESTATUS_REGISTRO_MA]    Script Date: 22/3/2019 12:38:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ESTATUS_REGISTRO_MA](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[num_registro] [nvarchar](50) NOT NULL,
	[id_proceso] [bigint] NOT NULL,
 CONSTRAINT [PK_ESTATUS_REGISTRO_MA_1] PRIMARY KEY CLUSTERED 
(
	[num_registro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LOG_INSTAPAGO]    Script Date: 22/3/2019 12:38:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOG_INSTAPAGO](
	[Success] [nvarchar](max) NULL,
	[TransID] [nvarchar](max) NULL,
	[Message] [nvarchar](max) NULL,
	[Code] [nvarchar](max) NULL,
	[ResponseCode] [nvarchar](max) NULL,
	[Reference] [nvarchar](max) NULL,
	[Sequence] [nvarchar](max) NULL,
	[Approval] [nvarchar](max) NULL,
	[Monto] [nvarchar](max) NULL,
	[Fecha] [datetime] NULL,
	[InternoWeb_TipoTransaccion] [numeric](18, 0) NULL,
	[InternoWeb_ErrorNumber] [numeric](18, 0) NULL,
	[InternoWeb_ErrorDescription] [nvarchar](max) NULL,
	[CustomerCode] [nvarchar](50) NULL,
	[OrderNumber] [nvarchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LOG_ORDER_ERROR]    Script Date: 22/3/2019 12:38:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOG_ORDER_ERROR](
	[Input_CustomerCode] [nvarchar](20) NULL,
	[Input_Cliente] [nvarchar](255) NULL,
	[Input_Cedula] [nvarchar](50) NULL,
	[Total] [float] NULL,
	[Subtotal] [float] NULL,
	[Tax] [float] NULL,
	[Fecha] [datetime] NULL,
	[ErrorDescription] [nvarchar](max) NULL,
	[OrderNumber] [nvarchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MA_ALIMENTOS]    Script Date: 22/3/2019 12:38:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MA_ALIMENTOS](
	[cod_alimento] [nvarchar](10) NOT NULL,
	[tipo_alimento] [tinyint] NOT NULL,
	[descripcion] [nvarchar](200) NOT NULL,
	[medida_practica] [nvarchar](50) NULL,
	[medida_practica_cant] [varchar](50) NULL,
	[unidad] [nvarchar](50) NULL,
	[unidad_cant] [tinyint] NULL,
 CONSTRAINT [PK_MA_ALIMENTOS] PRIMARY KEY CLUSTERED 
(
	[cod_alimento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MA_FACTURACION]    Script Date: 22/3/2019 12:38:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MA_FACTURACION](
	[num_facturado] [nvarchar](50) NOT NULL,
	[codeorden] [nvarchar](50) NOT NULL,
	[num_registro] [nvarchar](50) NOT NULL,
	[apellido] [nvarchar](50) NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
	[sexo] [nvarchar](20) NOT NULL,
	[correo] [nvarchar](200) NOT NULL,
	[cedula] [nvarchar](50) NOT NULL,
	[phone] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_MA_FACTURACION] PRIMARY KEY CLUSTERED 
(
	[num_facturado] ASC,
	[codeorden] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MA_LOGIN]    Script Date: 22/3/2019 12:38:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MA_LOGIN](
	[num_registro] [nvarchar](50) NOT NULL,
	[correo] [nvarchar](200) NOT NULL,
	[id_proveedor] [nvarchar](50) NULL,
	[nombre_proveedor] [nvarchar](50) NULL,
	[clave] [nvarchar](50) NULL,
	[token] [nvarchar](100) NULL,
	[fecha_registro] [datetime] NOT NULL,
 CONSTRAINT [PK_MA_LOGIN] PRIMARY KEY CLUSTERED 
(
	[correo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MA_PRODUCTOS]    Script Date: 22/3/2019 12:38:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MA_PRODUCTOS](
	[C_CODIGO] [nvarchar](15) NOT NULL,
	[C_DESCRI] [nvarchar](255) NOT NULL,
	[e_precio] [float] NOT NULL CONSTRAINT [DF_MA_PRODUCTOS_n_precio1]  DEFAULT ((60)),
	[n_precio_m] [float] NOT NULL CONSTRAINT [DF_Table_1_n_precio1]  DEFAULT ((0)),
	[n_impuesto] [float] NOT NULL CONSTRAINT [DF_Table_1_n_impuesto1]  DEFAULT ((0)),
	[c_observacion] [ntext] NULL,
	[n_Votos_Estrellas] [int] NOT NULL CONSTRAINT [DF_MA_PRODUCTOS_n_Votos_Estrellas]  DEFAULT ((1)),
	[n_Total_Estrellas] [int] NOT NULL CONSTRAINT [DF_MA_PRODUCTOS_n_Total_Estrellas]  DEFAULT ((0)),
	[ImgBytes] [int] NOT NULL CONSTRAINT [DF_MA_PRODUCTOS_ImgBytes]  DEFAULT ((-1))
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NOTIFICACIONES]    Script Date: 22/3/2019 12:38:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NOTIFICACIONES](
	[id_notificacion] [int] IDENTITY(1,1) NOT NULL,
	[fecha_notificacion] [datetime] NULL,
	[correo] [nvarchar](200) NOT NULL,
	[tipo] [nvarchar](50) NOT NULL,
	[num_registro] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_NOTIFICACIONES] PRIMARY KEY CLUSTERED 
(
	[id_notificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ORDERS_DELIVERYMETHOD]    Script Date: 22/3/2019 12:38:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ORDERS_DELIVERYMETHOD](
	[Code] [nvarchar](50) NOT NULL,
	[Type] [tinyint] NOT NULL,
	[PersonName] [nvarchar](255) NOT NULL,
	[PersonLastname] [nvarchar](255) NOT NULL,
	[PersonPhone] [nvarchar](50) NOT NULL,
	[PersonEmail] [nvarchar](50) NOT NULL,
	[PersonCedula] [nvarchar](50) NULL,
	[Date] [datetime] NOT NULL,
	[PersonAdditionalPhone] [nvarchar](50) NOT NULL,
	[PersonAddress] [nvarchar](max) NOT NULL,
	[PersonCity] [nvarchar](50) NOT NULL,
	[PersonState] [nvarchar](50) NOT NULL,
	[PersonMunicipality] [nvarchar](50) NOT NULL,
	[PersonBenchmark] [nvarchar](max) NOT NULL,
	[DateDeliveryIni] [date] NOT NULL,
	[DateDeliveryFin] [date] NOT NULL,
	[PersonPais] [nvarchar](50) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ORDERS_DELIVERYMETHOD_TYPES]    Script Date: 22/3/2019 12:38:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ORDERS_DELIVERYMETHOD_TYPES](
	[Code] [tinyint] NOT NULL,
	[SysName] [nvarchar](250) NOT NULL,
	[SysNameResourceID] [int] NOT NULL CONSTRAINT [DF_ORDERS_DELIVERYMETHOD_TYPES_SysNameResourceID]  DEFAULT ((0)),
	[Description] [nvarchar](250) NOT NULL,
	[DescResourceID] [int] NOT NULL CONSTRAINT [DF_ORDERS_DELIVERYMETHOD_TYPES_DescResourceID]  DEFAULT ((0))
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ORDERS_PAYMENTMETHOD]    Script Date: 22/3/2019 12:38:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ORDERS_PAYMENTMETHOD](
	[ID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[CodeOrden] [nvarchar](50) NOT NULL,
	[Type] [int] NOT NULL,
	[Amount] [decimal](18, 2) NULL,
	[TransactionReference] [nvarchar](50) NULL,
	[TransactionID] [nvarchar](50) NULL,
	[Date] [datetime] NOT NULL,
	[PersonName] [nvarchar](255) NOT NULL,
	[PersonLastname] [nvarchar](255) NOT NULL,
	[PersonCedula] [nvarchar](50) NOT NULL,
	[CDCNumber] [nvarchar](50) NOT NULL,
	[BancoEmisor] [nvarchar](200) NULL,
	[BancoReceptor] [nvarchar](200) NULL,
 CONSTRAINT [PK_ORDERS_PAYMENTMETHOD] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ORDERS_PAYMENTMETHOD_TYPES]    Script Date: 22/3/2019 12:38:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ORDERS_PAYMENTMETHOD_TYPES](
	[Code] [int] NOT NULL,
	[SysName] [nvarchar](250) NOT NULL,
	[SysNameResourceID] [int] NOT NULL CONSTRAINT [DF_ORDERS_PAYMENTMETHOD_TYPES_SysNameResourceID]  DEFAULT ((0)),
	[Description] [nvarchar](250) NOT NULL,
	[DescResourceID] [int] NOT NULL CONSTRAINT [DF_ORDERS_PAYMENTMETHOD_TYPES_DescResourceID]  DEFAULT ((0)),
 CONSTRAINT [PK_ORDERS_PAYMENTMETHOD_TYPES] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PAGO_MA]    Script Date: 22/3/2019 12:38:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PAGO_MA](
	[num_registro] [nvarchar](50) NOT NULL,
	[codeorden] [nvarchar](50) NOT NULL,
	[date] [datetime] NOT NULL,
	[estatus] [int] NULL,
	[transactioninvalid] [int] NOT NULL,
	[total] [float] NOT NULL,
	[subtotal] [float] NOT NULL,
	[tax] [float] NOT NULL,
	[observation] [nvarchar](max) NOT NULL,
	[paid] [float] NOT NULL,
	[id_afiliacion] [nvarchar](50) NULL,
 CONSTRAINT [PK_PAGO_MA] PRIMARY KEY CLUSTERED 
(
	[num_registro] ASC,
	[codeorden] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PAGO_TR]    Script Date: 22/3/2019 12:38:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PAGO_TR](
	[num_registro] [nvarchar](50) NOT NULL,
	[codeorden] [nvarchar](50) NOT NULL,
	[id_afiliacion] [varchar](50) NOT NULL,
	[descripcion] [nvarchar](100) NULL,
	[cantidad] [int] NOT NULL,
	[semana] [int] NOT NULL,
	[total] [float] NOT NULL,
	[subtotal] [float] NOT NULL,
	[tax] [float] NOT NULL,
	[date] [datetime] NOT NULL,
	[correo] [nvarchar](50) NOT NULL,
	[precio] [float] NOT NULL,
 CONSTRAINT [PK_pago_tr] PRIMARY KEY CLUSTERED 
(
	[num_registro] ASC,
	[id_afiliacion] ASC,
	[codeorden] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PAIS]    Script Date: 22/3/2019 12:38:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PAIS](
	[id_pais] [nvarchar](4) NOT NULL,
	[pais] [nvarchar](250) NOT NULL,
	[iso] [nvarchar](4) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PLAN_NUTRICIONAL]    Script Date: 22/3/2019 12:38:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PLAN_NUTRICIONAL](
	[id_plan] [nvarchar](20) NOT NULL,
	[descripcion] [nvarchar](20) NOT NULL,
	[calorias_diaria] [int] NOT NULL,
 CONSTRAINT [PK_PLAN_NUTRICIONAL] PRIMARY KEY CLUSTERED 
(
	[id_plan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PLAN_NUTRICIONAL_ACT_FISICA]    Script Date: 22/3/2019 12:38:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PLAN_NUTRICIONAL_ACT_FISICA](
	[act_fisica] [nvarchar](5) NOT NULL,
	[descripcion] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_PLAN_NUTRICIONAL_ACT_FISICA] PRIMARY KEY CLUSTERED 
(
	[act_fisica] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PLAN_NUTRICIONAL_ALIMENTOS]    Script Date: 22/3/2019 12:38:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PLAN_NUTRICIONAL_ALIMENTOS](
	[id_plan] [nvarchar](20) NOT NULL,
	[cod_alimento] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_PLAN_NUTRICIONAL_ALIMENTOS] PRIMARY KEY CLUSTERED 
(
	[id_plan] ASC,
	[cod_alimento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PLAN_NUTRICIONAL_CONDICION]    Script Date: 22/3/2019 12:38:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PLAN_NUTRICIONAL_CONDICION](
	[id_plan] [nvarchar](20) NOT NULL,
	[linea_condicion] [tinyint] NOT NULL,
	[sexo] [nvarchar](20) NOT NULL,
	[edad_menor] [tinyint] NULL,
	[edad_mayor] [tinyint] NULL,
	[act_fisica] [nvarchar](5) NOT NULL,
	[condicion_esp] [nvarchar](5) NOT NULL,
	[IMC_menor] [tinyint] NULL,
	[IMC_mayor] [tinyint] NULL,
 CONSTRAINT [PK_PLAN_NUTRICIONAL_CONDICION] PRIMARY KEY CLUSTERED 
(
	[id_plan] ASC,
	[linea_condicion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PLAN_NUTRICIONAL_CONDICION_ESPECIAL]    Script Date: 22/3/2019 12:38:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PLAN_NUTRICIONAL_CONDICION_ESPECIAL](
	[condicion_esp] [nvarchar](5) NOT NULL,
	[descripcion] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_PLAN_NUTRICIONAL_CONDICION_ESPECIAL] PRIMARY KEY CLUSTERED 
(
	[condicion_esp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PLAN_NUTRICIONAL_PORCION]    Script Date: 22/3/2019 12:38:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PLAN_NUTRICIONAL_PORCION](
	[id_plan] [nvarchar](20) NOT NULL,
	[comida] [nvarchar](20) NOT NULL,
	[tipo_alimento] [tinyint] NOT NULL,
	[porcion] [tinyint] NULL,
 CONSTRAINT [PK_PLAN_NUTRICIONAL_PORCION_1] PRIMARY KEY CLUSTERED 
(
	[id_plan] ASC,
	[comida] ASC,
	[tipo_alimento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PLAN_NUTRICIONAL_TIPO_COMIDA]    Script Date: 22/3/2019 12:38:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PLAN_NUTRICIONAL_TIPO_COMIDA](
	[tipo_comida] [nvarchar](20) NOT NULL,
	[descripcion] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_PLAN_NUTRICIONAL_TIPO_COMIDA] PRIMARY KEY CLUSTERED 
(
	[tipo_comida] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PLANES_SUSCRIPCION]    Script Date: 22/3/2019 12:38:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PLANES_SUSCRIPCION](
	[plan_suscrip] [nvarchar](20) NOT NULL,
	[descripcion] [nvarchar](100) NOT NULL,
	[precio] [numeric](18, 2) NULL,
	[plan_detalle] [nvarchar](200) NOT NULL,
	[dias_valides] [tinyint] NULL,
 CONSTRAINT [PK_PLANES_SUSCRIPCION] PRIMARY KEY CLUSTERED 
(
	[plan_suscrip] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PROCESO_REGISTRO_MA]    Script Date: 22/3/2019 12:38:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PROCESO_REGISTRO_MA](
	[id_proceso] [bigint] IDENTITY(1,1) NOT NULL,
	[descripcion] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_PROCESO_REGISTRO_MA] PRIMARY KEY CLUSTERED 
(
	[id_proceso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[REGLASDENEGOCIO]    Script Date: 22/3/2019 12:38:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[REGLASDENEGOCIO](
	[IDModulo] [nvarchar](50) NOT NULL CONSTRAINT [DF_REGLASDENEGOCIO_IDModulo_1]  DEFAULT (''),
	[IDProceso] [nvarchar](50) NOT NULL CONSTRAINT [DF_REGLASDENEGOCIO_IDProceso_1]  DEFAULT (''),
	[Campo] [nvarchar](50) NOT NULL,
	[Descripcion] [nvarchar](1000) NOT NULL CONSTRAINT [DF_REGLASDENEGOCIO_Descripcion_1]  DEFAULT (''),
	[Tipo] [nvarchar](50) NOT NULL CONSTRAINT [DF_REGLASDENEGOCIO_Tipo_1]  DEFAULT (''),
	[ValorDefault] [nvarchar](1024) NOT NULL CONSTRAINT [DF_REGLASDENEGOCIO_ValorDefault_1]  DEFAULT (''),
	[ValoresPermitidos] [nvarchar](max) NOT NULL CONSTRAINT [DF_REGLASDENEGOCIO_ValoresPermitidos_1]  DEFAULT (''),
	[Valor] [nvarchar](1024) NOT NULL CONSTRAINT [DF_REGLASDENEGOCIO_Valor_1]  DEFAULT ((0)),
	[Oculto] [bit] NOT NULL CONSTRAINT [DF_REGLASDENEGOCIO_Oculto_1]  DEFAULT ((0)),
 CONSTRAINT [PK_REGLASDENEGOCIO] PRIMARY KEY CLUSTERED 
(
	[Campo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SECTORES]    Script Date: 22/3/2019 12:38:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SECTORES](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_ciudad] [int] NOT NULL CONSTRAINT [DF_Sector_id_ciudad]  DEFAULT ((0)),
	[id_municipio] [int] NOT NULL CONSTRAINT [DF_Sector_id_municipio]  DEFAULT ((0)),
	[Sector] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_Sector] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SYSTEM_CORRELATIVES]    Script Date: 22/3/2019 12:38:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SYSTEM_CORRELATIVES](
	[Identifier] [nvarchar](100) NOT NULL,
	[Info] [nvarchar](250) NOT NULL CONSTRAINT [DF_SYSTEM_CORRELATIVES_Info]  DEFAULT (''),
	[Value] [numeric](18, 0) NOT NULL,
	[Format] [nvarchar](50) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TIPO_ALIMENTO]    Script Date: 22/3/2019 12:38:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TIPO_ALIMENTO](
	[tipo_alimento] [tinyint] NOT NULL,
	[descripcion] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_TIPO_ALIMENTO] PRIMARY KEY CLUSTERED 
(
	[tipo_alimento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TIPO_NOTIFICACIONES]    Script Date: 22/3/2019 12:38:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TIPO_NOTIFICACIONES](
	[id_notificacion] [tinyint] NOT NULL,
	[descripcion] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_TIPO_NOTIFICACIONES_1] PRIMARY KEY CLUSTERED 
(
	[id_notificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  View [dbo].[vw_detalles_plan]    Script Date: 22/3/2019 12:38:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_detalles_plan]
AS
SELECT        AF.num_registro, AF.id_afiliacion, AF.plan_nut, (CASE PL.comida WHEN 'DESAYUNO' THEN 1 WHEN 'MERIENDA_1' THEN 2 WHEN 'ALMUERZO' THEN 3 WHEN 'MERIENDA_2' THEN 4 ELSE 5 END) AS ord_comida, PL.porcion, 
                         AL.descripcion AS tipo_alimento, AL.tipo_alimento AS cod_tipo_alimento, tc.tipo_comida, tc.descripcion AS comida
FROM            dbo.AFILIADOS AS AF INNER JOIN
                         dbo.PLAN_NUTRICIONAL_PORCION AS PL ON AF.plan_nut = PL.id_plan INNER JOIN
                         dbo.TIPO_ALIMENTO AS AL ON PL.tipo_alimento = AL.tipo_alimento INNER JOIN
                         dbo.PLAN_NUTRICIONAL_TIPO_COMIDA AS tc ON PL.comida = tc.tipo_comida


GO
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'seg1o0um95l5i86fom1kbkahs9dbteus', N'::1', 1552932781, N'__ci_last_regenerate|i:1552932779;SemanaActual|i:12;DiaSemanaActual|i:2;DiaSemanaPago|i:13;correo|s:22:"avelazquez@bigwise.com";num_registro|s:10:"0000000002";ReciboPago|s:8592:"
&lt;table style=&quot;background-color: white;&quot;&gt;
    &lt;tbody&gt;
        &lt;tr&gt;
            &lt;td&gt;
                &lt;div style=&quot;border: 1px solid #222; padding: 9px; text-align: center; max-width:255px&quot; id=&quot;voucher&quot;&gt;

                    &lt;style type=&quot;text/css&quot;&gt;
                        .normal-left {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: left;
                        }

                        .normal-right {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: right;
                        }

                        .big-center {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: center;
                            font-weight: 900;
                        }

                        .big-center-especial {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: center;
                            font-weight: 900;
                            letter-spacing: .9em;
                        }

                        .big-left {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: left;
                            font-weight: 900;
                        }

                        .big-right {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: right;
                            font-weight: 900;
                        }

                        .normal-center {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: center;
                        }

                        #voucher td {
                            padding: 0;
                            margin: 0;
                        }
                    &lt;/style&gt;
                    &lt;div id=&quot;voucher&quot;&gt;
                        &lt;table&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-center&quot;&gt;COPIA - CLIENTE&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center-especial&quot;&gt;
                                    &lt;br /&gt;
                                    BANESCO
                                &lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;
                                    &lt;br /&gt;
                                    
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;TECNOLOGIA INSTAPAGO&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;DEMOSTRACI&amp;#211;N&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;J-000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-left&quot;&gt;000000000000&lt;/td&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-right&quot;&gt;000000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;FECHA:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;00/00/00 00:00:00 PM&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;NRO CUENTA:&lt;/td&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-left&quot;&gt;000000******0000    &lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;&#39;0&#39;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td class=&quot;normal-left&quot;&gt;NRO. REF.:&lt;/td&gt;
                                &lt;td class=&quot;normal-left&quot;&gt;000000&lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;LOTE:&lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;APROBACION: &lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;SECUENCIA:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;
                                    &lt;br /&gt;
                                    MONTO BS.  0,00
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr style=&quot;margin-top: 10px;&quot;&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;RIF: J-000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;
                                    &lt;b&gt;
                                        &lt;br /&gt;
                                    &lt;/b&gt;
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;
                                    &lt;br /&gt;debito
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;ID:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;000000000000000000&lt;/td&gt;
                            &lt;/tr&gt;
                        &lt;/table&gt;
                    &lt;/div&gt;
                &lt;/div&gt;
            &lt;/td&gt;
        &lt;/tr&gt;
    &lt;/tbody&gt;
&lt;/table&gt;



";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'qrnqbeoa52dmbs510j6p4qosik36aumc', N'::1', 1552932781, N'__ci_last_regenerate|i:1552932779;SemanaActual|i:12;DiaSemanaActual|i:2;DiaSemanaPago|i:13;correo|s:22:"avelazquez@bigwise.com";num_registro|s:10:"0000000002";ReciboPago|s:8592:"
&lt;table style=&quot;background-color: white;&quot;&gt;
    &lt;tbody&gt;
        &lt;tr&gt;
            &lt;td&gt;
                &lt;div style=&quot;border: 1px solid #222; padding: 9px; text-align: center; max-width:255px&quot; id=&quot;voucher&quot;&gt;

                    &lt;style type=&quot;text/css&quot;&gt;
                        .normal-left {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: left;
                        }

                        .normal-right {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: right;
                        }

                        .big-center {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: center;
                            font-weight: 900;
                        }

                        .big-center-especial {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: center;
                            font-weight: 900;
                            letter-spacing: .9em;
                        }

                        .big-left {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: left;
                            font-weight: 900;
                        }

                        .big-right {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: right;
                            font-weight: 900;
                        }

                        .normal-center {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: center;
                        }

                        #voucher td {
                            padding: 0;
                            margin: 0;
                        }
                    &lt;/style&gt;
                    &lt;div id=&quot;voucher&quot;&gt;
                        &lt;table&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-center&quot;&gt;COPIA - CLIENTE&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center-especial&quot;&gt;
                                    &lt;br /&gt;
                                    BANESCO
                                &lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;
                                    &lt;br /&gt;
                                    
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;TECNOLOGIA INSTAPAGO&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;DEMOSTRACI&amp;#211;N&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;J-000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-left&quot;&gt;000000000000&lt;/td&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-right&quot;&gt;000000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;FECHA:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;00/00/00 00:00:00 PM&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;NRO CUENTA:&lt;/td&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-left&quot;&gt;000000******0000    &lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;&#39;0&#39;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td class=&quot;normal-left&quot;&gt;NRO. REF.:&lt;/td&gt;
                                &lt;td class=&quot;normal-left&quot;&gt;000000&lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;LOTE:&lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;APROBACION: &lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;SECUENCIA:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;
                                    &lt;br /&gt;
                                    MONTO BS.  0,00
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr style=&quot;margin-top: 10px;&quot;&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;RIF: J-000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;
                                    &lt;b&gt;
                                        &lt;br /&gt;
                                    &lt;/b&gt;
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;
                                    &lt;br /&gt;debito
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;ID:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;000000000000000000&lt;/td&gt;
                            &lt;/tr&gt;
                        &lt;/table&gt;
                    &lt;/div&gt;
                &lt;/div&gt;
            &lt;/td&gt;
        &lt;/tr&gt;
    &lt;/tbody&gt;
&lt;/table&gt;



";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'v2c39e39fm7oa6m2smk8oakmqcotpoit', N'::1', 1552934679, N'__ci_last_regenerate|i:1552934398;SemanaActual|i:12;DiaSemanaActual|i:2;DiaSemanaPago|i:13;correo|s:22:"avelazquez@bigwise.com";num_registro|s:10:"0000000002";ReciboPago|s:8592:"
&lt;table style=&quot;background-color: white;&quot;&gt;
    &lt;tbody&gt;
        &lt;tr&gt;
            &lt;td&gt;
                &lt;div style=&quot;border: 1px solid #222; padding: 9px; text-align: center; max-width:255px&quot; id=&quot;voucher&quot;&gt;

                    &lt;style type=&quot;text/css&quot;&gt;
                        .normal-left {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: left;
                        }

                        .normal-right {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: right;
                        }

                        .big-center {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: center;
                            font-weight: 900;
                        }

                        .big-center-especial {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: center;
                            font-weight: 900;
                            letter-spacing: .9em;
                        }

                        .big-left {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: left;
                            font-weight: 900;
                        }

                        .big-right {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: right;
                            font-weight: 900;
                        }

                        .normal-center {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: center;
                        }

                        #voucher td {
                            padding: 0;
                            margin: 0;
                        }
                    &lt;/style&gt;
                    &lt;div id=&quot;voucher&quot;&gt;
                        &lt;table&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-center&quot;&gt;COPIA - CLIENTE&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center-especial&quot;&gt;
                                    &lt;br /&gt;
                                    BANESCO
                                &lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;
                                    &lt;br /&gt;
                                    
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;TECNOLOGIA INSTAPAGO&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;DEMOSTRACI&amp;#211;N&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;J-000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-left&quot;&gt;000000000000&lt;/td&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-right&quot;&gt;000000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;FECHA:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;00/00/00 00:00:00 PM&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;NRO CUENTA:&lt;/td&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-left&quot;&gt;000000******0000    &lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;&#39;0&#39;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td class=&quot;normal-left&quot;&gt;NRO. REF.:&lt;/td&gt;
                                &lt;td class=&quot;normal-left&quot;&gt;000000&lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;LOTE:&lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;APROBACION: &lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;SECUENCIA:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;
                                    &lt;br /&gt;
                                    MONTO BS.  0,00
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr style=&quot;margin-top: 10px;&quot;&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;RIF: J-000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;
                                    &lt;b&gt;
                                        &lt;br /&gt;
                                    &lt;/b&gt;
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;
                                    &lt;br /&gt;debito
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;ID:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;000000000000000000&lt;/td&gt;
                            &lt;/tr&gt;
                        &lt;/table&gt;
                    &lt;/div&gt;
                &lt;/div&gt;
            &lt;/td&gt;
        &lt;/tr&gt;
    &lt;/tbody&gt;
&lt;/table&gt;



";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'fvfqhiudeomnkvo2k3f46rmi70uk69bo', N'::1', 1552938106, N'__ci_last_regenerate|i:1552937818;SemanaActual|i:12;DiaSemanaActual|i:2;DiaSemanaPago|i:13;correo|s:22:"avelazquez@bigwise.com";num_registro|s:10:"0000000002";ReciboPago|s:8592:"
&lt;table style=&quot;background-color: white;&quot;&gt;
    &lt;tbody&gt;
        &lt;tr&gt;
            &lt;td&gt;
                &lt;div style=&quot;border: 1px solid #222; padding: 9px; text-align: center; max-width:255px&quot; id=&quot;voucher&quot;&gt;

                    &lt;style type=&quot;text/css&quot;&gt;
                        .normal-left {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: left;
                        }

                        .normal-right {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: right;
                        }

                        .big-center {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: center;
                            font-weight: 900;
                        }

                        .big-center-especial {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: center;
                            font-weight: 900;
                            letter-spacing: .9em;
                        }

                        .big-left {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: left;
                            font-weight: 900;
                        }

                        .big-right {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: right;
                            font-weight: 900;
                        }

                        .normal-center {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: center;
                        }

                        #voucher td {
                            padding: 0;
                            margin: 0;
                        }
                    &lt;/style&gt;
                    &lt;div id=&quot;voucher&quot;&gt;
                        &lt;table&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-center&quot;&gt;COPIA - CLIENTE&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center-especial&quot;&gt;
                                    &lt;br /&gt;
                                    BANESCO
                                &lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;
                                    &lt;br /&gt;
                                    
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;TECNOLOGIA INSTAPAGO&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;DEMOSTRACI&amp;#211;N&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;J-000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-left&quot;&gt;000000000000&lt;/td&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-right&quot;&gt;000000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;FECHA:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;00/00/00 00:00:00 PM&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;NRO CUENTA:&lt;/td&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-left&quot;&gt;000000******0000    &lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;&#39;0&#39;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td class=&quot;normal-left&quot;&gt;NRO. REF.:&lt;/td&gt;
                                &lt;td class=&quot;normal-left&quot;&gt;000000&lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;LOTE:&lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;APROBACION: &lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;SECUENCIA:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;
                                    &lt;br /&gt;
                                    MONTO BS.  0,00
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr style=&quot;margin-top: 10px;&quot;&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;RIF: J-000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;
                                    &lt;b&gt;
                                        &lt;br /&gt;
                                    &lt;/b&gt;
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;
                                    &lt;br /&gt;debito
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;ID:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;000000000000000000&lt;/td&gt;
                            &lt;/tr&gt;
                        &lt;/table&gt;
                    &lt;/div&gt;
                &lt;/div&gt;
            &lt;/td&gt;
        &lt;/tr&gt;
    &lt;/tbody&gt;
&lt;/table&gt;



";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'mmih87q91ag7pknlsuks3a0ds32lj33b', N'::1', 1552938626, N'__ci_last_regenerate|i:1552938483;SemanaActual|i:12;DiaSemanaActual|i:2;DiaSemanaPago|i:13;correo|s:22:"avelazquez@bigwise.com";num_registro|s:10:"0000000002";ReciboPago|s:8592:"
&lt;table style=&quot;background-color: white;&quot;&gt;
    &lt;tbody&gt;
        &lt;tr&gt;
            &lt;td&gt;
                &lt;div style=&quot;border: 1px solid #222; padding: 9px; text-align: center; max-width:255px&quot; id=&quot;voucher&quot;&gt;

                    &lt;style type=&quot;text/css&quot;&gt;
                        .normal-left {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: left;
                        }

                        .normal-right {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: right;
                        }

                        .big-center {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: center;
                            font-weight: 900;
                        }

                        .big-center-especial {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: center;
                            font-weight: 900;
                            letter-spacing: .9em;
                        }

                        .big-left {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: left;
                            font-weight: 900;
                        }

                        .big-right {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: right;
                            font-weight: 900;
                        }

                        .normal-center {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: center;
                        }

                        #voucher td {
                            padding: 0;
                            margin: 0;
                        }
                    &lt;/style&gt;
                    &lt;div id=&quot;voucher&quot;&gt;
                        &lt;table&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-center&quot;&gt;COPIA - CLIENTE&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center-especial&quot;&gt;
                                    &lt;br /&gt;
                                    BANESCO
                                &lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;
                                    &lt;br /&gt;
                                    
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;TECNOLOGIA INSTAPAGO&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;DEMOSTRACI&amp;#211;N&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;J-000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-left&quot;&gt;000000000000&lt;/td&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-right&quot;&gt;000000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;FECHA:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;00/00/00 00:00:00 PM&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;NRO CUENTA:&lt;/td&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-left&quot;&gt;000000******0000    &lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;&#39;0&#39;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td class=&quot;normal-left&quot;&gt;NRO. REF.:&lt;/td&gt;
                                &lt;td class=&quot;normal-left&quot;&gt;000000&lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;LOTE:&lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;APROBACION: &lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;SECUENCIA:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;
                                    &lt;br /&gt;
                                    MONTO BS.  0,00
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr style=&quot;margin-top: 10px;&quot;&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;RIF: J-000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;
                                    &lt;b&gt;
                                        &lt;br /&gt;
                                    &lt;/b&gt;
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;
                                    &lt;br /&gt;debito
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;ID:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;000000000000000000&lt;/td&gt;
                            &lt;/tr&gt;
                        &lt;/table&gt;
                    &lt;/div&gt;
                &lt;/div&gt;
            &lt;/td&gt;
        &lt;/tr&gt;
    &lt;/tbody&gt;
&lt;/table&gt;



";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'jgrc8mm2cfc273ekj73v949pauqetu8s', N'::1', 1552939744, N'__ci_last_regenerate|i:1552939565;SemanaActual|i:12;DiaSemanaActual|i:2;DiaSemanaPago|i:13;correo|s:22:"avelazquez@bigwise.com";num_registro|s:10:"0000000002";ReciboPago|s:8592:"
&lt;table style=&quot;background-color: white;&quot;&gt;
    &lt;tbody&gt;
        &lt;tr&gt;
            &lt;td&gt;
                &lt;div style=&quot;border: 1px solid #222; padding: 9px; text-align: center; max-width:255px&quot; id=&quot;voucher&quot;&gt;

                    &lt;style type=&quot;text/css&quot;&gt;
                        .normal-left {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: left;
                        }

                        .normal-right {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: right;
                        }

                        .big-center {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: center;
                            font-weight: 900;
                        }

                        .big-center-especial {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: center;
                            font-weight: 900;
                            letter-spacing: .9em;
                        }

                        .big-left {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: left;
                            font-weight: 900;
                        }

                        .big-right {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: right;
                            font-weight: 900;
                        }

                        .normal-center {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: center;
                        }

                        #voucher td {
                            padding: 0;
                            margin: 0;
                        }
                    &lt;/style&gt;
                    &lt;div id=&quot;voucher&quot;&gt;
                        &lt;table&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-center&quot;&gt;COPIA - CLIENTE&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center-especial&quot;&gt;
                                    &lt;br /&gt;
                                    BANESCO
                                &lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;
                                    &lt;br /&gt;
                                    
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;TECNOLOGIA INSTAPAGO&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;DEMOSTRACI&amp;#211;N&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;J-000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-left&quot;&gt;000000000000&lt;/td&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-right&quot;&gt;000000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;FECHA:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;00/00/00 00:00:00 PM&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;NRO CUENTA:&lt;/td&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-left&quot;&gt;000000******0000    &lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;&#39;0&#39;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td class=&quot;normal-left&quot;&gt;NRO. REF.:&lt;/td&gt;
                                &lt;td class=&quot;normal-left&quot;&gt;000000&lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;LOTE:&lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;APROBACION: &lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;SECUENCIA:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;
                                    &lt;br /&gt;
                                    MONTO BS.  0,00
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr style=&quot;margin-top: 10px;&quot;&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;RIF: J-000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;
                                    &lt;b&gt;
                                        &lt;br /&gt;
                                    &lt;/b&gt;
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;
                                    &lt;br /&gt;debito
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;ID:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;000000000000000000&lt;/td&gt;
                            &lt;/tr&gt;
                        &lt;/table&gt;
                    &lt;/div&gt;
                &lt;/div&gt;
            &lt;/td&gt;
        &lt;/tr&gt;
    &lt;/tbody&gt;
&lt;/table&gt;



";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'obugc090j7v4usckdbs92knh7d471qnf', N'::1', 1552941824, N'__ci_last_regenerate|i:1552941551;SemanaActual|i:12;DiaSemanaActual|i:2;DiaSemanaPago|i:13;correo|s:22:"avelazquez@bigwise.com";num_registro|s:10:"0000000002";ReciboPago|s:8592:"
&lt;table style=&quot;background-color: white;&quot;&gt;
    &lt;tbody&gt;
        &lt;tr&gt;
            &lt;td&gt;
                &lt;div style=&quot;border: 1px solid #222; padding: 9px; text-align: center; max-width:255px&quot; id=&quot;voucher&quot;&gt;

                    &lt;style type=&quot;text/css&quot;&gt;
                        .normal-left {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: left;
                        }

                        .normal-right {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: right;
                        }

                        .big-center {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: center;
                            font-weight: 900;
                        }

                        .big-center-especial {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: center;
                            font-weight: 900;
                            letter-spacing: .9em;
                        }

                        .big-left {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: left;
                            font-weight: 900;
                        }

                        .big-right {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: right;
                            font-weight: 900;
                        }

                        .normal-center {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: center;
                        }

                        #voucher td {
                            padding: 0;
                            margin: 0;
                        }
                    &lt;/style&gt;
                    &lt;div id=&quot;voucher&quot;&gt;
                        &lt;table&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-center&quot;&gt;COPIA - CLIENTE&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center-especial&quot;&gt;
                                    &lt;br /&gt;
                                    BANESCO
                                &lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;
                                    &lt;br /&gt;
                                    
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;TECNOLOGIA INSTAPAGO&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;DEMOSTRACI&amp;#211;N&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;J-000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-left&quot;&gt;000000000000&lt;/td&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-right&quot;&gt;000000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;FECHA:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;00/00/00 00:00:00 PM&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;NRO CUENTA:&lt;/td&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-left&quot;&gt;000000******0000    &lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;&#39;0&#39;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td class=&quot;normal-left&quot;&gt;NRO. REF.:&lt;/td&gt;
                                &lt;td class=&quot;normal-left&quot;&gt;000000&lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;LOTE:&lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;APROBACION: &lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;SECUENCIA:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;
                                    &lt;br /&gt;
                                    MONTO BS.  0,00
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr style=&quot;margin-top: 10px;&quot;&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;RIF: J-000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;
                                    &lt;b&gt;
                                        &lt;br /&gt;
                                    &lt;/b&gt;
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;
                                    &lt;br /&gt;debito
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;ID:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;000000000000000000&lt;/td&gt;
                            &lt;/tr&gt;
                        &lt;/table&gt;
                    &lt;/div&gt;
                &lt;/div&gt;
            &lt;/td&gt;
        &lt;/tr&gt;
    &lt;/tbody&gt;
&lt;/table&gt;



";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'l6bsuhb8on41kj8ib6retfsmauq2olie', N'::1', 1552944191, N'__ci_last_regenerate|i:1552943978;SemanaActual|i:12;DiaSemanaActual|i:2;DiaSemanaPago|i:13;')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'qn93vdstt711c146g655am9eseahkcs9', N'::1', 1553016022, N'__ci_last_regenerate|i:1553015808;SemanaActual|i:12;DiaSemanaActual|i:3;DiaSemanaPago|i:13;correo|s:14:"rosi@gmail.com";num_registro|s:10:"0000000010";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'dpkt3sal0q3cihmu3mt0vcnr3ue1ekbm', N'::1', 1553016427, N'__ci_last_regenerate|i:1553016121;SemanaActual|i:12;DiaSemanaActual|i:3;DiaSemanaPago|i:13;correo|s:14:"rosi@gmail.com";num_registro|s:10:"0000000010";ReciboPago|s:8592:"
&lt;table style=&quot;background-color: white;&quot;&gt;
    &lt;tbody&gt;
        &lt;tr&gt;
            &lt;td&gt;
                &lt;div style=&quot;border: 1px solid #222; padding: 9px; text-align: center; max-width:255px&quot; id=&quot;voucher&quot;&gt;

                    &lt;style type=&quot;text/css&quot;&gt;
                        .normal-left {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: left;
                        }

                        .normal-right {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: right;
                        }

                        .big-center {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: center;
                            font-weight: 900;
                        }

                        .big-center-especial {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: center;
                            font-weight: 900;
                            letter-spacing: .9em;
                        }

                        .big-left {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: left;
                            font-weight: 900;
                        }

                        .big-right {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: right;
                            font-weight: 900;
                        }

                        .normal-center {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: center;
                        }

                        #voucher td {
                            padding: 0;
                            margin: 0;
                        }
                    &lt;/style&gt;
                    &lt;div id=&quot;voucher&quot;&gt;
                        &lt;table&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-center&quot;&gt;COPIA - CLIENTE&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center-especial&quot;&gt;
                                    &lt;br /&gt;
                                    BANESCO
                                &lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;
                                    &lt;br /&gt;
                                    
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;TECNOLOGIA INSTAPAGO&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;DEMOSTRACI&amp;#211;N&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;J-000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-left&quot;&gt;000000000000&lt;/td&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-right&quot;&gt;000000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;FECHA:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;00/00/00 00:00:00 PM&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;NRO CUENTA:&lt;/td&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-left&quot;&gt;000000******0000    &lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;&#39;0&#39;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td class=&quot;normal-left&quot;&gt;NRO. REF.:&lt;/td&gt;
                                &lt;td class=&quot;normal-left&quot;&gt;000000&lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;LOTE:&lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;APROBACION: &lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;SECUENCIA:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;
                                    &lt;br /&gt;
                                    MONTO BS.  0,00
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr style=&quot;margin-top: 10px;&quot;&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;RIF: J-000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;
                                    &lt;b&gt;
                                        &lt;br /&gt;
                                    &lt;/b&gt;
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;
                                    &lt;br /&gt;debito
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;ID:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;000000000000000000&lt;/td&gt;
                            &lt;/tr&gt;
                        &lt;/table&gt;
                    &lt;/div&gt;
                &lt;/div&gt;
            &lt;/td&gt;
        &lt;/tr&gt;
    &lt;/tbody&gt;
&lt;/table&gt;



";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'0nvihfolabus260pd0s934g3m79ovp3v', N'::1', 1553016783, N'__ci_last_regenerate|i:1553016495;SemanaActual|i:12;DiaSemanaActual|i:3;DiaSemanaPago|i:13;correo|s:14:"rosi@gmail.com";num_registro|s:10:"0000000010";ReciboPago|s:8592:"
&lt;table style=&quot;background-color: white;&quot;&gt;
    &lt;tbody&gt;
        &lt;tr&gt;
            &lt;td&gt;
                &lt;div style=&quot;border: 1px solid #222; padding: 9px; text-align: center; max-width:255px&quot; id=&quot;voucher&quot;&gt;

                    &lt;style type=&quot;text/css&quot;&gt;
                        .normal-left {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: left;
                        }

                        .normal-right {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: right;
                        }

                        .big-center {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: center;
                            font-weight: 900;
                        }

                        .big-center-especial {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: center;
                            font-weight: 900;
                            letter-spacing: .9em;
                        }

                        .big-left {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: left;
                            font-weight: 900;
                        }

                        .big-right {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: right;
                            font-weight: 900;
                        }

                        .normal-center {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: center;
                        }

                        #voucher td {
                            padding: 0;
                            margin: 0;
                        }
                    &lt;/style&gt;
                    &lt;div id=&quot;voucher&quot;&gt;
                        &lt;table&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-center&quot;&gt;COPIA - CLIENTE&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center-especial&quot;&gt;
                                    &lt;br /&gt;
                                    BANESCO
                                &lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;
                                    &lt;br /&gt;
                                    
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;TECNOLOGIA INSTAPAGO&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;DEMOSTRACI&amp;#211;N&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;J-000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-left&quot;&gt;000000000000&lt;/td&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-right&quot;&gt;000000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;FECHA:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;00/00/00 00:00:00 PM&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;NRO CUENTA:&lt;/td&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-left&quot;&gt;000000******0000    &lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;&#39;0&#39;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td class=&quot;normal-left&quot;&gt;NRO. REF.:&lt;/td&gt;
                                &lt;td class=&quot;normal-left&quot;&gt;000000&lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;LOTE:&lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;APROBACION: &lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;SECUENCIA:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;
                                    &lt;br /&gt;
                                    MONTO BS.  0,00
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr style=&quot;margin-top: 10px;&quot;&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;RIF: J-000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;
                                    &lt;b&gt;
                                        &lt;br /&gt;
                                    &lt;/b&gt;
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;
                                    &lt;br /&gt;debito
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;ID:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;000000000000000000&lt;/td&gt;
                            &lt;/tr&gt;
                        &lt;/table&gt;
                    &lt;/div&gt;
                &lt;/div&gt;
            &lt;/td&gt;
        &lt;/tr&gt;
    &lt;/tbody&gt;
&lt;/table&gt;



";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'ts8h6o9tgusscgfujpck6ophgpvbce13', N'::1', 1553016848, N'__ci_last_regenerate|i:1553016847;SemanaActual|i:12;DiaSemanaActual|i:3;DiaSemanaPago|i:13;correo|s:14:"rosi@gmail.com";num_registro|s:10:"0000000010";ReciboPago|s:8592:"
&lt;table style=&quot;background-color: white;&quot;&gt;
    &lt;tbody&gt;
        &lt;tr&gt;
            &lt;td&gt;
                &lt;div style=&quot;border: 1px solid #222; padding: 9px; text-align: center; max-width:255px&quot; id=&quot;voucher&quot;&gt;

                    &lt;style type=&quot;text/css&quot;&gt;
                        .normal-left {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: left;
                        }

                        .normal-right {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: right;
                        }

                        .big-center {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: center;
                            font-weight: 900;
                        }

                        .big-center-especial {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: center;
                            font-weight: 900;
                            letter-spacing: .9em;
                        }

                        .big-left {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: left;
                            font-weight: 900;
                        }

                        .big-right {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: right;
                            font-weight: 900;
                        }

                        .normal-center {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: center;
                        }

                        #voucher td {
                            padding: 0;
                            margin: 0;
                        }
                    &lt;/style&gt;
                    &lt;div id=&quot;voucher&quot;&gt;
                        &lt;table&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-center&quot;&gt;COPIA - CLIENTE&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center-especial&quot;&gt;
                                    &lt;br /&gt;
                                    BANESCO
                                &lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;
                                    &lt;br /&gt;
                                    
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;TECNOLOGIA INSTAPAGO&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;DEMOSTRACI&amp;#211;N&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;J-000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-left&quot;&gt;000000000000&lt;/td&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-right&quot;&gt;000000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;FECHA:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;00/00/00 00:00:00 PM&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;NRO CUENTA:&lt;/td&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-left&quot;&gt;000000******0000    &lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;&#39;0&#39;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td class=&quot;normal-left&quot;&gt;NRO. REF.:&lt;/td&gt;
                                &lt;td class=&quot;normal-left&quot;&gt;000000&lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;LOTE:&lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;APROBACION: &lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;SECUENCIA:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;
                                    &lt;br /&gt;
                                    MONTO BS.  0,00
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr style=&quot;margin-top: 10px;&quot;&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;RIF: J-000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;
                                    &lt;b&gt;
                                        &lt;br /&gt;
                                    &lt;/b&gt;
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;
                                    &lt;br /&gt;debito
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;ID:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;000000000000000000&lt;/td&gt;
                            &lt;/tr&gt;
                        &lt;/table&gt;
                    &lt;/div&gt;
                &lt;/div&gt;
            &lt;/td&gt;
        &lt;/tr&gt;
    &lt;/tbody&gt;
&lt;/table&gt;



";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'3k7ucd6d3ssjh37v69rtsqmp40fv6jbi', N'::1', 1553025538, N'__ci_last_regenerate|i:1553025236;SemanaActual|i:12;DiaSemanaActual|i:3;DiaSemanaPago|i:13;num_registro|s:10:"0000000001";correo|s:13:"adr@gmail.com";ReciboPago|s:8592:"
&lt;table style=&quot;background-color: white;&quot;&gt;
    &lt;tbody&gt;
        &lt;tr&gt;
            &lt;td&gt;
                &lt;div style=&quot;border: 1px solid #222; padding: 9px; text-align: center; max-width:255px&quot; id=&quot;voucher&quot;&gt;

                    &lt;style type=&quot;text/css&quot;&gt;
                        .normal-left {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: left;
                        }

                        .normal-right {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: right;
                        }

                        .big-center {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: center;
                            font-weight: 900;
                        }

                        .big-center-especial {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: center;
                            font-weight: 900;
                            letter-spacing: .9em;
                        }

                        .big-left {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: left;
                            font-weight: 900;
                        }

                        .big-right {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: right;
                            font-weight: 900;
                        }

                        .normal-center {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: center;
                        }

                        #voucher td {
                            padding: 0;
                            margin: 0;
                        }
                    &lt;/style&gt;
                    &lt;div id=&quot;voucher&quot;&gt;
                        &lt;table&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-center&quot;&gt;COPIA - CLIENTE&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center-especial&quot;&gt;
                                    &lt;br /&gt;
                                    BANESCO
                                &lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;
                                    &lt;br /&gt;
                                    
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;TECNOLOGIA INSTAPAGO&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;DEMOSTRACI&amp;#211;N&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;J-000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-left&quot;&gt;000000000000&lt;/td&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-right&quot;&gt;000000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;FECHA:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;00/00/00 00:00:00 PM&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;NRO CUENTA:&lt;/td&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-left&quot;&gt;000000******0000    &lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;&#39;0&#39;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td class=&quot;normal-left&quot;&gt;NRO. REF.:&lt;/td&gt;
                                &lt;td class=&quot;normal-left&quot;&gt;000000&lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;LOTE:&lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;APROBACION: &lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;SECUENCIA:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;
                                    &lt;br /&gt;
                                    MONTO BS.  0,00
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr style=&quot;margin-top: 10px;&quot;&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;RIF: J-000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;
                                    &lt;b&gt;
                                        &lt;br /&gt;
                                    &lt;/b&gt;
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;
                                    &lt;br /&gt;debito
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;ID:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;000000000000000000&lt;/td&gt;
                            &lt;/tr&gt;
                        &lt;/table&gt;
                    &lt;/div&gt;
                &lt;/div&gt;
            &lt;/td&gt;
        &lt;/tr&gt;
    &lt;/tbody&gt;
&lt;/table&gt;



";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'rannfbq73jd37qhk93cg1t214vjvd7rf', N'::1', 1553025826, N'__ci_last_regenerate|i:1553025547;SemanaActual|i:12;DiaSemanaActual|i:3;DiaSemanaPago|i:13;num_registro|s:10:"0000000001";correo|s:13:"adr@gmail.com";ReciboPago|s:8592:"
&lt;table style=&quot;background-color: white;&quot;&gt;
    &lt;tbody&gt;
        &lt;tr&gt;
            &lt;td&gt;
                &lt;div style=&quot;border: 1px solid #222; padding: 9px; text-align: center; max-width:255px&quot; id=&quot;voucher&quot;&gt;

                    &lt;style type=&quot;text/css&quot;&gt;
                        .normal-left {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: left;
                        }

                        .normal-right {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: right;
                        }

                        .big-center {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: center;
                            font-weight: 900;
                        }

                        .big-center-especial {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: center;
                            font-weight: 900;
                            letter-spacing: .9em;
                        }

                        .big-left {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: left;
                            font-weight: 900;
                        }

                        .big-right {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: right;
                            font-weight: 900;
                        }

                        .normal-center {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: center;
                        }

                        #voucher td {
                            padding: 0;
                            margin: 0;
                        }
                    &lt;/style&gt;
                    &lt;div id=&quot;voucher&quot;&gt;
                        &lt;table&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-center&quot;&gt;COPIA - CLIENTE&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center-especial&quot;&gt;
                                    &lt;br /&gt;
                                    BANESCO
                                &lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;
                                    &lt;br /&gt;
                                    
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;TECNOLOGIA INSTAPAGO&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;DEMOSTRACI&amp;#211;N&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;J-000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-left&quot;&gt;000000000000&lt;/td&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-right&quot;&gt;000000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;FECHA:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;00/00/00 00:00:00 PM&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;NRO CUENTA:&lt;/td&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-left&quot;&gt;000000******0000    &lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;&#39;0&#39;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td class=&quot;normal-left&quot;&gt;NRO. REF.:&lt;/td&gt;
                                &lt;td class=&quot;normal-left&quot;&gt;000000&lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;LOTE:&lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;APROBACION: &lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;SECUENCIA:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;
                                    &lt;br /&gt;
                                    MONTO BS.  0,00
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr style=&quot;margin-top: 10px;&quot;&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;RIF: J-000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;
                                    &lt;b&gt;
                                        &lt;br /&gt;
                                    &lt;/b&gt;
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;
                                    &lt;br /&gt;debito
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;ID:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;000000000000000000&lt;/td&gt;
                            &lt;/tr&gt;
                        &lt;/table&gt;
                    &lt;/div&gt;
                &lt;/div&gt;
            &lt;/td&gt;
        &lt;/tr&gt;
    &lt;/tbody&gt;
&lt;/table&gt;



";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'2aaj9grja1mc2atj1b71ub5s43fg8efd', N'::1', 1553026125, N'__ci_last_regenerate|i:1553025856;SemanaActual|i:12;DiaSemanaActual|i:3;DiaSemanaPago|i:13;num_registro|s:10:"0000000001";correo|s:13:"adr@gmail.com";ReciboPago|s:8592:"
&lt;table style=&quot;background-color: white;&quot;&gt;
    &lt;tbody&gt;
        &lt;tr&gt;
            &lt;td&gt;
                &lt;div style=&quot;border: 1px solid #222; padding: 9px; text-align: center; max-width:255px&quot; id=&quot;voucher&quot;&gt;

                    &lt;style type=&quot;text/css&quot;&gt;
                        .normal-left {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: left;
                        }

                        .normal-right {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: right;
                        }

                        .big-center {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: center;
                            font-weight: 900;
                        }

                        .big-center-especial {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: center;
                            font-weight: 900;
                            letter-spacing: .9em;
                        }

                        .big-left {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: left;
                            font-weight: 900;
                        }

                        .big-right {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: right;
                            font-weight: 900;
                        }

                        .normal-center {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: center;
                        }

                        #voucher td {
                            padding: 0;
                            margin: 0;
                        }
                    &lt;/style&gt;
                    &lt;div id=&quot;voucher&quot;&gt;
                        &lt;table&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-center&quot;&gt;COPIA - CLIENTE&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center-especial&quot;&gt;
                                    &lt;br /&gt;
                                    BANESCO
                                &lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;
                                    &lt;br /&gt;
                                    
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;TECNOLOGIA INSTAPAGO&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;DEMOSTRACI&amp;#211;N&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;J-000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-left&quot;&gt;000000000000&lt;/td&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-right&quot;&gt;000000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;FECHA:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;00/00/00 00:00:00 PM&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;NRO CUENTA:&lt;/td&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-left&quot;&gt;000000******0000    &lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;&#39;0&#39;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td class=&quot;normal-left&quot;&gt;NRO. REF.:&lt;/td&gt;
                                &lt;td class=&quot;normal-left&quot;&gt;000000&lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;LOTE:&lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;APROBACION: &lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;SECUENCIA:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;
                                    &lt;br /&gt;
                                    MONTO BS.  0,00
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr style=&quot;margin-top: 10px;&quot;&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;RIF: J-000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;
                                    &lt;b&gt;
                                        &lt;br /&gt;
                                    &lt;/b&gt;
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;
                                    &lt;br /&gt;debito
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;ID:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;000000000000000000&lt;/td&gt;
                            &lt;/tr&gt;
                        &lt;/table&gt;
                    &lt;/div&gt;
                &lt;/div&gt;
            &lt;/td&gt;
        &lt;/tr&gt;
    &lt;/tbody&gt;
&lt;/table&gt;



";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'7ugv4kthbjg6td0aum2ro3vmi9shkmik', N'::1', 1552922428, N'__ci_last_regenerate|i:1552922112;SemanaActual|i:12;DiaSemanaActual|i:2;DiaSemanaPago|i:13;correo|s:22:"avelazquez@bigwise.com";num_registro|s:10:"0000000002";ReciboPago|s:8592:"
&lt;table style=&quot;background-color: white;&quot;&gt;
    &lt;tbody&gt;
        &lt;tr&gt;
            &lt;td&gt;
                &lt;div style=&quot;border: 1px solid #222; padding: 9px; text-align: center; max-width:255px&quot; id=&quot;voucher&quot;&gt;

                    &lt;style type=&quot;text/css&quot;&gt;
                        .normal-left {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: left;
                        }

                        .normal-right {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: right;
                        }

                        .big-center {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: center;
                            font-weight: 900;
                        }

                        .big-center-especial {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: center;
                            font-weight: 900;
                            letter-spacing: .9em;
                        }

                        .big-left {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: left;
                            font-weight: 900;
                        }

                        .big-right {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: right;
                            font-weight: 900;
                        }

                        .normal-center {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: center;
                        }

                        #voucher td {
                            padding: 0;
                            margin: 0;
                        }
                    &lt;/style&gt;
                    &lt;div id=&quot;voucher&quot;&gt;
                        &lt;table&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-center&quot;&gt;COPIA - CLIENTE&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center-especial&quot;&gt;
                                    &lt;br /&gt;
                                    BANESCO
                                &lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;
                                    &lt;br /&gt;
                                    
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;TECNOLOGIA INSTAPAGO&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;DEMOSTRACI&amp;#211;N&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;J-000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-left&quot;&gt;000000000000&lt;/td&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-right&quot;&gt;000000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;FECHA:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;00/00/00 00:00:00 PM&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;NRO CUENTA:&lt;/td&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-left&quot;&gt;000000******0000    &lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;&#39;0&#39;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td class=&quot;normal-left&quot;&gt;NRO. REF.:&lt;/td&gt;
                                &lt;td class=&quot;normal-left&quot;&gt;000000&lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;LOTE:&lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;APROBACION: &lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;SECUENCIA:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;
                                    &lt;br /&gt;
                                    MONTO BS.  0,00
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr style=&quot;margin-top: 10px;&quot;&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;RIF: J-000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;
                                    &lt;b&gt;
                                        &lt;br /&gt;
                                    &lt;/b&gt;
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;
                                    &lt;br /&gt;debito
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;ID:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;000000000000000000&lt;/td&gt;
                            &lt;/tr&gt;
                        &lt;/table&gt;
                    &lt;/div&gt;
                &lt;/div&gt;
            &lt;/td&gt;
        &lt;/tr&gt;
    &lt;/tbody&gt;
&lt;/table&gt;



";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'p7mfce6sbnc60v7fovtr8ppv9npqc8tq', N'::1', 1552922485, N'__ci_last_regenerate|i:1552922431;SemanaActual|i:12;DiaSemanaActual|i:2;DiaSemanaPago|i:13;correo|s:22:"avelazquez@bigwise.com";num_registro|s:10:"0000000002";ReciboPago|s:8592:"
&lt;table style=&quot;background-color: white;&quot;&gt;
    &lt;tbody&gt;
        &lt;tr&gt;
            &lt;td&gt;
                &lt;div style=&quot;border: 1px solid #222; padding: 9px; text-align: center; max-width:255px&quot; id=&quot;voucher&quot;&gt;

                    &lt;style type=&quot;text/css&quot;&gt;
                        .normal-left {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: left;
                        }

                        .normal-right {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: right;
                        }

                        .big-center {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: center;
                            font-weight: 900;
                        }

                        .big-center-especial {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: center;
                            font-weight: 900;
                            letter-spacing: .9em;
                        }

                        .big-left {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: left;
                            font-weight: 900;
                        }

                        .big-right {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: right;
                            font-weight: 900;
                        }

                        .normal-center {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: center;
                        }

                        #voucher td {
                            padding: 0;
                            margin: 0;
                        }
                    &lt;/style&gt;
                    &lt;div id=&quot;voucher&quot;&gt;
                        &lt;table&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-center&quot;&gt;COPIA - CLIENTE&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center-especial&quot;&gt;
                                    &lt;br /&gt;
                                    BANESCO
                                &lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;
                                    &lt;br /&gt;
                                    
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;TECNOLOGIA INSTAPAGO&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;DEMOSTRACI&amp;#211;N&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;J-000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-left&quot;&gt;000000000000&lt;/td&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-right&quot;&gt;000000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;FECHA:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;00/00/00 00:00:00 PM&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;NRO CUENTA:&lt;/td&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-left&quot;&gt;000000******0000    &lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;&#39;0&#39;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td class=&quot;normal-left&quot;&gt;NRO. REF.:&lt;/td&gt;
                                &lt;td class=&quot;normal-left&quot;&gt;000000&lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;LOTE:&lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;APROBACION: &lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;SECUENCIA:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;
                                    &lt;br /&gt;
                                    MONTO BS.  0,00
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr style=&quot;margin-top: 10px;&quot;&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;RIF: J-000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;
                                    &lt;b&gt;
                                        &lt;br /&gt;
                                    &lt;/b&gt;
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;
                                    &lt;br /&gt;debito
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;ID:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;000000000000000000&lt;/td&gt;
                            &lt;/tr&gt;
                        &lt;/table&gt;
                    &lt;/div&gt;
                &lt;/div&gt;
            &lt;/td&gt;
        &lt;/tr&gt;
    &lt;/tbody&gt;
&lt;/table&gt;



";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'ara4mfdjkivka4a9lnsv4vcd0ma1filt', N'::1', 1552923232, N'__ci_last_regenerate|i:1552922919;SemanaActual|i:12;DiaSemanaActual|i:2;DiaSemanaPago|i:13;correo|s:22:"avelazquez@bigwise.com";num_registro|s:10:"0000000002";ReciboPago|s:8592:"
&lt;table style=&quot;background-color: white;&quot;&gt;
    &lt;tbody&gt;
        &lt;tr&gt;
            &lt;td&gt;
                &lt;div style=&quot;border: 1px solid #222; padding: 9px; text-align: center; max-width:255px&quot; id=&quot;voucher&quot;&gt;

                    &lt;style type=&quot;text/css&quot;&gt;
                        .normal-left {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: left;
                        }

                        .normal-right {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: right;
                        }

                        .big-center {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: center;
                            font-weight: 900;
                        }

                        .big-center-especial {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: center;
                            font-weight: 900;
                            letter-spacing: .9em;
                        }

                        .big-left {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: left;
                            font-weight: 900;
                        }

                        .big-right {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: right;
                            font-weight: 900;
                        }

                        .normal-center {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: center;
                        }

                        #voucher td {
                            padding: 0;
                            margin: 0;
                        }
                    &lt;/style&gt;
                    &lt;div id=&quot;voucher&quot;&gt;
                        &lt;table&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-center&quot;&gt;COPIA - CLIENTE&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center-especial&quot;&gt;
                                    &lt;br /&gt;
                                    BANESCO
                                &lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;
                                    &lt;br /&gt;
                                    
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;TECNOLOGIA INSTAPAGO&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;DEMOSTRACI&amp;#211;N&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;J-000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-left&quot;&gt;000000000000&lt;/td&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-right&quot;&gt;000000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;FECHA:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;00/00/00 00:00:00 PM&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;NRO CUENTA:&lt;/td&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-left&quot;&gt;000000******0000    &lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;&#39;0&#39;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td class=&quot;normal-left&quot;&gt;NRO. REF.:&lt;/td&gt;
                                &lt;td class=&quot;normal-left&quot;&gt;000000&lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;LOTE:&lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;APROBACION: &lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;SECUENCIA:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;
                                    &lt;br /&gt;
                                    MONTO BS.  0,00
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr style=&quot;margin-top: 10px;&quot;&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;RIF: J-000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;
                                    &lt;b&gt;
                                        &lt;br /&gt;
                                    &lt;/b&gt;
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;
                                    &lt;br /&gt;debito
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;ID:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;000000000000000000&lt;/td&gt;
                            &lt;/tr&gt;
                        &lt;/table&gt;
                    &lt;/div&gt;
                &lt;/div&gt;
            &lt;/td&gt;
        &lt;/tr&gt;
    &lt;/tbody&gt;
&lt;/table&gt;



";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'afqaku4ao5p33rjrdvmcsqa6p985ce1o', N'::1', 1552931164, N'__ci_last_regenerate|i:1552923666;SemanaActual|i:12;DiaSemanaActual|i:2;DiaSemanaPago|i:13;correo|s:22:"avelazquez@bigwise.com";num_registro|s:10:"0000000002";ReciboPago|s:8592:"
&lt;table style=&quot;background-color: white;&quot;&gt;
    &lt;tbody&gt;
        &lt;tr&gt;
            &lt;td&gt;
                &lt;div style=&quot;border: 1px solid #222; padding: 9px; text-align: center; max-width:255px&quot; id=&quot;voucher&quot;&gt;

                    &lt;style type=&quot;text/css&quot;&gt;
                        .normal-left {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: left;
                        }

                        .normal-right {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: right;
                        }

                        .big-center {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: center;
                            font-weight: 900;
                        }

                        .big-center-especial {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: center;
                            font-weight: 900;
                            letter-spacing: .9em;
                        }

                        .big-left {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: left;
                            font-weight: 900;
                        }

                        .big-right {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: right;
                            font-weight: 900;
                        }

                        .normal-center {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: center;
                        }

                        #voucher td {
                            padding: 0;
                            margin: 0;
                        }
                    &lt;/style&gt;
                    &lt;div id=&quot;voucher&quot;&gt;
                        &lt;table&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-center&quot;&gt;COPIA - CLIENTE&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center-especial&quot;&gt;
                                    &lt;br /&gt;
                                    BANESCO
                                &lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;
                                    &lt;br /&gt;
                                    
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;TECNOLOGIA INSTAPAGO&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;DEMOSTRACI&amp;#211;N&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;J-000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-left&quot;&gt;000000000000&lt;/td&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-right&quot;&gt;000000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;FECHA:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;00/00/00 00:00:00 PM&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;NRO CUENTA:&lt;/td&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-left&quot;&gt;000000******0000    &lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;&#39;0&#39;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td class=&quot;normal-left&quot;&gt;NRO. REF.:&lt;/td&gt;
                                &lt;td class=&quot;normal-left&quot;&gt;000000&lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;LOTE:&lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;APROBACION: &lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;SECUENCIA:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;
                                    &lt;br /&gt;
                                    MONTO BS.  0,00
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr style=&quot;margin-top: 10px;&quot;&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;RIF: J-000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;
                                    &lt;b&gt;
                                        &lt;br /&gt;
                                    &lt;/b&gt;
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;
                                    &lt;br /&gt;debito
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;ID:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;000000000000000000&lt;/td&gt;
                            &lt;/tr&gt;
                        &lt;/table&gt;
                    &lt;/div&gt;
                &lt;/div&gt;
            &lt;/td&gt;
        &lt;/tr&gt;
    &lt;/tbody&gt;
&lt;/table&gt;



";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'rs60nd96dn8f5m92fs37lc8qljhp8rmh', N'::1', 1553026405, N'__ci_last_regenerate|i:1553026161;SemanaActual|i:12;DiaSemanaActual|i:3;DiaSemanaPago|i:13;num_registro|s:10:"0000000001";correo|s:13:"adr@gmail.com";ReciboPago|s:8592:"
&lt;table style=&quot;background-color: white;&quot;&gt;
    &lt;tbody&gt;
        &lt;tr&gt;
            &lt;td&gt;
                &lt;div style=&quot;border: 1px solid #222; padding: 9px; text-align: center; max-width:255px&quot; id=&quot;voucher&quot;&gt;

                    &lt;style type=&quot;text/css&quot;&gt;
                        .normal-left {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: left;
                        }

                        .normal-right {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: right;
                        }

                        .big-center {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: center;
                            font-weight: 900;
                        }

                        .big-center-especial {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: center;
                            font-weight: 900;
                            letter-spacing: .9em;
                        }

                        .big-left {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: left;
                            font-weight: 900;
                        }

                        .big-right {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: right;
                            font-weight: 900;
                        }

                        .normal-center {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: center;
                        }

                        #voucher td {
                            padding: 0;
                            margin: 0;
                        }
                    &lt;/style&gt;
                    &lt;div id=&quot;voucher&quot;&gt;
                        &lt;table&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-center&quot;&gt;COPIA - CLIENTE&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center-especial&quot;&gt;
                                    &lt;br /&gt;
                                    BANESCO
                                &lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;
                                    &lt;br /&gt;
                                    
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;TECNOLOGIA INSTAPAGO&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;DEMOSTRACI&amp;#211;N&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;J-000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-left&quot;&gt;000000000000&lt;/td&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-right&quot;&gt;000000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;FECHA:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;00/00/00 00:00:00 PM&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;NRO CUENTA:&lt;/td&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-left&quot;&gt;000000******0000    &lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;&#39;0&#39;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td class=&quot;normal-left&quot;&gt;NRO. REF.:&lt;/td&gt;
                                &lt;td class=&quot;normal-left&quot;&gt;000000&lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;LOTE:&lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;APROBACION: &lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;SECUENCIA:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;
                                    &lt;br /&gt;
                                    MONTO BS.  0,00
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr style=&quot;margin-top: 10px;&quot;&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;RIF: J-000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;
                                    &lt;b&gt;
                                        &lt;br /&gt;
                                    &lt;/b&gt;
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;
                                    &lt;br /&gt;debito
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;ID:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;000000000000000000&lt;/td&gt;
                            &lt;/tr&gt;
                        &lt;/table&gt;
                    &lt;/div&gt;
                &lt;/div&gt;
            &lt;/td&gt;
        &lt;/tr&gt;
    &lt;/tbody&gt;
&lt;/table&gt;



";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'1eqkvlkhrb2hdp6kd2t0d16lropm7btn', N'::1', 1553026622, N'__ci_last_regenerate|i:1553026521;SemanaActual|i:12;DiaSemanaActual|i:3;DiaSemanaPago|i:13;num_registro|s:10:"0000000001";correo|s:13:"adr@gmail.com";ReciboPago|s:8592:"
&lt;table style=&quot;background-color: white;&quot;&gt;
    &lt;tbody&gt;
        &lt;tr&gt;
            &lt;td&gt;
                &lt;div style=&quot;border: 1px solid #222; padding: 9px; text-align: center; max-width:255px&quot; id=&quot;voucher&quot;&gt;

                    &lt;style type=&quot;text/css&quot;&gt;
                        .normal-left {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: left;
                        }

                        .normal-right {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: right;
                        }

                        .big-center {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: center;
                            font-weight: 900;
                        }

                        .big-center-especial {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: center;
                            font-weight: 900;
                            letter-spacing: .9em;
                        }

                        .big-left {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: left;
                            font-weight: 900;
                        }

                        .big-right {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: right;
                            font-weight: 900;
                        }

                        .normal-center {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: center;
                        }

                        #voucher td {
                            padding: 0;
                            margin: 0;
                        }
                    &lt;/style&gt;
                    &lt;div id=&quot;voucher&quot;&gt;
                        &lt;table&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-center&quot;&gt;COPIA - CLIENTE&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center-especial&quot;&gt;
                                    &lt;br /&gt;
                                    BANESCO
                                &lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;
                                    &lt;br /&gt;
                                    
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;TECNOLOGIA INSTAPAGO&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;DEMOSTRACI&amp;#211;N&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;J-000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-left&quot;&gt;000000000000&lt;/td&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-right&quot;&gt;000000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;FECHA:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;00/00/00 00:00:00 PM&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;NRO CUENTA:&lt;/td&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-left&quot;&gt;000000******0000    &lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;&#39;0&#39;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td class=&quot;normal-left&quot;&gt;NRO. REF.:&lt;/td&gt;
                                &lt;td class=&quot;normal-left&quot;&gt;000000&lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;LOTE:&lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;APROBACION: &lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;SECUENCIA:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;
                                    &lt;br /&gt;
                                    MONTO BS.  0,00
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr style=&quot;margin-top: 10px;&quot;&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;RIF: J-000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;
                                    &lt;b&gt;
                                        &lt;br /&gt;
                                    &lt;/b&gt;
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;
                                    &lt;br /&gt;debito
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;ID:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;000000000000000000&lt;/td&gt;
                            &lt;/tr&gt;
                        &lt;/table&gt;
                    &lt;/div&gt;
                &lt;/div&gt;
            &lt;/td&gt;
        &lt;/tr&gt;
    &lt;/tbody&gt;
&lt;/table&gt;



";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'57ktr88p2od982akc8j9ncl0kfuukrsu', N'::1', 1553027118, N'__ci_last_regenerate|i:1553026881;SemanaActual|i:12;DiaSemanaActual|i:3;DiaSemanaPago|i:13;num_registro|s:10:"0000000001";correo|s:13:"adr@gmail.com";ReciboPago|s:8592:"
&lt;table style=&quot;background-color: white;&quot;&gt;
    &lt;tbody&gt;
        &lt;tr&gt;
            &lt;td&gt;
                &lt;div style=&quot;border: 1px solid #222; padding: 9px; text-align: center; max-width:255px&quot; id=&quot;voucher&quot;&gt;

                    &lt;style type=&quot;text/css&quot;&gt;
                        .normal-left {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: left;
                        }

                        .normal-right {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: right;
                        }

                        .big-center {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: center;
                            font-weight: 900;
                        }

                        .big-center-especial {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: center;
                            font-weight: 900;
                            letter-spacing: .9em;
                        }

                        .big-left {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: left;
                            font-weight: 900;
                        }

                        .big-right {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: right;
                            font-weight: 900;
                        }

                        .normal-center {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: center;
                        }

                        #voucher td {
                            padding: 0;
                            margin: 0;
                        }
                    &lt;/style&gt;
                    &lt;div id=&quot;voucher&quot;&gt;
                        &lt;table&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-center&quot;&gt;COPIA - CLIENTE&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center-especial&quot;&gt;
                                    &lt;br /&gt;
                                    BANESCO
                                &lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;
                                    &lt;br /&gt;
                                    
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;TECNOLOGIA INSTAPAGO&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;DEMOSTRACI&amp;#211;N&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;J-000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-left&quot;&gt;000000000000&lt;/td&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-right&quot;&gt;000000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;FECHA:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;00/00/00 00:00:00 PM&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;NRO CUENTA:&lt;/td&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-left&quot;&gt;000000******0000    &lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;&#39;0&#39;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td class=&quot;normal-left&quot;&gt;NRO. REF.:&lt;/td&gt;
                                &lt;td class=&quot;normal-left&quot;&gt;000000&lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;LOTE:&lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;APROBACION: &lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;SECUENCIA:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;
                                    &lt;br /&gt;
                                    MONTO BS.  0,00
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr style=&quot;margin-top: 10px;&quot;&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;RIF: J-000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;
                                    &lt;b&gt;
                                        &lt;br /&gt;
                                    &lt;/b&gt;
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;
                                    &lt;br /&gt;debito
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;ID:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;000000000000000000&lt;/td&gt;
                            &lt;/tr&gt;
                        &lt;/table&gt;
                    &lt;/div&gt;
                &lt;/div&gt;
            &lt;/td&gt;
        &lt;/tr&gt;
    &lt;/tbody&gt;
&lt;/table&gt;



";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'7mjbbi347no73gel41kkoo8nflnbgmp8', N'::1', 1553027573, N'__ci_last_regenerate|i:1553027303;SemanaActual|i:12;DiaSemanaActual|i:3;DiaSemanaPago|i:13;num_registro|s:10:"0000000001";correo|s:13:"adr@gmail.com";ReciboPago|s:8592:"
&lt;table style=&quot;background-color: white;&quot;&gt;
    &lt;tbody&gt;
        &lt;tr&gt;
            &lt;td&gt;
                &lt;div style=&quot;border: 1px solid #222; padding: 9px; text-align: center; max-width:255px&quot; id=&quot;voucher&quot;&gt;

                    &lt;style type=&quot;text/css&quot;&gt;
                        .normal-left {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: left;
                        }

                        .normal-right {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: right;
                        }

                        .big-center {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: center;
                            font-weight: 900;
                        }

                        .big-center-especial {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: center;
                            font-weight: 900;
                            letter-spacing: .9em;
                        }

                        .big-left {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: left;
                            font-weight: 900;
                        }

                        .big-right {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: right;
                            font-weight: 900;
                        }

                        .normal-center {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: center;
                        }

                        #voucher td {
                            padding: 0;
                            margin: 0;
                        }
                    &lt;/style&gt;
                    &lt;div id=&quot;voucher&quot;&gt;
                        &lt;table&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-center&quot;&gt;COPIA - CLIENTE&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center-especial&quot;&gt;
                                    &lt;br /&gt;
                                    BANESCO
                                &lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;
                                    &lt;br /&gt;
                                    
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;TECNOLOGIA INSTAPAGO&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;DEMOSTRACI&amp;#211;N&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;J-000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-left&quot;&gt;000000000000&lt;/td&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-right&quot;&gt;000000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;FECHA:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;00/00/00 00:00:00 PM&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;NRO CUENTA:&lt;/td&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-left&quot;&gt;000000******0000    &lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;&#39;0&#39;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td class=&quot;normal-left&quot;&gt;NRO. REF.:&lt;/td&gt;
                                &lt;td class=&quot;normal-left&quot;&gt;000000&lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;LOTE:&lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;APROBACION: &lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;SECUENCIA:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;
                                    &lt;br /&gt;
                                    MONTO BS.  0,00
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr style=&quot;margin-top: 10px;&quot;&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;RIF: J-000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;
                                    &lt;b&gt;
                                        &lt;br /&gt;
                                    &lt;/b&gt;
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;
                                    &lt;br /&gt;debito
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;ID:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;000000000000000000&lt;/td&gt;
                            &lt;/tr&gt;
                        &lt;/table&gt;
                    &lt;/div&gt;
                &lt;/div&gt;
            &lt;/td&gt;
        &lt;/tr&gt;
    &lt;/tbody&gt;
&lt;/table&gt;



";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'769rg3obvl2584mbd7t1ktn6hdmqhtpj', N'::1', 1553027991, N'__ci_last_regenerate|i:1553027733;SemanaActual|i:12;DiaSemanaActual|i:3;DiaSemanaPago|i:13;num_registro|s:10:"0000000001";correo|s:13:"adr@gmail.com";ReciboPago|s:8592:"
&lt;table style=&quot;background-color: white;&quot;&gt;
    &lt;tbody&gt;
        &lt;tr&gt;
            &lt;td&gt;
                &lt;div style=&quot;border: 1px solid #222; padding: 9px; text-align: center; max-width:255px&quot; id=&quot;voucher&quot;&gt;

                    &lt;style type=&quot;text/css&quot;&gt;
                        .normal-left {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: left;
                        }

                        .normal-right {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: right;
                        }

                        .big-center {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: center;
                            font-weight: 900;
                        }

                        .big-center-especial {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: center;
                            font-weight: 900;
                            letter-spacing: .9em;
                        }

                        .big-left {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: left;
                            font-weight: 900;
                        }

                        .big-right {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: right;
                            font-weight: 900;
                        }

                        .normal-center {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: center;
                        }

                        #voucher td {
                            padding: 0;
                            margin: 0;
                        }
                    &lt;/style&gt;
                    &lt;div id=&quot;voucher&quot;&gt;
                        &lt;table&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-center&quot;&gt;COPIA - CLIENTE&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center-especial&quot;&gt;
                                    &lt;br /&gt;
                                    BANESCO
                                &lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;
                                    &lt;br /&gt;
                                    
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;TECNOLOGIA INSTAPAGO&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;DEMOSTRACI&amp;#211;N&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;J-000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-left&quot;&gt;000000000000&lt;/td&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-right&quot;&gt;000000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;FECHA:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;00/00/00 00:00:00 PM&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;NRO CUENTA:&lt;/td&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-left&quot;&gt;000000******0000    &lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;&#39;0&#39;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td class=&quot;normal-left&quot;&gt;NRO. REF.:&lt;/td&gt;
                                &lt;td class=&quot;normal-left&quot;&gt;000000&lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;LOTE:&lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;APROBACION: &lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;SECUENCIA:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;
                                    &lt;br /&gt;
                                    MONTO BS.  0,00
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr style=&quot;margin-top: 10px;&quot;&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;RIF: J-000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;
                                    &lt;b&gt;
                                        &lt;br /&gt;
                                    &lt;/b&gt;
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;
                                    &lt;br /&gt;debito
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;ID:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;000000000000000000&lt;/td&gt;
                            &lt;/tr&gt;
                        &lt;/table&gt;
                    &lt;/div&gt;
                &lt;/div&gt;
            &lt;/td&gt;
        &lt;/tr&gt;
    &lt;/tbody&gt;
&lt;/table&gt;



";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'5mpgt05tgsdfkp88va5tr4epb6qeopbr', N'::1', 1553028300, N'__ci_last_regenerate|i:1553028086;SemanaActual|i:12;DiaSemanaActual|i:3;DiaSemanaPago|i:13;num_registro|s:10:"0000000001";correo|s:13:"adr@gmail.com";ReciboPago|s:8592:"
&lt;table style=&quot;background-color: white;&quot;&gt;
    &lt;tbody&gt;
        &lt;tr&gt;
            &lt;td&gt;
                &lt;div style=&quot;border: 1px solid #222; padding: 9px; text-align: center; max-width:255px&quot; id=&quot;voucher&quot;&gt;

                    &lt;style type=&quot;text/css&quot;&gt;
                        .normal-left {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: left;
                        }

                        .normal-right {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: right;
                        }

                        .big-center {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: center;
                            font-weight: 900;
                        }

                        .big-center-especial {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: center;
                            font-weight: 900;
                            letter-spacing: .9em;
                        }

                        .big-left {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: left;
                            font-weight: 900;
                        }

                        .big-right {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: right;
                            font-weight: 900;
                        }

                        .normal-center {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: center;
                        }

                        #voucher td {
                            padding: 0;
                            margin: 0;
                        }
                    &lt;/style&gt;
                    &lt;div id=&quot;voucher&quot;&gt;
                        &lt;table&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-center&quot;&gt;COPIA - CLIENTE&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center-especial&quot;&gt;
                                    &lt;br /&gt;
                                    BANESCO
                                &lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;
                                    &lt;br /&gt;
                                    
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;TECNOLOGIA INSTAPAGO&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;DEMOSTRACI&amp;#211;N&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;J-000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-left&quot;&gt;000000000000&lt;/td&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-right&quot;&gt;000000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;FECHA:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;00/00/00 00:00:00 PM&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;NRO CUENTA:&lt;/td&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-left&quot;&gt;000000******0000    &lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;&#39;0&#39;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td class=&quot;normal-left&quot;&gt;NRO. REF.:&lt;/td&gt;
                                &lt;td class=&quot;normal-left&quot;&gt;000000&lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;LOTE:&lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;APROBACION: &lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;SECUENCIA:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;
                                    &lt;br /&gt;
                                    MONTO BS.  0,00
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr style=&quot;margin-top: 10px;&quot;&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;RIF: J-000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;
                                    &lt;b&gt;
                                        &lt;br /&gt;
                                    &lt;/b&gt;
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;
                                    &lt;br /&gt;debito
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;ID:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;000000000000000000&lt;/td&gt;
                            &lt;/tr&gt;
                        &lt;/table&gt;
                    &lt;/div&gt;
                &lt;/div&gt;
            &lt;/td&gt;
        &lt;/tr&gt;
    &lt;/tbody&gt;
&lt;/table&gt;



";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'971h8b18dv7q6sd9lebdp76ambm4as3u', N'::1', 1553028669, N'__ci_last_regenerate|i:1553028419;SemanaActual|i:12;DiaSemanaActual|i:3;DiaSemanaPago|i:13;num_registro|s:10:"0000000001";correo|s:13:"adr@gmail.com";ReciboPago|s:8592:"
&lt;table style=&quot;background-color: white;&quot;&gt;
    &lt;tbody&gt;
        &lt;tr&gt;
            &lt;td&gt;
                &lt;div style=&quot;border: 1px solid #222; padding: 9px; text-align: center; max-width:255px&quot; id=&quot;voucher&quot;&gt;

                    &lt;style type=&quot;text/css&quot;&gt;
                        .normal-left {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: left;
                        }

                        .normal-right {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: right;
                        }

                        .big-center {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: center;
                            font-weight: 900;
                        }

                        .big-center-especial {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: center;
                            font-weight: 900;
                            letter-spacing: .9em;
                        }

                        .big-left {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: left;
                            font-weight: 900;
                        }

                        .big-right {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: right;
                            font-weight: 900;
                        }

                        .normal-center {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: center;
                        }

                        #voucher td {
                            padding: 0;
                            margin: 0;
                        }
                    &lt;/style&gt;
                    &lt;div id=&quot;voucher&quot;&gt;
                        &lt;table&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-center&quot;&gt;COPIA - CLIENTE&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center-especial&quot;&gt;
                                    &lt;br /&gt;
                                    BANESCO
                                &lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;
                                    &lt;br /&gt;
                                    
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;TECNOLOGIA INSTAPAGO&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;DEMOSTRACI&amp;#211;N&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;J-000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-left&quot;&gt;000000000000&lt;/td&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-right&quot;&gt;000000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;FECHA:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;00/00/00 00:00:00 PM&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;NRO CUENTA:&lt;/td&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-left&quot;&gt;000000******0000    &lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;&#39;0&#39;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td class=&quot;normal-left&quot;&gt;NRO. REF.:&lt;/td&gt;
                                &lt;td class=&quot;normal-left&quot;&gt;000000&lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;LOTE:&lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;APROBACION: &lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;SECUENCIA:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;
                                    &lt;br /&gt;
                                    MONTO BS.  0,00
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr style=&quot;margin-top: 10px;&quot;&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;RIF: J-000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;
                                    &lt;b&gt;
                                        &lt;br /&gt;
                                    &lt;/b&gt;
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;
                                    &lt;br /&gt;debito
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;ID:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;000000000000000000&lt;/td&gt;
                            &lt;/tr&gt;
                        &lt;/table&gt;
                    &lt;/div&gt;
                &lt;/div&gt;
            &lt;/td&gt;
        &lt;/tr&gt;
    &lt;/tbody&gt;
&lt;/table&gt;



";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'a1u52k029ds3her4rjgb4c8h9cke1pb5', N'::1', 1553029124, N'__ci_last_regenerate|i:1553028883;SemanaActual|i:12;DiaSemanaActual|i:3;DiaSemanaPago|i:13;num_registro|s:10:"0000000001";correo|s:13:"adr@gmail.com";ReciboPago|s:8592:"
&lt;table style=&quot;background-color: white;&quot;&gt;
    &lt;tbody&gt;
        &lt;tr&gt;
            &lt;td&gt;
                &lt;div style=&quot;border: 1px solid #222; padding: 9px; text-align: center; max-width:255px&quot; id=&quot;voucher&quot;&gt;

                    &lt;style type=&quot;text/css&quot;&gt;
                        .normal-left {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: left;
                        }

                        .normal-right {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: right;
                        }

                        .big-center {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: center;
                            font-weight: 900;
                        }

                        .big-center-especial {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: center;
                            font-weight: 900;
                            letter-spacing: .9em;
                        }

                        .big-left {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: left;
                            font-weight: 900;
                        }

                        .big-right {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: right;
                            font-weight: 900;
                        }

                        .normal-center {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: center;
                        }

                        #voucher td {
                            padding: 0;
                            margin: 0;
                        }
                    &lt;/style&gt;
                    &lt;div id=&quot;voucher&quot;&gt;
                        &lt;table&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-center&quot;&gt;COPIA - CLIENTE&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center-especial&quot;&gt;
                                    &lt;br /&gt;
                                    BANESCO
                                &lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;
                                    &lt;br /&gt;
                                    
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;TECNOLOGIA INSTAPAGO&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;DEMOSTRACI&amp;#211;N&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;J-000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-left&quot;&gt;000000000000&lt;/td&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-right&quot;&gt;000000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;FECHA:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;00/00/00 00:00:00 PM&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;NRO CUENTA:&lt;/td&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-left&quot;&gt;000000******0000    &lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;&#39;0&#39;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td class=&quot;normal-left&quot;&gt;NRO. REF.:&lt;/td&gt;
                                &lt;td class=&quot;normal-left&quot;&gt;000000&lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;LOTE:&lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;APROBACION: &lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;SECUENCIA:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;
                                    &lt;br /&gt;
                                    MONTO BS.  0,00
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr style=&quot;margin-top: 10px;&quot;&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;RIF: J-000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;
                                    &lt;b&gt;
                                        &lt;br /&gt;
                                    &lt;/b&gt;
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;
                                    &lt;br /&gt;debito
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;ID:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;000000000000000000&lt;/td&gt;
                            &lt;/tr&gt;
                        &lt;/table&gt;
                    &lt;/div&gt;
                &lt;/div&gt;
            &lt;/td&gt;
        &lt;/tr&gt;
    &lt;/tbody&gt;
&lt;/table&gt;



";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N't8t2552a8igq97aks28ngop80gapmb2r', N'::1', 1553029429, N'__ci_last_regenerate|i:1553029184;SemanaActual|i:12;DiaSemanaActual|i:3;DiaSemanaPago|i:13;num_registro|s:10:"0000000001";correo|s:13:"adr@gmail.com";ReciboPago|s:8592:"
&lt;table style=&quot;background-color: white;&quot;&gt;
    &lt;tbody&gt;
        &lt;tr&gt;
            &lt;td&gt;
                &lt;div style=&quot;border: 1px solid #222; padding: 9px; text-align: center; max-width:255px&quot; id=&quot;voucher&quot;&gt;

                    &lt;style type=&quot;text/css&quot;&gt;
                        .normal-left {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: left;
                        }

                        .normal-right {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: right;
                        }

                        .big-center {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: center;
                            font-weight: 900;
                        }

                        .big-center-especial {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: center;
                            font-weight: 900;
                            letter-spacing: .9em;
                        }

                        .big-left {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: left;
                            font-weight: 900;
                        }

                        .big-right {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: right;
                            font-weight: 900;
                        }

                        .normal-center {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: center;
                        }

                        #voucher td {
                            padding: 0;
                            margin: 0;
                        }
                    &lt;/style&gt;
                    &lt;div id=&quot;voucher&quot;&gt;
                        &lt;table&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-center&quot;&gt;COPIA - CLIENTE&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center-especial&quot;&gt;
                                    &lt;br /&gt;
                                    BANESCO
                                &lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;
                                    &lt;br /&gt;
                                    
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;TECNOLOGIA INSTAPAGO&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;DEMOSTRACI&amp;#211;N&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;J-000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-left&quot;&gt;000000000000&lt;/td&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-right&quot;&gt;000000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;FECHA:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;00/00/00 00:00:00 PM&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;NRO CUENTA:&lt;/td&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-left&quot;&gt;000000******0000    &lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;&#39;0&#39;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td class=&quot;normal-left&quot;&gt;NRO. REF.:&lt;/td&gt;
                                &lt;td class=&quot;normal-left&quot;&gt;000000&lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;LOTE:&lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;APROBACION: &lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;SECUENCIA:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;
                                    &lt;br /&gt;
                                    MONTO BS.  0,00
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr style=&quot;margin-top: 10px;&quot;&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;RIF: J-000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;
                                    &lt;b&gt;
                                        &lt;br /&gt;
                                    &lt;/b&gt;
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;
                                    &lt;br /&gt;debito
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;ID:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;000000000000000000&lt;/td&gt;
                            &lt;/tr&gt;
                        &lt;/table&gt;
                    &lt;/div&gt;
                &lt;/div&gt;
            &lt;/td&gt;
        &lt;/tr&gt;
    &lt;/tbody&gt;
&lt;/table&gt;



";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'lg287ff088shuug2qfgge54s5801mb1s', N'::1', 1553029742, N'__ci_last_regenerate|i:1553029527;SemanaActual|i:12;DiaSemanaActual|i:3;DiaSemanaPago|i:13;num_registro|s:10:"0000000001";correo|s:13:"adr@gmail.com";ReciboPago|s:8592:"
&lt;table style=&quot;background-color: white;&quot;&gt;
    &lt;tbody&gt;
        &lt;tr&gt;
            &lt;td&gt;
                &lt;div style=&quot;border: 1px solid #222; padding: 9px; text-align: center; max-width:255px&quot; id=&quot;voucher&quot;&gt;

                    &lt;style type=&quot;text/css&quot;&gt;
                        .normal-left {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: left;
                        }

                        .normal-right {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: right;
                        }

                        .big-center {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: center;
                            font-weight: 900;
                        }

                        .big-center-especial {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: center;
                            font-weight: 900;
                            letter-spacing: .9em;
                        }

                        .big-left {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: left;
                            font-weight: 900;
                        }

                        .big-right {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: right;
                            font-weight: 900;
                        }

                        .normal-center {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: center;
                        }

                        #voucher td {
                            padding: 0;
                            margin: 0;
                        }
                    &lt;/style&gt;
                    &lt;div id=&quot;voucher&quot;&gt;
                        &lt;table&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-center&quot;&gt;COPIA - CLIENTE&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center-especial&quot;&gt;
                                    &lt;br /&gt;
                                    BANESCO
                                &lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;
                                    &lt;br /&gt;
                                    
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;TECNOLOGIA INSTAPAGO&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;DEMOSTRACI&amp;#211;N&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;J-000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-left&quot;&gt;000000000000&lt;/td&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-right&quot;&gt;000000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;FECHA:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;00/00/00 00:00:00 PM&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;NRO CUENTA:&lt;/td&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-left&quot;&gt;000000******0000    &lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;&#39;0&#39;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td class=&quot;normal-left&quot;&gt;NRO. REF.:&lt;/td&gt;
                                &lt;td class=&quot;normal-left&quot;&gt;000000&lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;LOTE:&lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;APROBACION: &lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;SECUENCIA:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;
                                    &lt;br /&gt;
                                    MONTO BS.  0,00
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr style=&quot;margin-top: 10px;&quot;&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;RIF: J-000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;
                                    &lt;b&gt;
                                        &lt;br /&gt;
                                    &lt;/b&gt;
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;
                                    &lt;br /&gt;debito
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;ID:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;000000000000000000&lt;/td&gt;
                            &lt;/tr&gt;
                        &lt;/table&gt;
                    &lt;/div&gt;
                &lt;/div&gt;
            &lt;/td&gt;
        &lt;/tr&gt;
    &lt;/tbody&gt;
&lt;/table&gt;



";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'u22d8jmjlord80rf2gvqtvguc0ncqms5', N'::1', 1553030056, N'__ci_last_regenerate|i:1553029935;SemanaActual|i:12;DiaSemanaActual|i:3;DiaSemanaPago|i:13;num_registro|s:10:"0000000001";correo|s:13:"adr@gmail.com";ReciboPago|s:8592:"
&lt;table style=&quot;background-color: white;&quot;&gt;
    &lt;tbody&gt;
        &lt;tr&gt;
            &lt;td&gt;
                &lt;div style=&quot;border: 1px solid #222; padding: 9px; text-align: center; max-width:255px&quot; id=&quot;voucher&quot;&gt;

                    &lt;style type=&quot;text/css&quot;&gt;
                        .normal-left {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: left;
                        }

                        .normal-right {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: right;
                        }

                        .big-center {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: center;
                            font-weight: 900;
                        }

                        .big-center-especial {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: center;
                            font-weight: 900;
                            letter-spacing: .9em;
                        }

                        .big-left {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: left;
                            font-weight: 900;
                        }

                        .big-right {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: right;
                            font-weight: 900;
                        }

                        .normal-center {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: center;
                        }

                        #voucher td {
                            padding: 0;
                            margin: 0;
                        }
                    &lt;/style&gt;
                    &lt;div id=&quot;voucher&quot;&gt;
                        &lt;table&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-center&quot;&gt;COPIA - CLIENTE&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center-especial&quot;&gt;
                                    &lt;br /&gt;
                                    BANESCO
                                &lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;
                                    &lt;br /&gt;
                                    
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;TECNOLOGIA INSTAPAGO&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;DEMOSTRACI&amp;#211;N&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;J-000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-left&quot;&gt;000000000000&lt;/td&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-right&quot;&gt;000000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;FECHA:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;00/00/00 00:00:00 PM&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;NRO CUENTA:&lt;/td&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-left&quot;&gt;000000******0000    &lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;&#39;0&#39;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td class=&quot;normal-left&quot;&gt;NRO. REF.:&lt;/td&gt;
                                &lt;td class=&quot;normal-left&quot;&gt;000000&lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;LOTE:&lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;APROBACION: &lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;SECUENCIA:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;
                                    &lt;br /&gt;
                                    MONTO BS.  0,00
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr style=&quot;margin-top: 10px;&quot;&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;RIF: J-000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;
                                    &lt;b&gt;
                                        &lt;br /&gt;
                                    &lt;/b&gt;
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;
                                    &lt;br /&gt;debito
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;ID:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;000000000000000000&lt;/td&gt;
                            &lt;/tr&gt;
                        &lt;/table&gt;
                    &lt;/div&gt;
                &lt;/div&gt;
            &lt;/td&gt;
        &lt;/tr&gt;
    &lt;/tbody&gt;
&lt;/table&gt;



";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'83qqrd92fbee2c8un098opavousghrnm', N'::1', 1553108363, N'__ci_last_regenerate|i:1553108062;SemanaActual|i:12;DiaSemanaActual|i:4;DiaSemanaPago|i:14;correo|s:13:"adr@gmail.com";num_registro|s:10:"0000000001";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'tl11k7ujd50127c67jo0r49l1p1nbh85', N'::1', 1553116411, N'__ci_last_regenerate|i:1553116174;SemanaActual|i:12;DiaSemanaActual|i:4;DiaSemanaPago|i:14;correo|s:13:"adr@gmail.com";num_registro|s:10:"0000000001";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'0bhguf73nm6626697s261dk0mspq4mhl', N'::1', 1553117055, N'__ci_last_regenerate|i:1553116529;SemanaActual|i:12;DiaSemanaActual|i:4;DiaSemanaPago|i:14;correo|s:13:"adr@gmail.com";num_registro|s:10:"0000000001";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'ketuj7u2480j0k5pmogikr1nahn12hpe', N'::1', 1553117054, N'__ci_last_regenerate|i:1553116922;SemanaActual|i:12;DiaSemanaActual|i:4;DiaSemanaPago|i:14;correo|s:13:"adr@gmail.com";num_registro|s:10:"0000000001";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'dcmnmqktk753htmgndlfm7busin3ohhn', N'::1', 1553117234, N'__ci_last_regenerate|i:1553117232;SemanaActual|i:12;DiaSemanaActual|i:4;DiaSemanaPago|i:14;correo|s:13:"adr@gmail.com";num_registro|s:10:"0000000001";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'urkv7g9b3tbd54m152128nrg0fksacvn', N'::1', 1553171819, N'__ci_last_regenerate|i:1553170927;SemanaActual|i:12;DiaSemanaActual|i:5;DiaSemanaPago|i:14;correo|s:20:"rosanaba@hotmail.com";num_registro|s:10:"0000000002";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'6o9cpf36d0kshhsik2t5gecssfgvliu4', N'::1', 1553171819, N'__ci_last_regenerate|i:1553171560;SemanaActual|i:12;DiaSemanaActual|i:5;DiaSemanaPago|i:14;correo|s:20:"rosanaba@hotmail.com";num_registro|s:10:"0000000003";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'qir83u2binlf78g6m3cka5rnqmf9huc6', N'::1', 1553172136, N'__ci_last_regenerate|i:1553171876;SemanaActual|i:12;DiaSemanaActual|i:5;DiaSemanaPago|i:14;correo|s:20:"rosanaba@hotmail.com";num_registro|s:10:"0000000004";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'btaiu5btens2r5n9grupctvedo5sjs67', N'::1', 1553172519, N'__ci_last_regenerate|i:1553172192;SemanaActual|i:12;DiaSemanaActual|i:5;DiaSemanaPago|i:14;correo|s:20:"rosanaba@hotmail.com";num_registro|s:10:"0000000006";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'2ippck72mdqoo0q7s40v2rd0m89221kq', N'::1', 1553175247, N'__ci_last_regenerate|i:1553175175;SemanaActual|i:12;DiaSemanaActual|i:5;DiaSemanaPago|i:14;correo|s:13:"adr@gmail.com";num_registro|s:10:"0000000001";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'c2o02geeb6mn6s2lsiumu9rt4f4qabjb', N'::1', 1553192569, N'__ci_last_regenerate|i:1553192308;SemanaActual|i:12;DiaSemanaActual|i:5;DiaSemanaPago|i:14;correo|s:13:"adr@gmail.com";num_registro|s:10:"0000000001";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'vfvfhei3lpplag5tju8sbm9c3rf9dvll', N'::1', 1553192835, N'__ci_last_regenerate|i:1553192662;SemanaActual|i:12;DiaSemanaActual|i:5;DiaSemanaPago|i:14;correo|s:13:"adr@gmail.com";num_registro|s:10:"0000000001";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'a1nttchug7u6vnctmtepnmvb8pf2a98c', N'::1', 1553195303, N'__ci_last_regenerate|i:1553192973;SemanaActual|i:12;DiaSemanaActual|i:5;DiaSemanaPago|i:14;correo|s:13:"adr@gmail.com";num_registro|s:10:"0000000001";ReciboPago|s:8592:"
&lt;table style=&quot;background-color: white;&quot;&gt;
    &lt;tbody&gt;
        &lt;tr&gt;
            &lt;td&gt;
                &lt;div style=&quot;border: 1px solid #222; padding: 9px; text-align: center; max-width:255px&quot; id=&quot;voucher&quot;&gt;

                    &lt;style type=&quot;text/css&quot;&gt;
                        .normal-left {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: left;
                        }

                        .normal-right {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: right;
                        }

                        .big-center {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: center;
                            font-weight: 900;
                        }

                        .big-center-especial {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: center;
                            font-weight: 900;
                            letter-spacing: .9em;
                        }

                        .big-left {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: left;
                            font-weight: 900;
                        }

                        .big-right {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: right;
                            font-weight: 900;
                        }

                        .normal-center {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: center;
                        }

                        #voucher td {
                            padding: 0;
                            margin: 0;
                        }
                    &lt;/style&gt;
                    &lt;div id=&quot;voucher&quot;&gt;
                        &lt;table&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-center&quot;&gt;COPIA - CLIENTE&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center-especial&quot;&gt;
                                    &lt;br /&gt;
                                    BANESCO
                                &lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;
                                    &lt;br /&gt;
                                    
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;TECNOLOGIA INSTAPAGO&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;DEMOSTRACI&amp;#211;N&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;J-000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-left&quot;&gt;000000000000&lt;/td&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-right&quot;&gt;000000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;FECHA:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;00/00/00 00:00:00 PM&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;NRO CUENTA:&lt;/td&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-left&quot;&gt;000000******0000    &lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;&#39;0&#39;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td class=&quot;normal-left&quot;&gt;NRO. REF.:&lt;/td&gt;
                                &lt;td class=&quot;normal-left&quot;&gt;000000&lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;LOTE:&lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;APROBACION: &lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;SECUENCIA:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;
                                    &lt;br /&gt;
                                    MONTO BS.  0,00
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr style=&quot;margin-top: 10px;&quot;&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;RIF: J-000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;
                                    &lt;b&gt;
                                        &lt;br /&gt;
                                    &lt;/b&gt;
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;
                                    &lt;br /&gt;debito
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;ID:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;000000000000000000&lt;/td&gt;
                            &lt;/tr&gt;
                        &lt;/table&gt;
                    &lt;/div&gt;
                &lt;/div&gt;
            &lt;/td&gt;
        &lt;/tr&gt;
    &lt;/tbody&gt;
&lt;/table&gt;



";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'9hb6i2pdebkma1nti078nqkouqifl33a', N'::1', 1553200535, N'__ci_last_regenerate|i:1553200096;SemanaActual|i:12;DiaSemanaActual|i:5;DiaSemanaPago|i:14;correo|s:13:"adr@gmail.com";num_registro|s:10:"0000000001";ReciboPago|s:0:"";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'qqteim80l9ja5tsmlb5u37r6fl5qqi7l', N'::1', 1553210865, N'__ci_last_regenerate|i:1553210660;SemanaActual|i:12;DiaSemanaActual|i:5;DiaSemanaPago|i:14;correo|s:13:"adr@gmail.com";num_registro|s:10:"0000000001";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'i21a3vrhfcglcnitnjob5djko8mb5bmm', N'::1', 1553213186, N'__ci_last_regenerate|i:1553212437;SemanaActual|i:12;DiaSemanaActual|i:5;DiaSemanaPago|i:14;correo|s:22:"avelazquez@bigwise.com";num_registro|s:10:"0000000001";ReciboPago|s:0:"";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'2okmpo8mopp4332irmv4cjj8dh723k9s', N'::1', 1553213446, N'__ci_last_regenerate|i:1553213443;')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'08rpe1qpn2mfr7uukj78e1viegvkkegn', N'::1', 1553213761, N'__ci_last_regenerate|i:1553213457;SemanaActual|i:12;DiaSemanaActual|i:5;DiaSemanaPago|i:14;num_registro|s:10:"0000000001";correo|s:22:"avelazquez@bigwise.com";ReciboPago|s:0:"";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'72ttn6j52ig592e3q5nqofbk5radlvnt', N'::1', 1553213923, N'__ci_last_regenerate|i:1553213923;')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'uroieius2rs5mk6scgjtapbojike30l5', N'::1', 1553213990, N'__ci_last_regenerate|i:1553213924;SemanaActual|i:12;DiaSemanaActual|i:5;DiaSemanaPago|i:14;num_registro|s:10:"0000000001";correo|s:22:"avelazquez@bigwise.com";ReciboPago|s:0:"";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'ktgmr7dfrpepqf5hgh5un73mgiqv7spg', N'::1', 1553216398, N'__ci_last_regenerate|i:1553216395;SemanaActual|i:12;DiaSemanaActual|i:5;DiaSemanaPago|i:14;num_registro|s:10:"0000000001";correo|s:22:"avelazquez@bigwise.com";ReciboPago|s:0:"";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'esl9o4sic4m0qt4ds5ookigm8rupelpu', N'::1', 1553216893, N'__ci_last_regenerate|i:1553216893;SemanaActual|i:12;DiaSemanaActual|i:5;DiaSemanaPago|i:14;num_registro|s:10:"0000000001";correo|s:22:"avelazquez@bigwise.com";ReciboPago|s:0:"";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'g8ph59m1vrcc3cgv21102o5nandblpkr', N'::1', 1553217463, N'__ci_last_regenerate|i:1553217214;SemanaActual|i:12;DiaSemanaActual|i:5;DiaSemanaPago|i:14;num_registro|s:10:"0000000001";correo|s:22:"avelazquez@bigwise.com";ReciboPago|s:0:"";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'83mihukqluro6ojmi52q3e40pn168n6a', N'::1', 1553217602, N'__ci_last_regenerate|i:1553217590;SemanaActual|i:12;DiaSemanaActual|i:5;DiaSemanaPago|i:14;num_registro|s:10:"0000000001";correo|s:22:"avelazquez@bigwise.com";ReciboPago|s:0:"";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'3gbd0eh3sngqi85c35u65o6d7sjt2hgo', N'::1', 1553218214, N'__ci_last_regenerate|i:1553217930;SemanaActual|i:12;DiaSemanaActual|i:5;DiaSemanaPago|i:14;num_registro|s:10:"0000000001";correo|s:22:"avelazquez@bigwise.com";ReciboPago|s:0:"";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'mfqrafn8062ro9r3m6ro2ijuho18tm85', N'::1', 1553218442, N'__ci_last_regenerate|i:1553218442;')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'ehu6gemg6lsece3qdtpdk597rlv87vtg', N'::1', 1553218795, N'__ci_last_regenerate|i:1553218701;SemanaActual|i:12;DiaSemanaActual|i:5;DiaSemanaPago|i:14;num_registro|s:10:"0000000001";correo|s:22:"avelazquez@bigwise.com";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'iv289u8iaial1ts8ad560t68h67gi9ln', N'::1', 1553219109, N'__ci_last_regenerate|i:1553219082;SemanaActual|i:12;DiaSemanaActual|i:5;DiaSemanaPago|i:14;num_registro|s:10:"0000000001";correo|s:22:"avelazquez@bigwise.com";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'kucpa4rlv8h6a5ijclrk7ptanffu2ooc', N'::1', 1553220108, N'__ci_last_regenerate|i:1553219818;SemanaActual|i:12;DiaSemanaActual|i:5;DiaSemanaPago|i:14;num_registro|s:10:"0000000001";correo|s:22:"avelazquez@bigwise.com";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'ildh4t1tosfdigkec8angqm25tlm9q1d', N'::1', 1553220691, N'__ci_last_regenerate|i:1553220584;SemanaActual|i:12;DiaSemanaActual|i:5;DiaSemanaPago|i:14;num_registro|s:10:"0000000001";correo|s:22:"avelazquez@bigwise.com";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'ica9pe0ckln5g41sras345g730d1kka8', N'::1', 1553221530, N'__ci_last_regenerate|i:1553221525;SemanaActual|i:12;DiaSemanaActual|i:5;DiaSemanaPago|i:14;')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'sce6384u28dp2a3g5j7n3l1uq5oqib34', N'::1', 1553227463, N'__ci_last_regenerate|i:1553227452;SemanaActual|i:12;DiaSemanaActual|i:5;DiaSemanaPago|i:14;num_registro|s:10:"0000000001";correo|s:22:"avelazquez@bigwise.com";ReciboPago|s:0:"";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'16oenuen73lvgpo83n4al9me33hkcpbg', N'::1', 1553228573, N'__ci_last_regenerate|i:1553228495;SemanaActual|i:12;DiaSemanaActual|i:5;DiaSemanaPago|i:14;num_registro|s:10:"0000000001";correo|s:22:"avelazquez@bigwise.com";ReciboPago|s:0:"";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'j0hi8t8aqk73dsobga96ct1fsc3gfc2a', N'::1', 1553261539, N'__ci_last_regenerate|i:1553259764;SemanaActual|i:12;DiaSemanaActual|i:6;DiaSemanaPago|i:14;correo|s:20:"lameda12@bigwise.com";num_registro|s:10:"0000000003";ReciboPago|s:0:"";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'j5e069b9q99vht4jg928mv5kr7uivtar', N'::1', 1553261780, N'__ci_last_regenerate|i:1553261539;SemanaActual|i:12;DiaSemanaActual|i:6;DiaSemanaPago|i:14;correo|s:20:"lameda12@bigwise.com";num_registro|s:10:"0000000003";ReciboPago|s:0:"";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'7bh4vivd910ajmie4v19od1mv4dc3pbc', N'::1', 1553171560, N'__ci_last_regenerate|i:1553171560;')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'jodt2namp9rntp8b9hkk12hcrpnuka92', N'::1', 1553172974, N'__ci_last_regenerate|i:1553172807;SemanaActual|i:12;DiaSemanaActual|i:5;DiaSemanaPago|i:14;correo|s:20:"rosanaba@hotmail.com";num_registro|s:10:"0000000006";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'gh6rvoqj44092kbeqictfvpqu1knqc1h', N'::1', 1553173871, N'__ci_last_regenerate|i:1553173656;SemanaActual|i:12;DiaSemanaActual|i:5;DiaSemanaPago|i:14;correo|s:20:"rosanaba@hotmail.com";num_registro|s:10:"0000000006";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'j2dlfu0u3ktj2j2tih3k6runrq9ku0rp', N'::1', 1553174170, N'__ci_last_regenerate|i:1553174049;SemanaActual|i:12;DiaSemanaActual|i:5;DiaSemanaPago|i:14;num_registro|s:10:"0000000006";correo|s:20:"rosanaba@hotmail.com";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'2caq682h6kf8t0ee9mna3103f65m1j3m', N'::1', 1553175726, N'__ci_last_regenerate|i:1553175483;SemanaActual|i:12;DiaSemanaActual|i:5;DiaSemanaPago|i:14;correo|s:13:"adr@gmail.com";num_registro|s:10:"0000000001";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N't1jel39o2j5egha1jnd43vr1r34805b3', N'::1', 1553175812, N'__ci_last_regenerate|i:1553175809;SemanaActual|i:12;DiaSemanaActual|i:5;DiaSemanaPago|i:14;correo|s:13:"adr@gmail.com";num_registro|s:10:"0000000001";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'pquvfvl3k414q26p8cemkeo697n8rf64', N'::1', 1553202489, N'__ci_last_regenerate|i:1553202302;SemanaActual|i:12;DiaSemanaActual|i:5;DiaSemanaPago|i:14;correo|s:13:"adr@gmail.com";num_registro|s:10:"0000000001";ReciboPago|s:0:"";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'8nlpcg1uee5ahmr77f1g56on5l54889m', N'::1', 1553263172, N'__ci_last_regenerate|i:1553263070;SemanaActual|i:12;DiaSemanaActual|i:6;DiaSemanaPago|i:14;correo|s:20:"lameda12@bigwise.com";num_registro|s:10:"0000000003";ReciboPago|s:0:"";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'5it76aj8mt6ga02h0shekjfei8avnkkh', N'::1', 1552925060, N'__ci_last_regenerate|i:1552924765;SemanaActual|i:12;DiaSemanaActual|i:2;DiaSemanaPago|i:13;correo|s:22:"avelazquez@bigwise.com";num_registro|s:10:"0000000002";ReciboPago|s:8592:"
&lt;table style=&quot;background-color: white;&quot;&gt;
    &lt;tbody&gt;
        &lt;tr&gt;
            &lt;td&gt;
                &lt;div style=&quot;border: 1px solid #222; padding: 9px; text-align: center; max-width:255px&quot; id=&quot;voucher&quot;&gt;

                    &lt;style type=&quot;text/css&quot;&gt;
                        .normal-left {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: left;
                        }

                        .normal-right {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: right;
                        }

                        .big-center {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: center;
                            font-weight: 900;
                        }

                        .big-center-especial {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: center;
                            font-weight: 900;
                            letter-spacing: .9em;
                        }

                        .big-left {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: left;
                            font-weight: 900;
                        }

                        .big-right {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: right;
                            font-weight: 900;
                        }

                        .normal-center {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: center;
                        }

                        #voucher td {
                            padding: 0;
                            margin: 0;
                        }
                    &lt;/style&gt;
                    &lt;div id=&quot;voucher&quot;&gt;
                        &lt;table&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-center&quot;&gt;COPIA - CLIENTE&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center-especial&quot;&gt;
                                    &lt;br /&gt;
                                    BANESCO
                                &lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;
                                    &lt;br /&gt;
                                    
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;TECNOLOGIA INSTAPAGO&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;DEMOSTRACI&amp;#211;N&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;J-000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-left&quot;&gt;000000000000&lt;/td&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-right&quot;&gt;000000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;FECHA:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;00/00/00 00:00:00 PM&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;NRO CUENTA:&lt;/td&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-left&quot;&gt;000000******0000    &lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;&#39;0&#39;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td class=&quot;normal-left&quot;&gt;NRO. REF.:&lt;/td&gt;
                                &lt;td class=&quot;normal-left&quot;&gt;000000&lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;LOTE:&lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;APROBACION: &lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;SECUENCIA:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;
                                    &lt;br /&gt;
                                    MONTO BS.  0,00
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr style=&quot;margin-top: 10px;&quot;&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;RIF: J-000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;
                                    &lt;b&gt;
                                        &lt;br /&gt;
                                    &lt;/b&gt;
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;
                                    &lt;br /&gt;debito
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;ID:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;000000000000000000&lt;/td&gt;
                            &lt;/tr&gt;
                        &lt;/table&gt;
                    &lt;/div&gt;
                &lt;/div&gt;
            &lt;/td&gt;
        &lt;/tr&gt;
    &lt;/tbody&gt;
&lt;/table&gt;



";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'2vtn7kit2tf8cngru39takaesglohq46', N'::1', 1552939142, N'__ci_last_regenerate|i:1552938960;SemanaActual|i:12;DiaSemanaActual|i:2;DiaSemanaPago|i:13;correo|s:22:"avelazquez@bigwise.com";num_registro|s:10:"0000000002";ReciboPago|s:8592:"
&lt;table style=&quot;background-color: white;&quot;&gt;
    &lt;tbody&gt;
        &lt;tr&gt;
            &lt;td&gt;
                &lt;div style=&quot;border: 1px solid #222; padding: 9px; text-align: center; max-width:255px&quot; id=&quot;voucher&quot;&gt;

                    &lt;style type=&quot;text/css&quot;&gt;
                        .normal-left {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: left;
                        }

                        .normal-right {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: right;
                        }

                        .big-center {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: center;
                            font-weight: 900;
                        }

                        .big-center-especial {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: center;
                            font-weight: 900;
                            letter-spacing: .9em;
                        }

                        .big-left {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: left;
                            font-weight: 900;
                        }

                        .big-right {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: right;
                            font-weight: 900;
                        }

                        .normal-center {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: center;
                        }

                        #voucher td {
                            padding: 0;
                            margin: 0;
                        }
                    &lt;/style&gt;
                    &lt;div id=&quot;voucher&quot;&gt;
                        &lt;table&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-center&quot;&gt;COPIA - CLIENTE&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center-especial&quot;&gt;
                                    &lt;br /&gt;
                                    BANESCO
                                &lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;
                                    &lt;br /&gt;
                                    
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;TECNOLOGIA INSTAPAGO&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;DEMOSTRACI&amp;#211;N&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;J-000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-left&quot;&gt;000000000000&lt;/td&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-right&quot;&gt;000000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;FECHA:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;00/00/00 00:00:00 PM&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;NRO CUENTA:&lt;/td&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-left&quot;&gt;000000******0000    &lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;&#39;0&#39;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td class=&quot;normal-left&quot;&gt;NRO. REF.:&lt;/td&gt;
                                &lt;td class=&quot;normal-left&quot;&gt;000000&lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;LOTE:&lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;APROBACION: &lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;SECUENCIA:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;
                                    &lt;br /&gt;
                                    MONTO BS.  0,00
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr style=&quot;margin-top: 10px;&quot;&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;RIF: J-000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;
                                    &lt;b&gt;
                                        &lt;br /&gt;
                                    &lt;/b&gt;
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;
                                    &lt;br /&gt;debito
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;ID:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;000000000000000000&lt;/td&gt;
                            &lt;/tr&gt;
                        &lt;/table&gt;
                    &lt;/div&gt;
                &lt;/div&gt;
            &lt;/td&gt;
        &lt;/tr&gt;
    &lt;/tbody&gt;
&lt;/table&gt;



";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'sj3po0rjg4h3i7fsbe96le7mvqie43cc', N'::1', 1552997499, N'__ci_last_regenerate|i:1552997407;SemanaActual|i:12;DiaSemanaActual|i:3;DiaSemanaPago|i:13;correo|s:22:"avelazquez@bigwise.com";num_registro|s:10:"0000000002";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'via1fihkaqka0dtda7p6no8fs07hkosf', N'::1', 1552999288, N'__ci_last_regenerate|i:1552998969;SemanaActual|i:12;DiaSemanaActual|i:3;DiaSemanaPago|i:13;correo|s:22:"avelazquez@bigwise.com";num_registro|s:10:"0000000002";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'd9e1vij8sld44cret160vhfbu783aubs', N'::1', 1552999553, N'__ci_last_regenerate|i:1552999413;SemanaActual|i:12;DiaSemanaActual|i:3;DiaSemanaPago|i:13;correo|s:22:"avelazquez@bigwise.com";num_registro|s:10:"0000000002";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'lm6srjijqpukt01nb0d89iouqpsuqdnn', N'::1', 1553000449, N'__ci_last_regenerate|i:1553000446;SemanaActual|i:12;DiaSemanaActual|i:3;DiaSemanaPago|i:13;correo|s:22:"avelazquez@bigwise.com";num_registro|s:10:"0000000002";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'r0qrnhd59dms008nkirtn13cd4h2b99p', N'::1', 1553019242, N'__ci_last_regenerate|i:1553019242;SemanaActual|i:12;DiaSemanaActual|i:3;DiaSemanaPago|i:13;correo|s:14:"rosi@gmail.com";num_registro|s:10:"0000000010";ReciboPago|s:8592:"
&lt;table style=&quot;background-color: white;&quot;&gt;
    &lt;tbody&gt;
        &lt;tr&gt;
            &lt;td&gt;
                &lt;div style=&quot;border: 1px solid #222; padding: 9px; text-align: center; max-width:255px&quot; id=&quot;voucher&quot;&gt;

                    &lt;style type=&quot;text/css&quot;&gt;
                        .normal-left {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: left;
                        }

                        .normal-right {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: right;
                        }

                        .big-center {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: center;
                            font-weight: 900;
                        }

                        .big-center-especial {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: center;
                            font-weight: 900;
                            letter-spacing: .9em;
                        }

                        .big-left {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: left;
                            font-weight: 900;
                        }

                        .big-right {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: right;
                            font-weight: 900;
                        }

                        .normal-center {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: center;
                        }

                        #voucher td {
                            padding: 0;
                            margin: 0;
                        }
                    &lt;/style&gt;
                    &lt;div id=&quot;voucher&quot;&gt;
                        &lt;table&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-center&quot;&gt;COPIA - CLIENTE&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center-especial&quot;&gt;
                                    &lt;br /&gt;
                                    BANESCO
                                &lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;
                                    &lt;br /&gt;
                                    
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;TECNOLOGIA INSTAPAGO&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;DEMOSTRACI&amp;#211;N&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;J-000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-left&quot;&gt;000000000000&lt;/td&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-right&quot;&gt;000000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;FECHA:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;00/00/00 00:00:00 PM&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;NRO CUENTA:&lt;/td&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-left&quot;&gt;000000******0000    &lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;&#39;0&#39;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td class=&quot;normal-left&quot;&gt;NRO. REF.:&lt;/td&gt;
                                &lt;td class=&quot;normal-left&quot;&gt;000000&lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;LOTE:&lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;APROBACION: &lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;SECUENCIA:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;
                                    &lt;br /&gt;
                                    MONTO BS.  0,00
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr style=&quot;margin-top: 10px;&quot;&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;RIF: J-000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;
                                    &lt;b&gt;
                                        &lt;br /&gt;
                                    &lt;/b&gt;
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;
                                    &lt;br /&gt;debito
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;ID:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;000000000000000000&lt;/td&gt;
                            &lt;/tr&gt;
                        &lt;/table&gt;
                    &lt;/div&gt;
                &lt;/div&gt;
            &lt;/td&gt;
        &lt;/tr&gt;
    &lt;/tbody&gt;
&lt;/table&gt;



";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'6hd42o0op3eqcnrsb326og0tq7o208hb', N'::1', 1553021137, N'__ci_last_regenerate|i:1553021064;SemanaActual|i:12;DiaSemanaActual|i:3;DiaSemanaPago|i:13;')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'vf35si3gnobit0kj5q39plau0vv06f6h', N'::1', 1553022726, N'__ci_last_regenerate|i:1553022725;SemanaActual|i:12;DiaSemanaActual|i:3;DiaSemanaPago|i:13;')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'16tsictolm7jocp5qomaaod8lk2snfus', N'::1', 1553023889, N'__ci_last_regenerate|i:1553023793;SemanaActual|i:12;DiaSemanaActual|i:3;DiaSemanaPago|i:13;correo|s:13:"adr@gmail.com";num_registro|s:10:"0000000001";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'1evntgvdsk0ldl1l0f6chf6v107iurqr', N'::1', 1553085405, N'__ci_last_regenerate|i:1553085295;SemanaActual|i:12;DiaSemanaActual|i:4;DiaSemanaPago|i:14;correo|s:13:"adr@gmail.com";num_registro|s:10:"0000000001";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'fl2572pi278u9tnqaput43rpm1n6nbjk', N'::1', 1553086242, N'__ci_last_regenerate|i:1553085951;SemanaActual|i:12;DiaSemanaActual|i:4;DiaSemanaPago|i:14;correo|s:13:"adr@gmail.com";num_registro|s:10:"0000000001";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'7ubhljjhcitnj4unaustf7hi6iv1jnge', N'::1', 1553086522, N'__ci_last_regenerate|i:1553086273;SemanaActual|i:12;DiaSemanaActual|i:4;DiaSemanaPago|i:14;correo|s:13:"adr@gmail.com";num_registro|s:10:"0000000001";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'sssvsv5tg4jl7e2aesendefaijk76ma1', N'::1', 1553086863, N'__ci_last_regenerate|i:1553086738;SemanaActual|i:12;DiaSemanaActual|i:4;DiaSemanaPago|i:14;correo|s:13:"adr@gmail.com";num_registro|s:10:"0000000001";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'bt3mjvnp4n84uuupbf2hlkc2pktic150', N'::1', 1553087117, N'__ci_last_regenerate|i:1553087114;SemanaActual|i:12;DiaSemanaActual|i:4;DiaSemanaPago|i:14;correo|s:13:"adr@gmail.com";num_registro|s:10:"0000000001";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'8i8fl8bl57sgp7hjif033m1ddeqorr42', N'::1', 1553088707, N'__ci_last_regenerate|i:1553088456;SemanaActual|i:12;DiaSemanaActual|i:4;DiaSemanaPago|i:14;correo|s:13:"adr@gmail.com";num_registro|s:10:"0000000001";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'poh767b7sc6gcas0i7c71skn8p8f8doh', N'::1', 1553088851, N'__ci_last_regenerate|i:1553088795;SemanaActual|i:12;DiaSemanaActual|i:4;DiaSemanaPago|i:14;correo|s:13:"adr@gmail.com";num_registro|s:10:"0000000001";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'm6192rvcv9hbvvtttb5cgict3q357egd', N'::1', 1553089397, N'__ci_last_regenerate|i:1553089163;SemanaActual|i:12;DiaSemanaActual|i:4;DiaSemanaPago|i:14;correo|s:13:"adr@gmail.com";num_registro|s:10:"0000000001";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'67u0ae3cj9f13b54g81mugqmt1vvlfkt', N'::1', 1553089637, N'__ci_last_regenerate|i:1553089599;SemanaActual|i:12;DiaSemanaActual|i:4;DiaSemanaPago|i:14;correo|s:13:"adr@gmail.com";num_registro|s:10:"0000000001";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'nq01vtd85vh3ledq97fd7et9o3d4kta6', N'::1', 1553090005, N'__ci_last_regenerate|i:1553090004;SemanaActual|i:12;DiaSemanaActual|i:4;DiaSemanaPago|i:14;correo|s:13:"adr@gmail.com";num_registro|s:10:"0000000001";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'2utcg3u4lfl7glbs71jsl27lm65n2o4m', N'::1', 1553090805, N'__ci_last_regenerate|i:1553090538;SemanaActual|i:12;DiaSemanaActual|i:4;DiaSemanaPago|i:14;correo|s:13:"adr@gmail.com";num_registro|s:10:"0000000001";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'g9ocah3an595gfs7u5vknm3t005ib70a', N'::1', 1553090858, N'__ci_last_regenerate|i:1553090857;SemanaActual|i:12;DiaSemanaActual|i:4;DiaSemanaPago|i:14;correo|s:13:"adr@gmail.com";num_registro|s:10:"0000000001";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'ba1oq1068uredvjqg04dh3hv96fp7rgf', N'::1', 1553091261, N'__ci_last_regenerate|i:1553091176;SemanaActual|i:12;DiaSemanaActual|i:4;DiaSemanaPago|i:14;correo|s:13:"adr@gmail.com";num_registro|s:10:"0000000001";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'qh990p1padn5iif0lh820s5lkd0ujf17', N'::1', 1553091591, N'__ci_last_regenerate|i:1553091505;SemanaActual|i:12;DiaSemanaActual|i:4;DiaSemanaPago|i:14;correo|s:13:"adr@gmail.com";num_registro|s:10:"0000000001";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'hmh3l759e5aopdkb5mftag9au1em6c1m', N'::1', 1553092182, N'__ci_last_regenerate|i:1553091897;SemanaActual|i:12;DiaSemanaActual|i:4;DiaSemanaPago|i:14;correo|s:13:"adr@gmail.com";num_registro|s:10:"0000000001";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'a21cj52l4m3asonpao911sv71cts66jv', N'::1', 1553092455, N'__ci_last_regenerate|i:1553092207;SemanaActual|i:12;DiaSemanaActual|i:4;DiaSemanaPago|i:14;correo|s:13:"adr@gmail.com";num_registro|s:10:"0000000001";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'af4p1iq4bl9kjhovkk84vjpgdvufac78', N'::1', 1553092664, N'__ci_last_regenerate|i:1553092631;SemanaActual|i:12;DiaSemanaActual|i:4;DiaSemanaPago|i:14;correo|s:13:"adr@gmail.com";num_registro|s:10:"0000000001";')
GO
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'44am1ppih0puetvtco21sqdmqaveihrf', N'::1', 1553095367, N'__ci_last_regenerate|i:1553095119;SemanaActual|i:12;DiaSemanaActual|i:4;DiaSemanaPago|i:14;correo|s:13:"adr@gmail.com";num_registro|s:10:"0000000001";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'9fk7g6q7e91c0bgvni63skbivbv34ulp', N'::1', 1553095773, N'__ci_last_regenerate|i:1553095530;SemanaActual|i:12;DiaSemanaActual|i:4;DiaSemanaPago|i:14;correo|s:13:"adr@gmail.com";num_registro|s:10:"0000000001";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'ghibds30ib1n1os7cb4vn1mbrde34555', N'::1', 1553097170, N'__ci_last_regenerate|i:1553097144;SemanaActual|i:12;DiaSemanaActual|i:4;DiaSemanaPago|i:14;correo|s:13:"adr@gmail.com";num_registro|s:10:"0000000001";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'1iph5os01f69f6uifus87o4hm55r87jh', N'::1', 1553097885, N'__ci_last_regenerate|i:1553097884;SemanaActual|i:12;DiaSemanaActual|i:4;DiaSemanaPago|i:14;correo|s:13:"adr@gmail.com";num_registro|s:10:"0000000001";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'j7q3hsjcgae0c58ca9lvb59o5upban6n', N'::1', 1553099450, N'__ci_last_regenerate|i:1553099165;SemanaActual|i:12;DiaSemanaActual|i:4;DiaSemanaPago|i:14;correo|s:13:"adr@gmail.com";num_registro|s:10:"0000000001";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'dlftg1j9c0bmev80rv8ct61f8rs3ib9j', N'::1', 1553099515, N'__ci_last_regenerate|i:1553099514;SemanaActual|i:12;DiaSemanaActual|i:4;DiaSemanaPago|i:14;correo|s:13:"adr@gmail.com";num_registro|s:10:"0000000001";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'2d7q9nanq2agmfqap42vlfp0d05b6ms0', N'::1', 1553104482, N'__ci_last_regenerate|i:1553104318;SemanaActual|i:12;DiaSemanaActual|i:4;DiaSemanaPago|i:14;correo|s:13:"adr@gmail.com";num_registro|s:10:"0000000001";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'v2vnhhu5djp187mr43rodmehoknchmht', N'::1', 1553105045, N'__ci_last_regenerate|i:1553104778;SemanaActual|i:12;DiaSemanaActual|i:4;DiaSemanaPago|i:14;correo|s:13:"adr@gmail.com";num_registro|s:10:"0000000001";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'c8s700j4qgkd320kni6268hhigvm7jt0', N'::1', 1553105479, N'__ci_last_regenerate|i:1553105182;SemanaActual|i:12;DiaSemanaActual|i:4;DiaSemanaPago|i:14;correo|s:13:"adr@gmail.com";num_registro|s:10:"0000000001";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'decj9ibsad78osim6ia2vb8tdc9dk1le', N'::1', 1553105747, N'__ci_last_regenerate|i:1553105610;SemanaActual|i:12;DiaSemanaActual|i:4;DiaSemanaPago|i:14;correo|s:13:"adr@gmail.com";num_registro|s:10:"0000000001";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'26ijrfnskoipf1m5vd16b1rhs9u69g9s', N'::1', 1553106232, N'__ci_last_regenerate|i:1553105993;SemanaActual|i:12;DiaSemanaActual|i:4;DiaSemanaPago|i:14;correo|s:13:"adr@gmail.com";num_registro|s:10:"0000000001";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'rccnlra4v4p2r7k61q1fb7dl2olqfrlt', N'::1', 1553106610, N'__ci_last_regenerate|i:1553106315;SemanaActual|i:12;DiaSemanaActual|i:4;DiaSemanaPago|i:14;correo|s:13:"adr@gmail.com";num_registro|s:10:"0000000001";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'4jh75op2podsf371ar9rl190m580s95a', N'::1', 1553108495, N'__ci_last_regenerate|i:1553108417;SemanaActual|i:12;DiaSemanaActual|i:4;DiaSemanaPago|i:14;correo|s:13:"adr@gmail.com";num_registro|s:10:"0000000001";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'54nlt7aef0g9iiiikgc9e5g3rorkpked', N'::1', 1553110296, N'__ci_last_regenerate|i:1553110116;SemanaActual|i:12;DiaSemanaActual|i:4;DiaSemanaPago|i:14;correo|s:13:"adr@gmail.com";num_registro|s:10:"0000000001";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'i9pt0e4en818q7f45vvj9rj9pcanoghm', N'::1', 1553110777, N'__ci_last_regenerate|i:1553110485;SemanaActual|i:12;DiaSemanaActual|i:4;DiaSemanaPago|i:14;correo|s:13:"adr@gmail.com";num_registro|s:10:"0000000001";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'tkkrkn54hu1i5ic8958gb3vqfq1cr0s7', N'::1', 1553110956, N'__ci_last_regenerate|i:1553110844;SemanaActual|i:12;DiaSemanaActual|i:4;DiaSemanaPago|i:14;correo|s:13:"adr@gmail.com";num_registro|s:10:"0000000001";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'4f93cb3rq8270lpcfb4up69edb98s7gi', N'::1', 1553111312, N'__ci_last_regenerate|i:1553111156;SemanaActual|i:12;DiaSemanaActual|i:4;DiaSemanaPago|i:14;correo|s:13:"adr@gmail.com";num_registro|s:10:"0000000001";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'krlaj3pjcgu4tv6ce5i7gio0820d01qd', N'::1', 1553111680, N'__ci_last_regenerate|i:1553111564;SemanaActual|i:12;DiaSemanaActual|i:4;DiaSemanaPago|i:14;correo|s:13:"adr@gmail.com";num_registro|s:10:"0000000001";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'aodbqar1b6ubth56ig67jrndij6jn497', N'::1', 1553199581, N'__ci_last_regenerate|i:1553199191;SemanaActual|i:12;DiaSemanaActual|i:5;DiaSemanaPago|i:14;correo|s:13:"adr@gmail.com";num_registro|s:10:"0000000001";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'5pc26ae7gppfps2214p08rbl6pmit1oh', N'::1', 1553199776, N'__ci_last_regenerate|i:1553199581;SemanaActual|i:12;DiaSemanaActual|i:5;DiaSemanaPago|i:14;correo|s:13:"adr@gmail.com";num_registro|s:10:"0000000001";ReciboPago|s:0:"";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'mk87vfnsmvkv1605bv53bilqv9cth08q', N'::1', 1553270424, N'__ci_last_regenerate|i:1553270294;SemanaActual|i:12;DiaSemanaActual|i:6;DiaSemanaPago|i:14;')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'rfsjke07ggp882839m03dtahffi2aclr', N'::1', 1553271067, N'__ci_last_regenerate|i:1553271067;SemanaActual|i:12;DiaSemanaActual|i:6;DiaSemanaPago|i:14;')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'99s63i1ghbr9fq51om62t249r613p0bk', N'::1', 1553113447, N'__ci_last_regenerate|i:1553113212;SemanaActual|i:12;DiaSemanaActual|i:4;DiaSemanaPago|i:14;correo|s:13:"adr@gmail.com";num_registro|s:10:"0000000001";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'8gjo3rpd0mbtvcbpn22g2rf4oug8rhjf', N'::1', 1553113557, N'__ci_last_regenerate|i:1553113544;SemanaActual|i:12;DiaSemanaActual|i:4;DiaSemanaPago|i:14;correo|s:13:"adr@gmail.com";num_registro|s:10:"0000000001";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'ntvjo7p1mt93slusi9rahhl8gt8dle3j', N'::1', 1553114636, N'__ci_last_regenerate|i:1553114359;SemanaActual|i:12;DiaSemanaActual|i:4;DiaSemanaPago|i:14;correo|s:13:"adr@gmail.com";num_registro|s:10:"0000000001";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'dst5i4uu1h4oe2qt3c4k53rn8ggkoqos', N'::1', 1553114807, N'__ci_last_regenerate|i:1553114686;SemanaActual|i:12;DiaSemanaActual|i:4;DiaSemanaPago|i:14;correo|s:13:"adr@gmail.com";num_registro|s:10:"0000000001";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'cjrqs4qj61beaifipi7bkk7i73s4g23b', N'::1', 1553262170, N'__ci_last_regenerate|i:1553262098;SemanaActual|i:12;DiaSemanaActual|i:6;DiaSemanaPago|i:14;correo|s:20:"lameda12@bigwise.com";num_registro|s:10:"0000000003";ReciboPago|s:0:"";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'eiboc0o0s0r8s5b5ooggskhucqc5d3cg', N'::1', 1553263024, N'__ci_last_regenerate|i:1553262728;SemanaActual|i:12;DiaSemanaActual|i:6;DiaSemanaPago|i:14;correo|s:20:"lameda12@bigwise.com";num_registro|s:10:"0000000003";ReciboPago|s:0:"";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'9enolm47psfrjt7peja5cg5lugidkl1t', N'::1', 1553225577, N'__ci_last_regenerate|i:1553225553;SemanaActual|i:12;DiaSemanaActual|i:5;DiaSemanaPago|i:14;num_registro|s:10:"0000000001";correo|s:22:"avelazquez@bigwise.com";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'7oa8i0rvl7acuac0kgj2mm7ti49t1vvl', N'::1', 1553226500, N'__ci_last_regenerate|i:1553226490;SemanaActual|i:12;DiaSemanaActual|i:5;DiaSemanaPago|i:14;num_registro|s:10:"0000000001";correo|s:22:"avelazquez@bigwise.com";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'gg4o5m0ed4gfjbtg40go67loc50faf3o', N'::1', 1553227061, N'__ci_last_regenerate|i:1553227039;SemanaActual|i:12;DiaSemanaActual|i:5;DiaSemanaPago|i:14;num_registro|s:10:"0000000001";correo|s:22:"avelazquez@bigwise.com";ReciboPago|s:0:"";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'5nuqvr16frflofjik7s3rbr2rkvvjomm', N'::1', 1552923697, N'__ci_last_regenerate|i:1552923226;SemanaActual|i:12;DiaSemanaActual|i:2;DiaSemanaPago|i:13;correo|s:22:"avelazquez@bigwise.com";num_registro|s:10:"0000000002";ReciboPago|s:8592:"
&lt;table style=&quot;background-color: white;&quot;&gt;
    &lt;tbody&gt;
        &lt;tr&gt;
            &lt;td&gt;
                &lt;div style=&quot;border: 1px solid #222; padding: 9px; text-align: center; max-width:255px&quot; id=&quot;voucher&quot;&gt;

                    &lt;style type=&quot;text/css&quot;&gt;
                        .normal-left {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: left;
                        }

                        .normal-right {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: right;
                        }

                        .big-center {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: center;
                            font-weight: 900;
                        }

                        .big-center-especial {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: center;
                            font-weight: 900;
                            letter-spacing: .9em;
                        }

                        .big-left {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: left;
                            font-weight: 900;
                        }

                        .big-right {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: right;
                            font-weight: 900;
                        }

                        .normal-center {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: center;
                        }

                        #voucher td {
                            padding: 0;
                            margin: 0;
                        }
                    &lt;/style&gt;
                    &lt;div id=&quot;voucher&quot;&gt;
                        &lt;table&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-center&quot;&gt;COPIA - CLIENTE&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center-especial&quot;&gt;
                                    &lt;br /&gt;
                                    BANESCO
                                &lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;
                                    &lt;br /&gt;
                                    
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;TECNOLOGIA INSTAPAGO&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;DEMOSTRACI&amp;#211;N&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;J-000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-left&quot;&gt;000000000000&lt;/td&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-right&quot;&gt;000000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;FECHA:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;00/00/00 00:00:00 PM&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;NRO CUENTA:&lt;/td&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-left&quot;&gt;000000******0000    &lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;&#39;0&#39;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td class=&quot;normal-left&quot;&gt;NRO. REF.:&lt;/td&gt;
                                &lt;td class=&quot;normal-left&quot;&gt;000000&lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;LOTE:&lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;APROBACION: &lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;SECUENCIA:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;
                                    &lt;br /&gt;
                                    MONTO BS.  0,00
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr style=&quot;margin-top: 10px;&quot;&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;RIF: J-000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;
                                    &lt;b&gt;
                                        &lt;br /&gt;
                                    &lt;/b&gt;
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;
                                    &lt;br /&gt;debito
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;ID:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;000000000000000000&lt;/td&gt;
                            &lt;/tr&gt;
                        &lt;/table&gt;
                    &lt;/div&gt;
                &lt;/div&gt;
            &lt;/td&gt;
        &lt;/tr&gt;
    &lt;/tbody&gt;
&lt;/table&gt;



";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'jqd9576s06rnmomvghvsq9nct5t481me', N'::1', 1553112008, N'__ci_last_regenerate|i:1553111876;SemanaActual|i:12;DiaSemanaActual|i:4;DiaSemanaPago|i:14;correo|s:13:"adr@gmail.com";num_registro|s:10:"0000000001";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'knti7mve9526a7re8vbnv0labam03nu1', N'::1', 1553112307, N'__ci_last_regenerate|i:1553112185;SemanaActual|i:12;DiaSemanaActual|i:4;DiaSemanaPago|i:14;correo|s:13:"adr@gmail.com";num_registro|s:10:"0000000001";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'590u2egilau259k03u56ak78d41a1tc0', N'::1', 1553112675, N'__ci_last_regenerate|i:1553112674;SemanaActual|i:12;DiaSemanaActual|i:4;DiaSemanaPago|i:14;correo|s:13:"adr@gmail.com";num_registro|s:10:"0000000001";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'k8aurcako6bduo97gaqgr35vnge20121', N'::1', 1553185460, N'__ci_last_regenerate|i:1553185200;SemanaActual|i:12;DiaSemanaActual|i:5;DiaSemanaPago|i:14;correo|s:13:"adr@gmail.com";num_registro|s:10:"0000000001";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'2n1arjvcsq0pnpv1njs7vqo5tsc4bq0q', N'::1', 1553185587, N'__ci_last_regenerate|i:1553185519;SemanaActual|i:12;DiaSemanaActual|i:5;DiaSemanaPago|i:14;correo|s:13:"adr@gmail.com";num_registro|s:10:"0000000001";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'0gmg8ciieg4sle7u64me6qo1puaeitnr', N'::1', 1553195725, N'__ci_last_regenerate|i:1553195542;SemanaActual|i:12;DiaSemanaActual|i:5;DiaSemanaPago|i:14;correo|s:13:"adr@gmail.com";num_registro|s:10:"0000000001";ReciboPago|s:8592:"
&lt;table style=&quot;background-color: white;&quot;&gt;
    &lt;tbody&gt;
        &lt;tr&gt;
            &lt;td&gt;
                &lt;div style=&quot;border: 1px solid #222; padding: 9px; text-align: center; max-width:255px&quot; id=&quot;voucher&quot;&gt;

                    &lt;style type=&quot;text/css&quot;&gt;
                        .normal-left {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: left;
                        }

                        .normal-right {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: right;
                        }

                        .big-center {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: center;
                            font-weight: 900;
                        }

                        .big-center-especial {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: center;
                            font-weight: 900;
                            letter-spacing: .9em;
                        }

                        .big-left {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: left;
                            font-weight: 900;
                        }

                        .big-right {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: right;
                            font-weight: 900;
                        }

                        .normal-center {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: center;
                        }

                        #voucher td {
                            padding: 0;
                            margin: 0;
                        }
                    &lt;/style&gt;
                    &lt;div id=&quot;voucher&quot;&gt;
                        &lt;table&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-center&quot;&gt;COPIA - CLIENTE&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center-especial&quot;&gt;
                                    &lt;br /&gt;
                                    BANESCO
                                &lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;
                                    &lt;br /&gt;
                                    
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;TECNOLOGIA INSTAPAGO&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;DEMOSTRACI&amp;#211;N&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;J-000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-left&quot;&gt;000000000000&lt;/td&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-right&quot;&gt;000000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;FECHA:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;00/00/00 00:00:00 PM&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;NRO CUENTA:&lt;/td&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-left&quot;&gt;000000******0000    &lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;&#39;0&#39;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td class=&quot;normal-left&quot;&gt;NRO. REF.:&lt;/td&gt;
                                &lt;td class=&quot;normal-left&quot;&gt;000000&lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;LOTE:&lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;APROBACION: &lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;SECUENCIA:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;
                                    &lt;br /&gt;
                                    MONTO BS.  0,00
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr style=&quot;margin-top: 10px;&quot;&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;RIF: J-000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;
                                    &lt;b&gt;
                                        &lt;br /&gt;
                                    &lt;/b&gt;
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;
                                    &lt;br /&gt;debito
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;ID:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;000000000000000000&lt;/td&gt;
                            &lt;/tr&gt;
                        &lt;/table&gt;
                    &lt;/div&gt;
                &lt;/div&gt;
            &lt;/td&gt;
        &lt;/tr&gt;
    &lt;/tbody&gt;
&lt;/table&gt;



";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'15k67kqtp0eb657t14ao2iapacn4ip5l', N'::1', 1553196136, N'__ci_last_regenerate|i:1553195847;SemanaActual|i:12;DiaSemanaActual|i:5;DiaSemanaPago|i:14;correo|s:13:"adr@gmail.com";num_registro|s:10:"0000000001";ReciboPago|s:8592:"
&lt;table style=&quot;background-color: white;&quot;&gt;
    &lt;tbody&gt;
        &lt;tr&gt;
            &lt;td&gt;
                &lt;div style=&quot;border: 1px solid #222; padding: 9px; text-align: center; max-width:255px&quot; id=&quot;voucher&quot;&gt;

                    &lt;style type=&quot;text/css&quot;&gt;
                        .normal-left {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: left;
                        }

                        .normal-right {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: right;
                        }

                        .big-center {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: center;
                            font-weight: 900;
                        }

                        .big-center-especial {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: center;
                            font-weight: 900;
                            letter-spacing: .9em;
                        }

                        .big-left {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: left;
                            font-weight: 900;
                        }

                        .big-right {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: right;
                            font-weight: 900;
                        }

                        .normal-center {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: center;
                        }

                        #voucher td {
                            padding: 0;
                            margin: 0;
                        }
                    &lt;/style&gt;
                    &lt;div id=&quot;voucher&quot;&gt;
                        &lt;table&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-center&quot;&gt;COPIA - CLIENTE&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center-especial&quot;&gt;
                                    &lt;br /&gt;
                                    BANESCO
                                &lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;
                                    &lt;br /&gt;
                                    
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;TECNOLOGIA INSTAPAGO&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;DEMOSTRACI&amp;#211;N&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;J-000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-left&quot;&gt;000000000000&lt;/td&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-right&quot;&gt;000000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;FECHA:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;00/00/00 00:00:00 PM&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;NRO CUENTA:&lt;/td&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-left&quot;&gt;000000******0000    &lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;&#39;0&#39;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td class=&quot;normal-left&quot;&gt;NRO. REF.:&lt;/td&gt;
                                &lt;td class=&quot;normal-left&quot;&gt;000000&lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;LOTE:&lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;APROBACION: &lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;SECUENCIA:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;
                                    &lt;br /&gt;
                                    MONTO BS.  0,00
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr style=&quot;margin-top: 10px;&quot;&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;RIF: J-000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;
                                    &lt;b&gt;
                                        &lt;br /&gt;
                                    &lt;/b&gt;
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;
                                    &lt;br /&gt;debito
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;ID:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;000000000000000000&lt;/td&gt;
                            &lt;/tr&gt;
                        &lt;/table&gt;
                    &lt;/div&gt;
                &lt;/div&gt;
            &lt;/td&gt;
        &lt;/tr&gt;
    &lt;/tbody&gt;
&lt;/table&gt;



";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'8rnl5mnkdem1skmb2gtud7c3nbrv288c', N'::1', 1553196318, N'__ci_last_regenerate|i:1553196186;SemanaActual|i:12;DiaSemanaActual|i:5;DiaSemanaPago|i:14;correo|s:13:"adr@gmail.com";num_registro|s:10:"0000000001";ReciboPago|s:8592:"
&lt;table style=&quot;background-color: white;&quot;&gt;
    &lt;tbody&gt;
        &lt;tr&gt;
            &lt;td&gt;
                &lt;div style=&quot;border: 1px solid #222; padding: 9px; text-align: center; max-width:255px&quot; id=&quot;voucher&quot;&gt;

                    &lt;style type=&quot;text/css&quot;&gt;
                        .normal-left {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: left;
                        }

                        .normal-right {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: right;
                        }

                        .big-center {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: center;
                            font-weight: 900;
                        }

                        .big-center-especial {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: center;
                            font-weight: 900;
                            letter-spacing: .9em;
                        }

                        .big-left {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: left;
                            font-weight: 900;
                        }

                        .big-right {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: right;
                            font-weight: 900;
                        }

                        .normal-center {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: center;
                        }

                        #voucher td {
                            padding: 0;
                            margin: 0;
                        }
                    &lt;/style&gt;
                    &lt;div id=&quot;voucher&quot;&gt;
                        &lt;table&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-center&quot;&gt;COPIA - CLIENTE&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center-especial&quot;&gt;
                                    &lt;br /&gt;
                                    BANESCO
                                &lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;
                                    &lt;br /&gt;
                                    
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;TECNOLOGIA INSTAPAGO&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;DEMOSTRACI&amp;#211;N&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;J-000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-left&quot;&gt;000000000000&lt;/td&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-right&quot;&gt;000000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;FECHA:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;00/00/00 00:00:00 PM&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;NRO CUENTA:&lt;/td&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-left&quot;&gt;000000******0000    &lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;&#39;0&#39;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td class=&quot;normal-left&quot;&gt;NRO. REF.:&lt;/td&gt;
                                &lt;td class=&quot;normal-left&quot;&gt;000000&lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;LOTE:&lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;APROBACION: &lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;SECUENCIA:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;
                                    &lt;br /&gt;
                                    MONTO BS.  0,00
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr style=&quot;margin-top: 10px;&quot;&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;RIF: J-000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;
                                    &lt;b&gt;
                                        &lt;br /&gt;
                                    &lt;/b&gt;
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;
                                    &lt;br /&gt;debito
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;ID:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;000000000000000000&lt;/td&gt;
                            &lt;/tr&gt;
                        &lt;/table&gt;
                    &lt;/div&gt;
                &lt;/div&gt;
            &lt;/td&gt;
        &lt;/tr&gt;
    &lt;/tbody&gt;
&lt;/table&gt;



";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'npnt251dunlras6ttpvjhfiaoe5481ns', N'::1', 1553198941, N'__ci_last_regenerate|i:1553196588;SemanaActual|i:12;DiaSemanaActual|i:5;DiaSemanaPago|i:14;correo|s:13:"adr@gmail.com";num_registro|s:10:"0000000001";ReciboPago|s:8592:"
&lt;table style=&quot;background-color: white;&quot;&gt;
    &lt;tbody&gt;
        &lt;tr&gt;
            &lt;td&gt;
                &lt;div style=&quot;border: 1px solid #222; padding: 9px; text-align: center; max-width:255px&quot; id=&quot;voucher&quot;&gt;

                    &lt;style type=&quot;text/css&quot;&gt;
                        .normal-left {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: left;
                        }

                        .normal-right {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: right;
                        }

                        .big-center {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: center;
                            font-weight: 900;
                        }

                        .big-center-especial {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: center;
                            font-weight: 900;
                            letter-spacing: .9em;
                        }

                        .big-left {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: left;
                            font-weight: 900;
                        }

                        .big-right {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: right;
                            font-weight: 900;
                        }

                        .normal-center {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: center;
                        }

                        #voucher td {
                            padding: 0;
                            margin: 0;
                        }
                    &lt;/style&gt;
                    &lt;div id=&quot;voucher&quot;&gt;
                        &lt;table&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-center&quot;&gt;COPIA - CLIENTE&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center-especial&quot;&gt;
                                    &lt;br /&gt;
                                    BANESCO
                                &lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;
                                    &lt;br /&gt;
                                    
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;TECNOLOGIA INSTAPAGO&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;DEMOSTRACI&amp;#211;N&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;J-000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-left&quot;&gt;000000000000&lt;/td&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-right&quot;&gt;000000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;FECHA:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;00/00/00 00:00:00 PM&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;NRO CUENTA:&lt;/td&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-left&quot;&gt;000000******0000    &lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;&#39;0&#39;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td class=&quot;normal-left&quot;&gt;NRO. REF.:&lt;/td&gt;
                                &lt;td class=&quot;normal-left&quot;&gt;000000&lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;LOTE:&lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;APROBACION: &lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;SECUENCIA:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;
                                    &lt;br /&gt;
                                    MONTO BS.  0,00
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr style=&quot;margin-top: 10px;&quot;&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;RIF: J-000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;
                                    &lt;b&gt;
                                        &lt;br /&gt;
                                    &lt;/b&gt;
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;
                                    &lt;br /&gt;debito
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;ID:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;000000000000000000&lt;/td&gt;
                            &lt;/tr&gt;
                        &lt;/table&gt;
                    &lt;/div&gt;
                &lt;/div&gt;
            &lt;/td&gt;
        &lt;/tr&gt;
    &lt;/tbody&gt;
&lt;/table&gt;



";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'8c1c4e6kdhvmkpb4jd7n6gvdfl30ghih', N'::1', 1553198002, N'__ci_last_regenerate|i:1553197711;SemanaActual|i:12;DiaSemanaActual|i:5;DiaSemanaPago|i:14;')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'rvkbl65ka9sd3jjaus0nrr6f4jj89v6s', N'::1', 1553198779, N'__ci_last_regenerate|i:1553198498;SemanaActual|i:12;DiaSemanaActual|i:5;DiaSemanaPago|i:14;')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'ml85u0c9q17rrak3f1j3e1p3a2jvtanv', N'::1', 1553199156, N'__ci_last_regenerate|i:1553198884;SemanaActual|i:12;DiaSemanaActual|i:5;DiaSemanaPago|i:14;')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'5o6hmagcaujsqaeb9reheau1t115j9cf', N'::1', 1552932781, N'__ci_last_regenerate|i:1552930982;SemanaActual|i:12;DiaSemanaActual|i:2;DiaSemanaPago|i:13;correo|N;num_registro|s:10:"0000000002";ReciboPago|s:8592:"
&lt;table style=&quot;background-color: white;&quot;&gt;
    &lt;tbody&gt;
        &lt;tr&gt;
            &lt;td&gt;
                &lt;div style=&quot;border: 1px solid #222; padding: 9px; text-align: center; max-width:255px&quot; id=&quot;voucher&quot;&gt;

                    &lt;style type=&quot;text/css&quot;&gt;
                        .normal-left {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: left;
                        }

                        .normal-right {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: right;
                        }

                        .big-center {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: center;
                            font-weight: 900;
                        }

                        .big-center-especial {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: center;
                            font-weight: 900;
                            letter-spacing: .9em;
                        }

                        .big-left {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: left;
                            font-weight: 900;
                        }

                        .big-right {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: right;
                            font-weight: 900;
                        }

                        .normal-center {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: center;
                        }

                        #voucher td {
                            padding: 0;
                            margin: 0;
                        }
                    &lt;/style&gt;
                    &lt;div id=&quot;voucher&quot;&gt;
                        &lt;table&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-center&quot;&gt;COPIA - CLIENTE&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center-especial&quot;&gt;
                                    &lt;br /&gt;
                                    BANESCO
                                &lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;
                                    &lt;br /&gt;
                                    
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;TECNOLOGIA INSTAPAGO&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;DEMOSTRACI&amp;#211;N&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;J-000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-left&quot;&gt;000000000000&lt;/td&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-right&quot;&gt;000000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;FECHA:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;00/00/00 00:00:00 PM&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;NRO CUENTA:&lt;/td&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-left&quot;&gt;000000******0000    &lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;&#39;0&#39;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td class=&quot;normal-left&quot;&gt;NRO. REF.:&lt;/td&gt;
                                &lt;td class=&quot;normal-left&quot;&gt;000000&lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;LOTE:&lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;APROBACION: &lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;SECUENCIA:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;
                                    &lt;br /&gt;
                                    MONTO BS.  0,00
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr style=&quot;margin-top: 10px;&quot;&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;RIF: J-000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;
                                    &lt;b&gt;
                                        &lt;br /&gt;
                                    &lt;/b&gt;
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;
                                    &lt;br /&gt;debito
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;ID:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;000000000000000000&lt;/td&gt;
                            &lt;/tr&gt;
                        &lt;/table&gt;
                    &lt;/div&gt;
                &lt;/div&gt;
            &lt;/td&gt;
        &lt;/tr&gt;
    &lt;/tbody&gt;
&lt;/table&gt;



";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'65tvl1elbgfg7k77qf4o0b9c5qcqlfqj', N'::1', 1552933310, N'__ci_last_regenerate|i:1552933234;SemanaActual|i:12;DiaSemanaActual|i:2;DiaSemanaPago|i:13;correo|s:22:"avelazquez@bigwise.com";num_registro|s:10:"0000000002";ReciboPago|s:8592:"
&lt;table style=&quot;background-color: white;&quot;&gt;
    &lt;tbody&gt;
        &lt;tr&gt;
            &lt;td&gt;
                &lt;div style=&quot;border: 1px solid #222; padding: 9px; text-align: center; max-width:255px&quot; id=&quot;voucher&quot;&gt;

                    &lt;style type=&quot;text/css&quot;&gt;
                        .normal-left {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: left;
                        }

                        .normal-right {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: right;
                        }

                        .big-center {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: center;
                            font-weight: 900;
                        }

                        .big-center-especial {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: center;
                            font-weight: 900;
                            letter-spacing: .9em;
                        }

                        .big-left {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: left;
                            font-weight: 900;
                        }

                        .big-right {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: right;
                            font-weight: 900;
                        }

                        .normal-center {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: center;
                        }

                        #voucher td {
                            padding: 0;
                            margin: 0;
                        }
                    &lt;/style&gt;
                    &lt;div id=&quot;voucher&quot;&gt;
                        &lt;table&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-center&quot;&gt;COPIA - CLIENTE&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center-especial&quot;&gt;
                                    &lt;br /&gt;
                                    BANESCO
                                &lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;
                                    &lt;br /&gt;
                                    
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;TECNOLOGIA INSTAPAGO&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;DEMOSTRACI&amp;#211;N&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;J-000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-left&quot;&gt;000000000000&lt;/td&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-right&quot;&gt;000000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;FECHA:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;00/00/00 00:00:00 PM&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;NRO CUENTA:&lt;/td&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-left&quot;&gt;000000******0000    &lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;&#39;0&#39;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td class=&quot;normal-left&quot;&gt;NRO. REF.:&lt;/td&gt;
                                &lt;td class=&quot;normal-left&quot;&gt;000000&lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;LOTE:&lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;APROBACION: &lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;SECUENCIA:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;
                                    &lt;br /&gt;
                                    MONTO BS.  0,00
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr style=&quot;margin-top: 10px;&quot;&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;RIF: J-000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;
                                    &lt;b&gt;
                                        &lt;br /&gt;
                                    &lt;/b&gt;
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;
                                    &lt;br /&gt;debito
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;ID:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;000000000000000000&lt;/td&gt;
                            &lt;/tr&gt;
                        &lt;/table&gt;
                    &lt;/div&gt;
                &lt;/div&gt;
            &lt;/td&gt;
        &lt;/tr&gt;
    &lt;/tbody&gt;
&lt;/table&gt;



";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'rtk741rolffcea0snet0f02m32m231uf', N'::1', 1552935007, N'__ci_last_regenerate|i:1552934741;SemanaActual|i:12;DiaSemanaActual|i:2;DiaSemanaPago|i:13;correo|s:22:"avelazquez@bigwise.com";num_registro|s:10:"0000000002";ReciboPago|s:8592:"
&lt;table style=&quot;background-color: white;&quot;&gt;
    &lt;tbody&gt;
        &lt;tr&gt;
            &lt;td&gt;
                &lt;div style=&quot;border: 1px solid #222; padding: 9px; text-align: center; max-width:255px&quot; id=&quot;voucher&quot;&gt;

                    &lt;style type=&quot;text/css&quot;&gt;
                        .normal-left {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: left;
                        }

                        .normal-right {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: right;
                        }

                        .big-center {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: center;
                            font-weight: 900;
                        }

                        .big-center-especial {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: center;
                            font-weight: 900;
                            letter-spacing: .9em;
                        }

                        .big-left {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: left;
                            font-weight: 900;
                        }

                        .big-right {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: right;
                            font-weight: 900;
                        }

                        .normal-center {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: center;
                        }

                        #voucher td {
                            padding: 0;
                            margin: 0;
                        }
                    &lt;/style&gt;
                    &lt;div id=&quot;voucher&quot;&gt;
                        &lt;table&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-center&quot;&gt;COPIA - CLIENTE&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center-especial&quot;&gt;
                                    &lt;br /&gt;
                                    BANESCO
                                &lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;
                                    &lt;br /&gt;
                                    
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;TECNOLOGIA INSTAPAGO&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;DEMOSTRACI&amp;#211;N&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;J-000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-left&quot;&gt;000000000000&lt;/td&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-right&quot;&gt;000000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;FECHA:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;00/00/00 00:00:00 PM&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;NRO CUENTA:&lt;/td&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-left&quot;&gt;000000******0000    &lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;&#39;0&#39;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td class=&quot;normal-left&quot;&gt;NRO. REF.:&lt;/td&gt;
                                &lt;td class=&quot;normal-left&quot;&gt;000000&lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;LOTE:&lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;APROBACION: &lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;SECUENCIA:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;
                                    &lt;br /&gt;
                                    MONTO BS.  0,00
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr style=&quot;margin-top: 10px;&quot;&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;RIF: J-000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;
                                    &lt;b&gt;
                                        &lt;br /&gt;
                                    &lt;/b&gt;
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;
                                    &lt;br /&gt;debito
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;ID:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;000000000000000000&lt;/td&gt;
                            &lt;/tr&gt;
                        &lt;/table&gt;
                    &lt;/div&gt;
                &lt;/div&gt;
            &lt;/td&gt;
        &lt;/tr&gt;
    &lt;/tbody&gt;
&lt;/table&gt;



";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'ei9urb7ccgf5117i8hcq36aiepu2knj3', N'::1', 1552935060, N'__ci_last_regenerate|i:1552935056;SemanaActual|i:12;DiaSemanaActual|i:2;DiaSemanaPago|i:13;correo|s:22:"avelazquez@bigwise.com";num_registro|s:10:"0000000002";ReciboPago|s:8592:"
&lt;table style=&quot;background-color: white;&quot;&gt;
    &lt;tbody&gt;
        &lt;tr&gt;
            &lt;td&gt;
                &lt;div style=&quot;border: 1px solid #222; padding: 9px; text-align: center; max-width:255px&quot; id=&quot;voucher&quot;&gt;

                    &lt;style type=&quot;text/css&quot;&gt;
                        .normal-left {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: left;
                        }

                        .normal-right {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: right;
                        }

                        .big-center {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: center;
                            font-weight: 900;
                        }

                        .big-center-especial {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: center;
                            font-weight: 900;
                            letter-spacing: .9em;
                        }

                        .big-left {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: left;
                            font-weight: 900;
                        }

                        .big-right {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: right;
                            font-weight: 900;
                        }

                        .normal-center {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: center;
                        }

                        #voucher td {
                            padding: 0;
                            margin: 0;
                        }
                    &lt;/style&gt;
                    &lt;div id=&quot;voucher&quot;&gt;
                        &lt;table&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-center&quot;&gt;COPIA - CLIENTE&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center-especial&quot;&gt;
                                    &lt;br /&gt;
                                    BANESCO
                                &lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;
                                    &lt;br /&gt;
                                    
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;TECNOLOGIA INSTAPAGO&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;DEMOSTRACI&amp;#211;N&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;J-000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-left&quot;&gt;000000000000&lt;/td&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-right&quot;&gt;000000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;FECHA:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;00/00/00 00:00:00 PM&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;NRO CUENTA:&lt;/td&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-left&quot;&gt;000000******0000    &lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;&#39;0&#39;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td class=&quot;normal-left&quot;&gt;NRO. REF.:&lt;/td&gt;
                                &lt;td class=&quot;normal-left&quot;&gt;000000&lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;LOTE:&lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;APROBACION: &lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;SECUENCIA:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;
                                    &lt;br /&gt;
                                    MONTO BS.  0,00
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr style=&quot;margin-top: 10px;&quot;&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;RIF: J-000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;
                                    &lt;b&gt;
                                        &lt;br /&gt;
                                    &lt;/b&gt;
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;
                                    &lt;br /&gt;debito
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;ID:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;000000000000000000&lt;/td&gt;
                            &lt;/tr&gt;
                        &lt;/table&gt;
                    &lt;/div&gt;
                &lt;/div&gt;
            &lt;/td&gt;
        &lt;/tr&gt;
    &lt;/tbody&gt;
&lt;/table&gt;



";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'96hkab6379kbjn50smgie3guoul45onc', N'::1', 1552935904, N'__ci_last_regenerate|i:1552935894;SemanaActual|i:12;DiaSemanaActual|i:2;DiaSemanaPago|i:13;correo|s:22:"avelazquez@bigwise.com";num_registro|s:10:"0000000002";ReciboPago|s:8592:"
&lt;table style=&quot;background-color: white;&quot;&gt;
    &lt;tbody&gt;
        &lt;tr&gt;
            &lt;td&gt;
                &lt;div style=&quot;border: 1px solid #222; padding: 9px; text-align: center; max-width:255px&quot; id=&quot;voucher&quot;&gt;

                    &lt;style type=&quot;text/css&quot;&gt;
                        .normal-left {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: left;
                        }

                        .normal-right {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: right;
                        }

                        .big-center {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: center;
                            font-weight: 900;
                        }

                        .big-center-especial {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: center;
                            font-weight: 900;
                            letter-spacing: .9em;
                        }

                        .big-left {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: left;
                            font-weight: 900;
                        }

                        .big-right {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: right;
                            font-weight: 900;
                        }

                        .normal-center {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: center;
                        }

                        #voucher td {
                            padding: 0;
                            margin: 0;
                        }
                    &lt;/style&gt;
                    &lt;div id=&quot;voucher&quot;&gt;
                        &lt;table&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-center&quot;&gt;COPIA - CLIENTE&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center-especial&quot;&gt;
                                    &lt;br /&gt;
                                    BANESCO
                                &lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;
                                    &lt;br /&gt;
                                    
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;TECNOLOGIA INSTAPAGO&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;DEMOSTRACI&amp;#211;N&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;J-000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-left&quot;&gt;000000000000&lt;/td&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-right&quot;&gt;000000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;FECHA:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;00/00/00 00:00:00 PM&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;NRO CUENTA:&lt;/td&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-left&quot;&gt;000000******0000    &lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;&#39;0&#39;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td class=&quot;normal-left&quot;&gt;NRO. REF.:&lt;/td&gt;
                                &lt;td class=&quot;normal-left&quot;&gt;000000&lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;LOTE:&lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;APROBACION: &lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;SECUENCIA:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;
                                    &lt;br /&gt;
                                    MONTO BS.  0,00
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr style=&quot;margin-top: 10px;&quot;&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;RIF: J-000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;
                                    &lt;b&gt;
                                        &lt;br /&gt;
                                    &lt;/b&gt;
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;
                                    &lt;br /&gt;debito
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;ID:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;000000000000000000&lt;/td&gt;
                            &lt;/tr&gt;
                        &lt;/table&gt;
                    &lt;/div&gt;
                &lt;/div&gt;
            &lt;/td&gt;
        &lt;/tr&gt;
    &lt;/tbody&gt;
&lt;/table&gt;



";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N's5m0iq4ncpetsf3fbupmpeqm61cag3ok', N'::1', 1552925741, N'__ci_last_regenerate|i:1552925564;SemanaActual|i:12;DiaSemanaActual|i:2;DiaSemanaPago|i:13;correo|s:22:"avelazquez@bigwise.com";num_registro|s:10:"0000000002";ReciboPago|s:8592:"
&lt;table style=&quot;background-color: white;&quot;&gt;
    &lt;tbody&gt;
        &lt;tr&gt;
            &lt;td&gt;
                &lt;div style=&quot;border: 1px solid #222; padding: 9px; text-align: center; max-width:255px&quot; id=&quot;voucher&quot;&gt;

                    &lt;style type=&quot;text/css&quot;&gt;
                        .normal-left {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: left;
                        }

                        .normal-right {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: right;
                        }

                        .big-center {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: center;
                            font-weight: 900;
                        }

                        .big-center-especial {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: center;
                            font-weight: 900;
                            letter-spacing: .9em;
                        }

                        .big-left {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: left;
                            font-weight: 900;
                        }

                        .big-right {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: right;
                            font-weight: 900;
                        }

                        .normal-center {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: center;
                        }

                        #voucher td {
                            padding: 0;
                            margin: 0;
                        }
                    &lt;/style&gt;
                    &lt;div id=&quot;voucher&quot;&gt;
                        &lt;table&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-center&quot;&gt;COPIA - CLIENTE&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center-especial&quot;&gt;
                                    &lt;br /&gt;
                                    BANESCO
                                &lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;
                                    &lt;br /&gt;
                                    
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;TECNOLOGIA INSTAPAGO&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;DEMOSTRACI&amp;#211;N&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;J-000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-left&quot;&gt;000000000000&lt;/td&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-right&quot;&gt;000000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;FECHA:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;00/00/00 00:00:00 PM&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;NRO CUENTA:&lt;/td&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-left&quot;&gt;000000******0000    &lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;&#39;0&#39;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td class=&quot;normal-left&quot;&gt;NRO. REF.:&lt;/td&gt;
                                &lt;td class=&quot;normal-left&quot;&gt;000000&lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;LOTE:&lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;APROBACION: &lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;SECUENCIA:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;
                                    &lt;br /&gt;
                                    MONTO BS.  0,00
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr style=&quot;margin-top: 10px;&quot;&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;RIF: J-000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;
                                    &lt;b&gt;
                                        &lt;br /&gt;
                                    &lt;/b&gt;
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;
                                    &lt;br /&gt;debito
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;ID:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;000000000000000000&lt;/td&gt;
                            &lt;/tr&gt;
                        &lt;/table&gt;
                    &lt;/div&gt;
                &lt;/div&gt;
            &lt;/td&gt;
        &lt;/tr&gt;
    &lt;/tbody&gt;
&lt;/table&gt;



";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'tb774ieccb3qtqf5lis8kuqk3rq13fma', N'::1', 1553107242, N'__ci_last_regenerate|i:1553106973;SemanaActual|i:12;DiaSemanaActual|i:4;DiaSemanaPago|i:14;')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'f0jj3apk20au5rigvfj1f9lnp5e9pvt5', N'::1', 1553107569, N'__ci_last_regenerate|i:1553107299;SemanaActual|i:12;DiaSemanaActual|i:4;DiaSemanaPago|i:14;correo|s:13:"adr@gmail.com";num_registro|s:10:"0000000001";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'9u5lbjbeq3j7gd426u0ckvu3jkpbrqkm', N'::1', 1553115363, N'__ci_last_regenerate|i:1553115190;SemanaActual|i:12;DiaSemanaActual|i:4;DiaSemanaPago|i:14;correo|s:13:"adr@gmail.com";num_registro|s:10:"0000000001";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'4m10ua42dkejgto722gqr5og5nkeihg6', N'::1', 1553229882, N'__ci_last_regenerate|i:1553229807;SemanaActual|i:12;DiaSemanaActual|i:6;DiaSemanaPago|i:14;num_registro|s:10:"0000000001";correo|s:22:"avelazquez@bigwise.com";ReciboPago|s:0:"";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'1eid3vuo64a3jeimhcilgfsbg1c8uk9p', N'::1', 1553230553, N'__ci_last_regenerate|i:1553230219;SemanaActual|i:12;DiaSemanaActual|i:6;DiaSemanaPago|i:14;num_registro|s:10:"0000000001";correo|s:22:"avelazquez@bigwise.com";ReciboPago|s:0:"";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'lggvps1iqe4dqitqulbtabvs0966onhb', N'::1', 1553230833, N'__ci_last_regenerate|i:1553230553;SemanaActual|i:12;DiaSemanaActual|i:6;DiaSemanaPago|i:14;num_registro|s:10:"0000000001";correo|s:22:"avelazquez@bigwise.com";ReciboPago|s:0:"";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'vae20nt7mmhskjqkgh7i1knmbhlu89ld', N'::1', 1553231144, N'__ci_last_regenerate|i:1553230859;SemanaActual|i:12;DiaSemanaActual|i:6;DiaSemanaPago|i:14;num_registro|s:10:"0000000001";correo|s:22:"avelazquez@bigwise.com";ReciboPago|s:0:"";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'rs6qarojc49bp3da0v9o8cbgsvp6jm4g', N'::1', 1552925494, N'__ci_last_regenerate|i:1552925212;SemanaActual|i:12;DiaSemanaActual|i:2;DiaSemanaPago|i:13;correo|s:22:"avelazquez@bigwise.com";num_registro|s:10:"0000000002";ReciboPago|s:8592:"
&lt;table style=&quot;background-color: white;&quot;&gt;
    &lt;tbody&gt;
        &lt;tr&gt;
            &lt;td&gt;
                &lt;div style=&quot;border: 1px solid #222; padding: 9px; text-align: center; max-width:255px&quot; id=&quot;voucher&quot;&gt;

                    &lt;style type=&quot;text/css&quot;&gt;
                        .normal-left {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: left;
                        }

                        .normal-right {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: right;
                        }

                        .big-center {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: center;
                            font-weight: 900;
                        }

                        .big-center-especial {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: center;
                            font-weight: 900;
                            letter-spacing: .9em;
                        }

                        .big-left {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: left;
                            font-weight: 900;
                        }

                        .big-right {
                            font-family: Tahoma;
                            font-size: 9pt;
                            text-align: right;
                            font-weight: 900;
                        }

                        .normal-center {
                            font-family: Tahoma;
                            font-size: 7pt;
                            text-align: center;
                        }

                        #voucher td {
                            padding: 0;
                            margin: 0;
                        }
                    &lt;/style&gt;
                    &lt;div id=&quot;voucher&quot;&gt;
                        &lt;table&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-center&quot;&gt;COPIA - CLIENTE&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center-especial&quot;&gt;
                                    &lt;br /&gt;
                                    BANESCO
                                &lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;
                                    &lt;br /&gt;
                                    
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;TECNOLOGIA INSTAPAGO&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;DEMOSTRACI&amp;#211;N&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;J-000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-left&quot;&gt;000000000000&lt;/td&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-right&quot;&gt;000000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;FECHA:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;00/00/00 00:00:00 PM&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;NRO CUENTA:&lt;/td&gt;
                                &lt;td colspan=&quot;2&quot; class=&quot;normal-left&quot;&gt;000000******0000    &lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;&#39;0&#39;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td class=&quot;normal-left&quot;&gt;NRO. REF.:&lt;/td&gt;
                                &lt;td class=&quot;normal-left&quot;&gt;000000&lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;LOTE:&lt;/td&gt;
                                &lt;td class=&quot;normal-right&quot;&gt;000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;APROBACION: &lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;SECUENCIA:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;

                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;
                                    &lt;br /&gt;
                                    MONTO BS.  0,00
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr style=&quot;margin-top: 10px;&quot;&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;big-center&quot;&gt;RIF: J-000000000&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; style=&quot;height: 8px;&quot;&gt;&lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;
                                    &lt;b&gt;
                                        &lt;br /&gt;
                                    &lt;/b&gt;
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;4&quot; class=&quot;normal-left&quot;&gt;
                                    &lt;br /&gt;debito
                                &lt;/td&gt;
                            &lt;/tr&gt;
                            &lt;tr&gt;
                                &lt;td colspan=&quot;1&quot; class=&quot;normal-left&quot;&gt;ID:&lt;/td&gt;
                                &lt;td colspan=&quot;3&quot; class=&quot;normal-left&quot;&gt;000000000000000000&lt;/td&gt;
                            &lt;/tr&gt;
                        &lt;/table&gt;
                    &lt;/div&gt;
                &lt;/div&gt;
            &lt;/td&gt;
        &lt;/tr&gt;
    &lt;/tbody&gt;
&lt;/table&gt;



";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'p9upfhejrrc2et2qc229ojtfbfq263sr', N'::1', 1553202302, N'__ci_last_regenerate|i:1553200411;SemanaActual|i:12;DiaSemanaActual|i:5;DiaSemanaPago|i:14;correo|s:13:"adr@gmail.com";num_registro|s:10:"0000000001";ReciboPago|s:0:"";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'edatod0p5u1dfsmf9qlpqtd5thsh00p3', N'::1', 1553229001, N'__ci_last_regenerate|i:1553228980;SemanaActual|i:12;DiaSemanaActual|i:5;DiaSemanaPago|i:14;num_registro|s:10:"0000000001";correo|s:22:"avelazquez@bigwise.com";ReciboPago|s:0:"";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'v5oeutcjiaodpgjoe3ibb6ic1r5of0jp', N'::1', 1553229636, N'__ci_last_regenerate|i:1553229358;SemanaActual|i:12;DiaSemanaActual|i:6;DiaSemanaPago|i:14;num_registro|s:10:"0000000001";correo|s:22:"avelazquez@bigwise.com";ReciboPago|s:0:"";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'kqqdmijegl0nlit6ih6gb8k63lst4ve8', N'::1', 1552917425, N'__ci_last_regenerate|i:1552917155;SemanaActual|i:12;DiaSemanaActual|i:2;DiaSemanaPago|i:13;correo|s:22:"avelazquez@bigwise.com";num_registro|N;')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'3c1od4026feq255f80n9lm81joujbup0', N'::1', 1552917731, N'__ci_last_regenerate|i:1552917484;SemanaActual|i:12;DiaSemanaActual|i:2;DiaSemanaPago|i:13;correo|s:22:"avelazquez@bigwise.com";num_registro|N;')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'7tg1p9aocur3tfojvbudnnvap52agdke', N'::1', 1552917995, N'__ci_last_regenerate|i:1552917785;SemanaActual|i:12;DiaSemanaActual|i:2;DiaSemanaPago|i:13;correo|s:22:"avelazquez@bigwise.com";num_registro|N;')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'aa0baib8r9fuhckh1587kt78rtmm426e', N'::1', 1552918478, N'__ci_last_regenerate|i:1552918253;SemanaActual|i:12;DiaSemanaActual|i:2;DiaSemanaPago|i:13;correo|s:22:"avelazquez@bigwise.com";num_registro|N;')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'tuuebc0c9g548lbf98r6i0u3d0kv33jk', N'::1', 1552918806, N'__ci_last_regenerate|i:1552918560;SemanaActual|i:12;DiaSemanaActual|i:2;DiaSemanaPago|i:13;correo|s:22:"avelazquez@bigwise.com";num_registro|N;')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'2cjknt65vh7vlhd09vml9jfbeg4q634r', N'::1', 1552919225, N'__ci_last_regenerate|i:1552918915;SemanaActual|i:12;DiaSemanaActual|i:2;DiaSemanaPago|i:13;correo|s:22:"avelazquez@bigwise.com";num_registro|s:10:"0000000002";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'iv6iccm7a0j2m75o97l9aucfdr4gq44s', N'::1', 1552919597, N'__ci_last_regenerate|i:1552919305;SemanaActual|i:12;DiaSemanaActual|i:2;DiaSemanaPago|i:13;correo|s:22:"avelazquez@bigwise.com";num_registro|s:10:"0000000002";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'3v94f8ngp8s7994av0jas2097p400r1o', N'::1', 1552919876, N'__ci_last_regenerate|i:1552919651;SemanaActual|i:12;DiaSemanaActual|i:2;DiaSemanaPago|i:13;correo|s:22:"avelazquez@bigwise.com";num_registro|s:10:"0000000002";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'9iv4qsufohamrq651ldgf395gvoj256p', N'::1', 1552920793, N'__ci_last_regenerate|i:1552920496;SemanaActual|i:12;DiaSemanaActual|i:2;DiaSemanaPago|i:13;correo|N;num_registro|s:10:"0000000002";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'ga36sndc49d0blos97ijtdld5dl0h9rq', N'::1', 1552920980, N'__ci_last_regenerate|i:1552920797;SemanaActual|i:12;DiaSemanaActual|i:2;DiaSemanaPago|i:13;correo|s:22:"avelazquez@bigwise.com";num_registro|s:10:"0000000002";')
INSERT [dbo].[ci_sessions] ([id], [ip_address], [timestamp], [data]) VALUES (N'9jrbges5nk7m744rl5rt7odas26imlnl', N'::1', 1552921491, N'__ci_last_regenerate|i:1552921384;SemanaActual|i:12;DiaSemanaActual|i:2;DiaSemanaPago|i:13;correo|s:22:"avelazquez@bigwise.com";num_registro|s:10:"0000000002";')
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (1, 1, N'Maroa', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (2, 1, N'Puerto Ayacucho', 1)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (3, 1, N'San Fernando de Atabapo', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (4, 2, N'Anaco', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (5, 2, N'Aragua de Barcelona', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (6, 2, N'Barcelona', 1)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (7, 2, N'Boca de Uchire', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (8, 2, N'Cantaura', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (9, 2, N'Clarines', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (10, 2, N'El Chaparro', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (11, 2, N'El Pao Anzoátegui', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (12, 2, N'El Tigre', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (13, 2, N'El Tigrito', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (14, 2, N'Guanape', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (15, 2, N'Guanta', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (16, 2, N'Lechería', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (17, 2, N'Onoto', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (18, 2, N'Pariaguán', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (19, 2, N'Píritu', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (20, 2, N'Puerto La Cruz', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (21, 2, N'Puerto Píritu', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (22, 2, N'Sabana de Uchire', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (23, 2, N'San Mateo Anzoátegui', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (24, 2, N'San Pablo Anzoátegui', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (25, 2, N'San Tomé', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (26, 2, N'Santa Ana de Anzoátegui', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (27, 2, N'Santa Fe Anzoátegui', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (28, 2, N'Santa Rosa', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (29, 2, N'Soledad', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (30, 2, N'Urica', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (31, 2, N'Valle de Guanape', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (43, 3, N'Achaguas', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (44, 3, N'Biruaca', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (45, 3, N'Bruzual', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (46, 3, N'El Amparo', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (47, 3, N'El Nula', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (48, 3, N'Elorza', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (49, 3, N'Guasdualito', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (50, 3, N'Mantecal', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (51, 3, N'Puerto Páez', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (52, 3, N'San Fernando de Apure', 1)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (53, 3, N'San Juan de Payara', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (54, 4, N'Barbacoas', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (55, 4, N'Cagua', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (56, 4, N'Camatagua', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (58, 4, N'Choroní', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (59, 4, N'Colonia Tovar', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (60, 4, N'El Consejo', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (61, 4, N'La Victoria', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (62, 4, N'Las Tejerías', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (63, 4, N'Magdaleno', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (64, 4, N'Maracay', 1)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (65, 4, N'Ocumare de La Costa', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (66, 4, N'Palo Negro', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (67, 4, N'San Casimiro', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (68, 4, N'San Mateo', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (69, 4, N'San Sebastián', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (70, 4, N'Santa Cruz de Aragua', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (71, 4, N'Tocorón', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (72, 4, N'Turmero', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (73, 4, N'Villa de Cura', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (74, 4, N'Zuata', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (75, 5, N'Barinas', 1)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (76, 5, N'Barinitas', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (77, 5, N'Barrancas', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (78, 5, N'Calderas', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (79, 5, N'Capitanejo', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (80, 5, N'Ciudad Bolivia', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (81, 5, N'El Cantón', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (82, 5, N'Las Veguitas', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (83, 5, N'Libertad de Barinas', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (84, 5, N'Sabaneta', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (85, 5, N'Santa Bárbara de Barinas', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (86, 5, N'Socopó', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (87, 6, N'Caicara del Orinoco', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (88, 6, N'Canaima', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (89, 6, N'Ciudad Bolívar', 1)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (90, 6, N'Ciudad Piar', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (91, 6, N'El Callao', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (92, 6, N'El Dorado', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (93, 6, N'El Manteco', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (94, 6, N'El Palmar', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (95, 6, N'El Pao', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (96, 6, N'Guasipati', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (97, 6, N'Guri', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (98, 6, N'La Paragua', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (99, 6, N'Matanzas', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (100, 6, N'Puerto Ordaz', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (101, 6, N'San Félix', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (102, 6, N'Santa Elena de Uairén', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (103, 6, N'Tumeremo', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (104, 6, N'Unare', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (105, 6, N'Upata', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (106, 7, N'Bejuma', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (107, 7, N'Belén', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (108, 7, N'Campo de Carabobo', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (109, 7, N'Canoabo', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (110, 7, N'Central Tacarigua', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (111, 7, N'Chirgua', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (112, 7, N'Ciudad Alianza', 0)
GO
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (113, 7, N'El Palito', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (114, 7, N'Guacara', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (115, 7, N'Guigue', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (116, 7, N'Las Trincheras', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (117, 7, N'Los Guayos', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (118, 7, N'Mariara', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (119, 7, N'Miranda', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (120, 7, N'Montalbán', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (121, 7, N'Morón', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (122, 7, N'Naguanagua', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (123, 7, N'Puerto Cabello', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (124, 7, N'San Joaquín', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (125, 7, N'Tocuyito', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (126, 7, N'Urama', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (127, 7, N'Valencia', 1)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (128, 7, N'Vigirimita', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (129, 8, N'Aguirre', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (130, 8, N'Apartaderos Cojedes', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (131, 8, N'Arismendi', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (132, 8, N'Camuriquito', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (133, 8, N'El Baúl', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (134, 8, N'El Limón', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (135, 8, N'El Pao Cojedes', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (136, 8, N'El Socorro', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (137, 8, N'La Aguadita', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (138, 8, N'Las Vegas', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (139, 8, N'Libertad de Cojedes', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (140, 8, N'Mapuey', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (141, 8, N'Piñedo', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (142, 8, N'Samancito', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (143, 8, N'San Carlos', 1)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (144, 8, N'Sucre', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (145, 8, N'Tinaco', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (146, 8, N'Tinaquillo', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (147, 8, N'Vallecito', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (148, 9, N'Tucupita', 1)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (149, 24, N'Caracas', 1)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (150, 24, N'El Junquito', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (151, 10, N'Adícora', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (152, 10, N'Boca de Aroa', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (153, 10, N'Cabure', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (154, 10, N'Capadare', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (155, 10, N'Capatárida', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (156, 10, N'Chichiriviche', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (157, 10, N'Churuguara', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (158, 10, N'Coro', 1)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (159, 10, N'Cumarebo', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (160, 10, N'Dabajuro', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (161, 10, N'Judibana', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (162, 10, N'La Cruz de Taratara', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (163, 10, N'La Vela de Coro', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (164, 10, N'Los Taques', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (165, 10, N'Maparari', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (166, 10, N'Mene de Mauroa', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (167, 10, N'Mirimire', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (168, 10, N'Pedregal', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (169, 10, N'Píritu Falcón', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (170, 10, N'Pueblo Nuevo Falcón', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (171, 10, N'Puerto Cumarebo', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (172, 10, N'Punta Cardón', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (173, 10, N'Punto Fijo', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (174, 10, N'San Juan de Los Cayos', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (175, 10, N'San Luis', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (176, 10, N'Santa Ana Falcón', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (177, 10, N'Santa Cruz De Bucaral', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (178, 10, N'Tocopero', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (179, 10, N'Tocuyo de La Costa', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (180, 10, N'Tucacas', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (181, 10, N'Yaracal', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (182, 11, N'Altagracia de Orituco', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (183, 11, N'Cabruta', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (184, 11, N'Calabozo', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (185, 11, N'Camaguán', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (196, 11, N'Chaguaramas Guárico', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (197, 11, N'El Socorro', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (198, 11, N'El Sombrero', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (199, 11, N'Las Mercedes de Los Llanos', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (200, 11, N'Lezama', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (201, 11, N'Onoto', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (202, 11, N'Ortíz', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (203, 11, N'San José de Guaribe', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (204, 11, N'San Juan de Los Morros', 1)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (205, 11, N'San Rafael de Laya', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (206, 11, N'Santa María de Ipire', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (207, 11, N'Tucupido', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (208, 11, N'Valle de La Pascua', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (209, 11, N'Zaraza', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (210, 12, N'Aguada Grande', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (211, 12, N'Atarigua', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (212, 12, N'Barquisimeto', 1)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (213, 12, N'Bobare', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (214, 12, N'Cabudare', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (215, 12, N'Carora', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (216, 12, N'Cubiro', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (217, 12, N'Cují', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (218, 12, N'Duaca', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (219, 12, N'El Manzano', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (220, 12, N'El Tocuyo', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (221, 12, N'Guaríco', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (222, 12, N'Humocaro Alto', 0)
GO
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (223, 12, N'Humocaro Bajo', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (224, 12, N'La Miel', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (225, 12, N'Moroturo', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (226, 12, N'Quíbor', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (227, 12, N'Río Claro', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (228, 12, N'Sanare', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (229, 12, N'Santa Inés', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (230, 12, N'Sarare', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (231, 12, N'Siquisique', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (232, 12, N'Tintorero', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (233, 13, N'Apartaderos Mérida', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (234, 13, N'Arapuey', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (235, 13, N'Bailadores', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (236, 13, N'Caja Seca', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (237, 13, N'Canaguá', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (238, 13, N'Chachopo', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (239, 13, N'Chiguara', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (240, 13, N'Ejido', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (241, 13, N'El Vigía', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (242, 13, N'La Azulita', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (243, 13, N'La Playa', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (244, 13, N'Lagunillas Mérida', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (245, 13, N'Mérida', 1)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (246, 13, N'Mesa de Bolívar', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (247, 13, N'Mucuchíes', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (248, 13, N'Mucujepe', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (249, 13, N'Mucuruba', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (250, 13, N'Nueva Bolivia', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (251, 13, N'Palmarito', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (252, 13, N'Pueblo Llano', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (253, 13, N'Santa Cruz de Mora', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (254, 13, N'Santa Elena de Arenales', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (255, 13, N'Santo Domingo', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (256, 13, N'Tabáy', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (257, 13, N'Timotes', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (258, 13, N'Torondoy', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (259, 13, N'Tovar', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (260, 13, N'Tucani', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (261, 13, N'Zea', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (262, 14, N'Araguita', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (263, 14, N'Carrizal', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (264, 14, N'Caucagua', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (265, 14, N'Chaguaramas Miranda', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (266, 14, N'Charallave', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (267, 14, N'Chirimena', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (268, 14, N'Chuspa', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (269, 14, N'Cúa', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (270, 14, N'Cupira', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (271, 14, N'Curiepe', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (272, 14, N'El Guapo', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (273, 14, N'El Jarillo', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (274, 14, N'Filas de Mariche', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (275, 14, N'Guarenas', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (276, 14, N'Guatire', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (277, 14, N'Higuerote', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (278, 14, N'Los Anaucos', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (279, 14, N'Los Teques', 1)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (280, 14, N'Ocumare del Tuy', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (281, 14, N'Panaquire', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (282, 14, N'Paracotos', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (283, 14, N'Río Chico', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (284, 14, N'San Antonio de Los Altos', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (285, 14, N'San Diego de Los Altos', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (286, 14, N'San Fernando del Guapo', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (287, 14, N'San Francisco de Yare', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (288, 14, N'San José de Los Altos', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (289, 14, N'San José de Río Chico', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (290, 14, N'San Pedro de Los Altos', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (291, 14, N'Santa Lucía', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (292, 14, N'Santa Teresa', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (293, 14, N'Tacarigua de La Laguna', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (294, 14, N'Tacarigua de Mamporal', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (295, 14, N'Tácata', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (296, 14, N'Turumo', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (297, 15, N'Aguasay', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (298, 15, N'Aragua de Maturín', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (299, 15, N'Barrancas del Orinoco', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (300, 15, N'Caicara de Maturín', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (301, 15, N'Caripe', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (302, 15, N'Caripito', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (303, 15, N'Chaguaramal', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (305, 15, N'Chaguaramas Monagas', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (307, 15, N'El Furrial', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (308, 15, N'El Tejero', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (309, 15, N'Jusepín', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (310, 15, N'La Toscana', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (311, 15, N'Maturín', 1)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (312, 15, N'Miraflores', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (313, 15, N'Punta de Mata', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (314, 15, N'Quiriquire', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (315, 15, N'San Antonio de Maturín', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (316, 15, N'San Vicente Monagas', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (317, 15, N'Santa Bárbara', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (318, 15, N'Temblador', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (319, 15, N'Teresen', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (320, 15, N'Uracoa', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (321, 16, N'Altagracia', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (322, 16, N'Boca de Pozo', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (323, 16, N'Boca de Río', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (324, 16, N'El Espinal', 0)
GO
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (325, 16, N'El Valle del Espíritu Santo', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (326, 16, N'El Yaque', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (327, 16, N'Juangriego', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (328, 16, N'La Asunción', 1)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (329, 16, N'La Guardia', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (330, 16, N'Pampatar', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (331, 16, N'Porlamar', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (332, 16, N'Puerto Fermín', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (333, 16, N'Punta de Piedras', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (334, 16, N'San Francisco de Macanao', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (335, 16, N'San Juan Bautista', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (336, 16, N'San Pedro de Coche', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (337, 16, N'Santa Ana de Nueva Esparta', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (338, 16, N'Villa Rosa', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (339, 17, N'Acarigua', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (340, 17, N'Agua Blanca', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (341, 17, N'Araure', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (342, 17, N'Biscucuy', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (343, 17, N'Boconoito', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (344, 17, N'Campo Elías', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (345, 17, N'Chabasquén', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (346, 17, N'Guanare', 1)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (347, 17, N'Guanarito', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (348, 17, N'La Aparición', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (349, 17, N'La Misión', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (350, 17, N'Mesa de Cavacas', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (351, 17, N'Ospino', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (352, 17, N'Papelón', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (353, 17, N'Payara', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (354, 17, N'Pimpinela', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (355, 17, N'Píritu de Portuguesa', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (356, 17, N'San Rafael de Onoto', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (357, 17, N'Santa Rosalía', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (358, 17, N'Turén', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (359, 18, N'Altos de Sucre', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (360, 18, N'Araya', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (361, 18, N'Cariaco', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (362, 18, N'Carúpano', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (363, 18, N'Casanay', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (364, 18, N'Cumaná', 1)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (365, 18, N'Cumanacoa', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (366, 18, N'El Morro Puerto Santo', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (367, 18, N'El Pilar', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (368, 18, N'El Poblado', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (369, 18, N'Guaca', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (370, 18, N'Guiria', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (371, 18, N'Irapa', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (372, 18, N'Manicuare', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (373, 18, N'Mariguitar', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (374, 18, N'Río Caribe', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (375, 18, N'San Antonio del Golfo', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (376, 18, N'San José de Aerocuar', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (377, 18, N'San Vicente de Sucre', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (378, 18, N'Santa Fe de Sucre', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (379, 18, N'Tunapuy', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (380, 18, N'Yaguaraparo', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (381, 18, N'Yoco', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (382, 19, N'Abejales', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (383, 19, N'Borota', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (384, 19, N'Bramon', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (385, 19, N'Capacho', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (386, 19, N'Colón', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (387, 19, N'Coloncito', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (388, 19, N'Cordero', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (389, 19, N'El Cobre', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (390, 19, N'El Pinal', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (391, 19, N'Independencia', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (392, 19, N'La Fría', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (393, 19, N'La Grita', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (394, 19, N'La Pedrera', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (395, 19, N'La Tendida', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (396, 19, N'Las Delicias', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (397, 19, N'Las Hernández', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (398, 19, N'Lobatera', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (399, 19, N'Michelena', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (400, 19, N'Palmira', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (401, 19, N'Pregonero', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (402, 19, N'Queniquea', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (403, 19, N'Rubio', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (404, 19, N'San Antonio del Tachira', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (405, 19, N'San Cristobal', 1)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (406, 19, N'San José de Bolívar', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (407, 19, N'San Josecito', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (408, 19, N'San Pedro del Río', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (409, 19, N'Santa Ana Táchira', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (410, 19, N'Seboruco', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (411, 19, N'Táriba', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (412, 19, N'Umuquena', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (413, 19, N'Ureña', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (414, 20, N'Batatal', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (415, 20, N'Betijoque', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (416, 20, N'Boconó', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (417, 20, N'Carache', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (418, 20, N'Chejende', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (419, 20, N'Cuicas', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (420, 20, N'El Dividive', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (421, 20, N'El Jaguito', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (422, 20, N'Escuque', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (423, 20, N'Isnotú', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (424, 20, N'Jajó', 0)
GO
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (425, 20, N'La Ceiba', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (426, 20, N'La Concepción de Trujllo', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (427, 20, N'La Mesa de Esnujaque', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (428, 20, N'La Puerta', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (429, 20, N'La Quebrada', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (430, 20, N'Mendoza Fría', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (431, 20, N'Meseta de Chimpire', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (432, 20, N'Monay', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (433, 20, N'Motatán', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (434, 20, N'Pampán', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (435, 20, N'Pampanito', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (436, 20, N'Sabana de Mendoza', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (437, 20, N'San Lázaro', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (438, 20, N'Santa Ana de Trujillo', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (439, 20, N'Tostós', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (440, 20, N'Trujillo', 1)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (441, 20, N'Valera', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (442, 21, N'Carayaca', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (443, 21, N'Litoral', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (444, 25, N'Archipiélago Los Roques', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (445, 22, N'Aroa', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (446, 22, N'Boraure', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (447, 22, N'Campo Elías de Yaracuy', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (448, 22, N'Chivacoa', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (449, 22, N'Cocorote', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (450, 22, N'Farriar', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (451, 22, N'Guama', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (452, 22, N'Marín', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (453, 22, N'Nirgua', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (454, 22, N'Sabana de Parra', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (455, 22, N'Salom', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (456, 22, N'San Felipe', 1)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (457, 22, N'San Pablo de Yaracuy', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (458, 22, N'Urachiche', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (459, 22, N'Yaritagua', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (460, 22, N'Yumare', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (461, 23, N'Bachaquero', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (462, 23, N'Bobures', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (463, 23, N'Cabimas', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (464, 23, N'Campo Concepción', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (465, 23, N'Campo Mara', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (466, 23, N'Campo Rojo', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (467, 23, N'Carrasquero', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (468, 23, N'Casigua', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (469, 23, N'Chiquinquirá', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (470, 23, N'Ciudad Ojeda', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (471, 23, N'El Batey', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (472, 23, N'El Carmelo', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (473, 23, N'El Chivo', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (474, 23, N'El Guayabo', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (475, 23, N'El Mene', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (476, 23, N'El Venado', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (477, 23, N'Encontrados', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (478, 23, N'Gibraltar', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (479, 23, N'Isla de Toas', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (480, 23, N'La Concepción del Zulia', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (481, 23, N'La Paz', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (482, 23, N'La Sierrita', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (483, 23, N'Lagunillas del Zulia', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (484, 23, N'Las Piedras de Perijá', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (485, 23, N'Los Cortijos', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (486, 23, N'Machiques', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (487, 23, N'Maracaibo', 1)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (488, 23, N'Mene Grande', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (489, 23, N'Palmarejo', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (490, 23, N'Paraguaipoa', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (491, 23, N'Potrerito', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (492, 23, N'Pueblo Nuevo del Zulia', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (493, 23, N'Puertos de Altagracia', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (494, 23, N'Punta Gorda', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (495, 23, N'Sabaneta de Palma', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (496, 23, N'San Francisco', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (497, 23, N'San José de Perijá', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (498, 23, N'San Rafael del Moján', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (499, 23, N'San Timoteo', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (500, 23, N'Santa Bárbara Del Zulia', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (501, 23, N'Santa Cruz de Mara', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (502, 23, N'Santa Cruz del Zulia', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (503, 23, N'Santa Rita', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (504, 23, N'Sinamaica', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (505, 23, N'Tamare', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (506, 23, N'Tía Juana', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (507, 23, N'Villa del Rosario', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (508, 21, N'La Guaira', 1)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (509, 21, N'Catia La Mar', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (510, 21, N'Macuto', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (511, 21, N'Naiguatá', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (512, 25, N'Archipiélago Los Monjes', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (513, 25, N'Isla La Tortuga y Cayos adyacentes', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (514, 25, N'Isla La Sola', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (515, 25, N'Islas Los Testigos', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (516, 25, N'Islas Los Frailes', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (517, 25, N'Isla La Orchila', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (518, 25, N'Archipiélago Las Aves', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (519, 25, N'Isla de Aves', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (520, 25, N'Isla La Blanquilla', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (521, 25, N'Isla de Patos', 0)
INSERT [dbo].[CIUDADES] ([id_ciudad], [id_estado], [ciudad], [capital]) VALUES (522, 25, N'Islas Los Hermanos', 0)
INSERT [dbo].[ESTADOS] ([id_estado], [estado], [iso], [id_pais]) VALUES (24, N'Distrito Capital', N'VE-A', N'VE')
INSERT [dbo].[ESTADOS] ([id_estado], [estado], [iso], [id_pais]) VALUES (2, N'Anzoátegui', N'VE-B', N'VE')
INSERT [dbo].[ESTADOS] ([id_estado], [estado], [iso], [id_pais]) VALUES (3, N'Apure', N'VE-C', N'VE')
INSERT [dbo].[ESTADOS] ([id_estado], [estado], [iso], [id_pais]) VALUES (4, N'Aragua', N'VE-D', N'VE')
INSERT [dbo].[ESTADOS] ([id_estado], [estado], [iso], [id_pais]) VALUES (5, N'Barinas', N'VE-E', N'VE')
INSERT [dbo].[ESTADOS] ([id_estado], [estado], [iso], [id_pais]) VALUES (6, N'Bolívar', N'VE-F', N'VE')
INSERT [dbo].[ESTADOS] ([id_estado], [estado], [iso], [id_pais]) VALUES (7, N'Carabobo', N'VE-G', N'VE')
INSERT [dbo].[ESTADOS] ([id_estado], [estado], [iso], [id_pais]) VALUES (8, N'Cojedes', N'VE-H', N'VE')
INSERT [dbo].[ESTADOS] ([id_estado], [estado], [iso], [id_pais]) VALUES (10, N'Falcón', N'VE-I', N'VE')
INSERT [dbo].[ESTADOS] ([id_estado], [estado], [iso], [id_pais]) VALUES (11, N'Guárico', N'VE-J', N'VE')
INSERT [dbo].[ESTADOS] ([id_estado], [estado], [iso], [id_pais]) VALUES (12, N'Lara', N'VE-K', N'VE')
INSERT [dbo].[ESTADOS] ([id_estado], [estado], [iso], [id_pais]) VALUES (13, N'Mérida', N'VE-L', N'VE')
INSERT [dbo].[ESTADOS] ([id_estado], [estado], [iso], [id_pais]) VALUES (14, N'Miranda', N'VE-M', N'VE')
INSERT [dbo].[ESTADOS] ([id_estado], [estado], [iso], [id_pais]) VALUES (15, N'Monagas', N'VE-N', N'VE')
INSERT [dbo].[ESTADOS] ([id_estado], [estado], [iso], [id_pais]) VALUES (16, N'Nueva Esparta', N'VE-O', N'VE')
INSERT [dbo].[ESTADOS] ([id_estado], [estado], [iso], [id_pais]) VALUES (17, N'Portuguesa', N'VE-P', N'VE')
INSERT [dbo].[ESTADOS] ([id_estado], [estado], [iso], [id_pais]) VALUES (18, N'Sucre', N'VE-R', N'VE')
INSERT [dbo].[ESTADOS] ([id_estado], [estado], [iso], [id_pais]) VALUES (19, N'Táchira', N'VE-S', N'VE')
INSERT [dbo].[ESTADOS] ([id_estado], [estado], [iso], [id_pais]) VALUES (20, N'Trujillo', N'VE-T', N'VE')
INSERT [dbo].[ESTADOS] ([id_estado], [estado], [iso], [id_pais]) VALUES (22, N'Yaracuy', N'VE-U', N'VE')
INSERT [dbo].[ESTADOS] ([id_estado], [estado], [iso], [id_pais]) VALUES (23, N'Zulia', N'VE-V', N'VE')
INSERT [dbo].[ESTADOS] ([id_estado], [estado], [iso], [id_pais]) VALUES (21, N'Vargas', N'VE-W', N'VE')
INSERT [dbo].[ESTADOS] ([id_estado], [estado], [iso], [id_pais]) VALUES (1, N'Amazonas', N'VE-X', N'VE')
INSERT [dbo].[ESTADOS] ([id_estado], [estado], [iso], [id_pais]) VALUES (9, N'Delta Amacuro', N'VE-Y', N'VE')
INSERT [dbo].[ESTADOS] ([id_estado], [estado], [iso], [id_pais]) VALUES (25, N'Dependencias Federales', N'VE-Z', N'VE')
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000001', 4, N' Cereal tipo Muesli ', N'taza', N'1/4 ', N'Gramos', 20)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000002', 4, N' Pan de Hamburguesa, perro caliente o francés', N'unidad', N'1/2', N'Gramos', 30)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000003', 4, N' Pan integral Bajo en calorías (ligero)', N'rebanada', N'2 ', N'Gramos', 45)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000004', 4, N'Apio, ñame u ocumo', N'trozo pequeño', N'1 ', N'Gramos', 80)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000005', 4, N'Arepa de yuca', N'unidad', N'1 ', N'Gramos', 40)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000006', 4, N'Arroz', N'taza', N'1/2', N'Gramos', 80)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000007', 4, N'Avena (en hojuelas o harina)', N'cucharada', N'3 ', N'Gramos', 16)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000008', 4, N'Avena (en hojuelas o harina)', N'cucharada', N'3 ', N'Gramos', 16)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000009', 4, N'Cereales cocidos en agua', N'taza', N'1/2', N'Gramos', 100)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000010', 4, N'Cereales integrales (Special K, All Bran, etc.)', N'taza', N'1/2', N'Gramos', 20)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000011', 4, N'Crotones (sin grasa)', N'taza', N'1 ', N'Gramos', NULL)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000012', 4, N'Galletas De Arroz o Maíz', N'unidad', N'2 ', N'Gramos', 20)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000013', 4, N'Galletas De Soda, Dulces tipo María', N'unidad', N'3 ', N'Gramos', 25)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000014', 4, N'Galletas De Soda, Dulces tipo María, Club Social', N'unidad', N'3 ', N'Gramos', 25)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000015', 4, N'Galletas Dulces tipo Animalitos ', N'unidad', N'8 ', N'Gramos', 25)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000016', 4, N'Galletas Integrales tipo Honey Bran Kraker Bran, etc', N'unidad', N'3 ', N'Gramos', 25)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000017', 4, N'Galletas tipo Saltines ', N'unidad', N'6 ', N'Gramos', 25)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000018', 4, N'Germen de trigo', N'cucharada', N'3 ', N'Gramos', NULL)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000019', 4, N'Granola baja en grasa', N'taza', N'1/4', N'Gramos', 20)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000020', 4, N'Harina de Arroz', N'cucharada', N'2', N'Gramos', 20)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000021', 4, N'Hojuelas de maíz', N'taza', N'3/4', N'Gramos', 25)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000022', 4, N'Hojuelas de maíz', N'taza', N'3/4', N'Gramos', 25)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000023', 4, N'Hojuelas de maíz azucaradas', N'taza', N'1/2 ', N'Gramos', 20)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000024', 4, N'Leguminosas (caraotas, lentejas, frijoles, garbanzos, etc)', N'taza', N'1/2 ', N'Gramos', 120)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000025', 4, N'Maíz (en granos)', N'taza', N'1/2 ', N'Gramos', 120)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000026', 4, N'Maíz para Cotufas', N'taza', N'1/4 ', N'Gramos', 30)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000027', 4, N'Mazorca', N'unidad', N'1/2 ', N'Gramos', NULL)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000028', 4, N'Mazorca', N'unidad', N'1/2 ', N'Gramos', NULL)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000029', 4, N'Mezcla para Cachapa ', N'cucharada', N'2', N'Gramos', 50)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000030', 4, N'Pan Árabe', N'unidad', N'1/4 ', N'Gramos', NULL)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000031', 4, N'Pan Canilla', N'unidad', N'1/4', N'Gramos', 30)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000032', 4, N'Pan de maíz  (bollito)', N'unidad', N'1 ', N'Gramos', 60)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000033', 4, N'Pan Sueco', N'rebanada', N'2 ', N'Gramos', 20)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000034', 4, N'Papa', N'unidad', N'1 ', N'Gramos', 100)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000035', 4, N'Papa amarilla colombiana  (mini)', N'unidad', N'5 ', N'Gramos', 100)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000036', 4, N'Pasta', N'taza', N'1/2 ', N'Gramos', 70)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000037', 4, N'Pasta', N'taza', N'1/2 ', N'Gramos', 70)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000038', 4, N'Plátano', N'unidad', N'1/4', N'Gramos', 50)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000039', 4, N'Ponqué (6 cm diámetro)', N'', N'', N'Gramos', 50)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000040', 4, N'Sándwich blanco o integral', N'rebanada', N'1 ', N'Gramos', 30)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000041', 4, N'Tortilla de maíz (13 cm diámetro)', N'unidad', N'1 ', N'Gramos', 30)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000042', 4, N'Yuca', N'', N'', N'Gramos', 60)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000043', 3, N'Albaricoque', N'unidad', N'1 ', N'Gramos', 150)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000044', 3, N'Albaricoque', N'unidad', N'8 ', N'Gramos', NULL)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000045', 3, N'Cambur guineo ', N'unidad', N'1/2 ', N'Gramos', 90)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000046', 3, N'Cambur manzano', N'unidad', N'1 ', N'Gramos', 90)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000047', 3, N'Cerezas (semeruco)', N'unidad', N'12 ', N'Gramos', 100)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000048', 3, N'Ciruela  de huesito', N'unidad', N'8 ', N'Gramos', 100)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000049', 3, N'Ciruelas (importadas) ', N'unidad', N'2 ', N'Gramos', 150)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000050', 3, N'Ciruelas pasas', N'unidad', N'3 ', N'Gramos', NULL)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000051', 3, N'Dátiles', N'unidad', N'3 ', N'Gramos', NULL)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000052', 3, N'Durazno ', N'unidad', N'2 ', N'Gramos', 150)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000053', 3, N'Fresas', N'unidad', N'6-8 ', N'Gramos', 180)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000054', 3, N'Grapefruit', N'unidad', N'1/2 ', N'Gramos', NULL)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000055', 3, N'Guanábana (pulpa)', N'taza', N'1/2 ', N'Gramos', 100)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000056', 3, N'Guayaba rosada', N'unidad', N'1 ', N'Gramos', 200)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000057', 3, N'Hicaco', N'unidad', N'1 ', N'Gramos', 120)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000058', 3, N'Higo (fresco)', N'unidad', N'2 ', N'Gramos', 75)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000059', 3, N'Higos', N'unidad', N'2 ', N'Gramos', NULL)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000060', 3, N'Jobo', N'unidad', N'1 ', N'Gramos', 100)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000061', 3, N'Kiwi', N'unidad', N'1 ', N'Gramos', 100)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000062', 3, N'Lechosa', N'taza', N'2 ', N'Gramos', 200)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000063', 3, N'Mamey', N'unidad', N'1 ', N'Gramos', 170)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000064', 3, N'Mamón', N'unidad', N'6-8 ', N'Gramos', 90)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000065', 3, N'Mandarina', N'unidad', N'1 ', N'Gramos', 200)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000066', 3, N'Mango', N'unidad', N'1 ', N'Gramos', 150)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000067', 3, N'Manzana', N'unidad', N'4 ', N'Gramos', NULL)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000068', 3, N'Manzana con piel', N'unidad', N'1 ', N'Gramos', 120)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000069', 3, N'Manzana deshidratada', N'unidad', N'4 ', N'Gramos', NULL)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000070', 3, N'Melocotón', N'unidad', N'1 ', N'Gramos', 180)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000071', 3, N'Melón rosado', N'taza', N'2 ', N'Gramos', NULL)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000072', 3, N'Melón verde', N'taza', N'1 1/2', N'Gramos', 200)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000073', 3, N'Mora', N'unidad', N'6-8 ', N'Gramos', 120)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000074', 3, N'Naranja', N'unidad', N'1 ', N'Gramos', 190)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000075', 3, N'Nectarina', N'unidad', N'1 ', N'Gramos', 120)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000076', 3, N'Níspero', N'unidad', N'1 ', N'Gramos', 90)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000077', 3, N'Parchita', N'unidad', N'2 ', N'Gramos', 140)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000078', 3, N'Pasitas', N'cucharadita', N'2 ', N'Gramos', NULL)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000079', 3, N'Patilla', N'taza', N'2 ', N'Gramos', NULL)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000080', 3, N'Pera', N'unidad', N'1 ', N'Gramos', 120)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000081', 3, N'Piña', N'taza', N'3/4', N'Gramos', 100)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000082', 3, N'Riñon', N'unidad', N'1 ', N'Gramos', 80)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000083', 3, N'Tamarindo (pulpa)', N'taza', N'1/2 ', N'Gramos', 20)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000084', 3, N'Toronja', N'unidad', N'1/2 ', N'Gramos', 180)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000085', 3, N'Tuna', N'unidad', N'1 ', N'Gramos', 80)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000086', 3, N'Uvas ', N'unidad', N'15 ', N'Gramos', 90)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000087', 3, N'Zapote', N'unidad', N'1/4 ', N'Gramos', 60)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000088', 6, N'Aceite (canola, oliva, soya, maíz, girasol)', N'cucharadita', N'1 ', N'Gramos', 5)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000089', 6, N'Aceitunas: Negras', N'unidad', N'8 ', N'Gramos', 30)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000090', 6, N'Aceitunas: Verdes (rellenas)', N'unidad', N'10 ', N'Gramos', 30)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000091', 6, N'Aderezo comercial', N'cucharadita', N'2 ', N'Gramos', 10)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000092', 6, N'Aguacate ', N'unidad', N'1/8 ', N'Gramos', 30)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000093', 6, N'Coco endulzado, rallado', N'cucharada', N'2 ', N'Gramos', 10)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000094', 6, N'Frutos secos (Nueces, Almendras, maní, merey)', N'taza', N'1/4 ', N'Gramos', 30)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000095', 6, N'Mantequilla', N'cucharadita', N'1 ', N'Gramos', 5)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000096', 6, N'Mantequilla de maní', N'cucharadita', N'2 ', N'Gramos', 10)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000097', 6, N'Margarina (regular)', N'cucharadita', N'1 ', N'Gramos', 5)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000098', 6, N'Mayonesa (regular)', N'cucharadita', N'1 ', N'Gramos', 5)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000099', 6, N'Queso crema regular', N'cucharada', N'1 ', N'Gramos', 15)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000100', 6, N'Queso fundido estilo americano', N'cucharada', N'1 ', N'Gramos', 15)
GO
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000101', 6, N'Tocineta (cocida)', N'unidad', N'3 ', N'Gramos', 30)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000102', 1, N'Leche descremada 1%', N'taza', N'1 ', N'Gramos', 240)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000103', 1, N'Leche descremada 1% en polvo', N'cucharada', N'4 ', N'Gramos', 32)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000104', 1, N'Leche entera en polvo', N'cucharada', N'4 ', N'Gramos', 32)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000105', 1, N'Leche evaporada descremada', N'taza', N'1/2 ', N'Gramos', 120)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000106', 1, N'Yogurt líquido semi descremado c/ 3', N'taza', N'3/4', N'Gramos', 180)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000107', 1, N'Yogurt simple descremado (firme)', N'taza', N'3/4', N'Gramos', 180)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000108', 5, N'Aves de corral: pollo, gallina o pavo (carne blanca s/piel)', N'unidad', N'1/2', N'Gramos', 120)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000109', 5, N'Carne de Res, Carne de Cerdo', N'milanesa', N'1 ', N'Gramos', 120)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000110', 5, N'Embutidos (jamón pechuga de pavo, pechuga de pollo, salami, mortadela, bologna ', N'rebanada', N'2 ', N'Gramos', 30)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000111', 5, N'Huevos: (gallina)', N'unidad', N'1 ', N'Gramos', 50)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000112', 5, N'Mariscos y/o moluscos: almejas, langosta, camarón', N'0', N'0', N'Gramos', 120)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000113', 5, N'Pescados: fresco o congelado', N'filet', N'1 ', N'Gramos', 120)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000114', 5, N'Queso de Búfala', N'taza', N'1/4', N'Gramos', 45)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000115', 5, N'Quesos ', N'taza', N'1/4', N'Gramos', 45)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000116', 5, N'Salchicha', N'unidad', N'1 ', N'Gramos', 50)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000117', 2, N'Acelgas', N'taza', N'1 - 2 ', N'Gramos', 240)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000118', 2, N'Ají dulce', N'taza', N'1/2 ', N'Gramos', 120)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000119', 2, N'Ajo', N'taza', N'1/2 ', N'Gramos', 120)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000120', 2, N'Ajo porro', N'taza', N'1/2 ', N'Gramos', 120)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000121', 2, N'Alcachofa', N'taza', N'1 ', N'Gramos', 240)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000122', 2, N'Alfalfa', N'taza', N'1 ', N'Gramos', 240)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000123', 2, N'Auyama', N'taza', N'1 ', N'Gramos', 240)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000124', 2, N'Berenjena', N'taza', N'1 ', N'Gramos', 240)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000125', 2, N'Berros', N'taza', N'1 ', N'Gramos', 240)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000126', 2, N'Brócoli', N'taza', N'1 ', N'Gramos', 240)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000127', 2, N'Calabacín', N'taza', N'1 ', N'Gramos', 240)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000128', 2, N'Cebolla', N'taza', N'1/2 ', N'Gramos', 120)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000129', 2, N'Cebollín', N'taza', N'1/2 ', N'Gramos', 120)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000130', 2, N'Celery o apio españa', N'taza', N'1/2 ', N'Gramos', 120)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000131', 2, N'Chayota', N'taza', N'1 ', N'Gramos', 240)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000132', 2, N'Coliflor', N'taza', N'1 ', N'Gramos', 240)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000133', 2, N'Corazón de alcachofa', N'taza', N'1 ', N'Gramos', 240)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000134', 2, N'Escarola', N'taza', N'1 ', N'Gramos', 240)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000135', 2, N'Espárragos', N'taza', N'1 ', N'Gramos', 240)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000136', 2, N'Espinaca', N'taza', N'1 - 2  ', N'Gramos', 240)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000137', 2, N'Hinojo', N'taza', N'1 ', N'Gramos', 240)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000138', 2, N'Hongos', N'taza', N'1 ', N'Gramos', 240)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000139', 2, N'Jugo de tomate', N'taza', N'1 ', N'Gramos', 240)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000140', 2, N'Lechuga', N'taza', N'1 ', N'Gramos', 240)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000141', 2, N'Nabo', N'taza', N'1 ', N'Gramos', 240)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000142', 2, N'Palmito', N'taza', N'1 ', N'Gramos', 240)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000143', 2, N'Pepino', N'taza', N'1 ', N'Gramos', 240)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000144', 2, N'Perejil', N'taza', N'1 ', N'Gramos', 240)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000145', 2, N'Pimentón', N'taza', N'1/2 ', N'Gramos', 120)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000146', 2, N'Pimiento', N'taza', N'1/2 ', N'Gramos', 120)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000147', 2, N'Rábanos', N'taza', N'1 ', N'Gramos', 240)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000148', 2, N'Remolacha', N'taza', N'1/2 ', N'Gramos', 120)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000149', 2, N'Repollitos de Bruselas', N'taza', N'1 ', N'Gramos', 240)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000150', 2, N'Repollo', N'taza', N'1 ', N'Gramos', 240)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000151', 2, N'Tomate', N'taza', N'1 ', N'Gramos', 240)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000152', 2, N'Tomate enlatado', N'taza', N'1 ', N'Gramos', 240)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000153', 2, N'Vainitas', N'taza', N'1 ', N'Gramos', 240)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000154', 2, N'2 chinos', N'taza', N'1 ', N'Gramos', 240)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000155', 2, N'Zanahoria', N'taza', N'1 ', N'Gramos', 240)
INSERT [dbo].[MA_ALIMENTOS] ([cod_alimento], [tipo_alimento], [descripcion], [medida_practica], [medida_practica_cant], [unidad], [unidad_cant]) VALUES (N'000156', 5, N'Embutidos (jamón pechuga de pavo, pechuga de pollo, salami, mortadela, bologna (OJO SOLO 2 VECES X SEMANA)', N'rebanada', N'2 ', N'Gramos', 30)
INSERT [dbo].[MA_PRODUCTOS] ([C_CODIGO], [C_DESCRI], [e_precio], [n_precio_m], [n_impuesto], [c_observacion], [n_Votos_Estrellas], [n_Total_Estrellas], [ImgBytes]) VALUES (N'0000000001', N'NUTRIBOX', 60, 3500, 0, NULL, 1, 0, -1)
INSERT [dbo].[ORDERS_DELIVERYMETHOD_TYPES] ([Code], [SysName], [SysNameResourceID], [Description], [DescResourceID]) VALUES (0, N'N/A', 0, N'N/A', 0)
INSERT [dbo].[ORDERS_DELIVERYMETHOD_TYPES] ([Code], [SysName], [SysNameResourceID], [Description], [DescResourceID]) VALUES (1, N'Retiro', 0, N'Retiro en Sitio', 0)
INSERT [dbo].[ORDERS_DELIVERYMETHOD_TYPES] ([Code], [SysName], [SysNameResourceID], [Description], [DescResourceID]) VALUES (2, N'Entrega', 0, N'Entrega', 0)
INSERT [dbo].[ORDERS_PAYMENTMETHOD_TYPES] ([Code], [SysName], [SysNameResourceID], [Description], [DescResourceID]) VALUES (0, N'N/A', 0, N'N/A', 0)
INSERT [dbo].[ORDERS_PAYMENTMETHOD_TYPES] ([Code], [SysName], [SysNameResourceID], [Description], [DescResourceID]) VALUES (1, N'Pago en Sitio', 0, N'Pago en Sitio', 0)
INSERT [dbo].[ORDERS_PAYMENTMETHOD_TYPES] ([Code], [SysName], [SysNameResourceID], [Description], [DescResourceID]) VALUES (2, N'TDC', 0, N'Tarjeta de Credito', 0)
INSERT [dbo].[ORDERS_PAYMENTMETHOD_TYPES] ([Code], [SysName], [SysNameResourceID], [Description], [DescResourceID]) VALUES (3, N'PRE', 0, N'Pre Autorización con TDC', 0)
INSERT [dbo].[ORDERS_PAYMENTMETHOD_TYPES] ([Code], [SysName], [SysNameResourceID], [Description], [DescResourceID]) VALUES (4, N'TR', 0, N'Transferencia', 0)
INSERT [dbo].[ORDERS_PAYMENTMETHOD_TYPES] ([Code], [SysName], [SysNameResourceID], [Description], [DescResourceID]) VALUES (5, N'DEP', 0, N'Depósito', 0)
INSERT [dbo].[PAIS] ([id_pais], [pais], [iso]) VALUES (N'VE', N'Venezuela', N'VE')
INSERT [dbo].[PLAN_NUTRICIONAL] ([id_plan], [descripcion], [calorias_diaria]) VALUES (N'DHM07', N'DHM07', 2000)
INSERT [dbo].[PLAN_NUTRICIONAL] ([id_plan], [descripcion], [calorias_diaria]) VALUES (N'HMI03', N'HMI03', 1800)
INSERT [dbo].[PLAN_NUTRICIONAL] ([id_plan], [descripcion], [calorias_diaria]) VALUES (N'HMJ04', N'HMJ04', 1800)
INSERT [dbo].[PLAN_NUTRICIONAL] ([id_plan], [descripcion], [calorias_diaria]) VALUES (N'HSE05', N'HSE05', 2200)
INSERT [dbo].[PLAN_NUTRICIONAL] ([id_plan], [descripcion], [calorias_diaria]) VALUES (N'MLE02', N'MLE02', 2300)
INSERT [dbo].[PLAN_NUTRICIONAL] ([id_plan], [descripcion], [calorias_diaria]) VALUES (N'PPM01', N'PPM01', 1500)
INSERT [dbo].[PLAN_NUTRICIONAL_ACT_FISICA] ([act_fisica], [descripcion]) VALUES (N'001', N'SEDENTARIO')
INSERT [dbo].[PLAN_NUTRICIONAL_ACT_FISICA] ([act_fisica], [descripcion]) VALUES (N'002', N'LIGERA')
INSERT [dbo].[PLAN_NUTRICIONAL_ACT_FISICA] ([act_fisica], [descripcion]) VALUES (N'003', N'FUERTE')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000001')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000002')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000003')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000004')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000005')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000006')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000007')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000009')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000010')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000011')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000012')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000014')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000016')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000017')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000018')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000019')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000021')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000024')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000025')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000027')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000029')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000030')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000031')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000032')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000033')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000034')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000035')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000036')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000038')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000039')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000040')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000041')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000042')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000043')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000048')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000049')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000052')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000053')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000054')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000055')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000056')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000057')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000058')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000060')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000061')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000062')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000063')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000065')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000066')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000067')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000068')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000070')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000071')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000072')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000073')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000074')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000075')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000076')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000077')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000079')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000080')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000081')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000082')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000083')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000084')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000085')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000087')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000088')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000089')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000090')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000091')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000092')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000093')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000094')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000095')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000096')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000097')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000102')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000103')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000106')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000107')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000108')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000109')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000111')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000113')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000115')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000116')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000117')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000118')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000119')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000120')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000121')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000123')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000124')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000125')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000126')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000127')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000128')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000129')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000130')
GO
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000131')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000132')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000133')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000134')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000135')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000136')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000137')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000138')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000139')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000140')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000141')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000142')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000143')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000145')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000146')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000147')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000149')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000150')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000151')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000152')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000153')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000154')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000155')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'DHM07', N'000156')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMI03', N'000004')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMI03', N'000005')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMI03', N'000006')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMI03', N'000012')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMI03', N'000020')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMI03', N'000021')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMI03', N'000023')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMI03', N'000024')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMI03', N'000026')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMI03', N'000027')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMI03', N'000029')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMI03', N'000032')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMI03', N'000038')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMI03', N'000041')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMI03', N'000042')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMI03', N'000049')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMI03', N'000055')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMI03', N'000056')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMI03', N'000057')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMI03', N'000058')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMI03', N'000059')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMI03', N'000060')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMI03', N'000062')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMI03', N'000063')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMI03', N'000064')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMI03', N'000066')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMI03', N'000068')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMI03', N'000069')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMI03', N'000071')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMI03', N'000072')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMI03', N'000073')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMI03', N'000076')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMI03', N'000077')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMI03', N'000078')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMI03', N'000079')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMI03', N'000080')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMI03', N'000082')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMI03', N'000083')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMI03', N'000085')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMI03', N'000086')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMI03', N'000087')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMI03', N'000088')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMI03', N'000089')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMI03', N'000090')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMI03', N'000091')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMI03', N'000092')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMI03', N'000093')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMI03', N'000108')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMI03', N'000109')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMI03', N'000111')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMI03', N'000114')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMI03', N'000117')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMI03', N'000118')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMI03', N'000119')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMI03', N'000120')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMI03', N'000121')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMI03', N'000122')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMI03', N'000123')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMI03', N'000124')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMI03', N'000125')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMI03', N'000126')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMI03', N'000127')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMI03', N'000128')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMI03', N'000129')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMI03', N'000130')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMI03', N'000131')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMI03', N'000132')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMI03', N'000133')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMI03', N'000134')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMI03', N'000137')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMI03', N'000138')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMI03', N'000140')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMI03', N'000141')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMI03', N'000142')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMI03', N'000143')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMI03', N'000144')
GO
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMI03', N'000145')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMI03', N'000146')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMI03', N'000147')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMI03', N'000148')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMI03', N'000153')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMI03', N'000154')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMI03', N'000155')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000001')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000002')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000003')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000004')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000005')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000006')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000007')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000009')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000010')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000011')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000012')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000013')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000015')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000016')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000017')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000018')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000019')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000021')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000023')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000024')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000025')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000027')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000029')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000030')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000031')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000032')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000033')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000034')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000035')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000036')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000038')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000039')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000040')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000041')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000042')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000043')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000045')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000046')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000047')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000048')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000049')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000050')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000051')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000052')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000053')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000054')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000055')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000056')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000057')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000058')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000059')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000060')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000061')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000062')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000063')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000064')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000065')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000066')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000067')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000068')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000070')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000071')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000072')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000073')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000074')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000075')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000076')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000077')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000078')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000079')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000080')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000081')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000082')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000083')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000084')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000085')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000086')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000087')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000088')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000089')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000090')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000091')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000092')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000093')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000094')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000102')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000103')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000105')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000106')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000107')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000108')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000109')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000110')
GO
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000111')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000112')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000113')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000115')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000116')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000117')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000118')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000119')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000120')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000121')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000122')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000123')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000124')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000125')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000126')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000127')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000128')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000129')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000130')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000131')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000132')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000133')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000134')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000135')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000136')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000137')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000138')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000139')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000140')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000141')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000142')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000143')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000144')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000145')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000146')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000147')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000148')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000149')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000150')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000151')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000152')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000153')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000154')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HMJ04', N'000155')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000001')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000002')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000003')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000004')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000005')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000006')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000007')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000009')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000010')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000011')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000012')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000014')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000015')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000016')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000017')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000018')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000019')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000021')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000023')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000024')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000025')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000027')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000029')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000030')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000031')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000032')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000033')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000034')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000035')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000036')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000038')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000039')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000040')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000041')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000042')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000043')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000045')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000046')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000047')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000048')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000049')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000050')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000051')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000052')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000053')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000054')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000055')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000056')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000057')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000058')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000059')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000060')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000061')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000062')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000063')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000064')
GO
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000065')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000066')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000067')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000068')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000070')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000071')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000072')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000073')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000074')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000075')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000076')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000077')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000078')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000079')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000080')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000081')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000082')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000083')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000084')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000085')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000086')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000087')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000088')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000089')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000090')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000091')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000092')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000093')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000094')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000095')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000096')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000097')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000098')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000099')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000100')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000101')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000102')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000103')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000106')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000107')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000108')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000109')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000110')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000111')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000113')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000115')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000116')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000117')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000118')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000119')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000120')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000121')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000122')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000123')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000124')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000125')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000126')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000127')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000128')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000129')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000130')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000131')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000132')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000133')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000134')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000135')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000136')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000137')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000138')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000139')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000140')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000141')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000142')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000143')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000144')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000145')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000146')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000147')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000148')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000149')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000150')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000151')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000152')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000153')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000154')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'HSE05', N'000155')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000001')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000002')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000003')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000004')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000005')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000006')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000007')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000009')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000010')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000011')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000012')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000014')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000015')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000016')
GO
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000017')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000018')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000019')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000021')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000023')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000024')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000025')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000027')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000030')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000031')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000033')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000034')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000035')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000036')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000038')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000040')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000041')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000042')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000043')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000045')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000046')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000047')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000048')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000049')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000052')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000053')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000054')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000055')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000056')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000057')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000058')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000060')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000061')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000062')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000063')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000064')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000065')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000066')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000068')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000070')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000071')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000072')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000073')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000074')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000075')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000076')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000077')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000078')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000079')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000080')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000081')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000082')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000083')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000084')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000085')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000086')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000087')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000088')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000089')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000090')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000091')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000092')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000093')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000094')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000095')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000096')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000097')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000098')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000099')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000100')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000101')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000102')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000103')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000104')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000106')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000107')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000108')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000109')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000111')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000113')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000115')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000116')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000117')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000118')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000119')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000120')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000121')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000123')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000124')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000125')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000126')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000127')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000128')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000129')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000130')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000131')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000132')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000133')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000134')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000135')
GO
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000136')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000137')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000138')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000139')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000140')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000141')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000142')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000143')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000145')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000146')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000147')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000148')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000149')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000150')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000151')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000152')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000153')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000154')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000155')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'MLE02', N'000156')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000001')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000002')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000003')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000004')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000005')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000006')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000007')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000009')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000010')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000011')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000012')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000014')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000015')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000016')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000017')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000018')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000019')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000021')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000023')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000024')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000025')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000027')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000029')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000030')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000031')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000032')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000033')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000034')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000035')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000036')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000038')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000039')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000040')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000041')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000042')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000043')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000045')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000046')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000047')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000048')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000049')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000050')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000051')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000052')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000053')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000054')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000055')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000056')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000057')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000058')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000059')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000060')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000061')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000062')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000063')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000064')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000065')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000066')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000067')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000068')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000070')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000071')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000072')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000073')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000074')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000075')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000076')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000077')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000078')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000079')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000080')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000081')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000082')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000083')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000084')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000085')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000086')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000087')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000088')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000089')
GO
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000090')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000091')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000092')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000093')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000094')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000095')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000096')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000097')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000098')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000099')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000100')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000101')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000102')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000103')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000106')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000107')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000108')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000109')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000110')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000111')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000113')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000115')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000116')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000117')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000118')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000119')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000120')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000121')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000122')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000123')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000124')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000125')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000126')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000127')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000128')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000129')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000130')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000131')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000132')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000133')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000134')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000135')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000136')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000137')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000138')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000139')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000140')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000141')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000142')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000143')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000144')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000145')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000146')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000147')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000148')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000149')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000150')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000151')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000152')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000153')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000154')
INSERT [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] ([id_plan], [cod_alimento]) VALUES (N'PPM01', N'000155')
INSERT [dbo].[PLAN_NUTRICIONAL_CONDICION] ([id_plan], [linea_condicion], [sexo], [edad_menor], [edad_mayor], [act_fisica], [condicion_esp], [IMC_menor], [IMC_mayor]) VALUES (N'DHM07', 1, N'AMBOS', 12, 12, N'001', N'004', 25, 25)
INSERT [dbo].[PLAN_NUTRICIONAL_CONDICION] ([id_plan], [linea_condicion], [sexo], [edad_menor], [edad_mayor], [act_fisica], [condicion_esp], [IMC_menor], [IMC_mayor]) VALUES (N'DHM07', 2, N'AMBOS', 12, 12, N'002', N'004', 25, 25)
INSERT [dbo].[PLAN_NUTRICIONAL_CONDICION] ([id_plan], [linea_condicion], [sexo], [edad_menor], [edad_mayor], [act_fisica], [condicion_esp], [IMC_menor], [IMC_mayor]) VALUES (N'DHM07', 3, N'AMBOS', 12, 12, N'003', N'004', 25, 25)
INSERT [dbo].[PLAN_NUTRICIONAL_CONDICION] ([id_plan], [linea_condicion], [sexo], [edad_menor], [edad_mayor], [act_fisica], [condicion_esp], [IMC_menor], [IMC_mayor]) VALUES (N'HMI03', 1, N'AMBOS', 12, 12, N'001', N'005', 25, 25)
INSERT [dbo].[PLAN_NUTRICIONAL_CONDICION] ([id_plan], [linea_condicion], [sexo], [edad_menor], [edad_mayor], [act_fisica], [condicion_esp], [IMC_menor], [IMC_mayor]) VALUES (N'HMI03', 2, N'AMBOS', 12, 12, N'002', N'005', 25, 25)
INSERT [dbo].[PLAN_NUTRICIONAL_CONDICION] ([id_plan], [linea_condicion], [sexo], [edad_menor], [edad_mayor], [act_fisica], [condicion_esp], [IMC_menor], [IMC_mayor]) VALUES (N'HMI03', 3, N'AMBOS', 12, 12, N'003', N'005', 25, 25)
INSERT [dbo].[PLAN_NUTRICIONAL_CONDICION] ([id_plan], [linea_condicion], [sexo], [edad_menor], [edad_mayor], [act_fisica], [condicion_esp], [IMC_menor], [IMC_mayor]) VALUES (N'HMJ04', 1, N'AMBOS', 12, 12, N'001', N'003', 25, 25)
INSERT [dbo].[PLAN_NUTRICIONAL_CONDICION] ([id_plan], [linea_condicion], [sexo], [edad_menor], [edad_mayor], [act_fisica], [condicion_esp], [IMC_menor], [IMC_mayor]) VALUES (N'HMJ04', 2, N'AMBOS', 12, 12, N'002', N'003', 25, 25)
INSERT [dbo].[PLAN_NUTRICIONAL_CONDICION] ([id_plan], [linea_condicion], [sexo], [edad_menor], [edad_mayor], [act_fisica], [condicion_esp], [IMC_menor], [IMC_mayor]) VALUES (N'HMJ04', 3, N'AMBOS', 12, 12, N'003', N'003', 25, 25)
INSERT [dbo].[PLAN_NUTRICIONAL_CONDICION] ([id_plan], [linea_condicion], [sexo], [edad_menor], [edad_mayor], [act_fisica], [condicion_esp], [IMC_menor], [IMC_mayor]) VALUES (N'HSE05', 1, N'MASCULINO', NULL, 12, N'002', N'001', 25, NULL)
INSERT [dbo].[PLAN_NUTRICIONAL_CONDICION] ([id_plan], [linea_condicion], [sexo], [edad_menor], [edad_mayor], [act_fisica], [condicion_esp], [IMC_menor], [IMC_mayor]) VALUES (N'HSE05', 2, N'MASCULINO', NULL, 12, N'003', N'001', 25, NULL)
INSERT [dbo].[PLAN_NUTRICIONAL_CONDICION] ([id_plan], [linea_condicion], [sexo], [edad_menor], [edad_mayor], [act_fisica], [condicion_esp], [IMC_menor], [IMC_mayor]) VALUES (N'MLE02', 1, N'FEMENINO', NULL, 12, N'001', N'002', 25, 25)
INSERT [dbo].[PLAN_NUTRICIONAL_CONDICION] ([id_plan], [linea_condicion], [sexo], [edad_menor], [edad_mayor], [act_fisica], [condicion_esp], [IMC_menor], [IMC_mayor]) VALUES (N'MLE02', 2, N'FEMENINO', NULL, 12, N'002', N'002', 25, 25)
INSERT [dbo].[PLAN_NUTRICIONAL_CONDICION] ([id_plan], [linea_condicion], [sexo], [edad_menor], [edad_mayor], [act_fisica], [condicion_esp], [IMC_menor], [IMC_mayor]) VALUES (N'MLE02', 3, N'FEMENINO', NULL, 12, N'003', N'002', 25, 25)
INSERT [dbo].[PLAN_NUTRICIONAL_CONDICION] ([id_plan], [linea_condicion], [sexo], [edad_menor], [edad_mayor], [act_fisica], [condicion_esp], [IMC_menor], [IMC_mayor]) VALUES (N'PPM01', 1, N'AMBOS', 12, NULL, N'001', N'001', 25, 25)
INSERT [dbo].[PLAN_NUTRICIONAL_CONDICION] ([id_plan], [linea_condicion], [sexo], [edad_menor], [edad_mayor], [act_fisica], [condicion_esp], [IMC_menor], [IMC_mayor]) VALUES (N'PPM01', 2, N'MASCULINO', NULL, 12, N'001', N'001', 25, NULL)
INSERT [dbo].[PLAN_NUTRICIONAL_CONDICION] ([id_plan], [linea_condicion], [sexo], [edad_menor], [edad_mayor], [act_fisica], [condicion_esp], [IMC_menor], [IMC_mayor]) VALUES (N'PPM01', 3, N'AMBOS', NULL, 12, N'001', N'001', NULL, 25)
INSERT [dbo].[PLAN_NUTRICIONAL_CONDICION] ([id_plan], [linea_condicion], [sexo], [edad_menor], [edad_mayor], [act_fisica], [condicion_esp], [IMC_menor], [IMC_mayor]) VALUES (N'PPM01', 4, N'AMBOS', 12, NULL, N'002', N'001', 25, 25)
INSERT [dbo].[PLAN_NUTRICIONAL_CONDICION] ([id_plan], [linea_condicion], [sexo], [edad_menor], [edad_mayor], [act_fisica], [condicion_esp], [IMC_menor], [IMC_mayor]) VALUES (N'PPM01', 5, N'AMBOS', 12, NULL, N'003', N'001', 25, 25)
INSERT [dbo].[PLAN_NUTRICIONAL_CONDICION] ([id_plan], [linea_condicion], [sexo], [edad_menor], [edad_mayor], [act_fisica], [condicion_esp], [IMC_menor], [IMC_mayor]) VALUES (N'PPM01', 6, N'AMBOS', NULL, 12, N'002', N'001', NULL, 25)
INSERT [dbo].[PLAN_NUTRICIONAL_CONDICION] ([id_plan], [linea_condicion], [sexo], [edad_menor], [edad_mayor], [act_fisica], [condicion_esp], [IMC_menor], [IMC_mayor]) VALUES (N'PPM01', 7, N'AMBOS', NULL, 12, N'003', N'001', NULL, 25)
INSERT [dbo].[PLAN_NUTRICIONAL_CONDICION_ESPECIAL] ([condicion_esp], [descripcion]) VALUES (N'001', N'NINGUNA')
INSERT [dbo].[PLAN_NUTRICIONAL_CONDICION_ESPECIAL] ([condicion_esp], [descripcion]) VALUES (N'002', N'LACTANDO O EMBARAZADA')
INSERT [dbo].[PLAN_NUTRICIONAL_CONDICION_ESPECIAL] ([condicion_esp], [descripcion]) VALUES (N'003', N'HIPERTENSO')
INSERT [dbo].[PLAN_NUTRICIONAL_CONDICION_ESPECIAL] ([condicion_esp], [descripcion]) VALUES (N'004', N'DIABETES')
INSERT [dbo].[PLAN_NUTRICIONAL_CONDICION_ESPECIAL] ([condicion_esp], [descripcion]) VALUES (N'005', N'INTOLERANTE LACTOSA Y/O GLUTEN')
INSERT [dbo].[PLAN_NUTRICIONAL_PORCION] ([id_plan], [comida], [tipo_alimento], [porcion]) VALUES (N'DHM07', N'ALMUERZO', 2, 2)
INSERT [dbo].[PLAN_NUTRICIONAL_PORCION] ([id_plan], [comida], [tipo_alimento], [porcion]) VALUES (N'DHM07', N'ALMUERZO', 3, 1)
INSERT [dbo].[PLAN_NUTRICIONAL_PORCION] ([id_plan], [comida], [tipo_alimento], [porcion]) VALUES (N'DHM07', N'ALMUERZO', 4, 3)
INSERT [dbo].[PLAN_NUTRICIONAL_PORCION] ([id_plan], [comida], [tipo_alimento], [porcion]) VALUES (N'DHM07', N'ALMUERZO', 5, 1)
INSERT [dbo].[PLAN_NUTRICIONAL_PORCION] ([id_plan], [comida], [tipo_alimento], [porcion]) VALUES (N'DHM07', N'ALMUERZO', 6, 3)
INSERT [dbo].[PLAN_NUTRICIONAL_PORCION] ([id_plan], [comida], [tipo_alimento], [porcion]) VALUES (N'DHM07', N'CENA', 2, 2)
INSERT [dbo].[PLAN_NUTRICIONAL_PORCION] ([id_plan], [comida], [tipo_alimento], [porcion]) VALUES (N'DHM07', N'CENA', 3, 1)
INSERT [dbo].[PLAN_NUTRICIONAL_PORCION] ([id_plan], [comida], [tipo_alimento], [porcion]) VALUES (N'DHM07', N'CENA', 4, 2)
INSERT [dbo].[PLAN_NUTRICIONAL_PORCION] ([id_plan], [comida], [tipo_alimento], [porcion]) VALUES (N'DHM07', N'CENA', 5, 1)
INSERT [dbo].[PLAN_NUTRICIONAL_PORCION] ([id_plan], [comida], [tipo_alimento], [porcion]) VALUES (N'DHM07', N'CENA', 6, 2)
INSERT [dbo].[PLAN_NUTRICIONAL_PORCION] ([id_plan], [comida], [tipo_alimento], [porcion]) VALUES (N'DHM07', N'DESAYUNO', 3, 1)
INSERT [dbo].[PLAN_NUTRICIONAL_PORCION] ([id_plan], [comida], [tipo_alimento], [porcion]) VALUES (N'DHM07', N'DESAYUNO', 4, 2)
INSERT [dbo].[PLAN_NUTRICIONAL_PORCION] ([id_plan], [comida], [tipo_alimento], [porcion]) VALUES (N'DHM07', N'DESAYUNO', 5, 1)
INSERT [dbo].[PLAN_NUTRICIONAL_PORCION] ([id_plan], [comida], [tipo_alimento], [porcion]) VALUES (N'DHM07', N'DESAYUNO', 6, 1)
INSERT [dbo].[PLAN_NUTRICIONAL_PORCION] ([id_plan], [comida], [tipo_alimento], [porcion]) VALUES (N'DHM07', N'MERIENDA_1', 1, 1)
INSERT [dbo].[PLAN_NUTRICIONAL_PORCION] ([id_plan], [comida], [tipo_alimento], [porcion]) VALUES (N'DHM07', N'MERIENDA_1', 4, 1)
INSERT [dbo].[PLAN_NUTRICIONAL_PORCION] ([id_plan], [comida], [tipo_alimento], [porcion]) VALUES (N'DHM07', N'MERIENDA_2', 3, 1)
INSERT [dbo].[PLAN_NUTRICIONAL_PORCION] ([id_plan], [comida], [tipo_alimento], [porcion]) VALUES (N'DHM07', N'MERIENDA_2', 4, 1)
INSERT [dbo].[PLAN_NUTRICIONAL_PORCION] ([id_plan], [comida], [tipo_alimento], [porcion]) VALUES (N'HMI03', N'ALMUERZO', 2, 2)
INSERT [dbo].[PLAN_NUTRICIONAL_PORCION] ([id_plan], [comida], [tipo_alimento], [porcion]) VALUES (N'HMI03', N'ALMUERZO', 3, 1)
INSERT [dbo].[PLAN_NUTRICIONAL_PORCION] ([id_plan], [comida], [tipo_alimento], [porcion]) VALUES (N'HMI03', N'ALMUERZO', 4, 2)
INSERT [dbo].[PLAN_NUTRICIONAL_PORCION] ([id_plan], [comida], [tipo_alimento], [porcion]) VALUES (N'HMI03', N'ALMUERZO', 5, 1)
INSERT [dbo].[PLAN_NUTRICIONAL_PORCION] ([id_plan], [comida], [tipo_alimento], [porcion]) VALUES (N'HMI03', N'ALMUERZO', 6, 2)
INSERT [dbo].[PLAN_NUTRICIONAL_PORCION] ([id_plan], [comida], [tipo_alimento], [porcion]) VALUES (N'HMI03', N'CENA', 2, 2)
INSERT [dbo].[PLAN_NUTRICIONAL_PORCION] ([id_plan], [comida], [tipo_alimento], [porcion]) VALUES (N'HMI03', N'CENA', 3, 1)
INSERT [dbo].[PLAN_NUTRICIONAL_PORCION] ([id_plan], [comida], [tipo_alimento], [porcion]) VALUES (N'HMI03', N'CENA', 4, 2)
INSERT [dbo].[PLAN_NUTRICIONAL_PORCION] ([id_plan], [comida], [tipo_alimento], [porcion]) VALUES (N'HMI03', N'CENA', 5, 1)
INSERT [dbo].[PLAN_NUTRICIONAL_PORCION] ([id_plan], [comida], [tipo_alimento], [porcion]) VALUES (N'HMI03', N'CENA', 6, 2)
INSERT [dbo].[PLAN_NUTRICIONAL_PORCION] ([id_plan], [comida], [tipo_alimento], [porcion]) VALUES (N'HMI03', N'DESAYUNO', 3, 1)
INSERT [dbo].[PLAN_NUTRICIONAL_PORCION] ([id_plan], [comida], [tipo_alimento], [porcion]) VALUES (N'HMI03', N'DESAYUNO', 4, 2)
INSERT [dbo].[PLAN_NUTRICIONAL_PORCION] ([id_plan], [comida], [tipo_alimento], [porcion]) VALUES (N'HMI03', N'DESAYUNO', 5, 2)
INSERT [dbo].[PLAN_NUTRICIONAL_PORCION] ([id_plan], [comida], [tipo_alimento], [porcion]) VALUES (N'HMI03', N'DESAYUNO', 6, 1)
INSERT [dbo].[PLAN_NUTRICIONAL_PORCION] ([id_plan], [comida], [tipo_alimento], [porcion]) VALUES (N'HMI03', N'MERIENDA_1', 3, 1)
INSERT [dbo].[PLAN_NUTRICIONAL_PORCION] ([id_plan], [comida], [tipo_alimento], [porcion]) VALUES (N'HMI03', N'MERIENDA_1', 4, 1)
INSERT [dbo].[PLAN_NUTRICIONAL_PORCION] ([id_plan], [comida], [tipo_alimento], [porcion]) VALUES (N'HMJ04', N'ALMUERZO', 2, 2)
INSERT [dbo].[PLAN_NUTRICIONAL_PORCION] ([id_plan], [comida], [tipo_alimento], [porcion]) VALUES (N'HMJ04', N'ALMUERZO', 3, 1)
INSERT [dbo].[PLAN_NUTRICIONAL_PORCION] ([id_plan], [comida], [tipo_alimento], [porcion]) VALUES (N'HMJ04', N'ALMUERZO', 4, 2)
INSERT [dbo].[PLAN_NUTRICIONAL_PORCION] ([id_plan], [comida], [tipo_alimento], [porcion]) VALUES (N'HMJ04', N'ALMUERZO', 5, 1)
INSERT [dbo].[PLAN_NUTRICIONAL_PORCION] ([id_plan], [comida], [tipo_alimento], [porcion]) VALUES (N'HMJ04', N'ALMUERZO', 6, 2)
INSERT [dbo].[PLAN_NUTRICIONAL_PORCION] ([id_plan], [comida], [tipo_alimento], [porcion]) VALUES (N'HMJ04', N'CENA', 2, 2)
INSERT [dbo].[PLAN_NUTRICIONAL_PORCION] ([id_plan], [comida], [tipo_alimento], [porcion]) VALUES (N'HMJ04', N'CENA', 3, 1)
INSERT [dbo].[PLAN_NUTRICIONAL_PORCION] ([id_plan], [comida], [tipo_alimento], [porcion]) VALUES (N'HMJ04', N'CENA', 4, 2)
INSERT [dbo].[PLAN_NUTRICIONAL_PORCION] ([id_plan], [comida], [tipo_alimento], [porcion]) VALUES (N'HMJ04', N'CENA', 5, 1)
INSERT [dbo].[PLAN_NUTRICIONAL_PORCION] ([id_plan], [comida], [tipo_alimento], [porcion]) VALUES (N'HMJ04', N'CENA', 6, 2)
INSERT [dbo].[PLAN_NUTRICIONAL_PORCION] ([id_plan], [comida], [tipo_alimento], [porcion]) VALUES (N'HMJ04', N'DESAYUNO', 3, 1)
INSERT [dbo].[PLAN_NUTRICIONAL_PORCION] ([id_plan], [comida], [tipo_alimento], [porcion]) VALUES (N'HMJ04', N'DESAYUNO', 4, 2)
INSERT [dbo].[PLAN_NUTRICIONAL_PORCION] ([id_plan], [comida], [tipo_alimento], [porcion]) VALUES (N'HMJ04', N'DESAYUNO', 5, 2)
INSERT [dbo].[PLAN_NUTRICIONAL_PORCION] ([id_plan], [comida], [tipo_alimento], [porcion]) VALUES (N'HMJ04', N'DESAYUNO', 6, 1)
INSERT [dbo].[PLAN_NUTRICIONAL_PORCION] ([id_plan], [comida], [tipo_alimento], [porcion]) VALUES (N'HMJ04', N'MERIENDA_1', 1, 1)
INSERT [dbo].[PLAN_NUTRICIONAL_PORCION] ([id_plan], [comida], [tipo_alimento], [porcion]) VALUES (N'HMJ04', N'MERIENDA_1', 3, 1)
INSERT [dbo].[PLAN_NUTRICIONAL_PORCION] ([id_plan], [comida], [tipo_alimento], [porcion]) VALUES (N'HMJ04', N'MERIENDA_1', 4, 1)
INSERT [dbo].[PLAN_NUTRICIONAL_PORCION] ([id_plan], [comida], [tipo_alimento], [porcion]) VALUES (N'HMJ04', N'MERIENDA_2', 1, 1)
INSERT [dbo].[PLAN_NUTRICIONAL_PORCION] ([id_plan], [comida], [tipo_alimento], [porcion]) VALUES (N'HMJ04', N'MERIENDA_2', 3, 1)
INSERT [dbo].[PLAN_NUTRICIONAL_PORCION] ([id_plan], [comida], [tipo_alimento], [porcion]) VALUES (N'HMJ04', N'MERIENDA_2', 4, 1)
INSERT [dbo].[PLAN_NUTRICIONAL_PORCION] ([id_plan], [comida], [tipo_alimento], [porcion]) VALUES (N'HSE05', N'ALMUERZO', 2, 3)
INSERT [dbo].[PLAN_NUTRICIONAL_PORCION] ([id_plan], [comida], [tipo_alimento], [porcion]) VALUES (N'HSE05', N'ALMUERZO', 3, 1)
INSERT [dbo].[PLAN_NUTRICIONAL_PORCION] ([id_plan], [comida], [tipo_alimento], [porcion]) VALUES (N'HSE05', N'ALMUERZO', 4, 3)
INSERT [dbo].[PLAN_NUTRICIONAL_PORCION] ([id_plan], [comida], [tipo_alimento], [porcion]) VALUES (N'HSE05', N'ALMUERZO', 5, 1)
INSERT [dbo].[PLAN_NUTRICIONAL_PORCION] ([id_plan], [comida], [tipo_alimento], [porcion]) VALUES (N'HSE05', N'ALMUERZO', 6, 4)
INSERT [dbo].[PLAN_NUTRICIONAL_PORCION] ([id_plan], [comida], [tipo_alimento], [porcion]) VALUES (N'HSE05', N'CENA', 2, 1)
INSERT [dbo].[PLAN_NUTRICIONAL_PORCION] ([id_plan], [comida], [tipo_alimento], [porcion]) VALUES (N'HSE05', N'CENA', 3, 1)
INSERT [dbo].[PLAN_NUTRICIONAL_PORCION] ([id_plan], [comida], [tipo_alimento], [porcion]) VALUES (N'HSE05', N'CENA', 4, 2)
INSERT [dbo].[PLAN_NUTRICIONAL_PORCION] ([id_plan], [comida], [tipo_alimento], [porcion]) VALUES (N'HSE05', N'CENA', 5, 1)
INSERT [dbo].[PLAN_NUTRICIONAL_PORCION] ([id_plan], [comida], [tipo_alimento], [porcion]) VALUES (N'HSE05', N'CENA', 6, 2)
INSERT [dbo].[PLAN_NUTRICIONAL_PORCION] ([id_plan], [comida], [tipo_alimento], [porcion]) VALUES (N'HSE05', N'DESAYUNO', 1, 1)
INSERT [dbo].[PLAN_NUTRICIONAL_PORCION] ([id_plan], [comida], [tipo_alimento], [porcion]) VALUES (N'HSE05', N'DESAYUNO', 3, 1)
INSERT [dbo].[PLAN_NUTRICIONAL_PORCION] ([id_plan], [comida], [tipo_alimento], [porcion]) VALUES (N'HSE05', N'DESAYUNO', 4, 4)
INSERT [dbo].[PLAN_NUTRICIONAL_PORCION] ([id_plan], [comida], [tipo_alimento], [porcion]) VALUES (N'HSE05', N'DESAYUNO', 5, 2)
INSERT [dbo].[PLAN_NUTRICIONAL_PORCION] ([id_plan], [comida], [tipo_alimento], [porcion]) VALUES (N'HSE05', N'DESAYUNO', 6, 1)
INSERT [dbo].[PLAN_NUTRICIONAL_PORCION] ([id_plan], [comida], [tipo_alimento], [porcion]) VALUES (N'HSE05', N'MERIENDA_1', 4, 2)
INSERT [dbo].[PLAN_NUTRICIONAL_PORCION] ([id_plan], [comida], [tipo_alimento], [porcion]) VALUES (N'HSE05', N'MERIENDA_1', 6, 1)
INSERT [dbo].[PLAN_NUTRICIONAL_PORCION] ([id_plan], [comida], [tipo_alimento], [porcion]) VALUES (N'HSE05', N'MERIENDA_2', 3, 1)
INSERT [dbo].[PLAN_NUTRICIONAL_PORCION] ([id_plan], [comida], [tipo_alimento], [porcion]) VALUES (N'HSE05', N'MERIENDA_2', 4, 1)
INSERT [dbo].[PLAN_NUTRICIONAL_PORCION] ([id_plan], [comida], [tipo_alimento], [porcion]) VALUES (N'MLE02', N'ALMUERZO', 2, 2)
INSERT [dbo].[PLAN_NUTRICIONAL_PORCION] ([id_plan], [comida], [tipo_alimento], [porcion]) VALUES (N'MLE02', N'ALMUERZO', 3, 1)
INSERT [dbo].[PLAN_NUTRICIONAL_PORCION] ([id_plan], [comida], [tipo_alimento], [porcion]) VALUES (N'MLE02', N'ALMUERZO', 4, 2)
INSERT [dbo].[PLAN_NUTRICIONAL_PORCION] ([id_plan], [comida], [tipo_alimento], [porcion]) VALUES (N'MLE02', N'ALMUERZO', 5, 1)
INSERT [dbo].[PLAN_NUTRICIONAL_PORCION] ([id_plan], [comida], [tipo_alimento], [porcion]) VALUES (N'MLE02', N'ALMUERZO', 6, 2)
INSERT [dbo].[PLAN_NUTRICIONAL_PORCION] ([id_plan], [comida], [tipo_alimento], [porcion]) VALUES (N'MLE02', N'CENA', 1, 1)
INSERT [dbo].[PLAN_NUTRICIONAL_PORCION] ([id_plan], [comida], [tipo_alimento], [porcion]) VALUES (N'MLE02', N'CENA', 2, 2)
INSERT [dbo].[PLAN_NUTRICIONAL_PORCION] ([id_plan], [comida], [tipo_alimento], [porcion]) VALUES (N'MLE02', N'CENA', 3, 1)
INSERT [dbo].[PLAN_NUTRICIONAL_PORCION] ([id_plan], [comida], [tipo_alimento], [porcion]) VALUES (N'MLE02', N'CENA', 4, 2)
INSERT [dbo].[PLAN_NUTRICIONAL_PORCION] ([id_plan], [comida], [tipo_alimento], [porcion]) VALUES (N'MLE02', N'CENA', 5, 1)
INSERT [dbo].[PLAN_NUTRICIONAL_PORCION] ([id_plan], [comida], [tipo_alimento], [porcion]) VALUES (N'MLE02', N'CENA', 6, 2)
INSERT [dbo].[PLAN_NUTRICIONAL_PORCION] ([id_plan], [comida], [tipo_alimento], [porcion]) VALUES (N'MLE02', N'DESAYUNO', 1, 1)
INSERT [dbo].[PLAN_NUTRICIONAL_PORCION] ([id_plan], [comida], [tipo_alimento], [porcion]) VALUES (N'MLE02', N'DESAYUNO', 3, 1)
INSERT [dbo].[PLAN_NUTRICIONAL_PORCION] ([id_plan], [comida], [tipo_alimento], [porcion]) VALUES (N'MLE02', N'DESAYUNO', 4, 2)
INSERT [dbo].[PLAN_NUTRICIONAL_PORCION] ([id_plan], [comida], [tipo_alimento], [porcion]) VALUES (N'MLE02', N'DESAYUNO', 5, 2)
INSERT [dbo].[PLAN_NUTRICIONAL_PORCION] ([id_plan], [comida], [tipo_alimento], [porcion]) VALUES (N'MLE02', N'DESAYUNO', 6, 2)
INSERT [dbo].[PLAN_NUTRICIONAL_PORCION] ([id_plan], [comida], [tipo_alimento], [porcion]) VALUES (N'MLE02', N'MERIENDA_1', 3, 1)
INSERT [dbo].[PLAN_NUTRICIONAL_PORCION] ([id_plan], [comida], [tipo_alimento], [porcion]) VALUES (N'MLE02', N'MERIENDA_1', 4, 1)
INSERT [dbo].[PLAN_NUTRICIONAL_PORCION] ([id_plan], [comida], [tipo_alimento], [porcion]) VALUES (N'MLE02', N'MERIENDA_1', 6, 1)
INSERT [dbo].[PLAN_NUTRICIONAL_PORCION] ([id_plan], [comida], [tipo_alimento], [porcion]) VALUES (N'MLE02', N'MERIENDA_2', 3, 1)
INSERT [dbo].[PLAN_NUTRICIONAL_PORCION] ([id_plan], [comida], [tipo_alimento], [porcion]) VALUES (N'MLE02', N'MERIENDA_2', 4, 1)
INSERT [dbo].[PLAN_NUTRICIONAL_PORCION] ([id_plan], [comida], [tipo_alimento], [porcion]) VALUES (N'PPM01', N'ALMUERZO', 2, 2)
INSERT [dbo].[PLAN_NUTRICIONAL_PORCION] ([id_plan], [comida], [tipo_alimento], [porcion]) VALUES (N'PPM01', N'ALMUERZO', 3, 1)
INSERT [dbo].[PLAN_NUTRICIONAL_PORCION] ([id_plan], [comida], [tipo_alimento], [porcion]) VALUES (N'PPM01', N'ALMUERZO', 4, 2)
INSERT [dbo].[PLAN_NUTRICIONAL_PORCION] ([id_plan], [comida], [tipo_alimento], [porcion]) VALUES (N'PPM01', N'ALMUERZO', 5, 1)
INSERT [dbo].[PLAN_NUTRICIONAL_PORCION] ([id_plan], [comida], [tipo_alimento], [porcion]) VALUES (N'PPM01', N'ALMUERZO', 6, 2)
INSERT [dbo].[PLAN_NUTRICIONAL_PORCION] ([id_plan], [comida], [tipo_alimento], [porcion]) VALUES (N'PPM01', N'CENA', 2, 1)
GO
INSERT [dbo].[PLAN_NUTRICIONAL_PORCION] ([id_plan], [comida], [tipo_alimento], [porcion]) VALUES (N'PPM01', N'CENA', 3, 1)
INSERT [dbo].[PLAN_NUTRICIONAL_PORCION] ([id_plan], [comida], [tipo_alimento], [porcion]) VALUES (N'PPM01', N'CENA', 4, 2)
INSERT [dbo].[PLAN_NUTRICIONAL_PORCION] ([id_plan], [comida], [tipo_alimento], [porcion]) VALUES (N'PPM01', N'CENA', 5, 1)
INSERT [dbo].[PLAN_NUTRICIONAL_PORCION] ([id_plan], [comida], [tipo_alimento], [porcion]) VALUES (N'PPM01', N'CENA', 6, 2)
INSERT [dbo].[PLAN_NUTRICIONAL_PORCION] ([id_plan], [comida], [tipo_alimento], [porcion]) VALUES (N'PPM01', N'DESAYUNO', 1, 1)
INSERT [dbo].[PLAN_NUTRICIONAL_PORCION] ([id_plan], [comida], [tipo_alimento], [porcion]) VALUES (N'PPM01', N'DESAYUNO', 3, 1)
INSERT [dbo].[PLAN_NUTRICIONAL_PORCION] ([id_plan], [comida], [tipo_alimento], [porcion]) VALUES (N'PPM01', N'DESAYUNO', 4, 2)
INSERT [dbo].[PLAN_NUTRICIONAL_PORCION] ([id_plan], [comida], [tipo_alimento], [porcion]) VALUES (N'PPM01', N'DESAYUNO', 5, 1)
INSERT [dbo].[PLAN_NUTRICIONAL_PORCION] ([id_plan], [comida], [tipo_alimento], [porcion]) VALUES (N'PPM01', N'MERIENDA_1', 3, 1)
INSERT [dbo].[PLAN_NUTRICIONAL_TIPO_COMIDA] ([tipo_comida], [descripcion]) VALUES (N'ALMUERZO', N'ALMUERZO')
INSERT [dbo].[PLAN_NUTRICIONAL_TIPO_COMIDA] ([tipo_comida], [descripcion]) VALUES (N'CENA', N'CENA')
INSERT [dbo].[PLAN_NUTRICIONAL_TIPO_COMIDA] ([tipo_comida], [descripcion]) VALUES (N'DESAYUNO', N'DESAYUNO')
INSERT [dbo].[PLAN_NUTRICIONAL_TIPO_COMIDA] ([tipo_comida], [descripcion]) VALUES (N'MERIENDA_1', N'MERIENDA MAÑANA')
INSERT [dbo].[PLAN_NUTRICIONAL_TIPO_COMIDA] ([tipo_comida], [descripcion]) VALUES (N'MERIENDA_2', N'MERIENDA TARDE')
INSERT [dbo].[PLANES_SUSCRIPCION] ([plan_suscrip], [descripcion], [precio], [plan_detalle], [dias_valides]) VALUES (N'2', N'Plan suscripcion 2', CAST(60.00 AS Numeric(18, 2)), N'Este es el segundo plan', NULL)
SET IDENTITY_INSERT [dbo].[PROCESO_REGISTRO_MA] ON 

INSERT [dbo].[PROCESO_REGISTRO_MA] ([id_proceso], [descripcion]) VALUES (1, N'Registro de correo')
INSERT [dbo].[PROCESO_REGISTRO_MA] ([id_proceso], [descripcion]) VALUES (2, N'Registro de contraseña y correo')
INSERT [dbo].[PROCESO_REGISTRO_MA] ([id_proceso], [descripcion]) VALUES (3, N'Registro de datos afiliados y dirección')
INSERT [dbo].[PROCESO_REGISTRO_MA] ([id_proceso], [descripcion]) VALUES (4, N'Registro pago inicial ')
SET IDENTITY_INSERT [dbo].[PROCESO_REGISTRO_MA] OFF
INSERT [dbo].[REGLASDENEGOCIO] ([IDModulo], [IDProceso], [Campo], [Descripcion], [Tipo], [ValorDefault], [ValoresPermitidos], [Valor], [Oculto]) VALUES (N'0000000002', N'0000000002', N'Correo_Direccion', N'', N'Texto', N'', N'', N'ceresfreshweb@gmail.com', 1)
INSERT [dbo].[REGLASDENEGOCIO] ([IDModulo], [IDProceso], [Campo], [Descripcion], [Tipo], [ValorDefault], [ValoresPermitidos], [Valor], [Oculto]) VALUES (N'0000000003', N'0000000003', N'Correo_Password', N'', N'Texto', N'', N'', N'CeresFreshweb001', 1)
INSERT [dbo].[REGLASDENEGOCIO] ([IDModulo], [IDProceso], [Campo], [Descripcion], [Tipo], [ValorDefault], [ValoresPermitidos], [Valor], [Oculto]) VALUES (N'0000000001', N'0000000001', N'Precio nutribox', N'Precio por caja nutribox', N'Entero', N'60', N'', N'3000', 1)
SET IDENTITY_INSERT [dbo].[SECTORES] ON 

INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (1, 127, 0, N'Guataparo ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (2, 127, 0, N' Altos de Guataparo ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (3, 127, 0, N' Terrazas del Country ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (4, 127, 0, N' Lomas del Country Club ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (5, 127, 0, N' Guataparo Country Club ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (6, 127, 0, N' El Solar ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (7, 127, 0, N' Hato Royal ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (8, 127, 0, N' Villas Laguna Club ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (9, 127, 0, N' Villas Laguna Norte ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (10, 127, 0, N' Santa María del Campo ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (11, 127, 0, N' Colinas de Guataparo ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (12, 127, 0, N' El Mirador ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (13, 127, 0, N' Parque Mirador ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (14, 127, 0, N' El Bosque ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (15, 127, 0, N' Agua Blanca ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (16, 127, 0, N' Valles de Camoruco ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (17, 127, 0, N' Prebo I ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (18, 127, 0, N' Prebo II ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (19, 127, 0, N' Prebo III ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (20, 127, 0, N' Prebo II Norte ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (21, 127, 0, N' Altos de Prebo ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (22, 127, 0, N' Trigal Norte ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (23, 127, 0, N' Trigal Sur ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (24, 127, 0, N' Trigal Centro ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (25, 127, 0, N' La Viña ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (26, 127, 0, N' Lomas de La Viña ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (27, 127, 0, N' Guaparo ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (28, 127, 0, N' El Recreo ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (29, 127, 0, N' Los Chaguaramos ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (30, 127, 0, N' Los Mangos ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (31, 127, 0, N' Santa Cecilia ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (32, 127, 0, N' La Ceiba ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (33, 127, 0, N' Camoruco ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (34, 127, 0, N' Viejo Camoruco ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (35, 127, 0, N' El Viñedo ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (36, 127, 0, N' La Alegría ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (37, 127, 0, N' La Manguita ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (38, 127, 0, N' Los Colorados ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (39, 127, 0, N' Campo Alegre ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (40, 127, 0, N' Oviedo ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (41, 127, 0, N' San José de Tarbes ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (42, 127, 0, N' Kerdell ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (43, 127, 0, N' Los Nísperos ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (44, 127, 0, N' Terrazas de los Nísperos ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (45, 127, 0, N' El Parral ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (46, 127, 0, N' Altos del Parral ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (47, 127, 0, N' Sabana Larga ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (48, 127, 0, N' La Trigaleña ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (49, 127, 0, N' Las Chimeneas ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (50, 127, 0, N' Lomas del Este ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (51, 127, 0, N' Las Clavellinas ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (52, 127, 0, N' Las Palmas ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (53, 127, 0, N' Valle Blanco ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (54, 127, 0, N' La Florida Norte ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (55, 127, 0, N' Las Acacias ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (56, 127, 0, N' Caja de Agua ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (57, 127, 0, N' San José ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (58, 127, 0, N' Las Flores ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (59, 127, 0, N' El Parque ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (60, 127, 0, N' Miranda ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (61, 127, 0, N' La Rosarito ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (62, 127, 0, N' Country Norte ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (63, 127, 0, N' Prebol ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (64, 127, 0, N' Los Sauces ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (65, 127, 0, N' Los Naranjos ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (66, 127, 0, N' Carabobo ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (67, 127, 0, N' Padre Alfonso ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (68, 127, 0, N' Majay ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (69, 127, 0, N' La Arboleda ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (70, 127, 0, N' Piedra Pintada')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (71, 127, 0, N'La Candelaria Norte ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (72, 127, 0, N' La Candelaria Sur ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (73, 127, 0, N' Atlas ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (74, 127, 0, N' Central I ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (75, 127, 0, N' Central II ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (76, 127, 0, N' El Candelero ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (77, 127, 0, N' Eutimio Rivas ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (78, 127, 0, N' El Calvario ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (79, 127, 0, N' La Guacamaya I ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (80, 127, 0, N' La Guacamaya II ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (81, 127, 0, N' La Guacamaya III')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (82, 127, 0, N'Casco Central Histórico Este')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (83, 127, 0, N'Casco Central Histórico Oeste')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (84, 127, 0, N'Centro ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (85, 127, 0, N' Buenaventura ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (86, 127, 0, N' Paraparal ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (87, 127, 0, N' Alicia Pietri De Caldera ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (88, 127, 0, N' El Roble ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (89, 127, 0, N' Los Cerritos ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (90, 127, 0, N' Las Aguitas ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (91, 127, 0, N' Libertador ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (92, 127, 0, N' Las Américas ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (93, 127, 0, N' Rosalinda ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (94, 127, 0, N' Las Vegas ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (95, 127, 0, N' Piedras Negras ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (96, 127, 0, N' Las Casitas')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (97, 127, 0, N'Los Caobos ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (98, 127, 0, N' El Palotal ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (99, 127, 0, N' América ')
GO
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (100, 127, 0, N' Don Bosco ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (101, 127, 0, N' El Cañaveral ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (102, 127, 0, N' El Prado ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (103, 127, 0, N' Santa Teresa ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (104, 127, 0, N' Escalona ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (105, 127, 0, N' La Florida ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (106, 127, 0, N' 19 de abril ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (107, 127, 0, N' La Raya ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (108, 127, 0, N' Unión ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (109, 127, 0, N' 1 de mayo ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (110, 127, 0, N' Los Caimitos ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (111, 127, 0, N' Cabriales ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (112, 127, 0, N' La Guacamaya ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (113, 127, 0, N' Colinas de la Guacamaya ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (114, 127, 0, N' San Luis ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (115, 127, 0, N' Lomas de San Luis')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (116, 127, 0, N'Guaparo Norte ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (117, 127, 0, N' Mañongo ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (118, 127, 0, N' Ciudad Jardín Mañongo ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (119, 127, 0, N' Las Quintas I ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (120, 127, 0, N' Las Quintas II ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (121, 127, 0, N' Las Quintas III ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (122, 127, 0, N' La Granja ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (123, 127, 0, N' Fuerte Paramacay ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (124, 127, 0, N' Terrazas de Paramacay ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (125, 127, 0, N' Palma Real ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (126, 127, 0, N' El Rincón ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (127, 127, 0, N' Tazajal ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (128, 127, 0, N' Santa Ana ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (129, 127, 0, N' Caprenco ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (130, 127, 0, N' La Campiña I ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (131, 127, 0, N' La Campiña II ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (132, 127, 0, N' La Campiña III ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (133, 127, 0, N' La Florida ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (134, 127, 0, N' Guere ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (135, 127, 0, N' Valle Verde ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (136, 127, 0, N' Nueva Esparta ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (137, 127, 0, N' Casco  Central ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (138, 127, 0, N'1')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (139, 127, 0, N'190')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (140, 127, 0, N' Tarapio ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (141, 127, 0, N' Oeste ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (142, 127, 0, N' Los Guayabitos ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (143, 127, 0, N' Guayabal ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (144, 127, 0, N' Unión ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (145, 127, 0, N' La Begoña ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (146, 127, 0, N' Democracia ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (147, 127, 0, N' La Cidra ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (148, 127, 0, N' El Retobo ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (149, 127, 0, N' Valle Alto ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (150, 127, 0, N' Manantial ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (151, 127, 0, N' Terrazas de Naguanagua ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (152, 127, 0, N' El Naranjal I ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (153, 127, 0, N' El Naranjal II ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (154, 127, 0, N' El Cafetal ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (155, 127, 0, N' El Pinar ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (156, 127, 0, N' Puente Barbula ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (157, 127, 0, N' Los Candiles ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (158, 127, 0, N' Rotafe ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (159, 127, 0, N' Santa Marta ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (160, 127, 0, N' Ciudad Universitaria Bárbula ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (161, 127, 0, N' Brisas del Café ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (162, 127, 0, N' Mangos Paradise ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (163, 127, 0, N' El Turpital ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (164, 127, 0, N' Río Sil ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (165, 127, 0, N' La Querencia ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (166, 127, 0, N' La Vivienda Rural ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (167, 127, 0, N' La Bombona ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (168, 127, 0, N' Brisas de Carabobo ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (169, 127, 0, N' Valmore Rodríguez ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (170, 127, 0, N' Santa Eduvigis ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (171, 127, 0, N' Chaguaramal ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (172, 127, 0, N' Monte Sion ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (173, 127, 0, N' Agua Linda ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (174, 127, 0, N' Negra Matea ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (175, 127, 0, N' González Plaza ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (176, 127, 0, N' Girardot ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (177, 127, 0, N' La Luz ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (178, 127, 0, N' Bella Vista ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (179, 127, 0, N' Arturo Ramírez ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (180, 127, 0, N' Lorenzo Fernández ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (181, 127, 0, N' Malagon ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (182, 127, 0, N' Carialinda ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (183, 127, 0, N' Colinas de Girardot I ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (184, 127, 0, N' Colinas de Girardot II ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (185, 127, 0, N' Colinas de Girardot III ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (186, 127, 0, N' La Coromoto ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (187, 127, 0, N' La Llovizna ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (188, 127, 0, N' La Entrada I ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (189, 127, 0, N' La Entrada II ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (190, 127, 0, N' La Entrada III ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (191, 127, 0, N' Las Trincheras ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (192, 127, 0, N' El Chuponal')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (193, 127, 0, N'Industrial Carabobo ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (194, 127, 0, N' Zona Industrial Municipal Norte ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (195, 127, 0, N' Zona Industrial Municipal Sur I ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (196, 127, 0, N' Zona Industrial Municipal Sur II ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (197, 127, 0, N' Zona Industrial Michelena ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (198, 127, 0, N' La Quizanda ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (199, 127, 0, N' La Isabelica ')
GO
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (200, 127, 0, N' Zona Industrial y Comercial La Isabelica ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (201, 127, 0, N' Parque Valencia I ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (202, 127, 0, N' Parque Valencia II')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (203, 127, 0, N' Zona Industrial Aeropuerto ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (204, 127, 0, N' Agroindustrial El Recreo ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (205, 127, 0, N' Ezequiel Zamora ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (206, 127, 0, N' Bello Monte I ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (207, 127, 0, N' Bello Monte II ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (208, 127, 0, N' Los Samanes Norte ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (209, 127, 0, N' Los Samanes Sur ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (210, 127, 0, N' La Trinidad ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (211, 127, 0, N' 3 de mayo ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (212, 127, 0, N' Boca de Río I ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (213, 127, 0, N' Boca de Río II ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (214, 127, 0, N' Ciudad Plaza ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (215, 127, 0, N' Santa Inés ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (216, 127, 0, N' Flor Amarillo ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (217, 127, 0, N' Bucaral I ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (218, 127, 0, N' Bucaral II ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (219, 127, 0, N' Los Bucares ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (220, 127, 0, N' Agroindustrial La Rolandera ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (221, 127, 0, N' Agua Dulce y Baja ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (222, 127, 0, N' Calicanto ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (223, 127, 0, N' Valle Encantado ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (224, 127, 0, N' Las Palmitas ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (225, 127, 0, N' El Portal I ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (226, 127, 0, N' El Portal II ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (227, 127, 0, N' Rafael Urdaneta ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (228, 127, 0, N' Araguaney ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (229, 127, 0, N' Fundación Valencia I ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (230, 127, 0, N' Fundación Valencia II ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (231, 127, 0, N' Portal Valencia ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (232, 127, 0, N' El Alboral ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (233, 127, 0, N' Las Quintas de Flor Amarillo ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (234, 127, 0, N' Hermogenes Lòpez ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (235, 127, 0, N' Villa Real ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (236, 127, 0, N' Bucaral Sur ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (237, 127, 0, N' Infante ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (238, 127, 0, N' Aeropuerto ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (239, 127, 0, N' Tacarigua ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (240, 127, 0, N' Paso Real ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (241, 127, 0, N' Las Villas')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (242, 127, 0, N'La Adobera ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (243, 127, 0, N' Brisas del Este ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (244, 127, 0, N' El Pajal ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (245, 127, 0, N' La California ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (246, 127, 0, N' Michelena ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (247, 127, 0, N' San Blas I ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (248, 127, 0, N' San Blas II ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (249, 127, 0, N' Santa Ana ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (250, 127, 0, N' Libertador')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (251, 127, 0, N'Lomas de la Hacienda ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (252, 127, 0, N' San Antonio ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (253, 127, 0, N' La Cumaca ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (254, 127, 0, N' Las Josefinas ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (255, 127, 0, N' El Tulipán ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (256, 127, 0, N' La Lopera ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (257, 127, 0, N' El Origen ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (258, 127, 0, N' El Polvero ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (259, 127, 0, N' La Leonera ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (260, 127, 0, N' Colonial ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (261, 127, 0, N' Los Tamarindos ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (262, 127, 0, N' San Francisco de Cupira ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (263, 127, 0, N' Sabana del Medio ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (264, 127, 0, N' La Veguita ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (265, 127, 0, N' Valle Frasco Norte ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (266, 127, 0, N' Valle Frasco Sur ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (267, 127, 0, N' Las Morochas ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (268, 127, 0, N' Pueblo de San Diego ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (269, 127, 0, N' Las Mercedes ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (270, 127, 0, N' Santa Martha ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (271, 127, 0, N' Divino Niño ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (272, 127, 0, N' El Remanso ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (273, 127, 0, N' Villaserino Country Park ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (274, 127, 0, N' Bosqueserino ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (275, 127, 0, N' Monteserino ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (276, 127, 0, N' Villas Bahía San Diego ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (277, 127, 0, N' Los Colores ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (278, 127, 0, N' Villa Maporal ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (279, 127, 0, N' Parqueserino ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (280, 127, 0, N' Las Majaguas ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (281, 127, 0, N' Ciudad Montemayor ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (282, 127, 0, N' Montes de Sinaí ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (283, 127, 0, N' La Caracara ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (284, 127, 0, N' Terranostra ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (285, 127, 0, N' Chalet Country ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (286, 127, 0, N' Sansur ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (287, 127, 0, N' La Esmeralda ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (288, 127, 0, N' Lomas de la Esmeralda ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (289, 127, 0, N' Las Mercedes ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (290, 127, 0, N' Yuma I ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (291, 127, 0, N' Yuma II ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (292, 127, 0, N' Yuma III ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (293, 127, 0, N' Valle de Oro ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (294, 127, 0, N' Valle Verde ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (295, 127, 0, N' Los Andes ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (296, 127, 0, N' Terrazas de San Diego ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (297, 127, 0, N' La Gaviota ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (298, 127, 0, N' El Morro I ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (299, 127, 0, N' El Morro II ')
GO
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (300, 127, 0, N' El Morro III ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (301, 127, 0, N' Santa Ana ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (302, 127, 0, N' El Paraíso ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (303, 127, 0, N' Altos del Paraíso ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (304, 127, 0, N' Emmanuel ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (305, 127, 0, N' Perla Country ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (306, 127, 0, N' Campo Solo ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (307, 127, 0, N' Los Magallanes ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (308, 127, 0, N' Los Jarales ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (309, 127, 0, N' Los Arales ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (310, 127, 0, N' Paso Real ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (311, 127, 0, N' Valle Topacio ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (312, 127, 0, N' Valencey ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (313, 127, 0, N' Colinas de los Jarales ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (314, 127, 0, N' La Trinidad ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (315, 127, 0, N' Los Papelones ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (316, 127, 0, N' Cascabel ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (317, 127, 0, N' Zona Industrial Castillete ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (318, 127, 0, N' Zona Industrial San Diego ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (319, 127, 0, N' Zona Industrial Fundó La Unión ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (320, 127, 0, N' Zona Industrial Terrazas del Castillito ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (321, 127, 0, N' Parque Industrial y Comercial Castillito')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (322, 127, 0, N'Santa Rosa I ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (323, 127, 0, N' Santa Rosa II ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (324, 127, 0, N' Santa Rosa III ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (325, 127, 0, N' Los Taladros I ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (326, 127, 0, N' Los Taladros II ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (327, 127, 0, N' Ritec ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (328, 127, 0, N' Andrés Eloy Blanco ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (329, 127, 0, N' El Carmen Norte ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (330, 127, 0, N' El Carmen Sur ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (331, 127, 0, N' Zona Comercial Los Guajiros (Terminal viejo) ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (332, 127, 0, N' La Libertad ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (333, 127, 0, N' La Concordia ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (334, 127, 0, N' La Isabela ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (335, 127, 0, N' Brisas del Terminal ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (336, 127, 0, N' 24 horas ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (337, 127, 0, N' El Triunfo ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (338, 127, 0, N' La Milagrosa ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (339, 127, 0, N' 13 de septiembre ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (340, 127, 0, N' La Blanquera ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (341, 127, 0, N' La Pista ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (342, 127, 0, N' César Girón ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (343, 127, 0, N' Antonio José de Sucre Norte ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (344, 127, 0, N' Antonio José de Sucre Sur ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (345, 127, 0, N' Brisas del Sur ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (346, 127, 0, N' La Maestranza ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (347, 127, 0, N' Aquiles Nazoa ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (348, 127, 0, N' La Monumental ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (349, 127, 0, N' La Democracia ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (350, 127, 0, N' La Unidad ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (351, 127, 0, N' Teodoro Gubaira ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (352, 127, 0, N' La Mirandita')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (353, 127, 0, N'Safari Carabobo Country Club ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (354, 127, 0, N' Sabana del Medio ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (355, 127, 0, N' Santa Isabel ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (356, 127, 0, N' El Molino ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (357, 127, 0, N' El Oasis ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (358, 127, 0, N' Santa Bárbara ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (359, 127, 0, N' Libertador ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (360, 127, 0, N' La Esperanza ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (361, 127, 0, N' Santa Paula ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (362, 127, 0, N' Santa Eduviges ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (363, 127, 0, N' La Pradera ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (364, 127, 0, N' El Cují ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (365, 127, 0, N' El Porvenir ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (366, 127, 0, N' Valles de San Francisco ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (367, 127, 0, N' Centro ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (368, 127, 0, N' Bella Vista ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (369, 127, 0, N' José Rafael Pocaterra ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (370, 127, 0, N' La Guásima ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (371, 127, 0, N' CAP ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (372, 127, 0, N' Nueva Valencia ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (373, 127, 0, N' Los Cardones ')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (374, 127, 0, N' Brisas de Guataparo')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (375, 0, 0, N'Sector')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (376, 149, 0, N'Prados del Este')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (377, 149, 0, N'El Cafetal')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (378, 149, 0, N'Los Samanes')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (379, 149, 0, N'Terrazas del Avila')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (380, 149, 0, N'La Lagunita')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (381, 149, 0, N'Las Palmas')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (382, 149, 0, N'Los Palos Grandes')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (383, 149, 0, N'Vista Alegre')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (384, 149, 0, N'Los Naranjos')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (385, 149, 0, N'Valle Arriba')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (386, 149, 0, N'Las Mercedes')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (387, 149, 0, N'Los Chaguaramos')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (388, 149, 0, N'Guarenas')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (389, 149, 0, N'Guatire')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (390, 149, 0, N'Higuerote')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (391, 149, 0, N'El Parral')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (392, 149, 0, N'Los Nísperos')
INSERT [dbo].[SECTORES] ([id], [id_ciudad], [id_municipio], [Sector]) VALUES (393, 149, 0, N'Otros')
SET IDENTITY_INSERT [dbo].[SECTORES] OFF
INSERT [dbo].[SYSTEM_CORRELATIVES] ([Identifier], [Info], [Value], [Format]) VALUES (N'REGISTRO_USER', N'Correlativo de ordenes de Registro de Usuario', CAST(1 AS Numeric(18, 0)), N'0000000000')
INSERT [dbo].[SYSTEM_CORRELATIVES] ([Identifier], [Info], [Value], [Format]) VALUES (N'ORDER_BOX', N'Correlativo de ordenes de Nutribox', CAST(1 AS Numeric(18, 0)), N'0000000000')
INSERT [dbo].[SYSTEM_CORRELATIVES] ([Identifier], [Info], [Value], [Format]) VALUES (N'NUM_AFILIACION', N'Correlativo de numero de afiliacion', CAST(1 AS Numeric(18, 0)), N'0000000000')
INSERT [dbo].[SYSTEM_CORRELATIVES] ([Identifier], [Info], [Value], [Format]) VALUES (N'PRODUCTOS', N'Correlativo de porductos a vender', CAST(1 AS Numeric(18, 0)), N'0000000000')
INSERT [dbo].[SYSTEM_CORRELATIVES] ([Identifier], [Info], [Value], [Format]) VALUES (N'CARDS_MA', N'Tarjeta Registradas', CAST(1 AS Numeric(18, 0)), N'0000000000')
INSERT [dbo].[SYSTEM_CORRELATIVES] ([Identifier], [Info], [Value], [Format]) VALUES (N'NUM_FACTURACION', N'Correlativo de  quienes salen las facuras', CAST(1 AS Numeric(18, 0)), N'0000000000')
INSERT [dbo].[TIPO_ALIMENTO] ([tipo_alimento], [descripcion]) VALUES (1, N'Lácteos')
INSERT [dbo].[TIPO_ALIMENTO] ([tipo_alimento], [descripcion]) VALUES (2, N'Vegetales')
INSERT [dbo].[TIPO_ALIMENTO] ([tipo_alimento], [descripcion]) VALUES (3, N'Frutas')
INSERT [dbo].[TIPO_ALIMENTO] ([tipo_alimento], [descripcion]) VALUES (4, N'Almidones o Carbohidratos')
INSERT [dbo].[TIPO_ALIMENTO] ([tipo_alimento], [descripcion]) VALUES (5, N'Carnícos o Proteínas')
INSERT [dbo].[TIPO_ALIMENTO] ([tipo_alimento], [descripcion]) VALUES (6, N'Grasas')
INSERT [dbo].[TIPO_NOTIFICACIONES] ([id_notificacion], [descripcion]) VALUES (0, N'No existen notificaciones')
INSERT [dbo].[TIPO_NOTIFICACIONES] ([id_notificacion], [descripcion]) VALUES (1, N'Bienvenido a Ceresfresh')
INSERT [dbo].[TIPO_NOTIFICACIONES] ([id_notificacion], [descripcion]) VALUES (2, N'Afiliación exitosa')
INSERT [dbo].[TIPO_NOTIFICACIONES] ([id_notificacion], [descripcion]) VALUES (3, N'Pago procesado y confirmado')
INSERT [dbo].[TIPO_NOTIFICACIONES] ([id_notificacion], [descripcion]) VALUES (4, N'Pedido enviado a destino')
INSERT [dbo].[TIPO_NOTIFICACIONES] ([id_notificacion], [descripcion]) VALUES (5, N'Pago pendiente por autorización')
INSERT [dbo].[TIPO_NOTIFICACIONES] ([id_notificacion], [descripcion]) VALUES (6, N'Pago rechazado')
INSERT [dbo].[TIPO_NOTIFICACIONES] ([id_notificacion], [descripcion]) VALUES (7, N'Pedido entregado en destino')
ALTER TABLE [dbo].[AFILIADOS] ADD  CONSTRAINT [DF_AFILIADOS_Phone]  DEFAULT ('') FOR [phone]
GO
ALTER TABLE [dbo].[AFILIADOS] ADD  CONSTRAINT [DF_AFILIADOS_Address]  DEFAULT ('') FOR [address]
GO
ALTER TABLE [dbo].[AFILIADOS] ADD  CONSTRAINT [DF_AFILIADOS_City]  DEFAULT ('') FOR [city]
GO
ALTER TABLE [dbo].[AFILIADOS] ADD  CONSTRAINT [DF_AFILIADOS_State]  DEFAULT ('') FOR [state]
GO
ALTER TABLE [dbo].[AFILIADOS] ADD  CONSTRAINT [DF_AFILIADOS_ZipCode]  DEFAULT ('') FOR [zipcode]
GO
ALTER TABLE [dbo].[AFILIADOS] ADD  CONSTRAINT [DF_AFILIADOS_Sector]  DEFAULT ('') FOR [sector]
GO
ALTER TABLE [dbo].[AFILIADOS] ADD  CONSTRAINT [DF_AFILIADOS_sector1]  DEFAULT ('') FOR [pais]
GO
ALTER TABLE [dbo].[CARRITO] ADD  CONSTRAINT [DF_CARRITO_ListCode]  DEFAULT ('') FOR [listcode]
GO
ALTER TABLE [dbo].[CARRITO] ADD  CONSTRAINT [DF_CARRITO_productcode]  DEFAULT ((1)) FOR [productcode]
GO
ALTER TABLE [dbo].[LOG_INSTAPAGO] ADD  CONSTRAINT [DF_LOG_INSTAPAGO_Fecha]  DEFAULT (getdate()) FOR [Fecha]
GO
ALTER TABLE [dbo].[LOG_INSTAPAGO] ADD  CONSTRAINT [DF_LOG_INSTAPAGO_InternoWeb_ErrorNumber]  DEFAULT ((0)) FOR [InternoWeb_ErrorNumber]
GO
ALTER TABLE [dbo].[LOG_INSTAPAGO] ADD  CONSTRAINT [DF_LOG_INSTAPAGO_InternoWeb_ErrorDescription]  DEFAULT ('') FOR [InternoWeb_ErrorDescription]
GO
ALTER TABLE [dbo].[LOG_INSTAPAGO] ADD  CONSTRAINT [DF_LOG_INSTAPAGO_OrdenNumber]  DEFAULT ((0)) FOR [OrderNumber]
GO
ALTER TABLE [dbo].[LOG_ORDER_ERROR] ADD  CONSTRAINT [DF_LOG_ORDER_ERROR_Fecha]  DEFAULT (getdate()) FOR [Fecha]
GO
ALTER TABLE [dbo].[LOG_ORDER_ERROR] ADD  CONSTRAINT [DF_LOG_ORDER_ERROR_OrderNumber]  DEFAULT ((0)) FOR [OrderNumber]
GO
ALTER TABLE [dbo].[MA_FACTURACION] ADD  CONSTRAINT [DF_MA_FACTURACION_phone]  DEFAULT ('') FOR [phone]
GO
ALTER TABLE [dbo].[MA_LOGIN] ADD  CONSTRAINT [DF_MA_LOGIN_FechaRegistro]  DEFAULT (getdate()) FOR [fecha_registro]
GO
ALTER TABLE [dbo].[NOTIFICACIONES] ADD  CONSTRAINT [DF_NOTIFICACIONES_fecha_notificacion]  DEFAULT (getdate()) FOR [fecha_notificacion]
GO
ALTER TABLE [dbo].[ORDERS_DELIVERYMETHOD] ADD  CONSTRAINT [DF_ORDERS_DELIVERYMETHOD_Type]  DEFAULT ((0)) FOR [Type]
GO
ALTER TABLE [dbo].[ORDERS_DELIVERYMETHOD] ADD  CONSTRAINT [DF_ORDERS_DELIVERYMETHOD_PersonCedula]  DEFAULT ((0)) FOR [PersonCedula]
GO
ALTER TABLE [dbo].[ORDERS_DELIVERYMETHOD] ADD  CONSTRAINT [DF_ORDERS_DELIVERYMETHOD_Date]  DEFAULT (getdate()) FOR [Date]
GO
ALTER TABLE [dbo].[ORDERS_DELIVERYMETHOD] ADD  CONSTRAINT [DF_ORDERS_DELIVERYMETHOD_PersonAdditionalPhone]  DEFAULT ('') FOR [PersonAdditionalPhone]
GO
ALTER TABLE [dbo].[ORDERS_DELIVERYMETHOD] ADD  CONSTRAINT [DF_ORDERS_DELIVERYMETHOD_PersonAddress]  DEFAULT ('') FOR [PersonAddress]
GO
ALTER TABLE [dbo].[ORDERS_DELIVERYMETHOD] ADD  CONSTRAINT [DF_ORDERS_DELIVERYMETHOD_PersonCity]  DEFAULT ('') FOR [PersonCity]
GO
ALTER TABLE [dbo].[ORDERS_DELIVERYMETHOD] ADD  CONSTRAINT [DF_ORDERS_DELIVERYMETHOD_PersonState]  DEFAULT ('') FOR [PersonState]
GO
ALTER TABLE [dbo].[ORDERS_DELIVERYMETHOD] ADD  CONSTRAINT [DF_ORDERS_DELIVERYMETHOD_PersonMunicipality]  DEFAULT ('') FOR [PersonMunicipality]
GO
ALTER TABLE [dbo].[ORDERS_DELIVERYMETHOD] ADD  CONSTRAINT [DF_ORDERS_DELIVERYMETHOD_PersonBenchmark]  DEFAULT ('') FOR [PersonBenchmark]
GO
ALTER TABLE [dbo].[ORDERS_DELIVERYMETHOD] ADD  CONSTRAINT [DF_ORDERS_DELIVERYMETHOD_DateDelivery]  DEFAULT (getdate()+(2)) FOR [DateDeliveryIni]
GO
ALTER TABLE [dbo].[ORDERS_DELIVERYMETHOD] ADD  CONSTRAINT [DF_ORDERS_DELIVERYMETHOD_DateDeliveryIni1]  DEFAULT (getdate()+(4)) FOR [DateDeliveryFin]
GO
ALTER TABLE [dbo].[ORDERS_DELIVERYMETHOD] ADD  CONSTRAINT [DF_ORDERS_DELIVERYMETHOD_PersonState1]  DEFAULT ('') FOR [PersonPais]
GO
ALTER TABLE [dbo].[ORDERS_PAYMENTMETHOD] ADD  CONSTRAINT [DF_ORDERS_PAYMENTMETHOD_Type]  DEFAULT ((0)) FOR [Type]
GO
ALTER TABLE [dbo].[ORDERS_PAYMENTMETHOD] ADD  CONSTRAINT [DF_ORDERS_PAYMENTMETHOD_Amount]  DEFAULT ((-1)) FOR [Amount]
GO
ALTER TABLE [dbo].[ORDERS_PAYMENTMETHOD] ADD  CONSTRAINT [DF_ORDERS_PAYMENTMETHOD_TransactionReference]  DEFAULT ('N/A') FOR [TransactionReference]
GO
ALTER TABLE [dbo].[ORDERS_PAYMENTMETHOD] ADD  CONSTRAINT [ORDERS_PAYMENTMETHOD_DEFAULT_TransactionID]  DEFAULT ('N/A') FOR [TransactionID]
GO
ALTER TABLE [dbo].[ORDERS_PAYMENTMETHOD] ADD  CONSTRAINT [DF_ORDERS_PAYMENTMETHOD_Date]  DEFAULT (getdate()) FOR [Date]
GO
ALTER TABLE [dbo].[ORDERS_PAYMENTMETHOD] ADD  CONSTRAINT [DF_ORDERS_PAYMENTMETHOD_PersonName]  DEFAULT ('') FOR [PersonName]
GO
ALTER TABLE [dbo].[ORDERS_PAYMENTMETHOD] ADD  CONSTRAINT [DF_ORDERS_PAYMENTMETHOD_PersonLastname]  DEFAULT ('') FOR [PersonLastname]
GO
ALTER TABLE [dbo].[ORDERS_PAYMENTMETHOD] ADD  CONSTRAINT [DF_ORDERS_PAYMENTMETHOD_PersonCedula]  DEFAULT ('') FOR [PersonCedula]
GO
ALTER TABLE [dbo].[ORDERS_PAYMENTMETHOD] ADD  CONSTRAINT [DF_ORDERS_PAYMENTMETHOD_CDCNumber]  DEFAULT ('') FOR [CDCNumber]
GO
ALTER TABLE [dbo].[ORDERS_PAYMENTMETHOD] ADD  CONSTRAINT [DF_ORDERS_PAYMENTMETHOD_Banco_em]  DEFAULT ('') FOR [BancoEmisor]
GO
ALTER TABLE [dbo].[ORDERS_PAYMENTMETHOD] ADD  CONSTRAINT [DF_ORDERS_PAYMENTMETHOD_BancoEmisor1]  DEFAULT ('') FOR [BancoReceptor]
GO
ALTER TABLE [dbo].[PAGO_MA] ADD  CONSTRAINT [DF_PAGO_MA_fecha]  DEFAULT (getdate()) FOR [date]
GO
ALTER TABLE [dbo].[PAGO_MA] ADD  CONSTRAINT [DF_PAGO_MA_TransactionInvalid]  DEFAULT ((0)) FOR [transactioninvalid]
GO
ALTER TABLE [dbo].[PAGO_MA] ADD  CONSTRAINT [DF_PAGO_MA_Observation]  DEFAULT ('') FOR [observation]
GO
ALTER TABLE [dbo].[PAGO_MA] ADD  CONSTRAINT [DF_PAGO_MA_Paid]  DEFAULT ((0)) FOR [paid]
GO
ALTER TABLE [dbo].[PAGO_TR] ADD  CONSTRAINT [DF_PAGO_TR_Date]  DEFAULT (getdate()) FOR [date]
GO
ALTER TABLE [dbo].[ESTATUS_REGISTRO_MA]  WITH CHECK ADD  CONSTRAINT [FK_ESTATUS_REGISTRO_MA_PROCESO_REGISTRO_MA] FOREIGN KEY([id_proceso])
REFERENCES [dbo].[PROCESO_REGISTRO_MA] ([id_proceso])
GO
ALTER TABLE [dbo].[ESTATUS_REGISTRO_MA] CHECK CONSTRAINT [FK_ESTATUS_REGISTRO_MA_PROCESO_REGISTRO_MA]
GO
ALTER TABLE [dbo].[MA_ALIMENTOS]  WITH CHECK ADD  CONSTRAINT [FK_MA_ALIMENTOS_TIPO_ALIMENTO1] FOREIGN KEY([tipo_alimento])
REFERENCES [dbo].[TIPO_ALIMENTO] ([tipo_alimento])
GO
ALTER TABLE [dbo].[MA_ALIMENTOS] CHECK CONSTRAINT [FK_MA_ALIMENTOS_TIPO_ALIMENTO1]
GO
ALTER TABLE [dbo].[ORDERS_PAYMENTMETHOD]  WITH CHECK ADD  CONSTRAINT [FK_ORDERS_PAYMENTMETHOD_ORDERS_PAYMENTMETHOD_TYPES] FOREIGN KEY([Type])
REFERENCES [dbo].[ORDERS_PAYMENTMETHOD_TYPES] ([Code])
GO
ALTER TABLE [dbo].[ORDERS_PAYMENTMETHOD] CHECK CONSTRAINT [FK_ORDERS_PAYMENTMETHOD_ORDERS_PAYMENTMETHOD_TYPES]
GO
ALTER TABLE [dbo].[PAGO_TR]  WITH CHECK ADD  CONSTRAINT [FK_pago_tr_PAGO_MA] FOREIGN KEY([num_registro], [codeorden])
REFERENCES [dbo].[PAGO_MA] ([num_registro], [codeorden])
GO
ALTER TABLE [dbo].[PAGO_TR] CHECK CONSTRAINT [FK_pago_tr_PAGO_MA]
GO
ALTER TABLE [dbo].[PLAN_NUTRICIONAL_ALIMENTOS]  WITH CHECK ADD  CONSTRAINT [FK_PLAN_NUTRICIONAL_ALIMENTOS_MA_ALIMENTOS] FOREIGN KEY([cod_alimento])
REFERENCES [dbo].[MA_ALIMENTOS] ([cod_alimento])
GO
ALTER TABLE [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] CHECK CONSTRAINT [FK_PLAN_NUTRICIONAL_ALIMENTOS_MA_ALIMENTOS]
GO
ALTER TABLE [dbo].[PLAN_NUTRICIONAL_ALIMENTOS]  WITH CHECK ADD  CONSTRAINT [FK_PLAN_NUTRICIONAL_ALIMENTOS_PLAN_NUTRICIONAL] FOREIGN KEY([id_plan])
REFERENCES [dbo].[PLAN_NUTRICIONAL] ([id_plan])
GO
ALTER TABLE [dbo].[PLAN_NUTRICIONAL_ALIMENTOS] CHECK CONSTRAINT [FK_PLAN_NUTRICIONAL_ALIMENTOS_PLAN_NUTRICIONAL]
GO
ALTER TABLE [dbo].[PLAN_NUTRICIONAL_CONDICION]  WITH CHECK ADD  CONSTRAINT [FK_PLAN_NUTRICIONAL_CONDICION_PLAN_NUTRICIONAL] FOREIGN KEY([id_plan])
REFERENCES [dbo].[PLAN_NUTRICIONAL] ([id_plan])
GO
ALTER TABLE [dbo].[PLAN_NUTRICIONAL_CONDICION] CHECK CONSTRAINT [FK_PLAN_NUTRICIONAL_CONDICION_PLAN_NUTRICIONAL]
GO
ALTER TABLE [dbo].[PLAN_NUTRICIONAL_CONDICION]  WITH CHECK ADD  CONSTRAINT [FK_PLAN_NUTRICIONAL_CONDICION_PLAN_NUTRICIONAL_ACT_FISICA] FOREIGN KEY([act_fisica])
REFERENCES [dbo].[PLAN_NUTRICIONAL_ACT_FISICA] ([act_fisica])
GO
ALTER TABLE [dbo].[PLAN_NUTRICIONAL_CONDICION] CHECK CONSTRAINT [FK_PLAN_NUTRICIONAL_CONDICION_PLAN_NUTRICIONAL_ACT_FISICA]
GO
ALTER TABLE [dbo].[PLAN_NUTRICIONAL_CONDICION]  WITH CHECK ADD  CONSTRAINT [FK_PLAN_NUTRICIONAL_CONDICION_PLAN_NUTRICIONAL_CONDICION_ESPECIAL] FOREIGN KEY([condicion_esp])
REFERENCES [dbo].[PLAN_NUTRICIONAL_CONDICION_ESPECIAL] ([condicion_esp])
GO
ALTER TABLE [dbo].[PLAN_NUTRICIONAL_CONDICION] CHECK CONSTRAINT [FK_PLAN_NUTRICIONAL_CONDICION_PLAN_NUTRICIONAL_CONDICION_ESPECIAL]
GO
ALTER TABLE [dbo].[PLAN_NUTRICIONAL_PORCION]  WITH CHECK ADD  CONSTRAINT [FK_PLAN_NUTRICIONAL_PORCION_PLAN_NUTRICIONAL] FOREIGN KEY([id_plan])
REFERENCES [dbo].[PLAN_NUTRICIONAL] ([id_plan])
GO
ALTER TABLE [dbo].[PLAN_NUTRICIONAL_PORCION] CHECK CONSTRAINT [FK_PLAN_NUTRICIONAL_PORCION_PLAN_NUTRICIONAL]
GO
ALTER TABLE [dbo].[PLAN_NUTRICIONAL_PORCION]  WITH CHECK ADD  CONSTRAINT [FK_PLAN_NUTRICIONAL_PORCION_PLAN_NUTRICIONAL_TIPO_COMIDA] FOREIGN KEY([comida])
REFERENCES [dbo].[PLAN_NUTRICIONAL_TIPO_COMIDA] ([tipo_comida])
GO
ALTER TABLE [dbo].[PLAN_NUTRICIONAL_PORCION] CHECK CONSTRAINT [FK_PLAN_NUTRICIONAL_PORCION_PLAN_NUTRICIONAL_TIPO_COMIDA]
GO
/****** Object:  Trigger [dbo].[tg_plan_nutricional]    Script Date: 22/3/2019 12:38:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[tg_plan_nutricional] 
   ON [dbo].[AFILIADOS]
   AFTER INSERT,UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	declare @id_afiliacion nvarchar(50), @num_registro nvarchar(50), @edad int, @IMC int, @acf nvarchar(5), @cesp nvarchar(5), @sexo nvarchar(20), @atura numeric(5,2), @peso numeric(5,2)

    IF EXISTS(SELECT * FROM DELETED)
	begin
		if UPDATE(peso) or UPDATE(estatura) or UPDATE(condicion_esp) or UPDATE(act_fisica) or UPDATE(edad)
		begin
			select @num_registro=num_registro,@atura=estatura, @peso=peso, @sexo=sexo,@IMC= @peso/SQRT(@atura), @acf=act_fisica, @cesp=condicion_esp,
				@edad=edad, @id_afiliacion=id_afiliacion
			from inserted

			update AFILIADOS 
			set plan_nut=(select id_plan from PLAN_NUTRICIONAL_CONDICION
				where (edad_menor>=@edad or edad_mayor<=@edad) and (IMC_menor>=@IMC or IMC_mayor<=@IMC) and 
				act_fisica=@acf and condicion_esp=@cesp and (sexo=UPPER(@sexo) or sexo=UPPER('AMBOS')))
			where num_registro=@num_registro and id_afiliacion=@id_afiliacion
		end
	end
	else
	begin 
		select @num_registro=num_registro, @atura=estatura, @peso=peso, @sexo=sexo,@IMC= @peso/SQRT(@atura), @acf=act_fisica, @cesp=condicion_esp,
				@edad=edad, @id_afiliacion=id_afiliacion
			from inserted

			update AFILIADOS 
			set plan_nut=(select id_plan from PLAN_NUTRICIONAL_CONDICION
				where (edad_menor>=@edad or edad_mayor<=@edad) and (IMC_menor>=@IMC or IMC_mayor<=@IMC) and 
				act_fisica=@acf and condicion_esp=@cesp and (sexo=UPPER(@sexo) or sexo=UPPER('AMBOS')))
			where num_registro=@num_registro and id_afiliacion=@id_afiliacion
	end
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
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "AF"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 210
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "PL"
            Begin Extent = 
               Top = 6
               Left = 248
               Bottom = 136
               Right = 418
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "AL"
            Begin Extent = 
               Top = 6
               Left = 456
               Bottom = 102
               Right = 626
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tc"
            Begin Extent = 
               Top = 6
               Left = 664
               Bottom = 102
               Right = 834
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 10
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
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
 ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_detalles_plan'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'  End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_detalles_plan'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_detalles_plan'
GO
