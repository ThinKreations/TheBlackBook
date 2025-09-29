CREATE DATABASE Libreria
GO

USE Libreria;
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Autores](
	[Autor] [varchar](4) NOT NULL,
	[Nombre_autor] [varchar](20) NULL,
	[Apellido_autor] [varchar](20) NULL,
	[Fecha_nacimiento] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[Autor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetPrest](
	[Id_Libro] [varchar](4) NOT NULL,
	[Prestamo] [varchar](4) NOT NULL,
	[Fecha_Devolucion] [date] NULL,
	[Fecha_Lim_Devolucion] [date] NULL,
	[Multa] [varchar](2) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Libro] ASC,
	[Prestamo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Editoriales](
	[Numero_Editorial] [int] NOT NULL,
	[Nombre_editorial] [varchar](45) NULL,
PRIMARY KEY CLUSTERED 
(
	[Numero_Editorial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Libros](
	[Id_Libro] [varchar](4) NOT NULL,
	[Titulo] [varchar](60) NULL,
	[Numero_Editorial] [int] NULL,
	[Nom_Categoria] [varchar](30) NULL,
	[Año_Publicacion] [varchar](4) NULL,
	[Numero_Ejemplares] [int] NULL,
	[Portada] [VARCHAR](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Libro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LibrosVSAutores](
	[Id_Libro] [varchar](4) NOT NULL,
	[Autor] [varchar](4) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Libro] ASC,
	[Autor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Multas](
	[Multa] [varchar](2) NOT NULL,
	[Valor_base_multa] [varchar](5) NULL,
	[Descripción_multa] [varchar](45) NULL,
	[Tipodemulta] [varchar](45) NULL,
	[Monto_final_multa] [varchar](5) NULL,
	[Fecha_emisión_multa] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[Multa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prestamo](
	[Prestamo] [varchar](4) NOT NULL,
	[Usuario] [int] NULL,
	[Fecha_Prestamo] [date] NULL,
	[Cantidad_libros] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Prestamo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Usuario](
    [Usuario] INT IDENTITY(1,1) NOT NULL,      
    [Nombre] VARCHAR(20) NULL,
    [ApellidoP] VARCHAR(20) NULL,
    [ApellidoM] VARCHAR(20) NULL,
    [Email] VARCHAR(45) NULL,                  
    [Dirección_Email] VARCHAR(20) NULL,
    [Celular] VARCHAR(10) NULL,
    [Calle] VARCHAR(45) NULL,
    [Num_Ext] VARCHAR(10) NULL,
    [Colonia] VARCHAR(45) NULL,
    [Alcaldia] VARCHAR(45) NULL,
    [CP] VARCHAR(10) NULL,
    [Sexo] CHAR(1) NULL,
PRIMARY KEY CLUSTERED 
(
    [Usuario] ASC
)WITH (
    PAD_INDEX = OFF, 
    STATISTICS_NORECOMPUTE = OFF, 
    IGNORE_DUP_KEY = OFF, 
    ALLOW_ROW_LOCKS = ON, 
    ALLOW_PAGE_LOCKS = ON, 
    OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF
) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[wishlist](
    usuario INT,
    id_libro VARCHAR(4),
    fecha_guardado DATE,
    PRIMARY KEY (usuario, id_libro),
    CONSTRAINT fk_wishlist_usuario FOREIGN KEY (usuario) REFERENCES Usuario(usuario),
    CONSTRAINT fk_wishlist_libro FOREIGN KEY (id_libro) REFERENCES libros(id_libro)
);

ALTER TABLE [dbo].[DetPrest]  WITH CHECK ADD FOREIGN KEY([Id_Libro])
REFERENCES [dbo].[Libros] ([Id_Libro])
GO

ALTER TABLE [dbo].[DetPrest]  WITH CHECK ADD FOREIGN KEY([Multa])
REFERENCES [dbo].[Multas] ([Multa])
GO

ALTER TABLE [dbo].[DetPrest]  WITH CHECK ADD FOREIGN KEY([Prestamo])
REFERENCES [dbo].[Prestamo] ([Prestamo])
GO

ALTER TABLE [dbo].[Libros]  WITH CHECK ADD FOREIGN KEY([Numero_Editorial])
REFERENCES [dbo].[Editoriales] ([Numero_Editorial])
GO

ALTER TABLE [dbo].[LibrosVSAutores]  WITH CHECK ADD FOREIGN KEY([Autor])
REFERENCES [dbo].[Autores] ([Autor])
GO

ALTER TABLE [dbo].[LibrosVSAutores]  WITH CHECK ADD FOREIGN KEY([Id_Libro])
REFERENCES [dbo].[Libros] ([Id_Libro])
GO

ALTER TABLE [dbo].[Prestamo]  WITH CHECK ADD FOREIGN KEY([Usuario])
REFERENCES [dbo].[Usuario] ([Usuario])
GO

ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [caracter] CHECK  (([Sexo]='m' OR [Sexo]='h'))
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [caracter]
GO
/*
SELECT session_id, login_name, status
FROM sys.dm_exec_sessions WHERE login_name='napoles_munguia_josedejesus_1'
SELECT * FROM Usuario

DELETE FROM Usuario;
DROP USER napoles_munguia_josedejesus_1;
DROP LOGIN napoles_munguia_josedejesus_1;


select * from sys.syslogins
*/