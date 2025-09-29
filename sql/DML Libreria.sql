USE Libreria
GO

--AUTORES

INSERT [dbo].[Autores] ([Autor], [Nombre_autor], [Apellido_autor], [Fecha_nacimiento]) VALUES (N'A01', N'Gabriel', N'Garcia Marquez', CAST(N'1927-06-03' AS Date))
INSERT [dbo].[Autores] ([Autor], [Nombre_autor], [Apellido_autor], [Fecha_nacimiento]) VALUES (N'A02', N'Leonard', N'Mlodinow', CAST(N'1954-11-26' AS Date))
INSERT [dbo].[Autores] ([Autor], [Nombre_autor], [Apellido_autor], [Fecha_nacimiento]) VALUES (N'A03', N'Stephen', N'Hawking', CAST(N'1942-01-08' AS Date))
INSERT [dbo].[Autores] ([Autor], [Nombre_autor], [Apellido_autor], [Fecha_nacimiento]) VALUES (N'A04', N'Miguel', N'de Cervantes', CAST(N'1547-09-29' AS Date))
INSERT [dbo].[Autores] ([Autor], [Nombre_autor], [Apellido_autor], [Fecha_nacimiento]) VALUES (N'A05', N'Héctor German', N'Oesterheld', CAST(N'1919-07-23' AS Date))
INSERT [dbo].[Autores] ([Autor], [Nombre_autor], [Apellido_autor], [Fecha_nacimiento]) VALUES (N'A06', N'Stephen', N'Hawking', CAST(N'1942-01-08' AS Date))
INSERT [dbo].[Autores] ([Autor], [Nombre_autor], [Apellido_autor], [Fecha_nacimiento]) VALUES (N'A07', N'Joanne Kathleen', N'Rowling', CAST(N'1942-08-01' AS Date))
INSERT [dbo].[Autores] ([Autor], [Nombre_autor], [Apellido_autor], [Fecha_nacimiento]) VALUES (N'A08', N'Peter', N'Straub', CAST(N'1892-01-03' AS Date))
INSERT [dbo].[Autores] ([Autor], [Nombre_autor], [Apellido_autor], [Fecha_nacimiento]) VALUES (N'A09', N'Stephen', N'King', CAST(N'1947-09-21' AS Date))
INSERT [dbo].[Autores] ([Autor], [Nombre_autor], [Apellido_autor], [Fecha_nacimiento]) VALUES (N'A10', N'John Ronald', N'Reuel Tolkien', CAST(N'1892-07-31' AS Date))
INSERT [dbo].[Autores] ([Autor], [Nombre_autor], [Apellido_autor], [Fecha_nacimiento]) VALUES (N'A11', N'Nicolas', N'Maquiavelo', CAST(N'1469-05-03' AS Date))
INSERT [dbo].[Autores] ([Autor], [Nombre_autor], [Apellido_autor], [Fecha_nacimiento]) VALUES (N'A12', N'Giddens', N'Anthony', CAST(N'1938-01-18' AS Date))
INSERT [dbo].[Autores] ([Autor], [Nombre_autor], [Apellido_autor], [Fecha_nacimiento]) VALUES (N'A13', N'Philip', N'Sutton', CAST(N'1966-09-12' AS Date))
INSERT [dbo].[Autores] ([Autor], [Nombre_autor], [Apellido_autor], [Fecha_nacimiento]) VALUES (N'A14', N'David', N'Mitchell', CAST(N'1969-12-01' AS Date))
INSERT [dbo].[Autores] ([Autor], [Nombre_autor], [Apellido_autor], [Fecha_nacimiento]) VALUES (N'A15', N'David', N'Guy Myer	Myer', CAST(N'1942-09-20' AS Date))
INSERT [dbo].[Autores] ([Autor], [Nombre_autor], [Apellido_autor], [Fecha_nacimiento]) VALUES (N'A16', N'Nathan', N'DeWall', CAST(N'1979-08-12' AS Date))
INSERT [dbo].[Autores] ([Autor], [Nombre_autor], [Apellido_autor], [Fecha_nacimiento]) VALUES (N'A17', N'Annelies Marie', N'Frank', CAST(N'1929-12-06' AS Date))
INSERT [dbo].[Autores] ([Autor], [Nombre_autor], [Apellido_autor], [Fecha_nacimiento]) VALUES (N'A18', N'Nicholas', N'Gregory Mankiw', CAST(N'1958-03-02' AS Date))
INSERT [dbo].[Autores] ([Autor], [Nombre_autor], [Apellido_autor], [Fecha_nacimiento]) VALUES (N'A19', N'Philip', N'Kotler', CAST(N'1931-05-27' AS Date))
INSERT [dbo].[Autores] ([Autor], [Nombre_autor], [Apellido_autor], [Fecha_nacimiento]) VALUES (N'A20', N'Gary', N'Armstrong', CAST(N'1934-06-02' AS Date))
INSERT [dbo].[Autores] ([Autor], [Nombre_autor], [Apellido_autor], [Fecha_nacimiento]) VALUES (N'A21', N'Jean-Jacques', N'Rousseau', CAST(N'1712-06-28' AS Date))
INSERT [dbo].[Autores] ([Autor], [Nombre_autor], [Apellido_autor], [Fecha_nacimiento]) VALUES (N'A22', N'Carl', N'Sagan', CAST(N'1934-09-11' AS Date))
INSERT [dbo].[Autores] ([Autor], [Nombre_autor], [Apellido_autor], [Fecha_nacimiento]) VALUES (N'A23', N'Charles Thomas', N'Horngren', CAST(N'1926-04-28' AS Date))
INSERT [dbo].[Autores] ([Autor], [Nombre_autor], [Apellido_autor], [Fecha_nacimiento]) VALUES (N'A24', N'Walter', N'Harrison', CAST(N'1938-11-24' AS Date))
INSERT [dbo].[Autores] ([Autor], [Nombre_autor], [Apellido_autor], [Fecha_nacimiento]) VALUES (N'A25', N'Gilbert', N'Strang', CAST(N'1934-11-27' AS Date))
GO

