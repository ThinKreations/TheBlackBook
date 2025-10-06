import random
import string
import smtplib
import os
import re
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart
from services.database import getConnection
from pydantic import BaseModel, EmailStr

class ChangePassInput(BaseModel):
    correo: str
    pass_actual: str
    pass_nueva: str


class ForgotPassInput(BaseModel):
    correo: str

def send_email(to_email, password, login_name):
    smtp_server = "smtp.gmail.com"
    smtp_port = 587
    smtp_user = "theblackbookoficial@gmail.com"
    smtp_pass = os.getenv("MAILPASS")

    subject = "Acceso a The Black Book"
    body = f"""
    Hola,
    Recibimos una solicitud de cambio de contraseña por olvido.
    Te asignamos una contraseña temporal: <b>{password}</b>, y se recomienda que cambies tu contraseña después de acceder.


    Saludos,
    Equipo The Black Book
    
    Si tú no realizaste la solicitud, no te preocupes. Sin esta clave no podrán acceder a ningún sitio, aunque ahora esta es tu contraseña temporal.
    
    NO RESPONDAS A ESTE MENSAJE. Si necesitas más información, envía uno nuevo, gracias.
    """

    msg = MIMEMultipart()
    msg["From"] = smtp_user
    msg["To"] = to_email
    msg["Subject"] = subject
    msg.attach(MIMEText(body, "plain"))

    try:
        with smtplib.SMTP(smtp_server, smtp_port) as server:
            server.starttls()
            server.login(smtp_user, smtp_pass)
            server.send_message(msg)
        print(f"Correo enviado a {to_email}")
        return True
    except Exception as e:
        print(f"Error enviando correo: {e}")
        return False
    
    
def forgotPass(data: ForgotPassInput):
    conn = getConnection()
    if not conn:
        return {"status": "error", "msg": "No se pudo conectar a la BD"}

    correo = data.get("correo")
    if not correo or "@" not in correo:
        return {"status": "error", "msg": "Correo inválido"}

    try:
        email, direccion_email = correo.split("@", 1)
        cursor = conn.cursor()

        cursor.execute("""
            SELECT Usuario FROM Usuario 
            WHERE Email = ? AND Direccion_Email = ?
        """, (email, direccion_email))
        usuario = cursor.fetchone()

        if not usuario:
            return {"status": "error", "msg": "Usuario no encontrado"}

        nueva_contra = ''.join(random.choices(string.ascii_letters + string.digits, k=8))

        match_local = re.match(r"^([^@]+)@", correo)
        login_name = match_local.group(1).replace(".", "_") if match_local else correo

        cursor.execute(f"ALTER LOGIN {login_name} WITH PASSWORD = '{nueva_contra}'")
        conn.commit()
        
        enviado = send_email(correo, nueva_contra, login_name)
        if not enviado:
            return {"status": "error", "msg": "No se pudo enviar el correo"}

        return {"status": "ok", "msg": "Contraseña temporal enviada al correo"}

    except Exception as e:
        return {"status": "error", "msg": str(e)}
    finally:
        conn.close()
        
def changePass(data):
    conn = getConnection()
    if not conn:
        return {"status": "error", "msg": "No se pudo conectar a la BD"}

    # Usar dict directamente
    correo = data.get("correo")
    pass_actual = data.get("pass_actual")
    pass_nueva = data.get("pass_nueva")

    if not correo or "@" not in correo:
        return {"status": "error", "msg": "Correo inválido"}

    if not pass_actual or not pass_nueva:
        return {"status": "error", "msg": "Campos incompletos"}

    if len(pass_nueva) < 8:
        return {"status": "error", "msg": "La nueva contraseña debe tener al menos 8 caracteres"}

    try:
        email, direccion_email = correo.split("@", 1)
        cursor = conn.cursor()

        # Obtener el login asociado
        cursor.execute("""
            SELECT Usuario FROM Usuario 
            WHERE Email = ? AND Direccion_Email = ?
        """, (email, direccion_email))
        usuario = cursor.fetchone()

        if not usuario:
            return {"status": "error", "msg": "Usuario no encontrado"}

        match_local = re.match(r"^([^@]+)@", correo)
        login_name = match_local.group(1).replace(".", "_") if match_local else correo

        # ALTER LOGIN con contraseña nueva
        cursor.execute(f"""
            ALTER LOGIN {login_name} 
            WITH PASSWORD = '{pass_nueva}' OLD_PASSWORD = '{pass_actual}'
        """)
        conn.commit()

        return {"status": "ok", "msg": "Contraseña actualizada correctamente"}

    except Exception as e:
        msg = str(e)
        if "OLD_PASSWORD" in msg or "18456" in msg:
            return {"status": "error", "msg": "La contraseña actual es incorrecta"}
        return {"status": "error", "msg": msg}

    finally:
        conn.close()