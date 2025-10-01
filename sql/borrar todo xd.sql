-- ESTO ES PA BORRAR TODOS LOS OBJETOS EN CASO DE QUE TIREN SU BD MANUALMENTE (NO CON QUERY, SINO EN DELETE Y CLOSE ALL EXISTING CONNECTIONS)
IF OBJECT_ID('dbo.wishlist', 'U') IS NOT NULL
BEGIN
    IF EXISTS (SELECT * FROM sys.foreign_keys WHERE name = 'fk_wishlist_usuario')
        ALTER TABLE dbo.wishlist DROP CONSTRAINT fk_wishlist_usuario;
    IF EXISTS (SELECT * FROM sys.foreign_keys WHERE name = 'fk_wishlist_libro')
        ALTER TABLE dbo.wishlist DROP CONSTRAINT fk_wishlist_libro;
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

IF OBJECT_ID('dbo.Prestamos', 'U') IS NOT NULL
BEGIN
    IF EXISTS (SELECT * FROM sys.foreign_keys WHERE name = 'fk_prestamo_libro')
        ALTER TABLE dbo.Prestamos DROP CONSTRAINT fk_prestamo_libro;
    IF EXISTS (SELECT * FROM sys.foreign_keys WHERE name = 'fk_prestamo_usuario')
        ALTER TABLE dbo.Prestamos DROP CONSTRAINT fk_prestamo_usuario;
    IF EXISTS (SELECT * FROM sys.foreign_keys WHERE name = 'fk_prestamo_multa')
        ALTER TABLE dbo.Prestamos DROP CONSTRAINT fk_prestamo_multa;
END

IF OBJECT_ID('dbo.Usuario', 'U') IS NOT NULL
BEGIN
    IF EXISTS (SELECT * FROM sys.check_constraints WHERE name = 'caracter')
        ALTER TABLE dbo.Usuario DROP CONSTRAINT caracter;
END

IF OBJECT_ID('dbo.Multas', 'U') IS NOT NULL
BEGIN
    IF EXISTS (SELECT * FROM sys.check_constraints WHERE name = 'estado')
        ALTER TABLE dbo.Multas DROP CONSTRAINT estado;
END

IF OBJECT_ID('dbo.wishlist', 'U') IS NOT NULL DROP TABLE dbo.wishlist;
IF OBJECT_ID('dbo.LibrosVSAutores', 'U') IS NOT NULL DROP TABLE dbo.LibrosVSAutores;
IF OBJECT_ID('dbo.Prestamos', 'U') IS NOT NULL DROP TABLE dbo.Prestamos;
IF OBJECT_ID('dbo.Libros', 'U') IS NOT NULL DROP TABLE dbo.Libros;
IF OBJECT_ID('dbo.Multas', 'U') IS NOT NULL DROP TABLE dbo.Multas;
IF OBJECT_ID('dbo.Usuario', 'U') IS NOT NULL DROP TABLE dbo.Usuario;
IF OBJECT_ID('dbo.Editoriales', 'U') IS NOT NULL DROP TABLE dbo.Editoriales;
IF OBJECT_ID('dbo.Autores', 'U') IS NOT NULL DROP TABLE dbo.Autores;
GO

--DROP USER napoles_munguia_josedejesus_1
--DROP LOGIN napoles_munguia_josedejesus_1;

SELECT * FROM sys.syslogins