<?php
    $host = "localhost";
    $user = "clientes1";
    $pass = "StrongPass2024!";
    $db   = "blogphp";

    $conexion = new mysqli($host, $user, $pass, $db);

    $sql = "SELECT * FROM blog";

    $resultado = $conexion->query($sql);

    while ($fila = $resultado->fetch_assoc()) {
        var_dump($fila);
    }
        
    $conexion->close();

?>