--DET PREST
/*
INSERT [dbo].[DetPrest] ([Id_Libro], [Prestamo], [Fecha_Devolucion], [Fecha_Lim_Devolucion], [Multa]) VALUES (N'L001', N'P001', CAST(N'2024-09-04' AS Date), CAST(N'2024-09-05' AS Date), NULL)
INSERT [dbo].[DetPrest] ([Id_Libro], [Prestamo], [Fecha_Devolucion], [Fecha_Lim_Devolucion], [Multa]) VALUES (N'L001', N'P017', CAST(N'2024-10-10' AS Date), CAST(N'2024-10-12' AS Date), N'8')
INSERT [dbo].[DetPrest] ([Id_Libro], [Prestamo], [Fecha_Devolucion], [Fecha_Lim_Devolucion], [Multa]) VALUES (N'L002', N'P002', CAST(N'2025-12-04' AS Date), CAST(N'2025-12-06' AS Date), N'2')
INSERT [dbo].[DetPrest] ([Id_Libro], [Prestamo], [Fecha_Devolucion], [Fecha_Lim_Devolucion], [Multa]) VALUES (N'L003', N'P003', CAST(N'2024-10-05' AS Date), CAST(N'2024-10-07' AS Date), N'1')
INSERT [dbo].[DetPrest] ([Id_Libro], [Prestamo], [Fecha_Devolucion], [Fecha_Lim_Devolucion], [Multa]) VALUES (N'L004', N'P004', CAST(N'2025-02-16' AS Date), CAST(N'2025-02-16' AS Date), NULL)
INSERT [dbo].[DetPrest] ([Id_Libro], [Prestamo], [Fecha_Devolucion], [Fecha_Lim_Devolucion], [Multa]) VALUES (N'L005', N'P005', CAST(N'2024-08-11' AS Date), CAST(N'2024-08-12' AS Date), N'7')
INSERT [dbo].[DetPrest] ([Id_Libro], [Prestamo], [Fecha_Devolucion], [Fecha_Lim_Devolucion], [Multa]) VALUES (N'L006', N'P006', CAST(N'2024-09-26' AS Date), CAST(N'2024-09-27' AS Date), NULL)
INSERT [dbo].[DetPrest] ([Id_Libro], [Prestamo], [Fecha_Devolucion], [Fecha_Lim_Devolucion], [Multa]) VALUES (N'L007', N'P007', CAST(N'2024-08-26' AS Date), CAST(N'2024-08-28' AS Date), NULL)
INSERT [dbo].[DetPrest] ([Id_Libro], [Prestamo], [Fecha_Devolucion], [Fecha_Lim_Devolucion], [Multa]) VALUES (N'L008', N'P008', CAST(N'2024-10-07' AS Date), CAST(N'2024-10-07' AS Date), N'3')
INSERT [dbo].[DetPrest] ([Id_Libro], [Prestamo], [Fecha_Devolucion], [Fecha_Lim_Devolucion], [Multa]) VALUES (N'L009', N'P009', CAST(N'2024-09-23' AS Date), CAST(N'2024-09-26' AS Date), NULL)
INSERT [dbo].[DetPrest] ([Id_Libro], [Prestamo], [Fecha_Devolucion], [Fecha_Lim_Devolucion], [Multa]) VALUES (N'L010', N'P010', CAST(N'2024-12-10' AS Date), CAST(N'2024-12-11' AS Date), N'4')
INSERT [dbo].[DetPrest] ([Id_Libro], [Prestamo], [Fecha_Devolucion], [Fecha_Lim_Devolucion], [Multa]) VALUES (N'L011', N'P011', CAST(N'2025-05-30' AS Date), CAST(N'2025-06-01' AS Date), N'5')
INSERT [dbo].[DetPrest] ([Id_Libro], [Prestamo], [Fecha_Devolucion], [Fecha_Lim_Devolucion], [Multa]) VALUES (N'L013', N'P013', CAST(N'2025-01-30' AS Date), CAST(N'2025-01-31' AS Date), NULL)
INSERT [dbo].[DetPrest] ([Id_Libro], [Prestamo], [Fecha_Devolucion], [Fecha_Lim_Devolucion], [Multa]) VALUES (N'L014', N'P014', CAST(N'2024-08-10' AS Date), CAST(N'2024-08-12' AS Date), NULL)
INSERT [dbo].[DetPrest] ([Id_Libro], [Prestamo], [Fecha_Devolucion], [Fecha_Lim_Devolucion], [Multa]) VALUES (N'L015', N'P015', CAST(N'2024-07-06' AS Date), CAST(N'2024-07-07' AS Date), NULL)
INSERT [dbo].[DetPrest] ([Id_Libro], [Prestamo], [Fecha_Devolucion], [Fecha_Lim_Devolucion], [Multa]) VALUES (N'L016', N'P016', CAST(N'2025-01-04' AS Date), CAST(N'2025-01-04' AS Date), NULL)
INSERT [dbo].[DetPrest] ([Id_Libro], [Prestamo], [Fecha_Devolucion], [Fecha_Lim_Devolucion], [Multa]) VALUES (N'L017', N'P017', CAST(N'2024-10-11' AS Date), CAST(N'2024-10-12' AS Date), N'8')
INSERT [dbo].[DetPrest] ([Id_Libro], [Prestamo], [Fecha_Devolucion], [Fecha_Lim_Devolucion], [Multa]) VALUES (N'L018', N'P018', CAST(N'2024-11-19' AS Date), CAST(N'2024-11-20' AS Date), NULL)
INSERT [dbo].[DetPrest] ([Id_Libro], [Prestamo], [Fecha_Devolucion], [Fecha_Lim_Devolucion], [Multa]) VALUES (N'L019', N'P001', CAST(N'2024-09-05' AS Date), CAST(N'2024-09-05' AS Date), NULL)
INSERT [dbo].[DetPrest] ([Id_Libro], [Prestamo], [Fecha_Devolucion], [Fecha_Lim_Devolucion], [Multa]) VALUES (N'L019', N'P017', CAST(N'2024-10-12' AS Date), CAST(N'2024-10-12' AS Date), N'8')
INSERT [dbo].[DetPrest] ([Id_Libro], [Prestamo], [Fecha_Devolucion], [Fecha_Lim_Devolucion], [Multa]) VALUES (N'L019', N'P019', CAST(N'2024-09-04' AS Date), CAST(N'2024-09-05' AS Date), NULL)
INSERT [dbo].[DetPrest] ([Id_Libro], [Prestamo], [Fecha_Devolucion], [Fecha_Lim_Devolucion], [Multa]) VALUES (N'L020', N'P002', CAST(N'2025-12-06' AS Date), CAST(N'2025-12-06' AS Date), N'2')
INSERT [dbo].[DetPrest] ([Id_Libro], [Prestamo], [Fecha_Devolucion], [Fecha_Lim_Devolucion], [Multa]) VALUES (N'L020', N'P012', CAST(N'2024-05-31' AS Date), CAST(N'2024-06-02' AS Date), N'6')
INSERT [dbo].[DetPrest] ([Id_Libro], [Prestamo], [Fecha_Devolucion], [Fecha_Lim_Devolucion], [Multa]) VALUES (N'L020', N'P020', CAST(N'2025-12-06' AS Date), CAST(N'2025-12-06' AS Date), NULL)
GO
*/
--EDITORIALES

