from .database import getConnection
from datetime import date, timedelta

def get_prestamos_usuario(correo: str):
    conn = getConnection()
    if not conn:
        return {"status": "error", "msg": "No se pudo conectar a la BD", "prestamos": []}
    try:
        if not correo or "@" not in correo:
            return {"status": "error", "msg": "Correo inválido", "prestamos": []}
        email, direccion_email = correo.split("@", 1)
        cursor = conn.cursor()
        cursor.execute("""
            SELECT Usuario FROM Usuario 
            WHERE Email = ? AND Direccion_Email = ?
        """, (email, direccion_email))
        usuario = cursor.fetchone()
        if not usuario:
            return {"status": "error", "msg": "Usuario no encontrado", "prestamos": []}
        usuario_id = usuario[0]

        cursor.execute("""
            SELECT 
                P.Id_Prestamo,
                P.Id_Libro,
                L.Titulo,
                P.Fecha_Prestamo,
                P.Fecha_Lim_Devolucion,
                P.Fecha_Devolucion,
                P.Multa
            FROM Prestamos P
            INNER JOIN Libros L ON P.Id_Libro = L.Id_Libro
            WHERE P.Usuario = ?
        """, (usuario_id,))

        prestamos = cursor.fetchall()
        prestamosList = [
            {
                "id_prestamo": p[0],
                "usuario": usuario_id,
                "id_libro": p[1],
                "titulo": p[2],
                "fecha_prestamo": str(p[3]),
                "fecha_lim_dev": str(p[4]),
                "fecha_devolucion": str(p[5]) if p[5] else None,
                "multa": p[6],
            }
            for p in prestamos
        ]
        return {"status": "ok", "prestamos": prestamosList}
    except Exception as e:
        return {"status": "error", "msg": f"Error al obtener préstamos: {str(e)}", "prestamos": []}
    finally:
        cursor.close()
        conn.close()

        
def post_prestamo(correo: str, id_libro: str):
    conn = getConnection()
    if not conn:
        return {"status": "error", "msg": "No se pudo conectar a la BD"}

    try:
        cursor = conn.cursor()

        if "@" not in correo:
            return {"status": "error", "msg": "Correo inválido"}
        
        email, direccion_email = correo.split("@", 1)
        #Esto es para obtener la ID del usuario "Usuario"
        cursor.execute("""
            SELECT Usuario FROM Usuario
            WHERE Email = ? AND Direccion_Email = ?
        """, (email, direccion_email))
        usuario = cursor.fetchone()
        if not usuario:
            return {"status": "error", "msg": "Usuario no encontrado"}
        usuario_id = usuario[0]
        #Pa buscar el libro en la bd
        cursor.execute("SELECT Id_Libro FROM Libros WHERE Id_Libro = ?", (id_libro,))
        libro = cursor.fetchone()
        if not libro:
            return {"status": "error", "msg": "Libro no encontrado"}

        #Esto es pa validar si ya hay un prestamo sin entregar del libro y usuario
        cursor.execute("""
            SELECT * FROM Prestamos
            WHERE Id_Libro = ? AND Usuario = ? AND Fecha_Devolucion IS NULL
        """, (id_libro, usuario_id))
        prestamo_existente = cursor.fetchone()
        if prestamo_existente:
            return {"status": "error", "msg": "Ya existe un préstamo activo para este libro y usuario"}

        hoy = date.today()
        limite = hoy + timedelta(days=7)
        
        cursor.execute("""
            INSERT INTO Prestamos (Id_Libro, Usuario, Fecha_Prestamo, Fecha_Lim_Devolucion)
            VALUES (?, ?, ?, ?)
        """, (id_libro, usuario_id, hoy, limite))
        conn.commit()

        return {"status": "ok", "msg": f"Préstamo registrado para usuario ID {usuario_id}"}

    except Exception as e:
        return {"status": "error", "msg": f"Error al registrar préstamo: {str(e)}"}
    finally:
        cursor.close()
        conn.close()