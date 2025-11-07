
# Indroduccion brece y contexalizacion
En este ejercicio se muestra cómo un servidor creado con Flask puede generar contenido HTML dinámico, en este caso un calendario sencillo, demostrando cómo Python puede construir páginas web que cambian según los datos o la lógica del programa.



# Desarrollo técnico correcto y preciso
## Instalar Flask 
###  Asego de tener instalado Python en tu sistema. Luego, ejecuta el siguiente comando para instalar Flask
```
pip install flask
```
## Pon en marcha el servidor
### Abre un archivo llamado app.py y escribe lo siguiente
```
from flask import Flask

aplicacion = Flask(__name__)

@aplicacion.route("/")
def raiz():
  return "Esto es HTML desde Flask"
  
if __name__ == "__main__":
  aplicacion.run(debug=True)
```
### ahora ajecutar este archivo y tiene este mensage.Todo pase bien y ahoro puede abrir `http://127.0.0.1:5000` y tiene mi pagina web 
```
 * Serving Flask app '001'
 * Debug mode: on
WARNING: This is a development server. Do not use it in a production deployment. Use a production WSGI server instead.
 * Running on http://127.0.0.1:5000
Press CTRL+C to quit
 * Restarting with stat
 * Debugger is active!
 * Debugger PIN: 986-612-763
```
## Crea HTML más complejo
### Modifico el archivo app.py para que genere un HTML con estilos y contenido dinámico:
```
from flask import Flask

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
```
## Practica HTML dinámico
### Intenta agregar más elementos interactivos o modificaciones al HTML para practicar la creación de contenido dinámico en Flask.


```
style>
        body{font-family:Arial;background:#f2f2f2;padding:20px;}
        h1{text-align:center;color:#E63946;}
        .dias{display:grid;grid-template-columns:repeat(7,1fr);gap:8px;}
        .dias div{background:#A8DADC;padding:10px;border-radius:6px;text-align:center;}
</style>
```



# Codigo completa
```
from flask import Flask

aplicacion = Flask(__name__)

@aplicacion.route("/")
def raiz():
  cadena = '''
    <!doctype html>
    <html>
      <head>
        <title>HTML Dinámico</title>
         <style>
        body{font-family:Arial;background:#f2f2f2;padding:20px;}
        h1{text-align:center;color:#E63946;}
        .dias{display:grid;grid-template-columns:repeat(7,1fr);gap:8px;}
        .dias div{background:#A8DADC;padding:10px;border-radius:6px;text-align:center;}
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
```

# 4.-Cierre/Conclusión enlazando con la unidad
Con esta práctica pudimos observar cómo Flask permite integrar la lógica de programación en Python con la estructura de una página web en HTML. A través de un ejemplo sencillo, generamos contenido dinámico (los días del calendario) y lo mostramos en el navegador, comprendiendo así cómo el servidor envía información al cliente. Esto se relaciona directamente con la unidad, ya que refuerza el concepto de desarrollo web dinámico, donde la página no es fija, sino que se construye en función de los datos y la lógica del programa. Este fundamento será clave para continuar con aplicaciones más completas que incluyan formularios, bases de datos e interacción con el usuario.