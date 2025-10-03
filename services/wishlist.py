from datetime import date
from services.database import getConnection
import json
from pydantic import BaseModel
from typing import List, Optional


class PostWishlistInput(BaseModel):
    correo: str
    id_libro: str

def toggle_wishlist(input_data: PostWishlistInput):
    conn = getConnection()
    if not conn:
        return {"status": "error", "msg": "No se pudo conectar a la BD"}

    try:
        email, direccion_email = input_data.correo.split("@", 1)
        cursor = conn.cursor()
        cursor.execute("""
            SELECT Usuario FROM Usuario 
            WHERE Email = ? AND Direccion_Email = ?
        """, (email, direccion_email))
        usuario = cursor.fetchone()

        if not usuario:
            cursor.close()
            conn.close()
            return {"status": "error", "msg": "Usuario no encontrado"}

        usuario_id = usuario[0]

        cursor.execute("""
            SELECT 1 FROM Wishlist 
            WHERE usuario = ? AND id_libro = ?
        """, (usuario_id, input_data.id_libro))
        exists = cursor.fetchone()

        if exists:
            cursor.execute("""
                DELETE FROM Wishlist 
                WHERE usuario = ? AND id_libro = ?
            """, (usuario_id, input_data.id_libro))
            conn.commit()
            msg = "Libro eliminado de wishlist"
        else:
            fecha_hoy = date.today().isoformat()
            cursor.execute("""
                INSERT INTO Wishlist (usuario, id_libro, fecha_guardado)
                VALUES (?, ?, ?)
            """, (usuario_id, input_data.id_libro, fecha_hoy))
            conn.commit()
            msg = "Libro agregado a wishlist"

        cursor.close()
        conn.close()
        return {"status": "success", "msg": msg}

    except Exception as e:
        if conn:
            conn.close()
        return {"status": "error", "msg": str(e)}

def get_wishlist(correo: str):
    conn = getConnection()
    if not conn:
        return {"status": "error", "msg": "No se pudo conectar a la BD", "wishlist": []}

    try:
        email, direccion_email = correo.split("@", 1)
        cursor = conn.cursor()
        cursor.execute("""
            SELECT Usuario 
            FROM Usuario 
            WHERE Email = ? AND Direccion_Email = ?
        """, (email, direccion_email))
        usuario = cursor.fetchone()

        if not usuario:
            cursor.close()
            conn.close()
            return {"status": "error", "msg": "Usuario no encontrado", "wishlist": []}

        usuario_id = usuario[0]

        cursor.execute("""
            SELECT 
                w.usuario,
                w.fecha_guardado,
                l.id_libro,
                l.titulo,
                ISNULL(a.Nombre_autor, '') + ' ' + ISNULL(a.Apellido_autor, '') AS autor,
                l.numero_editorial,
                l.nom_categoria,
                l.anio_publicacion,
                l.numero_ejemplares,
                l.portada,
                e.nombre_editorial
            FROM Wishlist w
            INNER JOIN Libros l ON w.id_libro = l.id_libro
            INNER JOIN Editoriales e ON l.numero_editorial = e.numero_editorial
            LEFT JOIN LibrosVSAutores lv ON l.id_libro = lv.id_libro
            LEFT JOIN Autores a ON lv.autor = a.autor
            WHERE w.usuario = ?
            ORDER BY w.fecha_guardado DESC
        """, (usuario_id,))
        rows = cursor.fetchall()
        cursor.close()
        conn.close()

        wishlist = [
            {
                "usuario": row[0],
                "fecha_guardado": row[1].isoformat() if hasattr(row[1], "isoformat") else str(row[1]),
                "id_libro": row[2],
                "titulo": row[3],
                "autor": row[4] or "Autor desconocido",
                "numero_editorial": row[5],
                "nom_categoria": row[6],
                "anio_publicacion": row[7],
                "numero_ejemplares": row[8],
                "portada": row[9],
                "nombre_editorial": row[10]
            }
            for row in rows
        ]

        return {"status": "success", "wishlist": wishlist}

    except Exception as e:
        if conn:
            conn.close()
        return {"status": "error", "msg": str(e), "wishlist": []}

def delete_wishlist(correo: str, id_libro: str):
    conn = getConnection()
    if not conn:
        return {"status": "error", "msg": "No se pudo conectar a la BD"}

    try:
        email, direccion_email = correo.split("@", 1)
        cursor = conn.cursor()

        cursor.execute("""
            SELECT Usuario FROM Usuario 
            WHERE Email = ? AND Direccion_Email = ?
        """, (email, direccion_email))
        usuario = cursor.fetchone()

        if not usuario:
            cursor.close()
            conn.close()
            return {"status": "error", "msg": "Usuario no encontrado"}

        usuario_id = usuario[0]

        cursor.execute("""
            DELETE FROM Wishlist 
            WHERE usuario = ? AND id_libro = ?
        """, (usuario_id, id_libro))

        conn.commit()
        cursor.close()
        conn.close()
        return {"status": "success", "msg": "Libro eliminado de wishlist"}

    except Exception as e:
        if conn:
            conn.close()
        return {"status": "error", "msg": str(e)}