INSERT [dbo].[Editoriales] ([Numero_Editorial], [Nombre_editorial]) VALUES (1, N'Sudamericana')
INSERT [dbo].[Editoriales] ([Numero_Editorial], [Nombre_editorial]) VALUES (2, N'Bantam')
INSERT [dbo].[Editoriales] ([Numero_Editorial], [Nombre_editorial]) VALUES (3, N'Alfaguara')
INSERT [dbo].[Editoriales] ([Numero_Editorial], [Nombre_editorial]) VALUES (4, N'Planeta Cómic')
INSERT [dbo].[Editoriales] ([Numero_Editorial], [Nombre_editorial]) VALUES (5, N'Scholastic Inc')
INSERT [dbo].[Editoriales] ([Numero_Editorial], [Nombre_editorial]) VALUES (6, N'Minotauro')
INSERT [dbo].[Editoriales] ([Numero_Editorial], [Nombre_editorial]) VALUES (7, N'Pocket Books')
INSERT [dbo].[Editoriales] ([Numero_Editorial], [Nombre_editorial]) VALUES (8, N'Alma')
INSERT [dbo].[Editoriales] ([Numero_Editorial], [Nombre_editorial]) VALUES (9, N'McGraw-Hill')
INSERT [dbo].[Editoriales] ([Numero_Editorial], [Nombre_editorial]) VALUES (10, N'Sexto Piso')
INSERT [dbo].[Editoriales] ([Numero_Editorial], [Nombre_editorial]) VALUES (11, N'Worth Publishers')
INSERT [dbo].[Editoriales] ([Numero_Editorial], [Nombre_editorial]) VALUES (12, N'Debolsillo')
INSERT [dbo].[Editoriales] ([Numero_Editorial], [Nombre_editorial]) VALUES (13, N'Cengage')
INSERT [dbo].[Editoriales] ([Numero_Editorial], [Nombre_editorial]) VALUES (14, N'Pearson')
INSERT [dbo].[Editoriales] ([Numero_Editorial], [Nombre_editorial]) VALUES (15, N'Alianza Editorial')
INSERT [dbo].[Editoriales] ([Numero_Editorial], [Nombre_editorial]) VALUES (16, N'Planeta')
GO

--LIBROS

