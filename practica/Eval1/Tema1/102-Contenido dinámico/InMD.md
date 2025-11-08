# Indroduccion brece y contexalizacion
En esta práctica se trabajó con un servidor web desarrollado en Flask, un microframework de Python que permite crear aplicaciones web de forma sencilla y rápida. El objetivo fue comprender cómo se puede generar una página dinámica —en este caso, un blog— a partir de datos almacenados en un archivo JSON, y cómo el servidor procesa esa información para mostrarla en el navegador.

A través de esta experiencia, se exploró la relación entre el backend (servidor Flask y archivo JSON) y el frontend (HTML y CSS), aprendiendo cómo pequeños cambios en el código o en los datos se reflejan directamente en la página web generada.



# Desarrollo técnico correcto y preciso
## Python
### import flask para hacer la servidor en Python y import json para hacer data bases en json para guarder informacion
```
from flask import Flask
import json
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

### Dentro de server flask conecta Json o Html
#### Conectar json file con Python
```
with open("curiculum.json",encoding="utf-8") as f:
        data = json.load(f)
    dp = data["datos_personales"]
```
#### Conectar Html file con Python
```
with open("index.html",encoding="utf-8") as f:
        html = f.read()
```
## Json
### Crear una datos de una usario
```
{
  "datos_personales": {
    "nombre": "Bohdan",
    "apellidos": "Sydorenko",
    "email": "info@gmail.com",
    "telefono":"90545234",
    "direccion":"la calle no se",
    "codigopostal":"46000"
  },
  "experiencia": "",
  "formacion": ""
}
```
## Html
### Crear un corte curiculumn
## HTML
### Despues de crear una gile `index.html` voy a hacer una pagina
### Código básico para una estructura de do
```
<!doctype html>
<html lang="es">
  <head>
    <!-- Añade tu contenido aquí -->
  </head>
  <body>
    <!-- Añade tu contenido aquí -->
  </body>
</html>
```
### Esribo `head` en que guardo configuraciones y enlaces necesarios para que la página funcione y se vea bien, pero no muestra contenido en la pantalla.
```
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mi Portafolio</title>
    <link rel="stylesheet" href="styles.css">
</head>
```
### Esribo `<body>` que es contiene todo lo que se muestra en la pantalla: encabezado, menú, contenido principal y pie de página
```
<body>
    <header>Encabezado</header>
    <nav>Menú Navegación</nav>
    <main>
        <section class="item">Sección 1</section>
        <section class="item">Sección 2</section>
        <section class="item">Sección 3</section>
    </main>
    <footer>Pie de página</footer>
</body>
```
## Css
### Crear una css detro de una file html
```
<style>
            html{background: gray;font-family: sans-serif;}
            body{background: wheat;margin: auto; min-height: 200px;display: flex;width: 600px;}
            #isqurda{flex:1;background: darkblue;padding: 20px;}
            #derecha{flex:4;background:white ;padding: 20px;}
</style>
```
### Html
#### `background-color` para cambiar color del fondo
#### `font-family`sirve para elegir la fuente (tipo de letra) que se usará en un texto.
```
html{background: gray;font-family: sans-serif;}
```
### Body
#### `background-color` para cambiar color del fondo
#### `margin`  sin márgenes en el body.
#### `display` Define cómo se comporta un elemento en la página, es decir, cómo se muestra y cómo afecta al resto de elementos.
```
body{background: wheat;margin: auto; min-height: 200px;display: flex;width: 600px;}
```
### isqurda , derecha
#### `flex` un modo de diseño que facilita alinear y distribuir elementos.
#### `background-color` para cambiar color del fondo 
#### `flex` un modo de diseño que facilita alinear y distribuir elementos.

```
#isqurda{flex:1;background: darkblue;padding: 20px;}
#derecha{flex:4;background:white ;padding: 20px;}
```

# Codigo completa
## Python
```
from flask import Flask, render_template_string
import json

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
    app.run(debug=True)
```
## JSON
```
{
  "datos_personales": {
    "nombre": "Bohdan",
    "apellidos": "Sydorenko",
    "email": "info@gmail.com",
    "telefono":"90545234",
    "direccion":"la calle no se",
    "codigopostal":"46000"
  },
  "experiencia": "",
  "formacion": ""
}
```
## HTML
```
<!DOCTYPE html>
<html lang="es">
    <head>
        <title> CURICULUM</title>
        <meta charset="utf-8">
        <style>
            html{background: gray;font-family: sans-serif;}
            body{background: wheat;margin: auto; min-height: 200px;display: flex;width: 600px;}
            #isqurda{flex:1;background: darkblue;padding: 20px;}
            #derecha{flex:4;background:white ;padding: 20px;}
        </style>
    </head>
    <body>
        <div id="derecha"></div>
            <h1>{{nombre}}{{apellidos}}</h1>
            <p>{{email}}</p>
            <ul>
                <li>{{telefono}}</li>
                <li>{{direccion}}</li>
                <li>{{codigopostal}}</li>
            </ul>
        <div id="izquerda"></div>
    </body>
</html>
```

# 4.-Cierre/Conclusión enlazando con la unidad
Esta práctica permitió aplicar los conocimientos de la unidad sobre desarrollo web dinámico y gestión de datos con Python. Al utilizar Flask, se comprendió cómo un servidor puede generar contenido HTML de forma automática a partir de archivos JSON, demostrando la importancia de separar la lógica del servidor y la presentación visual.

Además, la experiencia reforzó conceptos clave como la carga y manipulación de datos, la estructura de una aplicación Flask, y la integración de HTML y CSS para mejorar la apariencia del sitio. En conjunto, la actividad mostró de manera práctica cómo los fundamentos teóricos de la unidad se aplican al desarrollo de aplicaciones web reales y dinámicas.
