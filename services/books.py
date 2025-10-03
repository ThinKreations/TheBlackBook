from .database import getConnection
import json

def get_all_books():
    conn = getConnection()
    if not conn:
        return json.dumps([])
    
    cursor = conn.cursor()
    cursor.execute("SELECT L.Id_Libro, L.Titulo, ISNULL(A.Nombre_autor, '') + ' ' + ISNULL(A.Apellido_autor, '') AS NombreAutor, L.Anio_Publicacion, E.Nombre_editorial, L.Nom_Categoria, L.Portada FROM Libros L JOIN LibrosVSAutores LA ON L.Id_Libro = LA.Id_Libro JOIN Autores A ON LA.Autor = A.Autor JOIN Editoriales E ON L.Numero_Editorial = E.Numero_Editorial;")
    librosRegistrados = cursor.fetchall()
    cursor.close()
    conn.close()
    
    bookList = []
    for libro in librosRegistrados:
        bookList.append({
            "id": libro[0],
            "titulo": libro[1],
            "autor": libro[2],
            "anio": libro[3],
            "editorial": libro[4],
            "categoria": libro[5],
            "portada": libro[6]
        })
    return json.dumps(bookList, ensure_ascii=False)
