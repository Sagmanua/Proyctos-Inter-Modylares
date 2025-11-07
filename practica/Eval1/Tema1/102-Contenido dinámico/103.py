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