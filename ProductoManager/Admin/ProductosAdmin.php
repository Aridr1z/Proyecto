
<?php require_once dirname(__DIR__,2)."/includes/auth_admin.php"; ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="ProductosAdmin.css">
    <title>Lista de Productos</title>
</head>
<body>

<?php include $_SERVER['DOCUMENT_ROOT'].'/Proyecto/includes/header.php'; ?>


<div class="container">
<?php
    include("conexion.php");

    $sql = mysqli_query($con, "SELECT * FROM productos");
?>

    <div class="table-container">
        <table>
            <thead>
                <tr>
                    <th>Id</th>
                    <th>Nombre del Curso</th>
                    <th>Precio</th>
                    <th>Fecha</th>
                    <th>Tipo</th>
                    <th>Descripción</th>
                    <th>Imagen</th>
                    <th>Acciones</th> <!-- Columna nueva -->
                </tr>
            </thead>
            <tbody>
            <?php while($row = mysqli_fetch_array($sql)) { ?>
                <tr>
                    <td><?php echo $row['id']; ?></td>
                    <td><?php echo $row['nombreCurso']; ?></td>
                    <td><?php echo $row['precioCurso']; ?></td>
                    <td><?php echo $row['fechaCurso']; ?></td>
                    <td><?php echo $row['tipoCurso']; ?></td>
                    <td><?php echo $row['desColumna']; ?></td>
                    <td><img src="<?php echo $row['imagenCurso']; ?>" alt="Imagen del curso" width="100"></td>
                    <td>
                        <form method="POST" action="EliminarProducto.php" style="display:inline-block;" onsubmit="return confirm('¿Estás seguro de eliminar este producto?');">
                            <input type="hidden" name="id" value="<?php echo $row['id']; ?>">
                            <button type="submit" class="btn-eliminar">Eliminar</button>
                        </form>
                        <form method="GET" action="ModificarProducto.php" style="display:inline-block;">
                            <input type="hidden" name="id" value="<?php echo $row['id']; ?>">
                            <button type="submit" class="btn-modificar">Modificar</button>
                        </form>
                    </td>
                    
                    
                    

                </tr>
            <?php } ?>
            </tbody>
        </table>
    </div>
</div>

</body>
</html>