<?php
/************************ PROTECCIÓN Y DATOS ********************/
require_once dirname(__DIR__,2).'/includes/auth_admin.php';
include __DIR__.'/conexion.php';

/* ── Consulta incluyendo las nuevas columnas ───────────────────────── */
$sql = "
SELECT  
    b.*,
    u.nombre AS admin_nombre
FROM    
    bitacora_productos b
LEFT JOIN 
    usuarios u ON u.id = b.admin_id
ORDER BY 
    b.fecha DESC
";
$resultado = mysqli_query($con, $sql)
    or die('Error al consultar la bitácora: '.mysqli_error($con));
?>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Bitácora de productos</title>
  <link rel="stylesheet" href="bitacora.css">
</head>
<body>

<?php include $_SERVER['DOCUMENT_ROOT'].'/Proyecto/includes/header.php'; ?>

<h1>Bitácora de Movimientos de Productos</h1>

<table>
  <thead>
    <tr>
      <th>ID</th>
      <th>Acción</th>
      <th>ID Producto</th>
      <th>Nombre</th>
      <th>Precio</th>
      <th>Tipo</th>
      <th>Fecha</th>
      <th>Consulta</th>
      <th>Contra-consulta</th>
      <th>Admin</th>
    </tr>
  </thead>
  <tbody>
  <?php while ($fila = mysqli_fetch_assoc($resultado)): ?>
    <?php
      /* ── clase de fila según acción ───────────────── */
      $accion   = strtoupper(trim($fila['accion']));
      $rowClass = ($accion==='INSERTAR') ? 'insertar-row'
                : (($accion==='ELIMINAR')  ? 'eliminar-row' : '');

      /* ── valores y clases para cambios ───────────────── */
      $nombre = $precio = $tipo = '';
      $cNom = $cPre = $cTip = '';
      if ($accion==='MODIFICAR') {
          $cNom = ($fila['nombre_antes']  !== $fila['nombre_despues']) ? 'cambio' : '';
          $cPre = ((float)$fila['precio_antes'] != (float)$fila['precio_despues']) ? 'cambio' : '';
          $cTip = ($fila['tipo_antes']    !== $fila['tipo_despues'])   ? 'cambio' : '';
          $nombre = $fila['nombre_despues'];
          $precio = $fila['precio_despues'];
          $tipo   = $fila['tipo_despues'];
      } elseif ($accion==='INSERTAR') {
          $nombre = $fila['nombre_despues'];
          $precio = $fila['precio_despues'];
          $tipo   = $fila['tipo_despues'];
      } else { // ELIMINAR
          $nombre = $fila['nombre_antes'];
          $precio = $fila['precio_antes'];
          $tipo   = $fila['tipo_antes'];
      }
    ?>
    <tr class="<?= $rowClass ?>">
      <td><?= $fila['id'] ?></td>
      <td><?= $accion ?></td>
      <td><?= $fila['id_producto'] ?></td>

      <td class="<?= $cNom ?>"><?= htmlspecialchars($nombre) ?></td>
      <td class="<?= $cPre ?>">$<?= number_format($precio, 2) ?></td>
      <td class="<?= $cTip ?>"><?= htmlspecialchars($tipo) ?></td>

      <td><?= $fila['fecha'] ?></td>
      <td><pre class="bitacora-sql"><?= htmlspecialchars($fila['consulta']) ?></pre></td>
      <td><pre class="bitacora-sql"><?= htmlspecialchars($fila['contra_consulta']) ?></pre></td>
      <td><?= htmlspecialchars($fila['admin_nombre'] ?: '—') ?></td>
    </tr>
  <?php endwhile; ?>
  </tbody>
</table>

</body>
</html>