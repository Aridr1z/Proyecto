<?php
session_start();         // Inicia la sesión (necesario para destruirla)
session_unset();         // Elimina todas las variables de sesión
session_destroy();       // Destruye completamente la sesión

// Redirige al inicio (o login)
header("Location: /Proyecto/LandingPage/LandingPage.php");
exit();
?>