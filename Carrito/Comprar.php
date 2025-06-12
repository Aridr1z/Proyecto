<?php
// Carrito/Comprar.php
session_start();

// 1) Autoload de Composer (Dompdf + PHPMailer)
require_once __DIR__ . '/../vendor/autoload.php';

// 2) Configuración SMTP
require_once __DIR__ . '/../includes/config.php';

// 3) Conexión a la BD
include "conexion.php";

// ────────────────────────────────────────────────
// 4) Recuperar ítems del carrito
// ────────────────────────────────────────────────
$items = [];
$total = 0;

if (isset($_SESSION['rol']) && $_SESSION['rol'] === 'cliente') {
    $uid = intval($_SESSION['id']);
    $rs  = mysqli_query($con, "
      SELECT p.nombreCurso, p.precioCurso, c.cantidad
        FROM carrito c
        JOIN productos p ON p.id = c.id_producto
       WHERE c.id_usuario = {$uid}
    ");
    $items = mysqli_fetch_all($rs, MYSQLI_ASSOC);

} elseif (!empty($_SESSION['carrito'])) {
    foreach ($_SESSION['carrito'] as $pid => $cant) {
        $q = mysqli_query($con, "
          SELECT nombreCurso, precioCurso
            FROM productos
           WHERE id = {$pid}
        ");
        if ($p = mysqli_fetch_assoc($q)) {
            $p['cantidad'] = $cant;
            $items[]       = $p;
        }
    }
}

if (empty($items)) {
    die('No hay productos en el carrito para facturar.');
}

// ────────────────────────────────────────────────
// 5) Registrar la compra en la tabla `compras`
// ────────────────────────────────────────────────

foreach ($items as $it) {
    $nombre = mysqli_real_escape_string($con, $it['nombreCurso']);
    $query  = "SELECT id FROM productos WHERE nombreCurso = '$nombre' LIMIT 1";
    $res    = mysqli_query($con, $query);
    
    if ($row = mysqli_fetch_assoc($res)) {
        $pid = $row['id'];
        for ($i = 0; $i < $it['cantidad']; $i++) {
            mysqli_query($con, "
                INSERT INTO compras (id_usuario, id_producto)
                VALUES ($uid, $pid)
            ");
        }
    }
}


// ────────────────────────────────────────────────
// 5) Generar PDF con Dompdf
// ────────────────────────────────────────────────
use Dompdf\Dompdf;

$html  = '<h2 style="text-align:center">Factura SkillUp</h2>';
$html .= '<table width="100%" border="1" cellspacing="0" cellpadding="5">
            <tr>
              <th>Producto</th>
              <th>Cant.</th>
              <th>Precio</th>
              <th>Subtotal</th>
            </tr>';

foreach ($items as $it) {
    $sub     = $it['precioCurso'] * $it['cantidad'];
    $total  += $sub;
    $html   .= sprintf(
      '<tr>
         <td>%s</td>
         <td align="center">%d</td>
         <td align="right">$%s</td>
         <td align="right">$%s</td>
       </tr>',
      htmlspecialchars($it['nombreCurso']),
      $it['cantidad'],
      number_format($it['precioCurso'], 2),
      number_format($sub, 2)
    );
}

$html .= sprintf(
  '<tr>
     <td colspan="3" align="right"><strong>Total</strong></td>
     <td align="right"><strong>$%s</strong></td>
   </tr>
  </table>',
  number_format($total, 2)
);

$dompdf = new Dompdf();
$dompdf->loadHtml($html);
$dompdf->setPaper('A4', 'portrait');
$dompdf->render();
$pdfString = $dompdf->output();

// ────────────────────────────────────────────────
// 6) Enviar correo con PHPMailer
// ────────────────────────────────────────────────
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

$destino = $_SESSION['correo'] 
         ?? die('No hay email en la sesión');

$mail = new PHPMailer(true);
try {
    // SMTP
    $mail->isSMTP();
    $mail->Host       = SMTP_HOST;
    $mail->SMTPAuth   = true;
    $mail->Username   = SMTP_USER;
    $mail->Password   = SMTP_PASS;
    $mail->SMTPSecure = SMTP_SECURE;
    $mail->Port       = SMTP_PORT;

    // From / To
    $mail->setFrom('facturas@skillup.com', 'SkillUp');
    $mail->addAddress($destino);

    // Contenido
    $mail->isHTML(true);
    $mail->Subject = 'Tu factura SkillUp';
    $mail->Body    = '<p>¡Gracias por tu compra! Adjuntamos tu factura en PDF.</p>';

    // Adjuntar el PDF
    $mail->addStringAttachment($pdfString, 'Factura-SkillUp.pdf');

    $mail->send();

    // ────────────────────────────────────────────────
    // 7) Vaciar carrito
    // ────────────────────────────────────────────────
    if (isset($_SESSION['rol']) && $_SESSION['rol'] === 'cliente') {
        mysqli_query($con,
            "DELETE FROM carrito WHERE id_usuario = {$uid}"
        );
    }
    unset($_SESSION['carrito']);

    include("../Reco/GenerarRelaciones.php");

    header('Location: Carrito.php?ok=1');
    exit;

} catch (Exception $e) {
    echo "No se pudo enviar el correo. Error: {$mail->ErrorInfo}";
}