INSERT [dbo].[Libros] ([Id_Libro], [Titulo], [Numero_Editorial], [Nom_Categoria], [Año_Publicacion], [Numero_Ejemplares]) VALUES (N'L001', N'Cien Años de Soledad', 1, N'Novela', N'1967', 15)
INSERT [dbo].[Libros] ([Id_Libro], [Titulo], [Numero_Editorial], [Nom_Categoria], [Año_Publicacion], [Numero_Ejemplares]) VALUES (N'L002', N'El Gran Diseño', 2, N'Ciencia popular', N'2010', 5)
INSERT [dbo].[Libros] ([Id_Libro], [Titulo], [Numero_Editorial], [Nom_Categoria], [Año_Publicacion], [Numero_Ejemplares]) VALUES (N'L003', N'Don Quijote de la Mancha', 3, N'Novela', N'1605', 12)
INSERT [dbo].[Libros] ([Id_Libro], [Titulo], [Numero_Editorial], [Nom_Categoria], [Año_Publicacion], [Numero_Ejemplares]) VALUES (N'L004', N'El Eternauta', 4, N'Ficción', N'1957', 10)
INSERT [dbo].[Libros] ([Id_Libro], [Titulo], [Numero_Editorial], [Nom_Categoria], [Año_Publicacion], [Numero_Ejemplares]) VALUES (N'L005', N'Breve historia del tiempo', 2, N'Ciencia popular', N'1988', 8)
INSERT [dbo].[Libros] ([Id_Libro], [Titulo], [Numero_Editorial], [Nom_Categoria], [Año_Publicacion], [Numero_Ejemplares]) VALUES (N'L006', N'Harry Potter y el príncipe mestizo', 5, N'Novela', N'2005', 7)
INSERT [dbo].[Libros] ([Id_Libro], [Titulo], [Numero_Editorial], [Nom_Categoria], [Año_Publicacion], [Numero_Ejemplares]) VALUES (N'L007', N'Trilogía El Señor de los Anillos', 6, N'Fantasía', N'2012', 6)
INSERT [dbo].[Libros] ([Id_Libro], [Titulo], [Numero_Editorial], [Nom_Categoria], [Año_Publicacion], [Numero_Ejemplares]) VALUES (N'L008', N'El talismán', 7, N'Novela', N'1984', 13)
INSERT [dbo].[Libros] ([Id_Libro], [Titulo], [Numero_Editorial], [Nom_Categoria], [Año_Publicacion], [Numero_Ejemplares]) VALUES (N'L009', N'El Hobbit', 6, N'Fantasía', N'1937', 9)
INSERT [dbo].[Libros] ([Id_Libro], [Titulo], [Numero_Editorial], [Nom_Categoria], [Año_Publicacion], [Numero_Ejemplares]) VALUES (N'L010', N'El Príncipe', 8, N'Filosofía política', N'1532', 11)
INSERT [dbo].[Libros] ([Id_Libro], [Titulo], [Numero_Editorial], [Nom_Categoria], [Año_Publicacion], [Numero_Ejemplares]) VALUES (N'L011', N'Introducción a la Sociología', 9, N'Sociología', N'2019', 5)
INSERT [dbo].[Libros] ([Id_Libro], [Titulo], [Numero_Editorial], [Nom_Categoria], [Año_Publicacion], [Numero_Ejemplares]) VALUES (N'L012', N'El Atlas de las Nubes', 10, N'Ficción Científica', N'2004', 14)
INSERT [dbo].[Libros] ([Id_Libro], [Titulo], [Numero_Editorial], [Nom_Categoria], [Año_Publicacion], [Numero_Ejemplares]) VALUES (N'L013', N'Psicología', 11, N'Psicología', N'2014', 6)
INSERT [dbo].[Libros] ([Id_Libro], [Titulo], [Numero_Editorial], [Nom_Categoria], [Año_Publicacion], [Numero_Ejemplares]) VALUES (N'L014', N'El Diario de Ana Frank', 12, N'Literatura', N'1947', 9)
INSERT [dbo].[Libros] ([Id_Libro], [Titulo], [Numero_Editorial], [Nom_Categoria], [Año_Publicacion], [Numero_Ejemplares]) VALUES (N'L015', N'Microeconomía', 13, N'Economía', N'2021', 10)
INSERT [dbo].[Libros] ([Id_Libro], [Titulo], [Numero_Editorial], [Nom_Categoria], [Año_Publicacion], [Numero_Ejemplares]) VALUES (N'L016', N'Fundamentos de Marketing de Kotler y Armstrong', 14, N'Marketing', N'2021', 4)
INSERT [dbo].[Libros] ([Id_Libro], [Titulo], [Numero_Editorial], [Nom_Categoria], [Año_Publicacion], [Numero_Ejemplares]) VALUES (N'L017', N'El Contrato Social', 15, N'Filosofía política', N'1762', 7)
INSERT [dbo].[Libros] ([Id_Libro], [Titulo], [Numero_Editorial], [Nom_Categoria], [Año_Publicacion], [Numero_Ejemplares]) VALUES (N'L018', N'Cosmos', 16, N'Divulgación Científica', N'1980', 6)
INSERT [dbo].[Libros] ([Id_Libro], [Titulo], [Numero_Editorial], [Nom_Categoria], [Año_Publicacion], [Numero_Ejemplares]) VALUES (N'L019', N'Contabilidad Financiera', 14, N'Contabilidad', N'2010', 5)
INSERT [dbo].[Libros] ([Id_Libro], [Titulo], [Numero_Editorial], [Nom_Categoria], [Año_Publicacion], [Numero_Ejemplares]) VALUES (N'L020', N'Álgebra Lineal y sus aplicaciones', 13, N'Matemáticas', N'2005', 12)
GO

--LIBROSVSAUTORES

