A continuación, presento el desarrollo del ejercicio estructurado de la misma forma que tu ejemplo anterior, integrando la base de datos de la "Tienda de Patitos" con el microservidor Flask.

Introducción y Contextualización
El objetivo de este ejercicio es evolucionar de un sitio web estático a una aplicación web dinámica. Aprenderemos a estructurar una base de datos relacional compleja (clientes, productos y pedidos) y a conectarla con Flask para mostrar información en tiempo real, utilizando el motor de plantillas Jinja2.

Desarrollo Técnico Correcto y Preciso
1. Desarrollo del Modelo de Datos (SQL)
010-tienda online de patitos.sql
Creamos la estructura siguiendo la integridad referencial: primero las tablas maestras (sin dependencias) y luego las tablas hijas.

Tablas Maestras: categorias_pato, clientes.

Tablas Hijas: productos_pato (depende de categorías), pedidos (depende de clientes) y lineas_pedido.

Vistas: Creamos vw_productos_pato para simplificar la lectura de datos uniendo nombres de categorías y stock.

SQL

-- Ejemplo de creación de tabla con FK
CREATE TABLE productos_pato (
    id_producto INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    id_categoria INT UNSIGNED NOT NULL,
    CONSTRAINT fk_productos_categoria FOREIGN KEY (id_categoria) 
    REFERENCES categorias_pato(id_categoria)
);
2. Implementación del Backend (Flask)
003-servidor_dinamico.py
Partiendo de 001-estatico.py y 002-multipagina.py, extendemos el servidor para conectar con MySQL y enviar los datos a las plantillas.

Python

from flask import Flask, render_template
import mysql.connector

app = Flask(__name__)

def conectar_db():
    return mysql.connector.connect(
        host="localhost", user="root", password="", database="tienda_patitos"
    )

@app.route("/")
def inicio():
    # Consulta a la vista creada en el SQL
    conexion = conectar_db()
    cursor = conexion.cursor(dictionary=True)
    cursor.execute("SELECT * FROM vw_productos_pato")
    productos = cursor.fetchall()
    return render_template("inicio.html", productos=productos)

@app.route("/contacto")
def contacto():
    return render_template("contacto.html")

if __name__ == "__main__":
    app.run(debug=True)
3. Implementación del Frontend (Jinja2)
templates/inicio.html
Utilizamos la lógica de Jinja2 para recorrer los productos que enviamos desde el backend de Flask.

HTML

<!doctype html>
<html lang="es">
  <head><title>Tienda de Patitos</title></head>
  <body>
    <h1>Nuestros Patos de Goma</h1>
    <ul>
      {% for producto in productos %}
        <li>
          <strong>{{ producto.nombre }}</strong> - 
          Precio: {{ producto.precio }}€ - 
          Categoría: {{ producto.categoria }} -
          Stock: {{ producto.stock_disponible }}
        </li>
      {% endfor %}
    </ul>
  </body>
</html>
Código Completo y Estructura
Plaintext

Project/
├─ 010-tienda online de patitos.sql (Base de datos)
├─ 003-servidor_dinamico.py        (Backend Flask)
├─ templates/
│  ├─ inicio.html                  (Vista dinámica)
│  ├─ contacto.html                (Vista estática)
│  └─ sobremi.html                 (Vista estática)
└─ static/                         (CSS/Imágenes)
Resumen de Funcionalidades:
Rutas Multipágina: Basado en 002-multipagina.py, el servidor maneja /, /sobremi y /contacto.

Integridad de Datos: El script SQL asegura que no existan pedidos sin clientes mediante FOREIGN KEY.

Vistas SQL: Facilitan el trabajo en Flask al devolver ya el nombre de la categoría en lugar del ID numérico.

Cierre y Conclusión
Este ejercicio demuestra la potencia de combinar SQL y Flask. Al separar la lógica de datos (SQL) de la presentación (HTML/Jinja2), logramos una aplicación escalable.

Mejoras sugeridas:

Seguridad: Implementar sentencias preparadas en el cursor de Python para evitar la inyección SQL.

Eficiencia: Usar un "Pool de conexiones" para no abrir y cerrar la conexión con la base de datos en cada clic del usuario.

Funcionalidad: Añadir un formulario en contacto.html que guarde mensajes directamente en una nueva tabla de la base de datos.