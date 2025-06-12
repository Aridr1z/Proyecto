<?php
session_start();
include("conexion.php");

$idProducto = isset($_POST['id_producto']) ? intval($_POST['id_producto']) : 0;
if ($idProducto <= 0) { header("Location: ../ProductoManager/User/ProductosUsuarios.php"); exit(); }

/* 1️⃣  Si el usuario está logueado como cliente → guarda en BD  */
if (isset($_SESSION['rol']) && $_SESSION['rol'] === 'cliente') {
    $userId = intval($_SESSION['id']);

    // ¿Ya existe este producto en su carrito?
    $check = mysqli_query($con, "SELECT cantidad FROM carrito WHERE id_usuario=$userId AND id_producto=$idProducto");
    if ($fila = mysqli_fetch_assoc($check)) {
        $cant = $fila['cantidad'] + 1;
        mysqli_query($con, "UPDATE carrito SET cantidad=$cant WHERE id_usuario=$userId AND id_producto=$idProducto");
    } else {
        mysqli_query($con, "INSERT INTO carrito (id_usuario,id_producto,cantidad) VALUES ($userId,$idProducto,1)");
    }
}
/* 2️⃣  Visitante o usuario sin login → guarda en SESSION */
else {
    if (!isset($_SESSION['carrito'])) $_SESSION['carrito'] = [];
    if (!isset($_SESSION['carrito'][$idProducto])) {
        $_SESSION['carrito'][$idProducto] = 1;
    } else {
        $_SESSION['carrito'][$idProducto] += 1;
    }
}

/* 3️⃣  Regresa a la lista con un mensaje opcional */
header("Location: ../ProductoManager/User/ProductosUsuarios.php?added=1");
exit();
?>