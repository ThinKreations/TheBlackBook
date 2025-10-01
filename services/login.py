from .database import getUserConnection
from pydantic import BaseModel, ValidationError
import re
import json

class LoginReq(BaseModel):
    correo: str
    password: str

def login(data):
    try:

        user_req = LoginReq(**data)
    except ValidationError as e:
        return {"status": "error", "msg": e.errors()}

    match_local = re.match(r"^([A-Za-z0-9._%+-]+)", user_req.correo)
    if not match_local:
        return {"status": "error", "msg": "Correo inválido"}
    
    
    
    
    login_name = match_local.group(1).replace(".", "_")
    password = user_req.password

    conn = getUserConnection(login_name, password)
    if not conn:
        return {"status": "error", "msg": "Usuario o contraseña incorrectos"}

    try:
        cursor = conn.cursor()
        cursor.execute("SELECT (Email+'@'+Direccion_Email) FROM Usuario;")
        row = cursor.fetchone()
        correo = row[0] if row else None
    except Exception as e:
        return {"status": "error", "msg": f"Error al usar la conexión: {str(e)}"}
    finally:
        cursor.close()
        conn.close()

    return {
        "status": "ok",
        "msg": f"Usuario {login_name} autenticado correctamente",
        "login": login_name,
        "password": password,
        "correo": correo
    }