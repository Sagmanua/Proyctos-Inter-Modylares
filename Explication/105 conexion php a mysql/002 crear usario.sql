-- ============================================
-- 1) VER TUS PRIVILEGIOS (OPCIONAL)
-- ============================================
SHOW GRANTS FOR CURRENT_USER;

-- ============================================
-- 2) CREAR BASE DE DATOS
-- ============================================
CREATE DATABASE IF NOT EXISTS clientes1;

-- ============================================
-- 3) CREAR USUARIO CON CONTRASEÑA FUERTE
-- ============================================
DROP USER IF EXISTS 'blogphp'@'localhost';

CREATE USER 'blogphp'@'localhost'
IDENTIFIED BY 'StrongPass2024!';

-- ============================================
-- 4) QUITAR LIMITES DEL USUARIO
-- ============================================
ALTER USER 'blogphp'@'localhost'
REQUIRE NONE
WITH 
  MAX_QUERIES_PER_HOUR 0
  MAX_CONNECTIONS_PER_HOUR 0
  MAX_UPDATES_PER_HOUR 0
  MAX_USER_CONNECTIONS 0;

-- ============================================
-- 5) OTORGAR TODOS LOS PRIVILEGIOS SOBRE clientes1
-- ============================================
GRANT ALL PRIVILEGES ON clientes1.* 
TO 'blogphp'@'localhost'
WITH GRANT OPTION;

-- ============================================
-- 6) RECARGAR PRIVILEGIOS
-- ============================================
FLUSH PRIVILEGES;