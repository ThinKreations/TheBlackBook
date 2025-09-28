import pyodbc
import os
from dotenv import load_dotenv

load_dotenv()

def getConnection():
    #Conexión para signup o tareas del admin
    server = os.getenv("SERVER")
    database = os.getenv("NAME")
    driver = os.getenv("DRIVER")
    
    conn_str = f"DRIVER={driver};SERVER={server};DATABASE={database};Trusted_Connection=yes;"
    try:
        conn = pyodbc.connect(conn_str)
        print("Conexión exitosa 10/10 y GOD")
        return conn
    except pyodbc.Error as e:
        print("Error al conectar a la base de datos:\n", e)
        return None

def getUserConnection(login: str, password: str):
    #Conexión usando el login y password de un usuario ya registrado
    #Esta se usa después de que el usuario se autentica
    server = os.getenv("SERVER")
    database = os.getenv("NAME")
    driver = os.getenv("DRIVER")

    conn_str = f"DRIVER={driver};SERVER={server};DATABASE={database};UID={login};PWD={password}"
    try:
        conn = pyodbc.connect(conn_str)
        print(f"Conexión exitosa para {login}, salu2.")
        return conn
    except pyodbc.Error as e:
        print(f"Error al conectar a la base de datos con {login}:\n", e)
        return None
