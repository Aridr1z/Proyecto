<?php
include "../ProductoManager/User/conexion.php";

// Se obtiene el correo del usuario desde la sesión activa
$correo = $_SESSION['correo'] ?? '';

// Consulta para obtener el ID del usuario y sus intereses registrados
$sqlUser = mysqli_query($con, "SELECT id, intereses FROM usuarios WHERE correo = '$correo'");
$user = mysqli_fetch_assoc($sqlUser);

// $uid almacena el identificador del usuario autenticado
$uid = $user['id'];

// $intereses es un arreglo de las preferencias o categorías seleccionadas por el usuario
$intereses = explode(',', $user['intereses']);

// Se obtienen todos los cursos comprados por el usuario
$compras = mysqli_query($con, "SELECT id_producto FROM compras WHERE id_usuario = $uid");

// $comprados es un arreglo con los ID de los cursos previamente adquiridos
$comprados = [];
while ($row = mysqli_fetch_assoc($compras)) {
    $comprados[] = $row['id_producto'];
}

// Se construye una tabla hash donde la clave es el interés y el valor es un arreglo de cursos relacionados
$tablaHash = [];
$res = mysqli_query($con, "SELECT * FROM productos");
while ($p = mysqli_fetch_assoc($res)) {
    $tipos = explode(',', $p['tipoCurso']); // cada curso puede pertenecer a múltiples categorías

    foreach ($tipos as $t) {
        $clave = trim($t); // se eliminan espacios en blanco innecesarios

        if (!isset($tablaHash[$clave])) {
            $tablaHash[$clave] = [];
        }

        // Se agregan los cursos a la categoría correspondiente en la tabla hash
        $tablaHash[$clave][] = $p;
    }
}

// Se buscan cursos que coincidan con los intereses del usuario y que aún no haya comprado
$recomendados = [];
foreach ($intereses as $clave) {
    $clave = trim($clave);

    foreach ($tablaHash[$clave] ?? [] as $curso) {
        if (!in_array($curso['id'], $comprados)) {
            // Se almacenan los cursos en un arreglo asociativo usando el ID como clave para evitar duplicados
            $recomendados[$curso['id']] = $curso;
        }
    }
}

// Se convierte el arreglo asociativo en un arreglo indexado para aplicar ordenamiento
$recomendados = array_values($recomendados);

// Función de ordenamiento MergeSort personalizada por un campo específico
function mergeSort($array, $campo) {
    if (count($array) <= 1) return $array;

    $medio = intdiv(count($array), 2);
    $izquierda = array_slice($array, 0, $medio);
    $derecha = array_slice($array, $medio);

    return merge(mergeSort($izquierda, $campo), mergeSort($derecha, $campo), $campo);
}

// Función auxiliar para combinar subarreglos ordenados
function merge($izq, $der, $campo) {
    $resultado = [];
    $i = $j = 0;

    while ($i < count($izq) && $j < count($der)) {
        if ($izq[$i][$campo] <= $der[$j][$campo]) {
            $resultado[] = $izq[$i++];
        } else {
            $resultado[] = $der[$j++];
        }
    }

    while ($i < count($izq)) $resultado[] = $izq[$i++];
    while ($j < count($der)) $resultado[] = $der[$j++];

    return $resultado;
}

// Se determina el criterio de ordenamiento a partir del parámetro GET, por defecto es precio
$orden = $_GET['orden'] ?? 'precioCurso';
$orden = ($orden === 'fechaCurso') ? 'fechaCurso' : 'precioCurso';

// Se ordenan los cursos recomendados usando MergeSort por el campo seleccionado
$recomendados = mergeSort($recomendados, $orden);

// Se importa el archivo CSS para estilizar la sección de cursos
echo '<link rel="stylesheet" href="/Proyecto/Reco/slider.css">';

// Título de la sección de recomendaciones
echo '<h2 style="text-align:center; margin-top:2rem;">Cursos que te pueden gustar</h2>';

// Selector desplegable para cambiar el criterio de ordenamiento (precio o fecha)
echo '<form method="GET" style="text-align:center; margin-bottom:1rem;">
        <label for="orden">Ordenar por:</label>
        <select name="orden" id="orden" onchange="this.form.submit()">
            <option value="precioCurso" ' . ($orden === 'precioCurso' ? 'selected' : '') . '>Precio</option>
            <option value="fechaCurso" ' . ($orden === 'fechaCurso' ? 'selected' : '') . '>Fecha</option>
        </select>
      </form>';

// Contenedor visual de las tarjetas de cursos
echo '<div class="galeria-cursos">';

// Si no hay cursos recomendados, se muestra un mensaje neutro
if (empty($recomendados)) {
    echo "<p style='text-align:center;'>No hay recomendaciones por ahora.</p>";
} else {
    // Se imprime cada curso en forma de tarjeta visual
    foreach ($recomendados as $p) {
        echo "<div class='card'>";
        echo "<img src='/Proyecto/ProductoManager/User/{$p['imagenCurso']}' alt='{$p['nombreCurso']}'>";
        echo "<h3>{$p['nombreCurso']}</h3>";
        echo "<p>{$p['tipoCurso']}</p>";
        echo "<p>\${$p['precioCurso']}</p>";
        echo "<p>{$p['fechaCurso']}</p>";
        echo "</div>";
    }
}
echo '</div>';
?>