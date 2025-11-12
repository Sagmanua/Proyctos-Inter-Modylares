# Indroduccion brece y contexalizacion
Este proyecto tiene como objetivo integrar los conocimientos de tres asignaturas del ciclo formativo: Bases de Datos, Programación y Lenguajes de Marcas. A partir de los ejercicios realizados en los exámenes de cada módulo, se construye una aplicación web funcional utilizando Python y el framework Flask, conectada a una base de datos MySQL y con una interfaz estructurada en HTML y CSS.

El propósito principal es demostrar la capacidad de combinar diferentes competencias técnicas en un único proyecto coherente, aplicando buenas prácticas de desarrollo web y reutilizando código de ejercicios anteriores



# Desarrollo técnico correcto y preciso

# Codigo completa
```
import mysql.connector
from flask import Flask

# Conexión a la base de datos
conexion = mysql.connector.connect(
    host="localhost",
    user="appuser",
    password="m1ClaveSegura!",
    database="portafolioexamen"
)
cursor = conexion.cursor()

app = Flask(__name__)

@app.route("/")
def holamundo():
    # Ejecutar consulta
    cursor.execute("SELECT * FROM CatPIEz ;")  # Cambia 'tu_tabla' por tu tabla real
    filas = cursor.fetchall()

    # Generar HTML
    cadena = ''' 
<!doctype html>
<html lang="es">
<head>
    <title>Mi primer sitio web</title>
    <style>
        html { background-color: blanchedalmond; }
        body { width: 600px; background: white; margin: auto; display: flex; flex-direction: column; }
        main { background-color: cornsilk; }
        footer { background-color: aquamarine; padding: 20px 0; text-align: center; }
        footer a { color: white; margin: 0 10px; }
        #container { display: flex; flex-wrap: wrap; justify-content: space-between; }
        .item { flex: 0 1 45%; margin: 10px; background: wheat; padding: 10px; }
    </style>
</head>
<body>
<main>
    <div id="sobremi">
        <h1>Bohdan SYdorenko</h1>
        <h2>Full stack developer</h2>
        <h5>SOBRE MÍ: Estudiante de desarrollo de aplicaciones multiplataforma. Responsable y ordenado. Buscando mi primera experiencia laboral.</h5>
        <hr style="border: 2px solid black;">
    </div>
    <section id="portfolio">
        <div id="container">
'''

    # Agregar filas dinámicamente
    for fila in filas:
        cadena += f'''
        <div class="item">
            <h2>{fila[1]}</h2>
            <p>{fila[2]}</p>
            <p>Fecha: {fila[3]}</p>
            <p>Categoría: {fila[5]}</p>
        </div>
        '''

    # Footer
    cadena += '''
        </div>
    </section>
</main>
<footer>
    <a href="https://github.com/Sagmanua">GitHub</a>
    <a href="https://t.me/Sagmanua">Telegram</a>
    <a href="https://www.linkedin.com/in/bohdan-sydorenko-6993b1397">LinkedIn</a>
</footer>
</body>
</html>
'''
    return cadena

if __name__ == "__main__":
    app.run(debug=True)

```

# 4.-Cierre/Conclusión enlazando con la unidad

