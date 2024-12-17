import mysql.connector
import pandas as pd
import getpass
from dotenv import load_dotenv
import os

load_dotenv()

# datos de acceso
db_config = {
    "host": os.getenv("DB_HOST") or "localhost",
    "user": os.getenv("DB_USER") or  input("Usuario: ") ,
    "password": os.getenv("DB_PASS") or getpass.getpass("Contraseña: "),
    "database": os.getenv("DB_NAME") or input("Base De Datos: ")
}

def get_mysql():
    queries = [
        "SELECT * FROM TotalFacturacionAnual",
        "SELECT * FROM ProveedoresMasSuministros",
        "SELECT * FROM TotalFacturasPorVendedor",
        "SELECT * FROM ClientesFrecuentes",
        "SELECT * FROM ProductosVendidosPorMes WHERE Año = 2024 "
    ]

    # Conexión MySQL
    try:
        connection = mysql.connector.connect(**db_config)
        print("Conexión exitosa.")
    except mysql.connector.Error as e:
        print(f"Error al conectar a MySQL: {e}")
        exit()

    dataframes = []
    for query in queries:
        try:
            df = pd.read_sql(query, connection)
            dataframes.append(df)
        except mysql.connector.Error as e:
            print(f"Error al ejecutar la consulta: {e}")

    connection.close()

    return dataframes


def get_tables():
    print('''
    Ingrese una de las siguientes opciones para iniciar:
    1 - Base de datos MySQL con script YasmedicalDB.sql
    2 - Archivo .CSV adjunto en el repositorio
    ''')
    value = input('Opción: ')

    if value == '1':
        data = get_mysql()
        return "Opción 1", data
    elif value == '2':
        data = get_cvs()
        return "Opción 2", data
    else:
        return "Opción no válida", None



