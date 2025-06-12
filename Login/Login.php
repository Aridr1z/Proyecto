<?php
session_start();
include "conexion.php";

if ($_SERVER["REQUEST_METHOD"] == "POST") {

    $correo   = mysqli_real_escape_string($con, $_POST['correo']);
    $password = mysqli_real_escape_string($con, $_POST['password']);

    $resultado = mysqli_query(
        $con,
        "SELECT * FROM usuarios
         WHERE correo='$correo' AND password='$password'"
    );

    if (mysqli_num_rows($resultado) > 0) {
        $fila = mysqli_fetch_assoc($resultado);

        // Guardamos datos de sesión
        $_SESSION['id']   = $fila['id'];
        $_SESSION['user'] = $fila['nombre'];
        $_SESSION['rol']  = $fila['rol'];
        $_SESSION['correo'] = $fila['correo'];  

        // ✅ Redirigir a la Landing Page después del login
        header("Location: /Proyecto/LandingPage/LandingPage.php");
        exit();
    } else {
        // ❌ Usuario o contraseña incorrectos
        echo "<script>
                alert('Correo o contraseña incorrectos');
                window.location.href = 'Login.html';
              </script>";
    }

    mysqli_close($con);
}
?>