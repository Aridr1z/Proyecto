<?php
include "conexion.php";

$nombre   = mysqli_real_escape_string($con, $_POST['nombre']);
$correo   = mysqli_real_escape_string($con, $_POST['correo']);
$password = mysqli_real_escape_string($con, $_POST['contrasena']);
$interesesSeleccionados = $_POST['intereses'] ?? [];

if (count($interesesSeleccionados) < 5) {
    die("Debes seleccionar al menos 5 intereses.");
}

$interesesTexto = mysqli_real_escape_string($con, implode(",", $interesesSeleccionados));

$sql = mysqli_query(
    $con,
    "INSERT INTO usuarios (nombre, correo, password, intereses)
     VALUES ('$nombre', '$correo', '$password', '$interesesTexto')"
);

if ($sql) {
    header("Location: /Proyecto/Login/Login.html");
    exit;
} else {
    echo "Error al registrar usuario: " . mysqli_error($con);
}

mysqli_close($con);