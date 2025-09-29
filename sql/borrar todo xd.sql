
IF OBJECT_ID('dbo.wishlist', 'U') IS NOT NULL
    ALTER TABLE dbo.wishlist DROP CONSTRAINT fk_wishlist_usuario;

IF OBJECT_ID('dbo.wishlist', 'U') IS NOT NULL
    ALTER TABLE dbo.wishlist DROP CONSTRAINT fk_wishlist_libro;

IF OBJECT_ID('dbo.DetPrest', 'U') IS NOT NULL
BEGIN
    IF EXISTS (SELECT * FROM sys.foreign_keys WHERE name = 'FK__DetPrest__Id_Libro')
        ALTER TABLE dbo.DetPrest DROP CONSTRAINT FK__DetPrest__Id_Libro;
    IF EXISTS (SELECT * FROM sys.foreign_keys WHERE name = 'FK__DetPrest__Prestamo')
        ALTER TABLE dbo.DetPrest DROP CONSTRAINT FK__DetPrest__Prestamo;
    IF EXISTS (SELECT * FROM sys.foreign_keys WHERE name = 'FK__DetPrest__Multa')
        ALTER TABLE dbo.DetPrest DROP CONSTRAINT FK__DetPrest__Multa;
END

IF OBJECT_ID('dbo.LibrosVSAutores', 'U') IS NOT NULL
BEGIN
    IF EXISTS (SELECT * FROM sys.foreign_keys WHERE name = 'FK__LibrosVSAutores__Autor')
        ALTER TABLE dbo.LibrosVSAutores DROP CONSTRAINT FK__LibrosVSAutores__Autor;
    IF EXISTS (SELECT * FROM sys.foreign_keys WHERE name = 'FK__LibrosVSAutores__Id_Libro')
        ALTER TABLE dbo.LibrosVSAutores DROP CONSTRAINT FK__LibrosVSAutores__Id_Libro;
END

IF OBJECT_ID('dbo.Libros', 'U') IS NOT NULL
BEGIN
    IF EXISTS (SELECT * FROM sys.foreign_keys WHERE name = 'FK__Libros__Numero_Editorial')
        ALTER TABLE dbo.Libros DROP CONSTRAINT FK__Libros__Numero_Editorial;
END

IF OBJECT_ID('dbo.Prestamo', 'U') IS NOT NULL
BEGIN
    IF EXISTS (SELECT * FROM sys.foreign_keys WHERE name = 'FK__Prestamo__Usuario')
        ALTER TABLE dbo.Prestamo DROP CONSTRAINT FK__Prestamo__Usuario;
END

IF OBJECT_ID('dbo.wishlist', 'U') IS NOT NULL DROP TABLE dbo.wishlist;
IF OBJECT_ID('dbo.DetPrest', 'U') IS NOT NULL DROP TABLE dbo.DetPrest;
IF OBJECT_ID('dbo.LibrosVSAutores', 'U') IS NOT NULL DROP TABLE dbo.LibrosVSAutores;
IF OBJECT_ID('dbo.Prestamo', 'U') IS NOT NULL DROP TABLE dbo.Prestamo;
IF OBJECT_ID('dbo.Libros', 'U') IS NOT NULL DROP TABLE dbo.Libros;
IF OBJECT_ID('dbo.Multas', 'U') IS NOT NULL DROP TABLE dbo.Multas;
IF OBJECT_ID('dbo.Usuario', 'U') IS NOT NULL DROP TABLE dbo.Usuario;
IF OBJECT_ID('dbo.Editoriales', 'U') IS NOT NULL DROP TABLE dbo.Editoriales;
IF OBJECT_ID('dbo.Autores', 'U') IS NOT NULL DROP TABLE dbo.Autores;
GO
