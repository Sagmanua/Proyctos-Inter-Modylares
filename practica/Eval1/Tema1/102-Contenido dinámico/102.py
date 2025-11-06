from flask import Flask
import mysql.connector

try:
    conexion=mysql.connector.connect(
        host="localhost",
        user="appuser",
        password="m1ClaveSegura!",
        database="portafolio"
    )
    cursor = conexion.cursor()
    print("✅ Conexión exitosa!")
    print("Hola tu redacta database portafolio")
except Exception as e:
    print("❌ Error:", e)

aplicacion = Flask(__name__)

@aplicacion.route("/")
def raiz():
  cadena = '''
    <!doctype html>
    <html>
      <head>
        <title>HTML Dinámico</title>
        <style>
          h1{color:red;}
        </style>
      </head>
      <body>
        <h1>Bienvenido a mi sitio web con Flask</h1>
  '''
          
  for dia in range(1,31):
    cadena += '<div>'+str(dia)+'</div>' 
          
  cadena += '''
      </body>
    </html>
  '''
  return cadena
  
if __name__ == "__main__":
  aplicacion.run(debug=True)





