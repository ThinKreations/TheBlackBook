from database import getConnection
import json

def get_all_books():
    conn = getConnection()
    if not conn:
        return json.dumps([])
    
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM Libros")
    librosRegistrados = cursor.fetchall()
    cursor.close()
    conn.close()
    
    bookList = []
    for libro in librosRegistrados:
        bookList.append({
            "id": libro[0],
            "titulo": libro[1],
            "editorial": libro[2],
            "categoria": libro[3],
            "anio": libro[4],
            "noEjemplares": libro[5],
            "portada": libro[6]
        })
    return json.dumps(bookList, ensure_ascii=False)
    
    
    