


# Indroduccion brece y contexalizacion




# Desarrollo técnico correcto y preciso

# Codigo completa
```
from flask import Flask
import json

aplicacion = Flask(__name__)

with open("curiculum.json",encoding="utf-8") as f:
  data = json.load(f)



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
      <p>Hola</p>
        <h1>Bienvenido a mi sitio web con Flask</h1>
        <div id="derecha"></div>
                  <h1>{{nombre}}{{apellidos}}</h1>
                  <p>{{email}}</p>
                  <ul>
                      <li>{{telefono}}</li>
                      <li>{{direccion}}</li>
                      <li>{{codigopostal}}</li>
                  </ul>
                  <p>hola
  
        <div id="izquerda">
          <p>Hola
        </div>
      </body>
    </html>
  '''
  return cadena
  
if __name__ == "__main__":
  aplicacion.run(debug=True)
```

# 4.-Cierre/Conclusión enlazando con la unidad

