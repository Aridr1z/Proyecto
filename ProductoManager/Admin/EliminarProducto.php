<?php
// Solo admin
require_once dirname(__DIR__,2).'/includes/auth_admin.php';

// Conexión BD
include __DIR__.'/conexion.php';

// Informa al trigger de quién es el admin (solo afecta a DELETE de productos)
mysqli_query($con, "SET @admin_id = ".intval($_SESSION['id']));

// Procesar la petición
if (isset($_POST['id'])) {
    $id = intval($_POST['id']);
    if ($id <= 0) {
        header("Location: ProductosAdmin.php");
        exit();
    }

    // 4A. Elimina cualquier línea de carrito que lo referencie
    mysqli_query($con, "DELETE FROM carrito WHERE id_producto = $id");

    // 4A.2 Elimina de grafo_intereses
    mysqli_query($con, "DELETE FROM grafo_intereses WHERE curso_id = $id");

    // 4A.3 Elimina de compras si también aplica
    mysqli_query($con, "DELETE FROM compras WHERE id_producto = $id");

    // 4B. Ahora elimina el producto
    if (mysqli_query($con, "DELETE FROM productos WHERE id = $id")) {

        // 5. Regenerar grafo de intereses
        include "../../RecoInt/GenerarInteres.php";

        header("Location: ProductosAdmin.php?del=1");
        exit();
    } else {
        echo "Error al eliminar el producto: " . mysqli_error($con);
    }
} else {
    echo "ID no recibido.";
}
?>