from datetime import date
from services.database import getConnection

VALOR_BASE = 200
INCREMENTO = 200

def calcular_multa(fecha_limite: date, monto_actual: int = VALOR_BASE) -> int:
    
    hoy = date.today()
    dias_retraso = (hoy - fecha_limite).days
    if dias_retraso <= 0:
        return 0
    bloques = (dias_retraso - 1) // 7
    return VALOR_BASE + (bloques * INCREMENTO)
from datetime import date
from services.database import getConnection

VALOR_BASE = 200
INCREMENTO_CADA_7_DIAS = 200

def calcular_multa(fecha_limite: date) -> int:
    """Calcula el monto de la multa según bloques de 7 días de retraso."""
    hoy = date.today()
    dias_retraso = (hoy - fecha_limite).days
    if dias_retraso <= 0:
        return 0
    bloques = (dias_retraso - 1) // 7
    return VALOR_BASE + (bloques * INCREMENTO_CADA_7_DIAS)

def generar_actualizar_multas():
    conn = getConnection()
    if not conn:
        return {"status": "error", "msg": "No se pudo conectar a la BD"}

    try:
        cursor = conn.cursor()

        cursor.execute("""
            SELECT Id_Prestamo, Fecha_Lim_Devolucion, Multa
            FROM Prestamos
            WHERE Fecha_Devolucion IS NULL
        """)
        prestamos = cursor.fetchall()
        
        cursor.execute("""
            SELECT Multa
            FROM Multas
        """)
        multasxd=cursor.fetchall()
        
        for prestamo in prestamos:
            id_prestamo, fecha_lim, multa_id = prestamo
            print(f"[DEBUG] Procesando préstamo {id_prestamo}, multa_id={multa_id}")

            monto = calcular_multa(fecha_lim)
            if monto == 0:
                print(f"[DEBUG] Préstamo {id_prestamo} aún no supera la fecha límite. No se genera multa.")
                continue
            
            if multa_id is not None and multa_id != 0:
                cursor.execute("""
                    SELECT Monto_actual_multa, Estatus
                    FROM Multas
                    WHERE Multa = ?
                """, (multa_id,))
                multa = cursor.fetchone()
                if multa:
                    monto_actual, estatus = multa
                    if estatus == 0 and monto != monto_actual:
                        cursor.execute("""
                            UPDATE Multas
                            SET Monto_actual_multa = ?
                            WHERE Multa = ?
                        """, (monto, multa_id))
                        print(f"[DEBUG] Multa {multa_id} actualizada de {monto_actual} a {monto}. Paga lo antes posible.")
            else:
                cursor.execute("SELECT Multa FROM Prestamos WHERE Id_Prestamo = ? AND Multa IS NOT NULL", (id_prestamo,))
                existente = cursor.fetchone()
                if existente:
                    #print(f"[DEBUG] Préstamo {id_prestamo} ya tiene multa vinculada: {existente[0]}")
                    continue

                cursor.execute("""
                    INSERT INTO Multas (Valor_base_multa, Monto_actual_multa, Fecha_emision_multa, Estatus)
                    VALUES (?, ?, ?, 0)
                """, (VALOR_BASE, monto, date.today()))

                cursor.execute("SELECT MAX(Multa) FROM Multas")
                nueva_multa_id=cursor.fetchone()[0]
                #print(f"Id_multa generada: {nueva_multa_id}")
                #print(f"Para prestamo: {id_prestamo}")

                cursor.execute("""
                    UPDATE Prestamos
                    SET Multa = ?
                    WHERE Id_Prestamo = ?
                """, (nueva_multa_id, id_prestamo))
                print(f"[DEBUG] Préstamo {id_prestamo} vinculado a multa {nueva_multa_id}")

        conn.commit()
        return {"status": "ok", "msg": "Multas generadas o actualizadas correctamente"}
    except Exception as e:
        return {"status": "error", "msg": f"Error al generar/actualizar multas: {str(e)}"}
    finally:
        cursor.close()
        conn.close()

        
def consultar_multas(correo: str):
    conn = getConnection()
    if not conn:
        return {"status": "error", "msg": "No se pudo conectar a la BD", "multas": []}

    try:
        if not correo or "@" not in correo:
            return {"status": "error", "msg": "Correo inválido", "multas": []}
        
        email, direccion_email = correo.split("@", 1)
        cursor = conn.cursor()

        cursor.execute("""
            SELECT Usuario FROM Usuario 
            WHERE Email = ? AND Direccion_Email = ?
        """, (email, direccion_email))
        usuario = cursor.fetchone()
        if not usuario:
            return {"status": "error", "msg": "Usuario no encontrado", "multas": []}
        usuario_id = usuario[0]

        cursor.execute("""
            SELECT m.Multa, m.Valor_base_multa, m.Monto_actual_multa, m.Fecha_emision_multa, m.Estatus
            FROM Multas m
            INNER JOIN Prestamos p ON m.Multa = p.Multa
            WHERE p.Usuario = ?
        """, (usuario_id,))

        multas = cursor.fetchall()
        multas_list = [
            dict(zip([column[0] for column in cursor.description], row))
            for row in multas
        ]
        return {"status": "ok", "multas": multas_list}

    except Exception as e:
        return {"status": "error", "msg": f"Error al consultar multas: {str(e)}", "multas": []}
    finally:
        if cursor:
            cursor.close()
        if conn:
            conn.close()