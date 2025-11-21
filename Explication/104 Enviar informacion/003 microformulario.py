from flask import Flask, render_template , request

app = Flask(__name__)

@app.route("/")
def inicio():
    return render_template("index.html")

@app.route("/envio")
def envio():
    nombre = request.args.get("nombre")
    apellidos = request.args.get("apellidos")
    print("Ops", nombre, apellidos)
    return "Mira en la consola si ha pasado"

if __name__ == "__main__":
    app.run(debug=True)


# http://127.0.0.1:5000/?nombre=Bohdan