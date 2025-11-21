from flask import Flask, render_template
import mysql.connector


####################### Mysql #############################
conexion = mysql.connector.connect(
    host="localhost",
    user="appuser",
    password="m1ClaveSegura!",
    database="portafolioexamen"
)
cursor = conexion.cursor()
#---------------------ESto envia las tablas
cursor.execute("SHOW TABLES;")
tablas= []
fillas = cursor.fetchall()
for filla in fillas:
    tablas.append(filla[0])
# ---------------- Esto envia las cabeceras de las tanlas 
cursor.execute("SHOW COLUMNS in piezasportafolio")
columnas = []
fillas = cursor.fetchall()
for filla in fillas:
    columnas.append(filla[0])

####################### Mysql #############################

app = Flask(__name__)
@app.route("/")
def inicio():
    return render_template("backofice007.html",mis_tablas = tablas,mis_columnas=columnas)

if __name__ == "__main__":
    app.run(debug=True)
