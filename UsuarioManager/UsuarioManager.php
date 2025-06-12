<?php

require_once dirname(__DIR__,1).'/includes/auth_admin.php';

include("conexion.php");

/* ── conexión BD ───────────────────────────────────────── */

/* ── obtengo todos los clientes (excluyo admin) ───────── */
$sql = "SELECT id, nombre, correo, rol
        FROM   usuarios
        WHERE  rol = 'cliente'
        ORDER BY id";
$res = mysqli_query($con,$sql) or
       die('Error: '.mysqli_error($con));
?>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Gestión de Usuarios</title>
  <link rel="stylesheet" href="UsuarioManager.css">
</head>
<body>

<?php include $_SERVER['DOCUMENT_ROOT'].'/Proyecto/includes/header.php'; ?>

<h1>Clientes registrados</h1>

<div class="table-wrapper">
  <table>
    <thead>
      <tr>
        <th>ID</th>
        <th>Nombre</th>
        <th>Correo</th>
        <th>Rol</th>
      </tr>
    </thead>
    <tbody>
    <?php while ($u = mysqli_fetch_assoc($res)): ?>
      <tr>
        <td><?= $u['id'] ?></td>
        <td><?= htmlspecialchars($u['nombre']) ?></td>
        <td><?= htmlspecialchars($u['correo']) ?></td>
        <td><?= $u['rol'] ?></td>
      </tr>
    <?php endwhile; ?>
    </tbody>
  </table>
</div>

</body>
</html>