from .database import getConnection
import json
import random
import string
import re
from pydantic import BaseModel, ValidationError
from typing import Optional
import smtplib
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart
import os
from dotenv import load_dotenv

load_dotenv()

#Agregué este basemodel pq sin él marcaba 501 xd
class SignUpReq(BaseModel):
    nombre: str
    apellidoP: str
    apellidoM: Optional[str] = None
    email: str 
    direccion_email: str
    celular: Optional[str] = None                 
    calle: Optional[str] = None
    num_ext: Optional[str] = None
    colonia: Optional[str] = None
    alcaldia: Optional[str] = None
    cp: Optional[str] = None                      
    sexo: Optional[str] = None 
    
    
def send_email(to_email, password, login_name):
    smtp_server = "smtp.gmail.com"
    smtp_port = 587
    smtp_user = "theblackbookoficial@gmail.com"
    smtp_pass = os.getenv("MAILPASS")

    subject = "Acceso a The Black Book"
    body = f"""
        Hola,

        Tu usuario para ingresar: {login_name}
        Tu contraseña temporal es: {password}

        *Por favor, cambia tu contraseña después del primer inicio de sesión.*
        Deseamos que disfrutes de la mejor biblioteca: The Black Book.
        Saludos,
        Equipo The Black Book
        
        Si tú no realizaste el registro, no te preocupes. Sin esta clave no podrán acceder a ningún sitio.
        
        NO RESPONDAS A ESTE MENSAJE. Si necesitas más información, envía uno nuevo, gracias.
        """

    msg = MIMEMultipart()
    msg["From"] = smtp_user
    msg["To"] = to_email
    msg["Subject"] = subject
    msg.attach(MIMEText(body, "plain"))

    try:
        server = smtplib.SMTP(smtp_server, smtp_port)
        server.starttls()
        server.login(smtp_user, smtp_pass)
        server.send_message(msg)
        server.quit()
        print(f"Correo enviado a {to_email}")
        return True
    except Exception as e:
        print(f"Error enviando correo: {e}")
        return False    


def signup(data):
    try:
        # Esto es pa validar xd
        user_req = SignUpReq(
            nombre=data.get("nombre", ""),
            apellidoP=data.get("apellidoP", ""),
            apellidoM=data.get("apellidoM"),
            email=data.get("correo", ""),
            direccion_email=data.get("direccion_email", ""),
            celular=data.get("celular"),
            calle=data.get("calle"),
            num_ext=data.get("num_ext"),
            colonia=data.get("colonia"),
            alcaldia=data.get("alcaldia"),
            cp=data.get("cp"),
            sexo=data.get("sexo")
        )
    except ValidationError as e:
        return json.dumps({"status": "error", "msg": e.errors()}, ensure_ascii=False)

    conn = getConnection()
    if not conn:
        return json.dumps({"status": "error", "msg": "Sin conexión a la BD"}, ensure_ascii=False)

    cursor = conn.cursor()
    #Pa separar el correo en las dos partes, aunque se me pasó el arroba
    correo = user_req.email
    match_correo = re.match(r"^([A-Za-z0-9._%+-]+)", correo)
    match_dominio = re.search(r"@(.+)$", correo)
    if not match_correo or not match_dominio:
        return json.dumps({"status": "error", "msg": "Correo inválido"}, ensure_ascii=False)
    
    email = match_correo.group(1)
    direccion_email = match_dominio.group(1)
    usuario = (user_req.nombre[:1] + user_req.apellidoP[:2]).upper().ljust(3, "X")
    sql = """
        INSERT INTO Usuario 
        (Nombre, ApellidoP, ApellidoM, Email, Dirección_Email, 
         Celular, Calle, Num_Ext, Colonia, Alcaldia, CP, Sexo)
        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
    """
    cursor.execute(sql, (
        user_req.nombre,
        user_req.apellidoP,
        user_req.apellidoM,
        email,
        direccion_email,
        user_req.celular,
        user_req.calle,
        user_req.num_ext,
        user_req.colonia,
        user_req.alcaldia,
        user_req.cp,
        user_req.sexo
    ))

    chars = string.ascii_letters + string.digits + "!@#$%^&*"
    password = ''.join(random.choice(chars) for _ in range(8))
    login = email.replace(".", "_")

    cursor.execute(f"CREATE LOGIN [{login}] WITH PASSWORD = '{password}';")
    cursor.execute(f"CREATE USER [{login}] FOR LOGIN [{login}];")
    cursor.execute(f"""
        ALTER ROLE db_datareader ADD MEMBER [{login}];
        ALTER ROLE db_datawriter ADD MEMBER [{login}];
    """)

    conn.commit()
    cursor.close()
    conn.close()
    
    email_completo = f"{email}@{direccion_email}"
    correo_ok = send_email(email_completo, password, email_completo)

    return json.dumps({
        "status": "ok",
        "msg": "Usuario registrado",
        "usuario": usuario,
        "login": login,
        "password": password,
        "email": email,
        "direccion_email": direccion_email
    }, ensure_ascii=False)
