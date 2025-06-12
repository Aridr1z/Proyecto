<?php
require_once dirname(__DIR__,2).'/includes/auth_admin.php';
include __DIR__.'/conexion.php';

/* —— Comunica el admin al trigger —— */
mysqli_query($con, "SET @admin_id = ".intval($_SESSION['id']));
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $id = intval($_POST['id']);
    $nombre = $_POST['nombreCurso'];
    $precio = $_POST['precioCurso'];
    $fecha = $_POST['fechaCurso'];
    $tipo = $_POST['tipoCurso'];
    $descripcion = $_POST['desColumna'];
    $imagen = $_POST['imagenCurso'];

    $sql = "UPDATE productos SET 
            nombreCurso = '$nombre',
            precioCurso = '$precio',
            fechaCurso = '$fecha',
            tipoCurso = '$tipo',
            desColumna = '$descripcion',
            imagenCurso = '$imagen'
            WHERE id = $id";

    $resultado = mysqli_query($con, $sql);

    if ($resultado) {
        include dirname(__DIR__, 2) . "/RecoInt/GenerarInteres.php";

        header("Location: ProductosAdmin.php");
        exit();
    } else {
        echo "Error al actualizar el producto.";
        exit();
    }
}

if (isset($_GET['id'])) {
    $id = intval($_GET['id']);
    $query = mysqli_query($con, "SELECT * FROM productos WHERE id = $id");
    $producto = mysqli_fetch_assoc($query);

    if (!$producto) {
        echo "Producto no encontrado.";
        exit();
    }
} else {
    echo "ID no recibido.";
    exit();
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Modificar Producto</title>
    <link rel="stylesheet" href="ModificarProducto.css">

    
</head>
<body>

<h1>Modificar Producto</h1>

<form method="POST" action="ModificarProducto.php">
    <input type="hidden" name="id" value="<?php echo $producto['id']; ?>">

    <label>Nombre:</label>
    <input type="text" name="nombreCurso" value="<?php echo $producto['nombreCurso']; ?>" required>

    <label>Precio:</label>
    <input type="number" name="precioCurso" value="<?php echo $producto['precioCurso']; ?>" required>

    <label>Fecha:</label>
    <input type="date" name="fechaCurso" value="<?php echo $producto['fechaCurso']; ?>" required>

    <label>Tipo:</label>
    <input type="text" name="tipoCurso" value="<?php echo $producto['tipoCurso']; ?>" required>

    <label>Descripción:</label>
    <textarea name="desColumna" required><?php echo $producto['desColumna']; ?></textarea>

    <label>Imagen (URL):</label>
    <input type="text" name="imagenCurso" value="<?php echo $producto['imagenCurso']; ?>" required>

    <button type="submit">Guardar Cambios</button>
</form>

</body>
</html>