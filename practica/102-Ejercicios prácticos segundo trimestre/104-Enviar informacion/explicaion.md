Introducción y ContextualizaciónEl objetivo de esta unidad es comprender cómo fluye la información entre el cliente (navegador) y el servidor (Flask). Aprenderemos a capturar datos enviados directamente en la URL mediante parámetros GET y cómo procesar formularios HTML para que el servidor pueda interactuar con el usuario.Desarrollo Técnico Correcto y Preciso1. Creación del Servidor Base001-primer servidor.pyEstablecemos la estructura mínima de una aplicación Flask. Este script levanta el servicio en el puerto local predeterminado (5000).Pythonfrom flask import Flask , request

app = Flask(__name__)

@app.route("/")
def inicio():
  return "" # Devuelve una página en blanco al acceder a http://127.0.0.1:5000/

if __name__ == "__main__":
  app.run(debug=True)
2. Captura de Parámetros desde la URL002-cojo parametro.pyUtilizamos el objeto request.args para extraer información que el usuario escribe en la barra de direcciones del navegador.Parámetro URL: Se define después del símbolo ? (ej: ?nombre=Jose).Espacios: En una URL, los espacios se codifican como %20.Python@app.route("/")
def inicio():
  # Captura el valor asociado a la clave "nombre"
  nombre = request.args.get("nombre") 
  print(nombre) # El dato aparece en la terminal del servidor
  return "Mira en la consola si ha pasado algo"
3. Procesamiento de Formularios003-microformulario.py y 004-lanzamos los datos.pyEstos scripts demuestran cómo recibir múltiples datos enviados desde un formulario HTML (index.html) hacia una ruta específica denominada /envio.Ruta Raíz (/): Carga el archivo de plantilla con el formulario.Ruta de Envío (/envio): Procesa los datos de nombre y apellidos.Comparativa de salida:ArchivoAcción en /envioResultado Visible003-microformulario.pyprint(nombre, apellidos)Los datos se ven en la Consola/Terminal.004-lanzamos los datos.pyreturn "nombre: "+nombre...Los datos se ven en el Navegador.Código Completo del ProyectoEstructura de archivos recomendada para practicar:PlaintextEjercicio_Flask/
├─ 001-primer servidor.py
├─ 002-cojo parametro.py
├─ 003-microformulario.py
├─ 004-lanzamos los datos.py
└─ templates/
   └─ index.html  (Debe contener un <form action="/envio">)
Ejemplo de funcionamiento del formulario (004-lanzamos los datos.py):Python@app.route("/envio")
def envio():
  # Captura de múltiples parámetros GET
  nombre = request.args.get("nombre")
  apellidos = request.args.get("apellidos")
  # Construcción de respuesta dinámica para el navegador
  return "nombre: "+nombre+" - apellidos: "+apellidos
Cierre/Conclusión enlazando con la unidadEste ejercicio es fundamental para entender la interactividad web. Has practicado cómo transformar una petición estática en una dinámica donde el servidor "escucha" lo que el usuario envía.