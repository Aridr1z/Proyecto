<?php
session_start();
include "conexion.php";

if (!isset($_SESSION['id']) || $_SESSION['rol'] !== 'cliente') {
    echo "<p>Inicia sesión como cliente para editar tus intereses.</p>";
    exit;
}

$uid = intval($_SESSION['id']);

// Obtener intereses actuales
$sql = mysqli_query($con, "SELECT intereses FROM usuarios WHERE id = $uid");
$user = mysqli_fetch_assoc($sql);
$intereses_actuales = explode(',', $user['intereses'] ?? '');

$categorias = [
    "Salud mental", "Tecnología", "Negocios", "Arte", "Música",
    "Idiomas", "Cocina", "Programación", "Desarrollo personal", "Finanzas",
    "Deportes", "Psicología", "Diseño", "Marketing", "Emprendimiento"
];

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $seleccionados = $_POST['intereses'] ?? [];
    if (count($seleccionados) >= 5) {
        $nuevo_valor = implode(',', array_map('trim', $seleccionados));
        mysqli_query($con, "UPDATE usuarios SET intereses = '$nuevo_valor' WHERE id = $uid");
        echo "<p style='color: green;'>Intereses actualizados correctamente.</p>";
        $intereses_actuales = $seleccionados;
    } else {
        echo "<p style='color: red;'>Selecciona al menos 5 intereses.</p>";
    }
}
?>

<?php include($_SERVER['DOCUMENT_ROOT']."/Proyecto/includes/header.php"); ?>

<h2>Editar Intereses</h2>


<form method="POST">
    <p>Selecciona al menos 5 intereses:</p>
    <?php foreach ($categorias as $cat): ?>
        <label>
            <input type="checkbox" name="intereses[]" value="<?php echo $cat; ?>"
                <?php echo in_array($cat, $intereses_actuales) ? 'checked' : ''; ?>>
            <?php echo $cat; ?>
        </label><br>
    <?php endforeach; ?>
    <br>
    <button type="submit">Guardar intereses</button>
</form>

<hr>
<h3>Tu historial de compras</h3>
<?php
// Consulta los productos comprados por el usuario
$compras = mysqli_query($con, "
    SELECT p.nombreCurso, p.tipoCurso, p.precioCurso, p.fechaCurso
    FROM compras c
    JOIN productos p ON c.id_producto = p.id
    WHERE c.id_usuario = $uid
");

if (mysqli_num_rows($compras) > 0): ?>
    <ul>
        <?php while ($curso = mysqli_fetch_assoc($compras)): ?>
            <li>
                <strong><?php echo $curso['nombreCurso']; ?></strong> <br>
                Categoría: <?php echo $curso['tipoCurso']; ?> <br>
                Precio: $<?php echo $curso['precioCurso']; ?> <br>
                Fecha: <?php echo $curso['fechaCurso']; ?>
            </li>
            <hr>
        <?php endwhile; ?>
    </ul>
<?php else: ?>
    <p>No has realizado compras aún.</p>
<?php endif; ?>