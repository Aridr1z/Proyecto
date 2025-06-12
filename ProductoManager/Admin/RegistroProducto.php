<?php
/*******************************
 *  RegistroProducto.php (admin)
 *******************************/
require_once dirname(__DIR__, 2) . "/includes/auth_admin.php";  // protección

include __DIR__ . "/conexion.php";

/* Si el formulario se envió, insertamos */
if ($_SERVER['REQUEST_METHOD'] === 'POST') {

    /* Para los triggers: quién es el admin que realiza la acción */
    mysqli_query($con, "SET @admin_id = " . intval($_SESSION['id']));

    // Sanitizar / recoger datos
    $nombreCurso = $_POST['nombreCurso'] ?? '';
    $precioCurso = $_POST['precioCurso'] ?? '';
    $fechaCurso  = $_POST['fechaCurso']  ?? '';
    $tipoCurso   = $_POST['tipoCurso']   ?? '';
    $desColumna  = $_POST['desColumna']  ?? '';
    $imagenCurso = $_POST['imagenCurso'] ?? '';

    // Convertir intereses a texto si vienen del checkbox
    $interesesSeleccionados = $_POST['intereses'] ?? [];
    $tipoCurso = implode(", ", $interesesSeleccionados);

    // Insertar
    $sql = "INSERT INTO productos
            (nombreCurso, precioCurso, fechaCurso, tipoCurso, desColumna, imagenCurso)
            VALUES ('$nombreCurso', '$precioCurso', '$fechaCurso',
                    '$tipoCurso', '$desColumna', '$imagenCurso')";

    if (mysqli_query($con, $sql)) {
        // Regenerar el grafo de intereses automáticamente
        include dirname(__DIR__, 2) . "/RecoInt/GenerarInteres.php";

        header("Location: ProductosAdmin.php?ok=1");
        exit();
    } else {
        $error = "Error: " . mysqli_error($con);
    }
}

/* Cerrar conexión (buena práctica) */
if (isset($con)) mysqli_close($con);
?>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width,initial-scale=1.0" />
  <title>Registro de Productos</title>
  <link rel="stylesheet" href="RegistroProducto.css" />
</head>
<body>

<?php
/* Header global */
include $_SERVER['DOCUMENT_ROOT'] . '/Proyecto/includes/header.php';
?>

<!--  Wrapper con padding propio  -->
<main class="page">

  <h1>Registro Productos</h1>

  <?php if (!empty($error)): ?>
    <p style="color:#c33;font-weight:bold"><?= $error ?></p>
  <?php endif; ?>

  <section>
    <div>
      <!-- action vacío -> vuelve a esta misma página -->
      <form method="POST" autocomplete="off">
        <div class="form-element">
          <label for="nombreCurso">Nombre</label>
          <input id="nombreCurso" name="nombreCurso" type="text" required />
        </div>

        <div class="form-element">
          <label for="precioCurso">Precio</label>
          <input id="precioCurso" name="precioCurso" type="number" required />
        </div>

        <div class="form-element">
          <label for="fechaCurso">Fecha del Curso</label>
          <input id="fechaCurso" name="fechaCurso" type="date" required />
        </div>

        <div class="form-element">
          <label>Selecciona los intereses del curso:</label>
          <?php
          $opciones = ["Salud mental", "Tecnología", "Negocios", "Arte", "Música", "Idiomas", "Cocina", "Programación", "Desarrollo personal", "Finanzas", "Deportes", "Psicología", "Diseño", "Marketing", "Emprendimiento"];
          foreach ($opciones as $interes) {
              echo "<label><input type='checkbox' name='intereses[]' value='$interes'> $interes</label><br>";
          }
          ?>
        </div>

        <div class="form-element">
          <label for="desColumna">Descripción</label>
          <textarea id="desColumna" name="desColumna" rows="4" required></textarea>
        </div>

        <div class="form-element">
          <label for="imagenCurso">Imagen (URL)</label>
          <input id="imagenCurso" name="imagenCurso" type="text" required />
        </div>

        <button type="submit">Registrar Producto</button>
      </form>
    </div>
  </section>

</main>
</body>
</html>
