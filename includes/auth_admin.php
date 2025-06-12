<?php
/* ── auth_admin.php ─────────────────────────────────────────── *
 * Inclúyelo al principio de TODA página o controlador que      *
 * solo puedan ver los administradores.                         *
 *-------------------------------------------------------------- */

session_start();                           // Activa sesión

// 1. ¿Existe sesión y es admin?
if (!isset($_SESSION['rol']) || $_SESSION['rol'] !== 'admin') {

    /* 2. Devuelve cabecera 403 Forbidden (útil para logs y bots) */
    header("HTTP/1.1 403 Forbidden");

    /* 3. Redirige a la página de “No autorizado” */
    header("Location: /Proyecto/Error/403.php");
    exit();
}
?>