INSERT [dbo].[LibrosVSAutores] ([Id_Libro], [Autor]) VALUES (N'L001', N'A01')
INSERT [dbo].[LibrosVSAutores] ([Id_Libro], [Autor]) VALUES (N'L002', N'A02')
INSERT [dbo].[LibrosVSAutores] ([Id_Libro], [Autor]) VALUES (N'L002', N'A03')
INSERT [dbo].[LibrosVSAutores] ([Id_Libro], [Autor]) VALUES (N'L003', N'A04')
INSERT [dbo].[LibrosVSAutores] ([Id_Libro], [Autor]) VALUES (N'L004', N'A05')
INSERT [dbo].[LibrosVSAutores] ([Id_Libro], [Autor]) VALUES (N'L005', N'A06')
INSERT [dbo].[LibrosVSAutores] ([Id_Libro], [Autor]) VALUES (N'L006', N'A07')
INSERT [dbo].[LibrosVSAutores] ([Id_Libro], [Autor]) VALUES (N'L007', N'A08')
INSERT [dbo].[LibrosVSAutores] ([Id_Libro], [Autor]) VALUES (N'L007', N'A09')
INSERT [dbo].[LibrosVSAutores] ([Id_Libro], [Autor]) VALUES (N'L008', N'A10')
INSERT [dbo].[LibrosVSAutores] ([Id_Libro], [Autor]) VALUES (N'L009', N'A11')
INSERT [dbo].[LibrosVSAutores] ([Id_Libro], [Autor]) VALUES (N'L010', N'A12')
INSERT [dbo].[LibrosVSAutores] ([Id_Libro], [Autor]) VALUES (N'L010', N'A13')
INSERT [dbo].[LibrosVSAutores] ([Id_Libro], [Autor]) VALUES (N'L011', N'A14')
INSERT [dbo].[LibrosVSAutores] ([Id_Libro], [Autor]) VALUES (N'L012', N'A15')
INSERT [dbo].[LibrosVSAutores] ([Id_Libro], [Autor]) VALUES (N'L012', N'A16')
INSERT [dbo].[LibrosVSAutores] ([Id_Libro], [Autor]) VALUES (N'L013', N'A17')
INSERT [dbo].[LibrosVSAutores] ([Id_Libro], [Autor]) VALUES (N'L014', N'A18')
INSERT [dbo].[LibrosVSAutores] ([Id_Libro], [Autor]) VALUES (N'L015', N'A19')
INSERT [dbo].[LibrosVSAutores] ([Id_Libro], [Autor]) VALUES (N'L015', N'A20')
INSERT [dbo].[LibrosVSAutores] ([Id_Libro], [Autor]) VALUES (N'L016', N'A21')
INSERT [dbo].[LibrosVSAutores] ([Id_Libro], [Autor]) VALUES (N'L017', N'A22')
INSERT [dbo].[LibrosVSAutores] ([Id_Libro], [Autor]) VALUES (N'L018', N'A23')
INSERT [dbo].[LibrosVSAutores] ([Id_Libro], [Autor]) VALUES (N'L019', N'A24')
INSERT [dbo].[LibrosVSAutores] ([Id_Libro], [Autor]) VALUES (N'L019', N'A25')
INSERT [dbo].[LibrosVSAutores] ([Id_Libro], [Autor]) VALUES (N'L020', N'A25')
GO

