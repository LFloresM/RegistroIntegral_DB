USE [master]
GO
/****** Object:  Database [RegistroIntegral]    Script Date: 08/02/2015 09:55:47 a.m. ******/
CREATE DATABASE [RegistroIntegral]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SISG', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\SISG.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SISG_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\SISG_log.ldf' , SIZE = 4672KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [RegistroIntegral] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RegistroIntegral].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RegistroIntegral] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RegistroIntegral] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RegistroIntegral] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RegistroIntegral] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RegistroIntegral] SET ARITHABORT OFF 
GO
ALTER DATABASE [RegistroIntegral] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [RegistroIntegral] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [RegistroIntegral] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RegistroIntegral] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RegistroIntegral] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RegistroIntegral] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RegistroIntegral] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RegistroIntegral] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RegistroIntegral] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RegistroIntegral] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RegistroIntegral] SET  DISABLE_BROKER 
GO
ALTER DATABASE [RegistroIntegral] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RegistroIntegral] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RegistroIntegral] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RegistroIntegral] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RegistroIntegral] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RegistroIntegral] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RegistroIntegral] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RegistroIntegral] SET RECOVERY FULL 
GO
ALTER DATABASE [RegistroIntegral] SET  MULTI_USER 
GO
ALTER DATABASE [RegistroIntegral] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RegistroIntegral] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RegistroIntegral] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RegistroIntegral] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [RegistroIntegral]
GO
/****** Object:  Table [dbo].[Administrador]    Script Date: 08/02/2015 09:55:47 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Administrador](
	[Adm_ID] [int] IDENTITY(1,1) NOT NULL,
	[Per_Id] [int] NOT NULL,
	[Adm_Area] [varchar](50) NULL,
	[Adm_Rpm] [char](12) NULL,
	[Adm_Nextel] [char](12) NOT NULL,
 CONSTRAINT [PK_Administrador] PRIMARY KEY CLUSTERED 
(
	[Adm_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Alumno]    Script Date: 08/02/2015 09:55:47 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Alumno](
	[Alu_Id] [int] IDENTITY(1,1) NOT NULL,
	[Per_Id] [int] NOT NULL,
	[Alu_FechNac] [date] NULL,
	[Alu_Apoderado] [varchar](50) NULL,
	[Alu_FechIngreso] [datetime] NOT NULL,
	[Alu_Estado] [bit] NOT NULL,
	[Alu_Foto] [varchar](200) NULL,
 CONSTRAINT [PK_Alumno] PRIMARY KEY CLUSTERED 
(
	[Alu_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Aula]    Script Date: 08/02/2015 09:55:47 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Aula](
	[Aul_Id] [int] IDENTITY(1,1) NOT NULL,
	[Aul_Capacidad] [varchar](50) NULL,
	[Aul_Nombre] [varchar](50) NULL,
 CONSTRAINT [PK_Aula] PRIMARY KEY CLUSTERED 
(
	[Aul_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Calificacion]    Script Date: 08/02/2015 09:55:47 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Calificacion](
	[Cal_Id] [int] IDENTITY(1,1) NOT NULL,
	[Mod_Id] [int] NOT NULL,
	[Alu_Id] [int] NOT NULL,
	[Cal_Fech] [datetime] NULL,
	[Cal_Condicion] [varchar](50) NOT NULL,
	[Cal_Practica] [decimal](12, 2) NOT NULL,
	[Cal_Teorica] [decimal](12, 2) NOT NULL,
	[Cal_Oral] [decimal](12, 2) NULL,
	[Cal_Otros] [decimal](12, 2) NULL,
 CONSTRAINT [PK_Calificacion] PRIMARY KEY CLUSTERED 
(
	[Cal_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Concepto]    Script Date: 08/02/2015 09:55:47 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Concepto](
	[Con_Id] [int] IDENTITY(1,1) NOT NULL,
	[Con_Descripcion] [varchar](50) NULL,
 CONSTRAINT [PK_Concepto] PRIMARY KEY CLUSTERED 
(
	[Con_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Costo]    Script Date: 08/02/2015 09:55:47 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Costo](
	[Cos_Id] [int] IDENTITY(1,1) NOT NULL,
	[Con_Id] [int] NULL,
	[Cos_Precio] [decimal](12, 2) NULL,
	[Cos_Fech] [date] NULL,
 CONSTRAINT [PK_Costo] PRIMARY KEY CLUSTERED 
(
	[Cos_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Det_Pago]    Script Date: 08/02/2015 09:55:47 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Det_Pago](
	[DetPag_Id] [int] IDENTITY(1,1) NOT NULL,
	[Pag_Id] [int] NOT NULL,
	[Con_Id] [int] NOT NULL,
	[DetPag_Ciclo] [varchar](50) NULL,
 CONSTRAINT [PK_Det_Pago_1] PRIMARY KEY CLUSTERED 
(
	[DetPag_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Detalle_Plan]    Script Date: 08/02/2015 09:55:47 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Detalle_Plan](
	[DetPlan_Id] [int] IDENTITY(1,1) NOT NULL,
	[Pla_Id] [int] NOT NULL,
	[Pro_Id] [int] NOT NULL,
 CONSTRAINT [PK_Detalle_Plan] PRIMARY KEY CLUSTERED 
(
	[DetPlan_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Deuda]    Script Date: 08/02/2015 09:55:47 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Deuda](
	[Deu_Id] [int] IDENTITY(1,1) NOT NULL,
	[Con_Id] [int] NULL,
	[Deu_Monto] [decimal](12, 2) NULL,
	[Deu_Estado] [bit] NULL,
	[Alu_Id] [int] NULL,
 CONSTRAINT [PK_Deuda] PRIMARY KEY CLUSTERED 
(
	[Deu_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Horario]    Script Date: 08/02/2015 09:55:47 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Horario](
	[Hor_Id] [int] IDENTITY(1,1) NOT NULL,
	[Hor_Grupo] [varchar](50) NULL,
	[Hor_Ini] [time](7) NULL,
	[Hor_Fin] [time](7) NULL,
	[Aul_Id] [int] NULL,
	[Pro_Id] [int] NULL,
 CONSTRAINT [PK_Horario] PRIMARY KEY CLUSTERED 
(
	[Hor_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Matricula]    Script Date: 08/02/2015 09:55:47 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Matricula](
	[Mat_Id] [int] IDENTITY(1,1) NOT NULL,
	[Mod_Id] [int] NOT NULL,
	[Alu_Id] [int] NOT NULL,
	[Mat_Tipo] [varchar](50) NULL,
	[Mat_Fecha] [date] NOT NULL,
	[Mat_Estado] [bit] NOT NULL,
 CONSTRAINT [PK_Matricula_1] PRIMARY KEY CLUSTERED 
(
	[Mat_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Modulo]    Script Date: 08/02/2015 09:55:47 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Modulo](
	[Mod_Id] [int] IDENTITY(1,1) NOT NULL,
	[Mod_Nombre] [varchar](50) NOT NULL,
	[Mod_Tipo] [varchar](50) NOT NULL,
	[Mod_Unidad] [varchar](50) NULL,
	[Mod_NumHoras] [varchar](50) NULL,
	[Mod_NumMes] [varchar](50) NOT NULL,
	[Mod_Nivel] [int] NULL,
 CONSTRAINT [PK_Modulo] PRIMARY KEY CLUSTERED 
(
	[Mod_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Pago]    Script Date: 08/02/2015 09:55:47 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pago](
	[Pag_Id] [int] IDENTITY(1,1) NOT NULL,
	[Alu_Id] [int] NULL,
	[Pag_Fech] [date] NULL,
 CONSTRAINT [PK_Pago] PRIMARY KEY CLUSTERED 
(
	[Pag_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Persona]    Script Date: 08/02/2015 09:55:47 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Persona](
	[Per_Id] [int] IDENTITY(1,1) NOT NULL,
	[Per_Dni] [char](8) NOT NULL,
	[Per_Nombre] [varchar](50) NULL,
	[Per_ApePaterno] [varchar](50) NULL,
	[Per_ApeMaterno] [varchar](50) NOT NULL,
	[Per_Sexo] [char](1) NULL,
	[Per_Dir] [varchar](50) NULL,
	[Per_Cel] [char](9) NULL,
	[Per_Tel] [varchar](20) NOT NULL,
	[Per_Email] [varchar](50) NULL,
 CONSTRAINT [PK_Persona] PRIMARY KEY CLUSTERED 
(
	[Per_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Plan_Estudio]    Script Date: 08/02/2015 09:55:47 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Plan_Estudio](
	[Pla_Id] [int] IDENTITY(1,1) NOT NULL,
	[Pla_Nombre] [varchar](50) NULL,
	[Pla_Distrito] [varchar](50) NOT NULL,
	[Pla_Ugel] [varchar](50) NULL,
	[Pla_CetPro] [varchar](50) NULL,
	[Pla_Fechini] [date] NULL,
	[Pla_Fechfin] [date] NULL,
 CONSTRAINT [PK_Plan_Estudio] PRIMARY KEY CLUSTERED 
(
	[Pla_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Profesor]    Script Date: 08/02/2015 09:55:47 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Profesor](
	[Prof_Id] [int] IDENTITY(1,1) NOT NULL,
	[Per_Id] [int] NOT NULL,
	[Prof_Rpm] [char](12) NOT NULL,
	[Prof_Nextel] [char](12) NOT NULL,
	[Prof_Especialidad] [varchar](50) NULL,
 CONSTRAINT [PK_Profesor_1] PRIMARY KEY CLUSTERED 
(
	[Prof_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Profesor_Horario]    Script Date: 08/02/2015 09:55:47 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Profesor_Horario](
	[ProfHor_Id] [int] IDENTITY(1,1) NOT NULL,
	[Prof_Id] [int] NOT NULL,
	[Hor_Id] [int] NOT NULL,
 CONSTRAINT [PK_Profesor-Horario_1] PRIMARY KEY CLUSTERED 
(
	[ProfHor_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Programacion]    Script Date: 08/02/2015 09:55:47 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Programacion](
	[Pro_Id] [int] IDENTITY(1,1) NOT NULL,
	[Mod_Id] [int] NOT NULL,
	[Pro_Fechaini] [date] NULL,
	[Pro_Fechafin] [date] NULL,
 CONSTRAINT [PK_Programacion_1] PRIMARY KEY CLUSTERED 
(
	[Pro_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tipo_Usuario]    Script Date: 08/02/2015 09:55:47 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tipo_Usuario](
	[TipoUser_Id] [int] IDENTITY(1,1) NOT NULL,
	[TipoUser_Descrip] [varchar](50) NULL,
	[TipoUser_Nivel] [tinyint] NOT NULL,
 CONSTRAINT [PK_Tipo_Usuario] PRIMARY KEY CLUSTERED 
(
	[TipoUser_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 08/02/2015 09:55:47 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Usuario](
	[User_Id] [int] IDENTITY(1,1) NOT NULL,
	[Per_Id] [int] NOT NULL,
	[User_Nombre] [varchar](50) NOT NULL,
	[User_Pass] [varchar](20) NOT NULL,
	[TipoUser_Id] [int] NOT NULL,
	[User_Estado] [bit] NOT NULL,
 CONSTRAINT [PK_Usuario_1] PRIMARY KEY CLUSTERED 
(
	[User_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Administrador] ON 

INSERT [dbo].[Administrador] ([Adm_ID], [Per_Id], [Adm_Area], [Adm_Rpm], [Adm_Nextel]) VALUES (1, 1, N'Tramite', N'11234556    ', N'3474364     ')
INSERT [dbo].[Administrador] ([Adm_ID], [Per_Id], [Adm_Area], [Adm_Rpm], [Adm_Nextel]) VALUES (2, 2, N'Tramite', N'83729899    ', N'6782367     ')
INSERT [dbo].[Administrador] ([Adm_ID], [Per_Id], [Adm_Area], [Adm_Rpm], [Adm_Nextel]) VALUES (3, 3, N'Administracion', N'82728923    ', N'8239872     ')
INSERT [dbo].[Administrador] ([Adm_ID], [Per_Id], [Adm_Area], [Adm_Rpm], [Adm_Nextel]) VALUES (4, 4, N'Gerencia', N'73376479    ', N'7336889     ')
INSERT [dbo].[Administrador] ([Adm_ID], [Per_Id], [Adm_Area], [Adm_Rpm], [Adm_Nextel]) VALUES (5, 5, N'Gerencia', N'63763838    ', N'6736387     ')
INSERT [dbo].[Administrador] ([Adm_ID], [Per_Id], [Adm_Area], [Adm_Rpm], [Adm_Nextel]) VALUES (6, 6, N'Marketing', N'76278627    ', N'7868768     ')
SET IDENTITY_INSERT [dbo].[Administrador] OFF
SET IDENTITY_INSERT [dbo].[Alumno] ON 

INSERT [dbo].[Alumno] ([Alu_Id], [Per_Id], [Alu_FechNac], [Alu_Apoderado], [Alu_FechIngreso], [Alu_Estado], [Alu_Foto]) VALUES (1, 1, CAST(0x2E140B00 AS Date), N'Cesar', CAST(0x0000A3A500000000 AS DateTime), 1, N'')
INSERT [dbo].[Alumno] ([Alu_Id], [Per_Id], [Alu_FechNac], [Alu_Apoderado], [Alu_FechIngreso], [Alu_Estado], [Alu_Foto]) VALUES (2, 2, CAST(0xD5230B00 AS Date), N'Victor', CAST(0x0000A38400000000 AS DateTime), 1, N'')
INSERT [dbo].[Alumno] ([Alu_Id], [Per_Id], [Alu_FechNac], [Alu_Apoderado], [Alu_FechIngreso], [Alu_Estado], [Alu_Foto]) VALUES (3, 3, CAST(0x41250B00 AS Date), N'Aneet', CAST(0x0000A3A800000000 AS DateTime), 1, N'imagen.jpg')
SET IDENTITY_INSERT [dbo].[Alumno] OFF
SET IDENTITY_INSERT [dbo].[Aula] ON 

INSERT [dbo].[Aula] ([Aul_Id], [Aul_Capacidad], [Aul_Nombre]) VALUES (1, N'20', N'A-1')
INSERT [dbo].[Aula] ([Aul_Id], [Aul_Capacidad], [Aul_Nombre]) VALUES (2, N'24', N'B-2')
INSERT [dbo].[Aula] ([Aul_Id], [Aul_Capacidad], [Aul_Nombre]) VALUES (3, N'30', N'A-2')
SET IDENTITY_INSERT [dbo].[Aula] OFF
SET IDENTITY_INSERT [dbo].[Calificacion] ON 

INSERT [dbo].[Calificacion] ([Cal_Id], [Mod_Id], [Alu_Id], [Cal_Fech], [Cal_Condicion], [Cal_Practica], [Cal_Teorica], [Cal_Oral], [Cal_Otros]) VALUES (1, 1, 1, CAST(0x0000A3A400000000 AS DateTime), N'Buena', CAST(15.00 AS Decimal(12, 2)), CAST(16.00 AS Decimal(12, 2)), CAST(15.00 AS Decimal(12, 2)), CAST(17.00 AS Decimal(12, 2)))
INSERT [dbo].[Calificacion] ([Cal_Id], [Mod_Id], [Alu_Id], [Cal_Fech], [Cal_Condicion], [Cal_Practica], [Cal_Teorica], [Cal_Oral], [Cal_Otros]) VALUES (2, 2, 1, CAST(0x0000A3A400000000 AS DateTime), N'Buena', CAST(16.00 AS Decimal(12, 2)), CAST(17.00 AS Decimal(12, 2)), CAST(17.00 AS Decimal(12, 2)), CAST(16.00 AS Decimal(12, 2)))
INSERT [dbo].[Calificacion] ([Cal_Id], [Mod_Id], [Alu_Id], [Cal_Fech], [Cal_Condicion], [Cal_Practica], [Cal_Teorica], [Cal_Oral], [Cal_Otros]) VALUES (3, 1, 2, CAST(0x0000A3A400000000 AS DateTime), N'Regular', CAST(14.00 AS Decimal(12, 2)), CAST(12.00 AS Decimal(12, 2)), CAST(13.00 AS Decimal(12, 2)), CAST(14.00 AS Decimal(12, 2)))
INSERT [dbo].[Calificacion] ([Cal_Id], [Mod_Id], [Alu_Id], [Cal_Fech], [Cal_Condicion], [Cal_Practica], [Cal_Teorica], [Cal_Oral], [Cal_Otros]) VALUES (4, 1, 3, CAST(0x0000A3A700000000 AS DateTime), N'Buena', CAST(17.00 AS Decimal(12, 2)), CAST(17.00 AS Decimal(12, 2)), CAST(18.00 AS Decimal(12, 2)), CAST(17.00 AS Decimal(12, 2)))
SET IDENTITY_INSERT [dbo].[Calificacion] OFF
SET IDENTITY_INSERT [dbo].[Concepto] ON 

INSERT [dbo].[Concepto] ([Con_Id], [Con_Descripcion]) VALUES (1, N'Matricula')
INSERT [dbo].[Concepto] ([Con_Id], [Con_Descripcion]) VALUES (2, N'Mensualidad')
INSERT [dbo].[Concepto] ([Con_Id], [Con_Descripcion]) VALUES (3, N'Aplazado')
SET IDENTITY_INSERT [dbo].[Concepto] OFF
SET IDENTITY_INSERT [dbo].[Costo] ON 

INSERT [dbo].[Costo] ([Cos_Id], [Con_Id], [Cos_Precio], [Cos_Fech]) VALUES (1, 1, CAST(200.00 AS Decimal(12, 2)), CAST(0x03390B00 AS Date))
INSERT [dbo].[Costo] ([Cos_Id], [Con_Id], [Cos_Precio], [Cos_Fech]) VALUES (2, 1, CAST(200.00 AS Decimal(12, 2)), CAST(0x03390B00 AS Date))
SET IDENTITY_INSERT [dbo].[Costo] OFF
SET IDENTITY_INSERT [dbo].[Det_Pago] ON 

INSERT [dbo].[Det_Pago] ([DetPag_Id], [Pag_Id], [Con_Id], [DetPag_Ciclo]) VALUES (1, 1, 1, N'Primer Ciclo')
INSERT [dbo].[Det_Pago] ([DetPag_Id], [Pag_Id], [Con_Id], [DetPag_Ciclo]) VALUES (2, 1, 2, N'Primer Ciclo')
SET IDENTITY_INSERT [dbo].[Det_Pago] OFF
SET IDENTITY_INSERT [dbo].[Detalle_Plan] ON 

INSERT [dbo].[Detalle_Plan] ([DetPlan_Id], [Pla_Id], [Pro_Id]) VALUES (1, 1, 1)
INSERT [dbo].[Detalle_Plan] ([DetPlan_Id], [Pla_Id], [Pro_Id]) VALUES (2, 1, 2)
SET IDENTITY_INSERT [dbo].[Detalle_Plan] OFF
SET IDENTITY_INSERT [dbo].[Deuda] ON 

INSERT [dbo].[Deuda] ([Deu_Id], [Con_Id], [Deu_Monto], [Deu_Estado], [Alu_Id]) VALUES (1, 1, CAST(200.00 AS Decimal(12, 2)), 1, 1)
INSERT [dbo].[Deuda] ([Deu_Id], [Con_Id], [Deu_Monto], [Deu_Estado], [Alu_Id]) VALUES (2, 1, CAST(300.00 AS Decimal(12, 2)), 1, 2)
INSERT [dbo].[Deuda] ([Deu_Id], [Con_Id], [Deu_Monto], [Deu_Estado], [Alu_Id]) VALUES (3, 2, CAST(250.00 AS Decimal(12, 2)), 1, 2)
INSERT [dbo].[Deuda] ([Deu_Id], [Con_Id], [Deu_Monto], [Deu_Estado], [Alu_Id]) VALUES (4, 3, CAST(250.00 AS Decimal(12, 2)), 1, 1)
SET IDENTITY_INSERT [dbo].[Deuda] OFF
SET IDENTITY_INSERT [dbo].[Horario] ON 

INSERT [dbo].[Horario] ([Hor_Id], [Hor_Grupo], [Hor_Ini], [Hor_Fin], [Aul_Id], [Pro_Id]) VALUES (1, N'A', CAST(0x0700DCC9A04F0000 AS Time), CAST(0x0700E03495640000 AS Time), 1, 1)
INSERT [dbo].[Horario] ([Hor_Id], [Hor_Grupo], [Hor_Ini], [Hor_Fin], [Aul_Id], [Pro_Id]) VALUES (2, N'B', CAST(0x0700D85EAC3A0000 AS Time), CAST(0x070010ACD1530000 AS Time), 2, 1)
SET IDENTITY_INSERT [dbo].[Horario] OFF
SET IDENTITY_INSERT [dbo].[Matricula] ON 

INSERT [dbo].[Matricula] ([Mat_Id], [Mod_Id], [Alu_Id], [Mat_Tipo], [Mat_Fecha], [Mat_Estado]) VALUES (1, 1, 1, N'Regular', CAST(0x02390B00 AS Date), 1)
INSERT [dbo].[Matricula] ([Mat_Id], [Mod_Id], [Alu_Id], [Mat_Tipo], [Mat_Fecha], [Mat_Estado]) VALUES (2, 1, 2, N'Extemporanea', CAST(0x03390B00 AS Date), 1)
INSERT [dbo].[Matricula] ([Mat_Id], [Mod_Id], [Alu_Id], [Mat_Tipo], [Mat_Fecha], [Mat_Estado]) VALUES (3, 1, 1, N'Regular', CAST(0x01390B00 AS Date), 1)
SET IDENTITY_INSERT [dbo].[Matricula] OFF
SET IDENTITY_INSERT [dbo].[Modulo] ON 

INSERT [dbo].[Modulo] ([Mod_Id], [Mod_Nombre], [Mod_Tipo], [Mod_Unidad], [Mod_NumHoras], [Mod_NumMes], [Mod_Nivel]) VALUES (1, N'Comidas Extranjeras', N'Gastronomia', N'Primera Unidad', N'6 Horas', N'4 Meses', 1)
INSERT [dbo].[Modulo] ([Mod_Id], [Mod_Nombre], [Mod_Tipo], [Mod_Unidad], [Mod_NumHoras], [Mod_NumMes], [Mod_Nivel]) VALUES (2, N'Dulces', N'Reposteria', N'Segunda Unidad', N'4 Horas', N'3 Meses', 2)
INSERT [dbo].[Modulo] ([Mod_Id], [Mod_Nombre], [Mod_Tipo], [Mod_Unidad], [Mod_NumHoras], [Mod_NumMes], [Mod_Nivel]) VALUES (3, N'Embutidos', N'Pasteleria y Panaderia', N'Primera Unidad', N'4 Horas', N'5 Meses', 1)
INSERT [dbo].[Modulo] ([Mod_Id], [Mod_Nombre], [Mod_Tipo], [Mod_Unidad], [Mod_NumHoras], [Mod_NumMes], [Mod_Nivel]) VALUES (4, N'Cocteles y  Tragos', N'Bar Training', N'Segunda Unidad', N'6 Horas', N'5 Meses', 2)
SET IDENTITY_INSERT [dbo].[Modulo] OFF
SET IDENTITY_INSERT [dbo].[Pago] ON 

INSERT [dbo].[Pago] ([Pag_Id], [Alu_Id], [Pag_Fech]) VALUES (1, 1, CAST(0x03390B00 AS Date))
INSERT [dbo].[Pago] ([Pag_Id], [Alu_Id], [Pag_Fech]) VALUES (2, 1, CAST(0x03390B00 AS Date))
SET IDENTITY_INSERT [dbo].[Pago] OFF
SET IDENTITY_INSERT [dbo].[Persona] ON 

INSERT [dbo].[Persona] ([Per_Id], [Per_Dni], [Per_Nombre], [Per_ApePaterno], [Per_ApeMaterno], [Per_Sexo], [Per_Dir], [Per_Cel], [Per_Tel], [Per_Email]) VALUES (1, N'46703747', N'Luis', N'Flores', N'Meza', N'M', N'Lima', N'123456789', N'234566', N'lflores@gmail.com')
INSERT [dbo].[Persona] ([Per_Id], [Per_Dni], [Per_Nombre], [Per_ApePaterno], [Per_ApeMaterno], [Per_Sexo], [Per_Dir], [Per_Cel], [Per_Tel], [Per_Email]) VALUES (2, N'47485599', N'Victor', N'Callegari', N'Portal', N'M', N'Lima', N'274484499', N'747484', N'victorpc@gmail.com')
INSERT [dbo].[Persona] ([Per_Id], [Per_Dni], [Per_Nombre], [Per_ApePaterno], [Per_ApeMaterno], [Per_Sexo], [Per_Dir], [Per_Cel], [Per_Tel], [Per_Email]) VALUES (3, N'47484848', N'Cesar', N'Flores', N'Meza', N'M', N'Lima', N'474848489', N'747448', N'cesar@gmail.com')
INSERT [dbo].[Persona] ([Per_Id], [Per_Dni], [Per_Nombre], [Per_ApePaterno], [Per_ApeMaterno], [Per_Sexo], [Per_Dir], [Per_Cel], [Per_Tel], [Per_Email]) VALUES (4, N'36348990', N'Jhonathan', N'Portal', N'Noel', N'M', N'Lima', N'748494900', N'373839', N'prnoel@gmail.com')
INSERT [dbo].[Persona] ([Per_Id], [Per_Dni], [Per_Nombre], [Per_ApePaterno], [Per_ApeMaterno], [Per_Sexo], [Per_Dir], [Per_Cel], [Per_Tel], [Per_Email]) VALUES (5, N'76363748', N'David', N'Lopez', N'Quiroga', N'M', N'Barranca', N'455456565', N'444334', N'davidl@hotmail.com')
INSERT [dbo].[Persona] ([Per_Id], [Per_Dni], [Per_Nombre], [Per_ApePaterno], [Per_ApeMaterno], [Per_Sexo], [Per_Dir], [Per_Cel], [Per_Tel], [Per_Email]) VALUES (6, N'47843787', N'Erick', N'Falen', N'Collantes', N'M', N'Supe', N'378944389', N'783849', N'erickf@gmail.com')
INSERT [dbo].[Persona] ([Per_Id], [Per_Dni], [Per_Nombre], [Per_ApePaterno], [Per_ApeMaterno], [Per_Sexo], [Per_Dir], [Per_Cel], [Per_Tel], [Per_Email]) VALUES (7, N'78433899', N'Elisa', N'Ortega', N'Diaz', N'F', N'Barranca', N'749890090', N'843784', N'elisao@hotmail.com')
INSERT [dbo].[Persona] ([Per_Id], [Per_Dni], [Per_Nombre], [Per_ApePaterno], [Per_ApeMaterno], [Per_Sexo], [Per_Dir], [Per_Cel], [Per_Tel], [Per_Email]) VALUES (8, N'73464738', N'Elva', N'Pesantes ', N'Gomero', N'F', N'Lima', N'398900000', N'784347', N'elvap@gmail.com')
INSERT [dbo].[Persona] ([Per_Id], [Per_Dni], [Per_Nombre], [Per_ApePaterno], [Per_ApeMaterno], [Per_Sexo], [Per_Dir], [Per_Cel], [Per_Tel], [Per_Email]) VALUES (9, N'78348347', N'Marllon', N'Marres ', N'Breas', N'M', N'Barranca', N'739879988', N'848447', N'marllonb@gmail.com')
INSERT [dbo].[Persona] ([Per_Id], [Per_Dni], [Per_Nombre], [Per_ApePaterno], [Per_ApeMaterno], [Per_Sexo], [Per_Dir], [Per_Cel], [Per_Tel], [Per_Email]) VALUES (10, N'84748898', N'Stefany', N'Tinoco', N'Peña', N'F', N'Pativilca', N'474743900', N'747447', N'stefanyt@hotmail.com')
INSERT [dbo].[Persona] ([Per_Id], [Per_Dni], [Per_Nombre], [Per_ApePaterno], [Per_ApeMaterno], [Per_Sexo], [Per_Dir], [Per_Cel], [Per_Tel], [Per_Email]) VALUES (11, N'34784789', N'Martha', N'Sanchez', N'Purisaca', N'F', N'Pativilca', N'744844000', N'747474', N'marthap@gmail.com')
INSERT [dbo].[Persona] ([Per_Id], [Per_Dni], [Per_Nombre], [Per_ApePaterno], [Per_ApeMaterno], [Per_Sexo], [Per_Dir], [Per_Cel], [Per_Tel], [Per_Email]) VALUES (12, N'87888903', N'Victor ', N'Davila ', N'Mattos', N'M', N'Barranca', N'348844800', N'747480', N'victord@gmail.com')
INSERT [dbo].[Persona] ([Per_Id], [Per_Dni], [Per_Nombre], [Per_ApePaterno], [Per_ApeMaterno], [Per_Sexo], [Per_Dir], [Per_Cel], [Per_Tel], [Per_Email]) VALUES (13, N'73844389', N'Pedro', N'Vargas', N'Tello', N'M', N'Lima', N'734847900', N'747474', N'pedrov@hotmail.com')
INSERT [dbo].[Persona] ([Per_Id], [Per_Dni], [Per_Nombre], [Per_ApePaterno], [Per_ApeMaterno], [Per_Sexo], [Per_Dir], [Per_Cel], [Per_Tel], [Per_Email]) VALUES (14, N'37634799', N'Ibeth', N'Goñi', N'Pizarro', N'F', N'Lima', N'748383399', N'873783', N'ibethg@gmail.com')
INSERT [dbo].[Persona] ([Per_Id], [Per_Dni], [Per_Nombre], [Per_ApePaterno], [Per_ApeMaterno], [Per_Sexo], [Per_Dir], [Per_Cel], [Per_Tel], [Per_Email]) VALUES (15, N'37634687', N'Nidia', N'Pesantes', N'Moreno', N'F', N'Barranca', N'873977349', N'872989', N'nidiap@gmail.com')
INSERT [dbo].[Persona] ([Per_Id], [Per_Dni], [Per_Nombre], [Per_ApePaterno], [Per_ApeMaterno], [Per_Sexo], [Per_Dir], [Per_Cel], [Per_Tel], [Per_Email]) VALUES (16, N'34673487', N'Juana', N'Manrique', N'Juarez', N'F', N'Supe', N'437643887', N'276734', N'juanam@hotmail.com')
INSERT [dbo].[Persona] ([Per_Id], [Per_Dni], [Per_Nombre], [Per_ApePaterno], [Per_ApeMaterno], [Per_Sexo], [Per_Dir], [Per_Cel], [Per_Tel], [Per_Email]) VALUES (17, N'37634739', N'Felipe', N'Juarez', N'Borja', N'M', N'Lima', N'874874990', N'847770', N'felipej@gmail.com')
INSERT [dbo].[Persona] ([Per_Id], [Per_Dni], [Per_Nombre], [Per_ApePaterno], [Per_ApeMaterno], [Per_Sexo], [Per_Dir], [Per_Cel], [Per_Tel], [Per_Email]) VALUES (18, N'87783908', N'Oscar', N'Ascon', N'Rosales', N'M', N'Lima', N'784834873', N'724889', N'oscar@gmail.com')
INSERT [dbo].[Persona] ([Per_Id], [Per_Dni], [Per_Nombre], [Per_ApePaterno], [Per_ApeMaterno], [Per_Sexo], [Per_Dir], [Per_Cel], [Per_Tel], [Per_Email]) VALUES (19, N'87387438', N'Cindy', N'Ugarte', N'Rios', N'F', N'Barranca', N'837438899', N'873887', N'cindyu@hotmail.com')
INSERT [dbo].[Persona] ([Per_Id], [Per_Dni], [Per_Nombre], [Per_ApePaterno], [Per_ApeMaterno], [Per_Sexo], [Per_Dir], [Per_Cel], [Per_Tel], [Per_Email]) VALUES (20, N'48734470', N'Brigithe', N'Diaz', N'Silva', N'F', N'Pativilca', N'776476487', N'763787', N'brisil@hotmail.com')
SET IDENTITY_INSERT [dbo].[Persona] OFF
SET IDENTITY_INSERT [dbo].[Plan_Estudio] ON 

INSERT [dbo].[Plan_Estudio] ([Pla_Id], [Pla_Nombre], [Pla_Distrito], [Pla_Ugel], [Pla_CetPro], [Pla_Fechini], [Pla_Fechfin]) VALUES (1, N'Plan de Estudios 2014-I', N'Barranca', N'Barranca', N'Inteltur', CAST(0x92370B00 AS Date), CAST(0x02390B00 AS Date))
INSERT [dbo].[Plan_Estudio] ([Pla_Id], [Pla_Nombre], [Pla_Distrito], [Pla_Ugel], [Pla_CetPro], [Pla_Fechini], [Pla_Fechfin]) VALUES (2, N'Plan de Estudios 2014-II', N'Barranca', N'Barranca', N'Inteltur', CAST(0xA4380B00 AS Date), CAST(0x59390B00 AS Date))
SET IDENTITY_INSERT [dbo].[Plan_Estudio] OFF
SET IDENTITY_INSERT [dbo].[Profesor] ON 

INSERT [dbo].[Profesor] ([Prof_Id], [Per_Id], [Prof_Rpm], [Prof_Nextel], [Prof_Especialidad]) VALUES (1, 1, N'161672788   ', N'37378888    ', N'Comida Peruana')
INSERT [dbo].[Profesor] ([Prof_Id], [Per_Id], [Prof_Rpm], [Prof_Nextel], [Prof_Especialidad]) VALUES (2, 2, N'387447338   ', N'84374784    ', N'Embutidos')
INSERT [dbo].[Profesor] ([Prof_Id], [Per_Id], [Prof_Rpm], [Prof_Nextel], [Prof_Especialidad]) VALUES (3, 3, N'483387993   ', N'84744899    ', N'Comida Peruana')
INSERT [dbo].[Profesor] ([Prof_Id], [Per_Id], [Prof_Rpm], [Prof_Nextel], [Prof_Especialidad]) VALUES (4, 4, N'763783687   ', N'76373889    ', N'Embutidos')
INSERT [dbo].[Profesor] ([Prof_Id], [Per_Id], [Prof_Rpm], [Prof_Nextel], [Prof_Especialidad]) VALUES (5, 5, N'373738900   ', N'62377679    ', N'Comida Peruana')
INSERT [dbo].[Profesor] ([Prof_Id], [Per_Id], [Prof_Rpm], [Prof_Nextel], [Prof_Especialidad]) VALUES (6, 6, N'373839007   ', N'76262652    ', N'Panaderia')
INSERT [dbo].[Profesor] ([Prof_Id], [Per_Id], [Prof_Rpm], [Prof_Nextel], [Prof_Especialidad]) VALUES (7, 7, N'736379076   ', N'76769089    ', N'Dulces')
INSERT [dbo].[Profesor] ([Prof_Id], [Per_Id], [Prof_Rpm], [Prof_Nextel], [Prof_Especialidad]) VALUES (8, 8, N'763673900   ', N'87383090    ', N'Pasteles')
INSERT [dbo].[Profesor] ([Prof_Id], [Per_Id], [Prof_Rpm], [Prof_Nextel], [Prof_Especialidad]) VALUES (9, 9, N'763378288   ', N'87687687    ', N'Dulces')
INSERT [dbo].[Profesor] ([Prof_Id], [Per_Id], [Prof_Rpm], [Prof_Nextel], [Prof_Especialidad]) VALUES (10, 10, N'763732278   ', N'93736208    ', N'Embutidos')
SET IDENTITY_INSERT [dbo].[Profesor] OFF
SET IDENTITY_INSERT [dbo].[Profesor_Horario] ON 

INSERT [dbo].[Profesor_Horario] ([ProfHor_Id], [Prof_Id], [Hor_Id]) VALUES (1, 1, 1)
INSERT [dbo].[Profesor_Horario] ([ProfHor_Id], [Prof_Id], [Hor_Id]) VALUES (2, 1, 2)
SET IDENTITY_INSERT [dbo].[Profesor_Horario] OFF
SET IDENTITY_INSERT [dbo].[Programacion] ON 

INSERT [dbo].[Programacion] ([Pro_Id], [Mod_Id], [Pro_Fechaini], [Pro_Fechafin]) VALUES (1, 1, CAST(0xFD380B00 AS Date), CAST(0x5F390B00 AS Date))
INSERT [dbo].[Programacion] ([Pro_Id], [Mod_Id], [Pro_Fechaini], [Pro_Fechafin]) VALUES (2, 2, CAST(0xFD380B00 AS Date), CAST(0x79390B00 AS Date))
SET IDENTITY_INSERT [dbo].[Programacion] OFF
SET IDENTITY_INSERT [dbo].[Tipo_Usuario] ON 

INSERT [dbo].[Tipo_Usuario] ([TipoUser_Id], [TipoUser_Descrip], [TipoUser_Nivel]) VALUES (1, N'Administrador', 1)
INSERT [dbo].[Tipo_Usuario] ([TipoUser_Id], [TipoUser_Descrip], [TipoUser_Nivel]) VALUES (2, N'Alumno', 0)
INSERT [dbo].[Tipo_Usuario] ([TipoUser_Id], [TipoUser_Descrip], [TipoUser_Nivel]) VALUES (3, N'Profesor', 1)
INSERT [dbo].[Tipo_Usuario] ([TipoUser_Id], [TipoUser_Descrip], [TipoUser_Nivel]) VALUES (4, N'Tramitador', 0)
SET IDENTITY_INSERT [dbo].[Tipo_Usuario] OFF
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([User_Id], [Per_Id], [User_Nombre], [User_Pass], [TipoUser_Id], [User_Estado]) VALUES (1, 1, N'LuisF', N'123', 1, 1)
INSERT [dbo].[Usuario] ([User_Id], [Per_Id], [User_Nombre], [User_Pass], [TipoUser_Id], [User_Estado]) VALUES (2, 1, N'CarlosM', N'123', 1, 1)
INSERT [dbo].[Usuario] ([User_Id], [Per_Id], [User_Nombre], [User_Pass], [TipoUser_Id], [User_Estado]) VALUES (3, 2, N'JuanP', N'1234', 2, 1)
INSERT [dbo].[Usuario] ([User_Id], [Per_Id], [User_Nombre], [User_Pass], [TipoUser_Id], [User_Estado]) VALUES (4, 1, N'VictorC', N'111', 1, 1)
INSERT [dbo].[Usuario] ([User_Id], [Per_Id], [User_Nombre], [User_Pass], [TipoUser_Id], [User_Estado]) VALUES (5, 3, N'CesarF', N'3636', 2, 1)
INSERT [dbo].[Usuario] ([User_Id], [Per_Id], [User_Nombre], [User_Pass], [TipoUser_Id], [User_Estado]) VALUES (6, 3, N'CesarM', N'4748', 1, 1)
INSERT [dbo].[Usuario] ([User_Id], [Per_Id], [User_Nombre], [User_Pass], [TipoUser_Id], [User_Estado]) VALUES (7, 1, N'LuisM', N'334', 2, 1)
INSERT [dbo].[Usuario] ([User_Id], [Per_Id], [User_Nombre], [User_Pass], [TipoUser_Id], [User_Estado]) VALUES (8, 7, N'ElisaO', N'2678', 3, 1)
INSERT [dbo].[Usuario] ([User_Id], [Per_Id], [User_Nombre], [User_Pass], [TipoUser_Id], [User_Estado]) VALUES (9, 8, N'ElvaP', N'477', 4, 1)
INSERT [dbo].[Usuario] ([User_Id], [Per_Id], [User_Nombre], [User_Pass], [TipoUser_Id], [User_Estado]) VALUES (10, 10, N'StefanyP', N'123', 2, 1)
SET IDENTITY_INSERT [dbo].[Usuario] OFF
/****** Object:  Index [UQ_Administrador_Per_Id]    Script Date: 08/02/2015 09:55:47 a.m. ******/
ALTER TABLE [dbo].[Administrador] ADD  CONSTRAINT [UQ_Administrador_Per_Id] UNIQUE NONCLUSTERED 
(
	[Per_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ_Alumno_Per_Id]    Script Date: 08/02/2015 09:55:47 a.m. ******/
ALTER TABLE [dbo].[Alumno] ADD  CONSTRAINT [UQ_Alumno_Per_Id] UNIQUE NONCLUSTERED 
(
	[Per_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ_Aula_Aula_Nombre]    Script Date: 08/02/2015 09:55:47 a.m. ******/
ALTER TABLE [dbo].[Aula] ADD  CONSTRAINT [UQ_Aula_Aula_Nombre] UNIQUE NONCLUSTERED 
(
	[Aul_Nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ_Calificacion_Mod_Id]    Script Date: 08/02/2015 09:55:47 a.m. ******/
ALTER TABLE [dbo].[Calificacion] ADD  CONSTRAINT [UQ_Calificacion_Mod_Id] UNIQUE NONCLUSTERED 
(
	[Mod_Id] ASC,
	[Alu_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ_Det_Pago]    Script Date: 08/02/2015 09:55:47 a.m. ******/
ALTER TABLE [dbo].[Det_Pago] ADD  CONSTRAINT [UQ_Det_Pago] UNIQUE NONCLUSTERED 
(
	[Con_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ_Detalle_Plan]    Script Date: 08/02/2015 09:55:47 a.m. ******/
ALTER TABLE [dbo].[Detalle_Plan] ADD  CONSTRAINT [UQ_Detalle_Plan] UNIQUE NONCLUSTERED 
(
	[Pro_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ_Deuda_Con_Id]    Script Date: 08/02/2015 09:55:47 a.m. ******/
ALTER TABLE [dbo].[Deuda] ADD  CONSTRAINT [UQ_Deuda_Con_Id] UNIQUE NONCLUSTERED 
(
	[Con_Id] ASC,
	[Alu_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ_Horario_Aul_Id]    Script Date: 08/02/2015 09:55:47 a.m. ******/
ALTER TABLE [dbo].[Horario] ADD  CONSTRAINT [UQ_Horario_Aul_Id] UNIQUE NONCLUSTERED 
(
	[Aul_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ_Horario_Hor_Grupo]    Script Date: 08/02/2015 09:55:47 a.m. ******/
ALTER TABLE [dbo].[Horario] ADD  CONSTRAINT [UQ_Horario_Hor_Grupo] UNIQUE NONCLUSTERED 
(
	[Hor_Grupo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ_Modulo_Mod_Nombre]    Script Date: 08/02/2015 09:55:47 a.m. ******/
ALTER TABLE [dbo].[Modulo] ADD  CONSTRAINT [UQ_Modulo_Mod_Nombre] UNIQUE NONCLUSTERED 
(
	[Mod_Nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ_Profesor_Per_Id]    Script Date: 08/02/2015 09:55:47 a.m. ******/
ALTER TABLE [dbo].[Profesor] ADD  CONSTRAINT [UQ_Profesor_Per_Id] UNIQUE NONCLUSTERED 
(
	[Per_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ_Profesor-Horario]    Script Date: 08/02/2015 09:55:47 a.m. ******/
ALTER TABLE [dbo].[Profesor_Horario] ADD  CONSTRAINT [UQ_Profesor-Horario] UNIQUE NONCLUSTERED 
(
	[Hor_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ_Programacion_Mod_Id]    Script Date: 08/02/2015 09:55:47 a.m. ******/
ALTER TABLE [dbo].[Programacion] ADD  CONSTRAINT [UQ_Programacion_Mod_Id] UNIQUE NONCLUSTERED 
(
	[Mod_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ_Tipo_Usuario_TipUser_Des]    Script Date: 08/02/2015 09:55:47 a.m. ******/
ALTER TABLE [dbo].[Tipo_Usuario] ADD  CONSTRAINT [UQ_Tipo_Usuario_TipUser_Des] UNIQUE NONCLUSTERED 
(
	[TipoUser_Descrip] ASC,
	[TipoUser_Nivel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ_Usuario_User_Nombre]    Script Date: 08/02/2015 09:55:47 a.m. ******/
ALTER TABLE [dbo].[Usuario] ADD  CONSTRAINT [UQ_Usuario_User_Nombre] UNIQUE NONCLUSTERED 
(
	[User_Nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Administrador]  WITH CHECK ADD  CONSTRAINT [FK_Administrador_Persona] FOREIGN KEY([Per_Id])
REFERENCES [dbo].[Persona] ([Per_Id])
GO
ALTER TABLE [dbo].[Administrador] CHECK CONSTRAINT [FK_Administrador_Persona]
GO
ALTER TABLE [dbo].[Alumno]  WITH CHECK ADD  CONSTRAINT [FK_Alumno_Persona] FOREIGN KEY([Per_Id])
REFERENCES [dbo].[Persona] ([Per_Id])
GO
ALTER TABLE [dbo].[Alumno] CHECK CONSTRAINT [FK_Alumno_Persona]
GO
ALTER TABLE [dbo].[Calificacion]  WITH CHECK ADD  CONSTRAINT [FK_Calificacion_Alumno] FOREIGN KEY([Alu_Id])
REFERENCES [dbo].[Alumno] ([Alu_Id])
GO
ALTER TABLE [dbo].[Calificacion] CHECK CONSTRAINT [FK_Calificacion_Alumno]
GO
ALTER TABLE [dbo].[Calificacion]  WITH CHECK ADD  CONSTRAINT [FK_Calificacion_Modulo] FOREIGN KEY([Mod_Id])
REFERENCES [dbo].[Modulo] ([Mod_Id])
GO
ALTER TABLE [dbo].[Calificacion] CHECK CONSTRAINT [FK_Calificacion_Modulo]
GO
ALTER TABLE [dbo].[Costo]  WITH CHECK ADD  CONSTRAINT [FK_Costo_Concepto] FOREIGN KEY([Con_Id])
REFERENCES [dbo].[Concepto] ([Con_Id])
GO
ALTER TABLE [dbo].[Costo] CHECK CONSTRAINT [FK_Costo_Concepto]
GO
ALTER TABLE [dbo].[Det_Pago]  WITH CHECK ADD  CONSTRAINT [FK_Det_Pago_Concepto1] FOREIGN KEY([Con_Id])
REFERENCES [dbo].[Concepto] ([Con_Id])
GO
ALTER TABLE [dbo].[Det_Pago] CHECK CONSTRAINT [FK_Det_Pago_Concepto1]
GO
ALTER TABLE [dbo].[Det_Pago]  WITH CHECK ADD  CONSTRAINT [FK_Det_Pago_Pago1] FOREIGN KEY([Pag_Id])
REFERENCES [dbo].[Pago] ([Pag_Id])
GO
ALTER TABLE [dbo].[Det_Pago] CHECK CONSTRAINT [FK_Det_Pago_Pago1]
GO
ALTER TABLE [dbo].[Detalle_Plan]  WITH CHECK ADD  CONSTRAINT [FK_Detalle_Plan_Plan_Estudio1] FOREIGN KEY([Pla_Id])
REFERENCES [dbo].[Plan_Estudio] ([Pla_Id])
GO
ALTER TABLE [dbo].[Detalle_Plan] CHECK CONSTRAINT [FK_Detalle_Plan_Plan_Estudio1]
GO
ALTER TABLE [dbo].[Detalle_Plan]  WITH CHECK ADD  CONSTRAINT [FK_Detalle_Plan_Programacion1] FOREIGN KEY([Pro_Id])
REFERENCES [dbo].[Programacion] ([Pro_Id])
GO
ALTER TABLE [dbo].[Detalle_Plan] CHECK CONSTRAINT [FK_Detalle_Plan_Programacion1]
GO
ALTER TABLE [dbo].[Deuda]  WITH CHECK ADD  CONSTRAINT [FK_Deuda_Alumno] FOREIGN KEY([Alu_Id])
REFERENCES [dbo].[Alumno] ([Alu_Id])
GO
ALTER TABLE [dbo].[Deuda] CHECK CONSTRAINT [FK_Deuda_Alumno]
GO
ALTER TABLE [dbo].[Deuda]  WITH CHECK ADD  CONSTRAINT [FK_Deuda_Concepto] FOREIGN KEY([Con_Id])
REFERENCES [dbo].[Concepto] ([Con_Id])
GO
ALTER TABLE [dbo].[Deuda] CHECK CONSTRAINT [FK_Deuda_Concepto]
GO
ALTER TABLE [dbo].[Horario]  WITH CHECK ADD  CONSTRAINT [FK_Horario_Aula] FOREIGN KEY([Aul_Id])
REFERENCES [dbo].[Aula] ([Aul_Id])
GO
ALTER TABLE [dbo].[Horario] CHECK CONSTRAINT [FK_Horario_Aula]
GO
ALTER TABLE [dbo].[Horario]  WITH CHECK ADD  CONSTRAINT [FK_Horario_Programacion] FOREIGN KEY([Pro_Id])
REFERENCES [dbo].[Programacion] ([Pro_Id])
GO
ALTER TABLE [dbo].[Horario] CHECK CONSTRAINT [FK_Horario_Programacion]
GO
ALTER TABLE [dbo].[Matricula]  WITH CHECK ADD  CONSTRAINT [FK_Matricula_Alumno] FOREIGN KEY([Alu_Id])
REFERENCES [dbo].[Alumno] ([Alu_Id])
GO
ALTER TABLE [dbo].[Matricula] CHECK CONSTRAINT [FK_Matricula_Alumno]
GO
ALTER TABLE [dbo].[Matricula]  WITH CHECK ADD  CONSTRAINT [FK_Matricula_Modulo] FOREIGN KEY([Mod_Id])
REFERENCES [dbo].[Modulo] ([Mod_Id])
GO
ALTER TABLE [dbo].[Matricula] CHECK CONSTRAINT [FK_Matricula_Modulo]
GO
ALTER TABLE [dbo].[Pago]  WITH CHECK ADD  CONSTRAINT [FK_Pago_Alumno] FOREIGN KEY([Alu_Id])
REFERENCES [dbo].[Alumno] ([Alu_Id])
GO
ALTER TABLE [dbo].[Pago] CHECK CONSTRAINT [FK_Pago_Alumno]
GO
ALTER TABLE [dbo].[Profesor]  WITH CHECK ADD  CONSTRAINT [FK_Profesor_Persona] FOREIGN KEY([Per_Id])
REFERENCES [dbo].[Persona] ([Per_Id])
GO
ALTER TABLE [dbo].[Profesor] CHECK CONSTRAINT [FK_Profesor_Persona]
GO
ALTER TABLE [dbo].[Profesor_Horario]  WITH CHECK ADD  CONSTRAINT [FK_Profesor-Horario_Horario] FOREIGN KEY([Hor_Id])
REFERENCES [dbo].[Horario] ([Hor_Id])
GO
ALTER TABLE [dbo].[Profesor_Horario] CHECK CONSTRAINT [FK_Profesor-Horario_Horario]
GO
ALTER TABLE [dbo].[Profesor_Horario]  WITH CHECK ADD  CONSTRAINT [FK_Profesor-Horario_Profesor] FOREIGN KEY([Prof_Id])
REFERENCES [dbo].[Profesor] ([Prof_Id])
GO
ALTER TABLE [dbo].[Profesor_Horario] CHECK CONSTRAINT [FK_Profesor-Horario_Profesor]
GO
ALTER TABLE [dbo].[Programacion]  WITH CHECK ADD  CONSTRAINT [FK_Programacion_Modulo] FOREIGN KEY([Mod_Id])
REFERENCES [dbo].[Modulo] ([Mod_Id])
GO
ALTER TABLE [dbo].[Programacion] CHECK CONSTRAINT [FK_Programacion_Modulo]
GO
ALTER TABLE [dbo].[Persona]  WITH CHECK ADD  CONSTRAINT [CK_Persona] CHECK  (([Per_Sexo]='M' OR [Per_Sexo]='F'))
GO
ALTER TABLE [dbo].[Persona] CHECK CONSTRAINT [CK_Persona]
GO
USE [master]
GO
ALTER DATABASE [RegistroIntegral] SET  READ_WRITE 
GO
