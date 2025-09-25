import pyodbc
import os
from dotenv import load_dotenv

load_dotenv()

def getConnection():
    server=os.getenv("SERVER")
    database=os.getenv("NAME")
    driver=os.getenv("DRIVER")
    
    conn_str = f"DRIVER={driver};SERVER={server};DATABASE={database};Trusted_Connection=yes;"
    try:
        conn = pyodbc.connect(conn_str)
        print("Conexión exitosa 10/10 y GOD")
        return conn
    except pyodbc.Error as e:
        print("Error al conectar a la base de datos:\n", e)
        return None