--MULTAS
/*
INSERT [dbo].[Multas] ([Multa], [Valor_base_multa], [Descripción_multa], [Tipodemulta], [Monto_final_multa], [Fecha_emisión_multa]) VALUES (N'1', N'$50', N'Entrega un dia depsues de fecha limite	', N'Entrega tardia', N'$50', CAST(N'2024-09-04' AS Date))
INSERT [dbo].[Multas] ([Multa], [Valor_base_multa], [Descripción_multa], [Tipodemulta], [Monto_final_multa], [Fecha_emisión_multa]) VALUES (N'2', N'$400', N'Extravio de libro prestado', N'Extravio', N'$400', CAST(N'2024-10-07' AS Date))
INSERT [dbo].[Multas] ([Multa], [Valor_base_multa], [Descripción_multa], [Tipodemulta], [Monto_final_multa], [Fecha_emisión_multa]) VALUES (N'3', N'$50', N'Entrega dos dias despues de la fecha', N'Entrega tardia', N'$100', CAST(N'2024-09-23' AS Date))
INSERT [dbo].[Multas] ([Multa], [Valor_base_multa], [Descripción_multa], [Tipodemulta], [Monto_final_multa], [Fecha_emisión_multa]) VALUES (N'4', N'$200', N'Entrega del libro con la pasta suelta', N'Mal uso del libro', N'$300', CAST(N'2024-12-10' AS Date))
INSERT [dbo].[Multas] ([Multa], [Valor_base_multa], [Descripción_multa], [Tipodemulta], [Monto_final_multa], [Fecha_emisión_multa]) VALUES (N'5', N'$200', N'Entrega del libro con la pasta suelta', N'Mal uso del libro', N'$200', CAST(N'2025-05-30' AS Date))
INSERT [dbo].[Multas] ([Multa], [Valor_base_multa], [Descripción_multa], [Tipodemulta], [Monto_final_multa], [Fecha_emisión_multa]) VALUES (N'6', N'$400', N'Extravio de libro prestado', N'Extravio', N'$400', CAST(N'2024-05-31' AS Date))
INSERT [dbo].[Multas] ([Multa], [Valor_base_multa], [Descripción_multa], [Tipodemulta], [Monto_final_multa], [Fecha_emisión_multa]) VALUES (N'7', N'$400', N'Extravio de libro prestado', N'Extravio', N'$400', CAST(N'2024-10-05' AS Date))
INSERT [dbo].[Multas] ([Multa], [Valor_base_multa], [Descripción_multa], [Tipodemulta], [Monto_final_multa], [Fecha_emisión_multa]) VALUES (N'8', N'$200', N'Entrega del libro con hojas maltratadas', N'Mal uso del libro', N'$200', CAST(N'2025-12-06' AS Date))
GO

--PRESTAMO

INSERT [dbo].[Prestamo] ([Prestamo], [Usuario], [Fecha_Prestamo], [Cantidad_libros]) VALUES (N'P001', N'101', CAST(N'2024-09-02' AS Date), 2)
INSERT [dbo].[Prestamo] ([Prestamo], [Usuario], [Fecha_Prestamo], [Cantidad_libros]) VALUES (N'P002', N'102', CAST(N'2025-12-03' AS Date), 2)
INSERT [dbo].[Prestamo] ([Prestamo], [Usuario], [Fecha_Prestamo], [Cantidad_libros]) VALUES (N'P003', N'103', CAST(N'2024-10-04' AS Date), 1)
INSERT [dbo].[Prestamo] ([Prestamo], [Usuario], [Fecha_Prestamo], [Cantidad_libros]) VALUES (N'P004', N'104', CAST(N'2025-02-13' AS Date), 1)
INSERT [dbo].[Prestamo] ([Prestamo], [Usuario], [Fecha_Prestamo], [Cantidad_libros]) VALUES (N'P005', N'105', CAST(N'2024-08-09' AS Date), 1)
INSERT [dbo].[Prestamo] ([Prestamo], [Usuario], [Fecha_Prestamo], [Cantidad_libros]) VALUES (N'P006', N'106', CAST(N'2024-09-24' AS Date), 1)
INSERT [dbo].[Prestamo] ([Prestamo], [Usuario], [Fecha_Prestamo], [Cantidad_libros]) VALUES (N'P007', N'107', CAST(N'2024-08-25' AS Date), 1)
INSERT [dbo].[Prestamo] ([Prestamo], [Usuario], [Fecha_Prestamo], [Cantidad_libros]) VALUES (N'P008', N'108', CAST(N'2024-10-04' AS Date), 1)
INSERT [dbo].[Prestamo] ([Prestamo], [Usuario], [Fecha_Prestamo], [Cantidad_libros]) VALUES (N'P009', N'109', CAST(N'2024-09-23' AS Date), 1)
INSERT [dbo].[Prestamo] ([Prestamo], [Usuario], [Fecha_Prestamo], [Cantidad_libros]) VALUES (N'P010', N'112', CAST(N'2024-12-08' AS Date), 1)
INSERT [dbo].[Prestamo] ([Prestamo], [Usuario], [Fecha_Prestamo], [Cantidad_libros]) VALUES (N'P011', N'113', CAST(N'2025-05-29' AS Date), 1)
INSERT [dbo].[Prestamo] ([Prestamo], [Usuario], [Fecha_Prestamo], [Cantidad_libros]) VALUES (N'P012', N'114', CAST(N'2024-05-30' AS Date), 2)
INSERT [dbo].[Prestamo] ([Prestamo], [Usuario], [Fecha_Prestamo], [Cantidad_libros]) VALUES (N'P013', N'115', CAST(N'2025-01-28' AS Date), 1)
INSERT [dbo].[Prestamo] ([Prestamo], [Usuario], [Fecha_Prestamo], [Cantidad_libros]) VALUES (N'P014', N'116', CAST(N'2024-08-09' AS Date), 1)
INSERT [dbo].[Prestamo] ([Prestamo], [Usuario], [Fecha_Prestamo], [Cantidad_libros]) VALUES (N'P015', N'117', CAST(N'2024-07-04' AS Date), 1)
INSERT [dbo].[Prestamo] ([Prestamo], [Usuario], [Fecha_Prestamo], [Cantidad_libros]) VALUES (N'P016', N'118', CAST(N'2025-01-01' AS Date), 1)
INSERT [dbo].[Prestamo] ([Prestamo], [Usuario], [Fecha_Prestamo], [Cantidad_libros]) VALUES (N'P017', N'119', CAST(N'2024-10-09' AS Date), 3)
INSERT [dbo].[Prestamo] ([Prestamo], [Usuario], [Fecha_Prestamo], [Cantidad_libros]) VALUES (N'P018', N'120', CAST(N'2024-11-17' AS Date), 1)
INSERT [dbo].[Prestamo] ([Prestamo], [Usuario], [Fecha_Prestamo], [Cantidad_libros]) VALUES (N'P019', N'101', CAST(N'2024-09-02' AS Date), 1)
INSERT [dbo].[Prestamo] ([Prestamo], [Usuario], [Fecha_Prestamo], [Cantidad_libros]) VALUES (N'P020', N'102', CAST(N'2025-12-03' AS Date), 1)
GO

--USUARIO

INSERT [dbo].[Usuario] ([Usuario], [Nombre], [ApellidoP], [ApellidoM], [Email], [Dirección_Email], [Celular], [Calle], [Num_Ext], [Colonia], [Alcaldia], [CP], [Sexo]) VALUES (N'101', N'Luis', N'Pérez', N'Ramírez', N'luis.perez', N'@gmail.com', N'5512345678', N'Av. Reforma', N'100', N'Juárez', N'Cuauhtémoc', N'6600', N'h')
INSERT [dbo].[Usuario] ([Usuario], [Nombre], [ApellidoP], [ApellidoM], [Email], [Dirección_Email], [Celular], [Calle], [Num_Ext], [Colonia], [Alcaldia], [CP], [Sexo]) VALUES (N'102', N'Ana', N'García', N'Torres', N'ana.garcia', N'@gmail.com', N'5598765432', N'Calle 5 de Mayo', N'45', N'Centro', N'Cuauhtémoc', N'6010', NULL)
INSERT [dbo].[Usuario] ([Usuario], [Nombre], [ApellidoP], [ApellidoM], [Email], [Dirección_Email], [Celular], [Calle], [Num_Ext], [Colonia], [Alcaldia], [CP], [Sexo]) VALUES (N'103', N'María', N'López', N'Méndez', N'marta.lopez', N'@gmail.com', N'5523456789', N'Insurgentes Sur', N'2500', N'Del Valle', N'Benito Juárez', N'3100', N'm')
INSERT [dbo].[Usuario] ([Usuario], [Nombre], [ApellidoP], [ApellidoM], [Email], [Dirección_Email], [Celular], [Calle], [Num_Ext], [Colonia], [Alcaldia], [CP], [Sexo]) VALUES (N'104', N'Jorge', N'Sánchez', N'Ortega', N'jorge.sanchez', N'@gmail.com', N'5587654321', N'Av. Coyoacán', N'875', N'Acacias', N'Benito Juárez', N'3160', NULL)
INSERT [dbo].[Usuario] ([Usuario], [Nombre], [ApellidoP], [ApellidoM], [Email], [Dirección_Email], [Celular], [Calle], [Num_Ext], [Colonia], [Alcaldia], [CP], [Sexo]) VALUES (N'105', N'Daniela', N'Ruiz', N'Gómez', N'daniela.ruiz', N'@gmail.com', N'5534567890', N'División del Norte', N'1234', N'Portales Norte', N'Benito Juárez', N'3300', NULL)
INSERT [dbo].[Usuario] ([Usuario], [Nombre], [ApellidoP], [ApellidoM], [Email], [Dirección_Email], [Celular], [Calle], [Num_Ext], [Colonia], [Alcaldia], [CP], [Sexo]) VALUES (N'106', N'Ricardo', N'Torres', N'Pérez', N'ricardo.t', N'@gmail.com', N'5511122233', N'Av. Patriotismo', N'560', N'San José', N'Miguel Hidalgo', N'11800', NULL)
INSERT [dbo].[Usuario] ([Usuario], [Nombre], [ApellidoP], [ApellidoM], [Email], [Dirección_Email], [Celular], [Calle], [Num_Ext], [Colonia], [Alcaldia], [CP], [Sexo]) VALUES (N'107', N'Mariana', N'Castro', N'Luna', N'mariana.c', N'@gmail.com', N'5699998887', N'Calz. de Tlalpan', N'789', N'Xotepingo', N'Coyoacán', N'4310', NULL)
INSERT [dbo].[Usuario] ([Usuario], [Nombre], [ApellidoP], [ApellidoM], [Email], [Dirección_Email], [Celular], [Calle], [Num_Ext], [Colonia], [Alcaldia], [CP], [Sexo]) VALUES (N'108', N'Pablo', N'Morales', N'Díaz', N'pablo.m', N'@gmail.com', N'5522223333', N'Av. Universidad', N'1020', N'Copilco', N'Coyoacán', N'4360', NULL)
INSERT [dbo].[Usuario] ([Usuario], [Nombre], [ApellidoP], [ApellidoM], [Email], [Dirección_Email], [Celular], [Calle], [Num_Ext], [Colonia], [Alcaldia], [CP], [Sexo]) VALUES (N'109', N'Karla', N'Jiménez', N'Soto', N'karla.j', N'@gmail.com', N'5588112233', N'Periférico Sur', N'200', N'Pedregal', N'Álvaro Obregón', N'1900', NULL)
INSERT [dbo].[Usuario] ([Usuario], [Nombre], [ApellidoP], [ApellidoM], [Email], [Dirección_Email], [Celular], [Calle], [Num_Ext], [Colonia], [Alcaldia], [CP], [Sexo]) VALUES (N'110', N'Andrés', N'Martínez', N'Vega', N'andres.m', N'@gmail.com', N'5533334444', N'Av. Constituyentes', N'1450', N'Lomas Altas', N'Miguel Hidalgo', N'11950', NULL)
INSERT [dbo].[Usuario] ([Usuario], [Nombre], [ApellidoP], [ApellidoM], [Email], [Dirección_Email], [Celular], [Calle], [Num_Ext], [Colonia], [Alcaldia], [CP], [Sexo]) VALUES (N'111', N'Fernanda', N'Aguilar', N'Ríos', N'fernanda.a', N'@gmail.com', N'5544445555', N'Horacio', N'800', N'Polanco', N'Miguel Hidalgo', N'11510', NULL)
INSERT [dbo].[Usuario] ([Usuario], [Nombre], [ApellidoP], [ApellidoM], [Email], [Dirección_Email], [Celular], [Calle], [Num_Ext], [Colonia], [Alcaldia], [CP], [Sexo]) VALUES (N'112', N'Miguel', N'Vargas', N'Lozano', N'miguel.v', N'@gmail.com', N'5566778899', N'Av. Revolución', N'910', N'San Ángel', N'Álvaro Obregón', N'1000', NULL)
INSERT [dbo].[Usuario] ([Usuario], [Nombre], [ApellidoP], [ApellidoM], [Email], [Dirección_Email], [Celular], [Calle], [Num_Ext], [Colonia], [Alcaldia], [CP], [Sexo]) VALUES (N'113', N'Isabel', N'Navarro', N'Paredes', N'isabel.n', N'@gmail.com', N'5522334455', N'Av. Chapultepec', N'360', N'Roma Norte', N'Cuauhtémoc', N'6700', NULL)
INSERT [dbo].[Usuario] ([Usuario], [Nombre], [ApellidoP], [ApellidoM], [Email], [Dirección_Email], [Celular], [Calle], [Num_Ext], [Colonia], [Alcaldia], [CP], [Sexo]) VALUES (N'114', N'Arturo', N'Herrera', N'Mora', N'arturo.h', N'@gmail.com', N'5577889900', N'Eje Central', N'110', N'Doctores', N'Cuauhtémoc', N'6720', NULL)
INSERT [dbo].[Usuario] ([Usuario], [Nombre], [ApellidoP], [ApellidoM], [Email], [Dirección_Email], [Celular], [Calle], [Num_Ext], [Colonia], [Alcaldia], [CP], [Sexo]) VALUES (N'115', N'Laura', N'Mendoza', N'Salas', N'laura.m', N'@gmail.com', N'5588990011', N'Eje 8 Sur', N'678', N'Del Carmen', N'Coyoacán', N'4100', NULL)
INSERT [dbo].[Usuario] ([Usuario], [Nombre], [ApellidoP], [ApellidoM], [Email], [Dirección_Email], [Celular], [Calle], [Num_Ext], [Colonia], [Alcaldia], [CP], [Sexo]) VALUES (N'116', N'David', N'Cruz', N'Hernández', N'david.c', N'@gmail.com', N'5512121212', N'Av. Tláhuac', N'1340', N'Nopalera', N'Tláhuac', N'13220', NULL)
INSERT [dbo].[Usuario] ([Usuario], [Nombre], [ApellidoP], [ApellidoM], [Email], [Dirección_Email], [Celular], [Calle], [Num_Ext], [Colonia], [Alcaldia], [CP], [Sexo]) VALUES (N'117', N'Patricia', N'Robles', N'Ayala', N'paty.r', N'@gmail.com', N'5639393939', N'Calz. Ignacio Zaragoza', N'444', N'Santa Martha', N'Iztapalapa', N'9140', NULL)
INSERT [dbo].[Usuario] ([Usuario], [Nombre], [ApellidoP], [ApellidoM], [Email], [Dirección_Email], [Celular], [Calle], [Num_Ext], [Colonia], [Alcaldia], [CP], [Sexo]) VALUES (N'118', N'Roberto', N'Salazar', N'Beltrán', N'roberto.s', N'@gmail.com', N'5591919191', N'Av. Ermita Iztapalapa', N'231', N'El Manto', N'Iztapalapa', N'9830', NULL)
INSERT [dbo].[Usuario] ([Usuario], [Nombre], [ApellidoP], [ApellidoM], [Email], [Dirección_Email], [Celular], [Calle], [Num_Ext], [Colonia], [Alcaldia], [CP], [Sexo]) VALUES (N'119', N'Brenda', N'Castañeda', N'Nieto', N'brenda.c', N'@gmail.com', N'5570707070', N'Av. Canal de Chalco', N'420', N'Valle de Luces', N'Iztapalapa', N'9560', NULL)
INSERT [dbo].[Usuario] ([Usuario], [Nombre], [ApellidoP], [ApellidoM], [Email], [Dirección_Email], [Celular], [Calle], [Num_Ext], [Colonia], [Alcaldia], [CP], [Sexo]) VALUES (N'120', N'Tomás', N'Pineda', N'Bravo', N'tomas.p', N'@gmail.com', N'5545454545', N'Av. Tláhuac', N'3001', N'Mixquic', N'Tláhuac', N'13600', NULL)
GO
*/
--FKS

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

