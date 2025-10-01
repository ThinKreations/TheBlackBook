USE Biblioteca
GO

USE Biblioteca;
GO

INSERT [dbo].[Autores] ([Autor], [Nombre_autor], [Apellido_autor], [Fecha_nacimiento]) VALUES 
(N'A01', N'Gabriel', N'Garcia Marquez', '1927-06-03'),
(N'A02', N'Leonard', N'Mlodinow', '1954-11-26'),
(N'A03', N'Stephen', N'Hawking', '1942-01-08'),
(N'A04', N'Miguel', N'de Cervantes', '1547-09-29'),
(N'A05', N'Héctor German', N'Oesterheld', '1919-07-23'),
(N'A06', N'Stephen', N'Hawking', '1942-01-08'),
(N'A07', N'Joanne Kathleen', N'Rowling', '1942-08-01'),
(N'A08', N'Peter', N'Straub', '1892-01-03'),
(N'A09', N'Stephen', N'King', '1947-09-21'),
(N'A10', N'John Ronald', N'Reuel Tolkien', '1892-07-31'),
(N'A11', N'Nicolas', N'Maquiavelo', '1469-05-03'),
(N'A12', N'Giddens', N'Anthony', '1938-01-18'),
(N'A13', N'Philip', N'Sutton', '1966-09-12'),
(N'A14', N'David', N'Mitchell', '1969-12-01'),
(N'A15', N'David', N'Guy Myer', '1942-09-20'),
(N'A16', N'Nathan', N'DeWall', '1979-08-12'),
(N'A17', N'Annelies Marie', N'Frank', '1929-12-06'),
(N'A18', N'Nicholas', N'Gregory Mankiw', '1958-03-02'),
(N'A19', N'Philip', N'Kotler', '1931-05-27'),
(N'A20', N'Gary', N'Armstrong', '1934-06-02'),
(N'A21', N'Jean-Jacques', N'Rousseau', '1712-06-28'),
(N'A22', N'Carl', N'Sagan', '1934-09-11'),
(N'A23', N'Charles Thomas', N'Horngren', '1926-04-28'),
(N'A24', N'Walter', N'Harrison', '1938-11-24'),
(N'A25', N'Gilbert', N'Strang', '1934-11-27');
GO

INSERT [dbo].[Editoriales] ([Numero_Editorial], [Nombre_editorial]) VALUES
(1, N'Sudamericana'),
(2, N'Bantam'),
(3, N'Alfaguara'),
(4, N'Planeta Cómic'),
(5, N'Scholastic Inc'),
(6, N'Minotauro'),
(7, N'Pocket Books'),
(8, N'Alma'),
(9, N'McGraw-Hill'),
(10, N'Sexto Piso'),
(11, N'Worth Publishers'),
(12, N'Debolsillo'),
(13, N'Cengage'),
(14, N'Pearson'),
(15, N'Alianza Editorial'),
(16, N'Planeta');
GO

INSERT [dbo].[Libros] ([Id_Libro], [Titulo], [Numero_Editorial], [Nom_Categoria], [Anio_Publicacion], [Numero_Ejemplares]) VALUES
(N'L001', N'Cien Años de Soledad', 1, N'Novela', N'1967', 15),
(N'L002', N'El Gran Diseño', 2, N'Ciencia popular', N'2010', 5),
(N'L003', N'Don Quijote de la Mancha', 3, N'Novela', N'1605', 12),
(N'L004', N'El Eternauta', 4, N'Ficción', N'1957', 10),
(N'L005', N'Breve historia del tiempo', 2, N'Ciencia popular', N'1988', 8),
(N'L006', N'Harry Potter y el príncipe mestizo', 5, N'Novela', N'2005', 7),
(N'L007', N'Trilogía El Señor de los Anillos', 6, N'Fantasía', N'2012', 6),
(N'L008', N'El talismán', 7, N'Novela', N'1984', 13),
(N'L009', N'El Hobbit', 6, N'Fantasía', N'1937', 9),
(N'L010', N'El Príncipe', 8, N'Filosofía política', N'1532', 11),
(N'L011', N'Introducción a la Sociología', 9, N'Sociología', N'2019', 5),
(N'L012', N'El Atlas de las Nubes', 10, N'Ficción Científica', N'2004', 14),
(N'L013', N'Psicología', 11, N'Psicología', N'2014', 6),
(N'L014', N'El Diario de Ana Frank', 12, N'Literatura', N'1947', 9),
(N'L015', N'Microeconomía', 13, N'Economía', N'2021', 10),
(N'L016', N'Fundamentos de Marketing de Kotler y Armstrong', 14, N'Marketing', N'2021', 4),
(N'L017', N'El Contrato Social', 15, N'Filosofía política', N'1762', 7),
(N'L018', N'Cosmos', 16, N'Divulgación Científica', N'1980', 6),
(N'L019', N'Contabilidad Financiera', 14, N'Contabilidad', N'2010', 5),
(N'L020', N'Álgebra Lineal y sus aplicaciones', 13, N'Matemáticas', N'2005', 12);
GO

INSERT [dbo].[LibrosVSAutores] ([Id_Libro], [Autor]) VALUES
(N'L001', N'A01'),
(N'L002', N'A02'),
(N'L002', N'A03'),
(N'L003', N'A04'),
(N'L004', N'A05'),
(N'L005', N'A06'),
(N'L006', N'A07'),
(N'L007', N'A08'),
(N'L007', N'A09'),
(N'L008', N'A10'),
(N'L009', N'A11'),
(N'L010', N'A12'),
(N'L010', N'A13'),
(N'L011', N'A14'),
(N'L012', N'A15'),
(N'L012', N'A16'),
(N'L013', N'A17'),
(N'L014', N'A18'),
(N'L015', N'A19'),
(N'L016', N'A20'),
(N'L017', N'A21'),
(N'L018', N'A22'),
(N'L019', N'A23'),
(N'L019', N'A24'),
(N'L020', N'A25');
GO

--FKS

ALTER TABLE [dbo].[Libros]  WITH CHECK ADD FOREIGN KEY([Numero_Editorial])
REFERENCES [dbo].[Editoriales] ([Numero_Editorial])
GO

ALTER TABLE [dbo].[LibrosVSAutores]  WITH CHECK ADD FOREIGN KEY([Autor])
REFERENCES [dbo].[Autores] ([Autor])
GO

ALTER TABLE [dbo].[LibrosVSAutores]  WITH CHECK ADD FOREIGN KEY([Id_Libro])
REFERENCES [dbo].[Libros] ([Id_Libro])
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


