from flask import Flask

aplicacion = Flask(__name__)  # Corregí 'aplicion' por 'aplicacion'

@aplicacion.route("/")
def raiz():
    cadena = '''
            <!doctype html>
            <html>
                <head>
                    <title></title>
                    <style>
                    h1 { color: red; }  /* Corregí la sintaxis CSS */
                    </style>
                </head>
                <body>
                    <h1> 
                    Esto es Html a 
                    </h1>
                </body>
            </html>
           '''
    for dia in range (1,31):
        cadena += '<dia>' +str(dia)+'</dia>'
if __name__ == "__main__":  # Aquí debe ir __main__
    aplicacion.run(debug=True)