--PORTADAS

Update Libros
Set Portada='https://pictures.abebooks.com/inventory/md/md32306557199.jpg'
Where Id_Libro='L001';

Update Libros
Set Portada='https://m.media-amazon.com/images/I/81ZvgZhSo3L.jpg'
Where Id_Libro='L002';

Update Libros
Set Portada='https://pdlibrosmex.cdnstatics2.com/usuaris/libros/thumbs/9189a95d-1d73-41ef-9704-bc3be66c60c2/d_360_620/382527_portada_don-quijote-de-la-mancha-comic_miguel-de-cervantes_202310231106.webp'
Where Id_Libro='L003';

Update Libros
Set Portada='https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1332297199i/191141.jpg'
Where Id_Libro='L004';

Update Libros
Set Portada='https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1299001782i/7494945.jpg'
Where Id_Libro='L005';

Update Libros
Set Portada='https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1627043894i/58613345.jpg'
Where Id_Libro='L006';

Update Libros
Set Portada='https://cdn.kobo.com/book-images/Images/7a4e6356-8be0-48c8-91a5-b70a15c30354/300/300/False/image.jpg'
Where Id_Libro='L007';

Update Libros
Set Portada='https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1295482998i/10267508.jpg'
Where Id_Libro='L008';

Update Libros
Set Portada='https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1738628304i/227221.jpg'
Where Id_Libro='L009';

