# Indroduccion brece y contexalizacion




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

