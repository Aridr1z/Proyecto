<?php
session_start();

/* conexión (ajusta si tu ruta cambia) */
include("conexion.php");

/*────────────────── ACCIONES (+ – ✕) ──────────────────*/
if ($_SERVER['REQUEST_METHOD'] === 'POST') {

    $id  = intval($_POST['id'] ?? 0);
    $act = $_POST['accion'] ?? '';

    /* A)  CLIENTE LOGUEADO  →  tabla `carrito` */
    if (isset($_SESSION['rol']) && $_SESSION['rol'] === 'cliente') {

        $uid = intval($_SESSION['id']);

        switch ($act) {

            case 'mas':
                mysqli_query($con,"UPDATE carrito
                                   SET cantidad = cantidad + 1
                                   WHERE id_usuario=$uid AND id_producto=$id");
                break;

            case 'menos':
                mysqli_query($con,"UPDATE carrito
                                   SET cantidad = GREATEST(cantidad-1,1)
                                   WHERE id_usuario=$uid AND id_producto=$id");
                break;

            case 'del':
                mysqli_query($con,"DELETE FROM carrito
                                   WHERE id_usuario=$uid AND id_producto=$id");
                break;
        }
    }

    /* B)  VISITANTE  →  carrito en $_SESSION */
    else {

        switch ($act) {
            case 'mas':
                $_SESSION['carrito'][$id] =
                    ($_SESSION['carrito'][$id] ?? 0) + 1;
                break;

            case 'menos':
                if (!empty($_SESSION['carrito'][$id]) &&
                    $_SESSION['carrito'][$id] > 1) {
                    $_SESSION['carrito'][$id]--;
                }
                break;

            case 'del':
                unset($_SESSION['carrito'][$id]);
                break;
        }
    }

    /* Redirige para evitar re-envíos */
    header('Location: Carrito.php');
    exit;
}

/*────────────────── CARGAR ÍTEMS ──────────────────────*/
$items = [];

/* 1) usuario logueado */
if (isset($_SESSION['rol']) && $_SESSION['rol'] === 'cliente') {

    $uid = intval($_SESSION['id']);
    $sql = "SELECT p.id, p.nombreCurso, p.precioCurso, c.cantidad
            FROM   carrito c
            JOIN   productos p ON p.id = c.id_producto
            WHERE  c.id_usuario = $uid";
    $items = mysqli_fetch_all(mysqli_query($con,$sql),MYSQLI_ASSOC);
}

/* 2) visitante */
elseif (!empty($_SESSION['carrito'])) {

    foreach ($_SESSION['carrito'] as $pid => $cant) {
        $p = mysqli_fetch_assoc(mysqli_query(
            $con,"SELECT id,nombreCurso,precioCurso FROM productos WHERE id=$pid"));
        if ($p) { $p['cantidad']=$cant; $items[]=$p; }
    }
}
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Mi carrito</title>
    <link rel="stylesheet" href="Carrito.css">
</head>
<body>

<?php include $_SERVER['DOCUMENT_ROOT'].'/Proyecto/includes/header.php'; ?>

<h1>Carrito</h1>

<?php if (!$items): ?>

    <p class="empty">No hay productos en el carrito.</p>

<?php else: ?>
    <table>
        <tr><th>Producto</th><th>Precio</th><th>Cant.</th><th>Total</th></tr>
        <?php $total=0;
              foreach ($items as $it):
                  $sub=$it['precioCurso']*$it['cantidad'];
                  $total+=$sub; ?>
            <tr>
                <td class="prod">
                    <!-- botón ✕ -->
                    <form class="del" action="Carrito.php" method="POST">
                        <input type="hidden" name="accion" value="del">
                        <input type="hidden" name="id" value="<?= $it['id'] ?>">
                        <button title="Eliminar">✕</button>
                    </form>
                    <?= htmlspecialchars($it['nombreCurso']) ?>
                </td>
                <td>$<?= number_format($it['precioCurso'],2) ?></td>
                <td class="qty">
                    <!-- – -->
                    <form action="Carrito.php" method="POST">
                        <input type="hidden" name="accion" value="menos">
                        <input type="hidden" name="id" value="<?= $it['id'] ?>">
                        <button>−</button>
                    </form>
                    <span><?= $it['cantidad'] ?></span>
                    <!-- + -->
                    <form action="Carrito.php" method="POST">
                        <input type="hidden" name="accion" value="mas">
                        <input type="hidden" name="id" value="<?= $it['id'] ?>">
                        <button>+</button>
                    </form>
                </td>
                <td>$<?= number_format($sub,2) ?></td>
            </tr>
        <?php endforeach; ?>
        <tr class="total-row">
            <td colspan="3" align="right"><strong>Total:</strong></td>
            <td><strong>$<?= number_format($total,2) ?></strong></td>
        </tr>
    </table>

    <!-- BOTÓN COMPRAR -->
    <form action="Comprar.php" method="POST" style="text-align:center;margin:2rem 0">
        <button class="btn-buy">Comprar</button>
    </form>
<?php endif; ?>

</body>
</html>