Update Libros
Set Portada='https://imagessl5.casadellibro.com/a/l/s7/25/9788417430825.webp'
Where Id_Libro='L010';

Update Libros
Set Portada='https://biblioteca.lapaz.bo/portadas/AGE/AGE01090.jpg'
Where Id_Libro='L011';

Update Libros
Set Portada='https://imagessl6.casadellibro.com/a/l/s7/86/9788416634286.webp'
Where Id_Libro='L012';

Update Libros
Set Portada=''
Where Id_Libro='L013';

Update Libros
Set Portada='https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1453677036i/28690711.jpg'
Where Id_Libro='L014';

Update Libros
Set Portada='https://books.google.com.mx/books?id=NbCqRfh3vgC&printsec=copyright&hl=es&redir_esc=y#v=onepage&q&f=false'
Where Id_Libro='L015';

Update Libros
Set Portada='https://www.ingebook.com/ib/pimg/Ingebook/00100_0000008731_18388.JPG'
Where Id_Libro='L016';

Update Libros
Set Portada='https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1175948991i/576230.jpg'
Where Id_Libro='L017';

Update Libros
Set Portada='https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1388620656i/55030.jpg'
Where Id_Libro='L018';

Update Libros
Set Portada='https://static.cegal.es/imagenes/marcadas/9789701/978970170386.gif'
Where Id_Libro='L019';

Update Libros
Set Portada='https://images.cdn1.buscalibre.com/fit-in/360x360/b3/88/b388e413610176cc696e6b3dd456a9ac.jpg'
Where Id_Libro='L020';
