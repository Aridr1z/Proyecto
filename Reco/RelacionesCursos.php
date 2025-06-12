<?php
include "conexion.php"; // Se establece conexión con la base de datos

// Se verifica si el usuario ha iniciado sesión como cliente
if (!isset($_SESSION['id']) || $_SESSION['rol'] !== 'cliente') {
    echo "<p>Inicia sesión como cliente para ver recomendaciones.</p>";
} else {
    $uid = intval($_SESSION['id']); // ID del usuario autenticado

    // Se recuperan todos los cursos que el usuario ha comprado
    $compras = mysqli_query($con, "SELECT id_producto FROM compras WHERE id_usuario = $uid");
    $comprados = [];
    while ($row = mysqli_fetch_assoc($compras)) {
        $comprados[] = $row['id_producto']; // Se almacena cada ID de producto en un arreglo
    }

    if (!empty($comprados)) {
        // Se elige uno de los cursos comprados como punto de partida para BFS
        $inicio = $comprados[0];

        // Se construye el grafo a partir de la tabla relaciones_cursos
        // Cada nodo es un curso y cada arista representa una co-compra con su respectivo peso
        $grafo = [];
        $res = mysqli_query($con, "SELECT * FROM relaciones_cursos");
        while ($rel = mysqli_fetch_assoc($res)) {
            $a = $rel['curso_origen_id'];
            $b = $rel['curso_destino_id'];
            $peso = $rel['peso']; // Representa la frecuencia de co-compra

            // El grafo es no dirigido: se registra en ambas direcciones
            $grafo[$a][$b] = $peso;
            $grafo[$b][$a] = $peso;
        }

        // Se implementa búsqueda en anchura (BFS) para explorar cursos relacionados
        $visitados = [];                   // Marcar nodos ya explorados
        $cola = [[$inicio, 0]];           // Cola para BFS con tupla [nodo, nivel]
        $relacionados = [];               // Cursos recomendados con su distancia (nivel)

        while (!empty($cola)) {
            [$nodo, $nivel] = array_shift($cola);

            if (!isset($visitados[$nodo])) {
                $visitados[$nodo] = true;

                // Solo se agregan nodos que no sean el curso base ni ya comprados
                if ($nodo != $inicio && !in_array($nodo, $comprados)) {
                    $relacionados[] = ["id" => $nodo, "nivel" => $nivel];
                }

                // Se agregan vecinos no visitados a la cola
                foreach ($grafo[$nodo] ?? [] as $vecino => $p) {
                    if (!isset($visitados[$vecino])) {
                        $cola[] = [$vecino, $nivel + 1];
                    }
                }
            }
        }

        // Se consulta información detallada de los cursos relacionados
        $cursos = [];
        foreach ($relacionados as $info) {
            $id = $info['id'];
            $nivel = $info['nivel'];

            $q = mysqli_query($con, "SELECT * FROM productos WHERE id = $id");
            if ($p = mysqli_fetch_assoc($q)) {
                $p['nivel'] = $nivel; // Se incluye la distancia desde el curso base
                $cursos[] = $p;
            }
        }

        // Función QuickSort para ordenar cursos según un campo (precio o fecha)
        function quickSort(array $arr, string $campo): array {
            if (count($arr) < 2) return $arr;

            $pivot = $arr[0];
            $menores = [];
            $mayores = [];

            for ($i = 1; $i < count($arr); $i++) {
                if ($arr[$i][$campo] <= $pivot[$campo]) {
                    $menores[] = $arr[$i];
                } else {
                    $mayores[] = $arr[$i];
                }
            }

            return array_merge(quickSort($menores, $campo), [$pivot], quickSort($mayores, $campo));
        }

        // Se define el criterio de ordenamiento: precioCurso (default) o fechaCurso
        $orden = $_GET['orden'] ?? 'precioCurso';
        $orden = in_array($orden, ['precioCurso', 'fechaCurso']) ? $orden : 'precioCurso';
        $cursos = quickSort($cursos, $orden);

        // Se renderiza el bloque visual con los cursos recomendados
        if (!empty($cursos)) {
            echo '<link rel="stylesheet" href="/Proyecto/Reco/slider.css">';
            echo '<h2 style="text-align:center; margin-top:2rem;">Cursos recomendados para ti</h2>';

            // Menú desplegable para cambiar el criterio de orden
            echo '<form method="GET" style="text-align:center; margin-bottom:1rem;">
                    <label for="orden">Ordenar por:</label>
                    <select name="orden" id="orden" onchange="this.form.submit()">
                        <option value="precioCurso" ' . ($orden === 'precioCurso' ? 'selected' : '') . '>Precio</option>
                        <option value="fechaCurso" ' . ($orden === 'fechaCurso' ? 'selected' : '') . '>Fecha</option>
                    </select>
                  </form>';

            // Se muestran los cursos en tarjetas visuales
            echo '<div class="galeria-cursos">';
            foreach ($cursos as $p) {
                echo "<div class='card'>";
                echo "<img src='/Proyecto/ProductoManager/User/{$p['imagenCurso']}' alt='{$p['nombreCurso']}'>";
                echo "<h3>{$p['nombreCurso']}</h3>";
                echo "<p>{$p['tipoCurso']}</p>";
                echo "<p>\${$p['precioCurso']}</p>";
                echo "<p>Fecha: {$p['fechaCurso']}</p>";
                echo "<p><strong>Distancia: Nivel {$p['nivel']}</strong></p>"; // Nivel de relación en el grafo
                echo "</div>";
            }
            echo '</div>';
        }
    }
}

?>