<?php
session_start();
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Estilos del header -->
    <link rel="stylesheet" href="/Proyecto/includes/header.css">

    <!-- Estilos propios de esta página -->
    <link rel="stylesheet" href="ProductosUsuarios.css">

    <title>Productos Usuarios</title>
</head>
<body>

<!-- Aquí se incluye tu header automáticamente -->
<?php include($_SERVER['DOCUMENT_ROOT']."/Proyecto/includes/header.php"); ?>

<h1>Productos Usuarios</h1>


<div class="container">
    <?php
    include("conexion.php");

    $sql = mysqli_query($con, "SELECT * FROM productos");

    while($row = mysqli_fetch_array($sql)){
    ?>
        <div class="producto">
            
            <div class="caja">
                <img class="img" src="<?php echo $row['imagenCurso']; ?>" alt="Imagen del curso" width="200"><br>

                <h2><?php echo $row['nombreCurso']; ?></h2>
                <p><strong>Precio:</strong> $<?php echo $row['precioCurso']; ?></p>
                <p><strong>Fecha del Curso:</strong> <?php echo $row['fechaCurso']; ?></p>
                <p><strong>Tipo:</strong> <?php echo $row['tipoCurso']; ?></p>
                <p><strong>Descripción:</strong> <?php echo $row['desColumna']; ?></p>
                <form action="/Proyecto/Carrito/agregar.php" method="POST">
                    <input type="hidden" name="id_producto" value="<?php echo $row['id']; ?>">
                    <button type="submit">Agregar al carrito</button>
                </form>
            </div>
        </div>
    <?php
    }
    ?>
</div>

</body>
</html>