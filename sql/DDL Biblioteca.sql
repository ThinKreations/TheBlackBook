CREATE DATABASE Biblioteca
GO

USE Biblioteca;
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
	[Anio_Publicacion] [varchar](4) NULL,
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
	[Multa] INT IDENTITY(1,1) NOT NULL, 
	[Valor_base_multa] INT NULL,
	[Monto_actual_multa] INT NULL,
	[Fecha_emision_multa] [date] NULL,
	[Fecha_pago] [date] NULL,
	[estatus] [int]
PRIMARY KEY CLUSTERED 
(
	[Multa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


CREATE TABLE [dbo].[Usuario](
    [Usuario] INT IDENTITY(1,1) NOT NULL,      
    [Nombre] VARCHAR(20) NULL,
    [ApellidoP] VARCHAR(20) NULL,
    [ApellidoM] VARCHAR(20) NULL,
    [Email] VARCHAR(45) NULL,                  
    [Direccion_Email] VARCHAR(20) NULL,
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

CREATE TABLE [dbo].[Prestamos]( 
[Id_Prestamo] INT IDENTITY(1,1) NOT NULL,
[Id_Libro] VARCHAR(4) NOT NULL, 
[Usuario] INT NOT NULL, 
[Fecha_Prestamo] DATE NOT NULL,
[Fecha_Lim_Devolucion] DATE NOT NULL, 
[Fecha_Devolucion] DATE NULL, 
[Multa] INT NULL, 
PRIMARY KEY CLUSTERED 
(
[Id_Prestamo] ASC
),
CONSTRAINT fk_prestamo_libro FOREIGN KEY ([Id_Libro]) REFERENCES [dbo].[Libros]([Id_Libro]),
CONSTRAINT fk_prestamo_usuario FOREIGN KEY ([Usuario]) REFERENCES [dbo].[Usuario]([Usuario]),
CONSTRAINT fk_prestamo_multa FOREIGN KEY ([Multa]) REFERENCES [dbo].[Multas]([Multa]) );
GO

CREATE TABLE [dbo].[wishlist](
    usuario INT,
    id_libro VARCHAR(4),
    fecha_guardado DATE,
    PRIMARY KEY (usuario, id_libro),	
    CONSTRAINT fk_wishlist_usuario FOREIGN KEY (usuario) REFERENCES Usuario(usuario),
    CONSTRAINT fk_wishlist_libro FOREIGN KEY (id_libro) REFERENCES libros(id_libro)
);

ALTER TABLE [dbo].[Libros]  WITH CHECK ADD FOREIGN KEY([Numero_Editorial])
REFERENCES [dbo].[Editoriales] ([Numero_Editorial])
GO

ALTER TABLE [dbo].[LibrosVSAutores]  WITH CHECK ADD FOREIGN KEY([Autor])
REFERENCES [dbo].[Autores] ([Autor])
GO

ALTER TABLE [dbo].[LibrosVSAutores]  WITH CHECK ADD FOREIGN KEY([Id_Libro])
REFERENCES [dbo].[Libros] ([Id_Libro])
GO

ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [caracter] CHECK  (([Sexo]='m' OR [Sexo]='f'))
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [caracter]
GO

ALTER TABLE [dbo].[Multas]  WITH CHECK ADD  CONSTRAINT [estado] CHECK  (([estatus]=0 OR [estatus]=1))
GO
ALTER TABLE [dbo].[Multas] CHECK CONSTRAINT [estado]
GO
