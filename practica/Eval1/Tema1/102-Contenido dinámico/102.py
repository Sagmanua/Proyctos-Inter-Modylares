<<<<<<< HEAD
from flask import Flask, render_template_string
import json
=======
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
>>>>>>> 6f1e760680909ef94434750e1fbb10165bc208f0

app = Flask(__name__)

@app.route("/")
def cv():
    with open("curiculum.json",encoding="utf-8") as f:
        data = json.load(f)
    dp = data["datos_personales"]

    with open("index.html",encoding="utf-8") as f:
        html = f.read()
    
    return render_template_string(html,**dp)

if __name__ == "__main__":
<<<<<<< HEAD
    app.run(debug=True)
=======
  aplicacion.run(debug=True)





>>>>>>> 6f1e760680909ef94434750e1fbb10165bc208f0
