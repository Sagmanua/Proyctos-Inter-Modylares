#sudo apt install python3 
#pip install flask -Windows


from flask import Flask

aplicion = Flask(__name__)

@aplicion.route("/")
def raiz():
    return "Esto es HTML desde Flask"
if __name__ == "":
    aplicion.run(debug=True)
