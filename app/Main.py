import dash
import webbrowser
from dash import dcc, html
import plotly.express as px

print('''
Ingrese una de las siguientes opciones para iniciar:
1 - Base de datos MySQL con script YasmedicalDB.sql
2 - Carpeta CSV alternativa
''')
value = input('Opción: ')

if value == '1':
    from GetSQL import get_mysql
    df = get_mysql()
elif value == '2':
    from GetCSV import get_csv
    df = get_csv()
else:
    print("Opción no válida")


facturacion_anual = df[0]
top_suministros = df[1]
top_vendedores = df[2]
top_clientes = df[3]
total_ventas = df[4].groupby(['Mes', 'Descripcion'], as_index=False).sum()

# gráficos
fig1 = px.bar(facturacion_anual, x="Año", y="Total", title="Facturación Anual",
              color_discrete_sequence=['green'])

fig2 = px.bar(top_suministros, x="RazonSocial", y="Total",
              title="Proveedores con Mas Suministros")

fig3 = px.pie(top_vendedores, names="Vendedor", values="Total", title="Vendedores con Mas Facturas")

fig4 = px.bar(top_clientes, x="Cliente", y="Compras", title="Clientes Frecuentes")

fig5 = px.histogram(total_ventas, x='Mes', y='TotalUnidadesVendidas', color='Descripcion',
                    barmode='group', title='Productos Mas Vendidos 2024')


# Estructura HTML
app = dash.Dash(__name__)
app.layout = html.Div([
    html.H1("Dashboard Yasmedical"),
    html.Div([
        html.Div([dcc.Graph(figure=fig1)], className="grid-item"),
        html.Div([dcc.Graph(figure=fig2)], className="grid-item"),
        html.Div([dcc.Graph(figure=fig3)], className="grid-item"),
        html.Div([dcc.Graph(figure=fig4)], className="grid-item"),
        html.Div([dcc.Graph(figure=fig5)], className="grid-item")
    ], className="grid-container")
])


# Lanzador
if __name__ == "__main__":
    webbrowser.open("http://127.0.0.1:8050")
    app.run_server()
    
    

