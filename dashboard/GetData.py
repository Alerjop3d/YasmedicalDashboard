import mysql.connector
import pandas as pd
from dotenv import load_dotenv
import os

load_dotenv()

# datos de acceso
db_config = {
    "host": os.getenv("DB_HOST"),
    "user": os.getenv("DB_USER"),
    "password": os.getenv("DB_PASS"),
    "database": os.getenv("DB_NAME")
}

def get_query():
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

