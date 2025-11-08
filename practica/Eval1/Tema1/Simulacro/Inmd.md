# Indroduccion brece y contexalizacion
Este proyecto tiene como objetivo integrar los conocimientos de tres asignaturas del ciclo formativo: Bases de Datos, Programación y Lenguajes de Marcas. A partir de los ejercicios realizados en los exámenes de cada módulo, se construye una aplicación web funcional utilizando Python y el framework Flask, conectada a una base de datos MySQL y con una interfaz estructurada en HTML y CSS.

El propósito principal es demostrar la capacidad de combinar diferentes competencias técnicas en un único proyecto coherente, aplicando buenas prácticas de desarrollo web y reutilizando código de ejercicios anteriores



# Desarrollo técnico correcto y preciso
## Python
### Imports
```
import mysql.connector                    
from flask import Flask     
```
### Conecto a Mysql bases de datos
```
conexion = mysql.connector.connect(
  host="localhost",
  user="portafolioceac",
  password="portafolioceac",
  database="portafolioceac"
  )                                 datos
cursor = conexion.cursor()               
```
### crear server
```
app = Flask(__name__)

@app.route("/")
def cv():
    return render_template_string(html,**dp)

if __name__ == "__main__":
    app.run(debug=True)
```
###  Setect todo de vista de piezas_y_categorias de un base de datos 
```
cursor.execute("SELECT * FROM piezas_y_categorias;")  
filas = cursor.fetchall()
```
### Ahora en cada cadena escribe html
```
cadena = ''' 
    <!doctype html>
<html lang="es">
  <head>
    <title>Examen</title>
    <meta charset="utf-8">
    <style>
      html,body{background:grey;font-family:sans-serif;}
      header,main,footer{
        background:white;
        padding:20px;
        width:800px;
        margin:auto;
        text-align:center;
      }
      main{
        display:grid;
        grid-template-columns:auto auto auto;
        gap:20px;
      }
    </style>
  </head>
  <body>
    <header>
      <h1>Jose Vicente Carratala</h1>
      <h2>info@jocarsa.com</h2>
    </header>
    <main>
  '''                              
  for fila in filas:                    
    cadena += '''
      <article>
        <p>'''+fila[0]+'''</p>
        <h3>'''+fila[2]+'''</h3>
        <p>'''+fila[3]+'''</p>
        <img src="'''+fila[4]+'''">
      </article>
    '''
  cadena += ''' 
    </main>
    <footer>
      (c) 2025 Jose Vicente Carratala
    </footer>
  </body>
</html>
  '''
```
# Codigo completa
```
import mysql.connector                    
from flask import Flask                  

conexion = mysql.connector.connect(
  host="localhost",
  user="portafolioceac",
  password="portafolioceac",
  database="portafolioceac"
  )                                 datos
cursor = conexion.cursor()              
app = Flask(__name__)                  

@app.route("/")                          
def holamundo():                         
  cursor.execute("SELECT * FROM piezas_y_categorias;")  

  filas = cursor.fetchall()                 
  cadena = ''' 
    <!doctype html>
<html lang="es">
  <head>
    <title>Examen</title>
    <meta charset="utf-8">
    <style>
      html,body{background:grey;font-family:sans-serif;}
      header,main,footer{
        background:white;
        padding:20px;
        width:800px;
        margin:auto;
        text-align:center;
      }
      main{
        display:grid;
        grid-template-columns:auto auto auto;
        gap:20px;
      }
    </style>
  </head>
  <body>
    <header>
      <h1>Jose Vicente Carratala</h1>
      <h2>info@jocarsa.com</h2>
    </header>
    <main>
  '''                              
  for fila in filas:                    
    cadena += '''
      <article>
        <p>'''+fila[0]+'''</p>
        <h3>'''+fila[2]+'''</h3>
        <p>'''+fila[3]+'''</p>
        <img src="'''+fila[4]+'''">
      </article>
    '''
  cadena += ''' 
    </main>
    <footer>
      (c) 2025 Jose Vicente Carratala
    </footer>
  </body>
</html>
  '''
  return cadena                            
if __name__ == "__main__":               
    app.run(debug=True)                 

```

# 4.-Cierre/Conclusión enlazando con la unidad
Este proyecto integrado permite consolidar de forma práctica los contenidos trabajados en la unidad, al aplicar los conocimientos de bases de datos, programación y lenguajes de marcas en un entorno real de desarrollo web. A través de la creación de una aplicación Flask conectada a MySQL, se evidencia la importancia de la interconexión entre los diferentes módulos y cómo cada uno aporta un componente esencial al producto final.
