# Indroduccion brece y contexalizacion
El objetivo de este ejercicio es aprender a leer un archivo JSON utilizando la API fetch en JavaScript y luego mostrar los datos en una página web usando Flask como microservidor.



# Desarrollo técnico correcto y preciso
## curriculum.json
### creo una json dile con una informacion
```
{
  "datos_personales":{
    "nombre":"Jose Vicente",
    "apellidos":"Carratalá Sanchis",
    "correo":"info@jocarsa.com",
    "telefonos":["653563","5432234"]
  },
  "experiencias_laborales":[
    {
      "titulo":"Profesor",
      "empresa":"CEAC",
      "timespan":"2025-presente",
      "descripcion":"Profesor en ciclos formativos de formación profesional"
    },
    {
      "titulo":"Profesor",
      "empresa":"CEAC",
      "timespan":"2025-presente",
      "descripcion":"Profesor en ciclos formativos de formación profesional"
    }
  ]
  
}
```
## 001-leer json.html
### creo una structura de HTML
```
<!doctype html>
<html lang="es">
  <head>
    <title>Plantilla fetch</title>
    <meta charset="utf-8">
  </head>
  <body>
  </body>
</html>
```
### creo una `sript` 
#### usa `fetch` para coge HTTP request
```
fetch("curriculum.json")
```
#### La info viene en json
```
.then(function(respuesta){
          return respuesta.json();  
        }
```
####  Vamos a vomitar en consola
```
      .then(function(datos){
        console.log(datos);       
      })
```

## 002-plantilla fetch.html
### creo una structura de HTML
```
<!doctype html>
<html lang="es">
  <head>
    <title>Plantilla fetch</title>
    <meta charset="utf-8">
  </head>
  <body>
  </body>
</html>
```
### creo una `sript` 
#### usa `fetch` para coge HTTP request
```
fetch("curriculum.json")
```
#### La info viene en json
```
.then(function(respuesta){
          return respuesta.json();  
        }
```
####  Vamos a vomitar en consola
```
      .then(function(datos){
        console.log(datos);       
      })
```
## curriculum.json 
### creo json file con informcaion
```
{
  "datos_personales":{
    "nombre":"Jose Vicente",
    "apellidos":"Carratalá Sanchis",
    "correo":"info@jocarsa.com"
  }
}
```
## index.html
### creo una structura de HTML
```
<!doctype html>
<html lang="es">
  <head>
    <title>Plantilla fetch</title>
    <meta charset="utf-8">
  </head>
  <body>
  </body>
</html>
```
### creo coge informcaion de la JSON que procesa con PY
```
    <h1>{{ datos_personales.nombre }}</h1>
    <h2>{{ datos_personales.apellidos }}</h2>
    <h3>{{ datos_personales.correo }}</h3>
```
## 003-microservidor.py 
### Importo librería flask para crear webs
```
from flask import Flask, render_template 
```
### Creo una nueva aplicación
```
app = Flask(__name__)
```
### Escucho en la ruta raiz
```
@app.route("/")
def inicio():
  return render_template("index.html")
```
### Si este archivo no es una libreria y es el archivo principal
```
if __name__ == "__main__":
  app.run(debug=True)
```

# Codigo completa
Project/
├─ explicacion.md  
├─ 004-modelo mas complejo  
|    ├─ static  
|    |    └─ curriculum.json  
|    ├─ templates  
|    |    └─ index.html  
|    └─ 003-microservidor.py       
├─ 001-leer json.html
├─ curriculum.json
└─ 002-plantilla fetch.html  
## 001-leer json.html
```
<!doctype html>
<html lang="es">
  <head>
    <title>Plantilla fetch</title>
    <meta charset="utf-8">
  </head>
  <body>
    <script>
      fetch("curriculum.json")
      .then(function(respuesta){
          return respuesta.json();  
        }
      )
      .then(function(datos){
        console.log(datos);       
      })
    </script>
  </body>
</html>
```
## 002-plantilla fetch.html
```
<!doctype html>
<html lang="es">
  <head>
    <title>Plantilla fetch</title>
    <meta charset="utf-8">
  </head>
  <body>
    <script>
      fetch("curriculum.json")
      .then(function(respuesta){
          return respuesta.json(); // La info viene en json
        }
      )
      .then(function(datos){
        console.log(datos);       // Vamos a vomitar en consola
      })
    </script>
  </body>
</html>
```
## curriculum.json 
```
{
  "datos_personales":{
    "nombre":"Jose Vicente",
    "apellidos":"Carratalá Sanchis",
    "correo":"info@jocarsa.com"
  }
}
```
## index.html
```
<!doctype html>
<html lang="es">
  <head>
    <title>Plantilla fetch</title>
    <meta charset="utf-8">
  </head>
  <body>
    <h1>{{ datos_personales.nombre }}</h1>
    <h2>{{ datos_personales.apellidos }}</h2>
    <h3>{{ datos_personales.correo }}</h3>
```
## 003-microservidor.py 
```
from flask import Flask, render_template 

app = Flask(__name__)

@app.route("/")
def inicio():
  # Y renderizo una plantilla llamada index.html
  return render_template("index.html")


if __name__ == "__main__":
  app.run(debug=True)

```

# Cierre/Conclusión enlazando con la unidad

Este ejercicio te permite practicar la lectura de archivos JSON usando JavaScript con la API fetch, así como el uso de Flask para crear un microservidor que despliega estos datos en una página web. Aprenderás cómo manejar datos JSON y cómo combinar tecnologías front-end y back-end para crear aplicaciones web completas.