from flask import Flask

app = Flask(__name__)

@app.route("/")
def raiz():
    cadena = ''  # Initialize the variable

    cadena += '''<!DOCTYPE html>
<html lang="es">
<head>
    <title>jocarsablog</title>
    <meta charset="utf-8">
    <style>
        body {
            background-color: bisque;
            color: white;
            font-family: sans-serif;        
        }
        header, footer, main {
            background-color: aquamarine;
            padding: 20px;
            margin: auto;
            width: 600px;
        }
        header, footer {
            text-align: center;
        }
        main {
            color: black;
        }
    </style>
</head>
<body>
    <header><h1>Bohdan</h1></header>
    <main>
    '''

    # Add article content
    import json
    archivo = open("block.json","r")
    contenodido = json.load(archivo)
    for linea in contenodido:
        cadena += ''' 
        <h3>'''+linea['Titulo']+'''</h3>
        <h3>'''+linea['fecha']+'''</h3>
        <h3>'''+linea['autor']+'''</h3>
        <h3>'''+linea['contiendo']+'''</h3>
                    
'''
        
    
    cadena += '''
        <article>
            <h3>Titulo del articulo</h3>
            <time>2025-10-16</time>
            <p>Contenido del artículo aquí.</p>
        </article>
    '''

    # Close main and add footer
    cadena += '''
    </main>
    <footer>
        (c) Bohdan Sydorenko
    </footer>
</body>
</html>
    '''

    return cadena  # Return the full HTML string

if __name__ == "__main__":
    app.run(debug=True)

