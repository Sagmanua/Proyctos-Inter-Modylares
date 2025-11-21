from flask import Flask, render_template , request

app = Flask(__name__)

@app.route("/")
def inicio():
    nombre = request.args.get("nombre")
    print("Ops",nombre)
    return "Mira en la consola si ha pasado"

if __name__ == "__main__":
    app.run(debug=True)

# http://127.0.0.1:5000/?nombre=Bohdan