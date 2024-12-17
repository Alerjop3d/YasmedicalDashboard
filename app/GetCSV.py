import pandas as pd
import os

def get_csv():
    queries = [
        "TotalFacturacionAnual.csv",
        "ProveedoresMasSuministros.csv",
        "TotalFacturasPorVendedor.csv",
        "ClientesFrecuentes.csv",
        "ProductosVendidosPorMes.csv"
    ]

    dataframes = []
    
    for query in queries:
        file_path = os.path.join('csv', query)  
        if os.path.exists(file_path):
            try:
                df = pd.read_csv(file_path)
                if query == "ProductosVendidosPorMes.csv":
                    df = df[df['Año'] == 2024] 
                dataframes.append(df)
                print(f"Lectura de datos exitosa para {query}")
            except Exception as e:
                print(f"Error al leer el archivo {query}: {e}")
        else:
            print(f"El archivo {query} no existe en el directorio especificado.")

    return dataframes