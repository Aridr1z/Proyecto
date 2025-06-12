<?php
include "../ProductoManager/User/conexion.php"; // Incluye la conexión a la base de datos

// Consulta para obtener las relaciones entre cursos con sus respectivos nombres
// Se realiza un JOIN doble para obtener el nombre del curso de origen y destino
$res = mysqli_query($con, "
    SELECT rc.*, p1.nombreCurso AS nombreA, p2.nombreCurso AS nombreB 
    FROM relaciones_cursos rc
    JOIN productos p1 ON rc.curso_origen_id = p1.id
    JOIN productos p2 ON rc.curso_destino_id = p2.id
");

// Inicializamos los arreglos para nodos y aristas del grafo
$nodes = []; // Representa los cursos (nodos)
$edges = []; // Representa las relaciones de co-compra entre cursos (aristas)

while ($rel = mysqli_fetch_assoc($res)) {
    $a = $rel['curso_origen_id'];    // ID del curso de origen
    $b = $rel['curso_destino_id'];   // ID del curso de destino
    $peso = $rel['peso'];            // Peso de la relación (número de co-compras)
    $nombreA = $rel['nombreA'];      // Nombre del curso de origen
    $nombreB = $rel['nombreB'];      // Nombre del curso de destino

    // Agregamos los nodos (evitamos duplicados al usar el ID como clave)
    $nodes[$a] = ["id" => $a, "label" => $nombreA];
    $nodes[$b] = ["id" => $b, "label" => $nombreB];

    // Agregamos la arista con etiqueta del peso
    $edges[] = ["from" => $a, "to" => $b, "label" => "Peso $peso"];
}
?>


<!DOCTYPE html>
<html>
<head>
    <title>Grafo de Compras</title>
    <script src="https://unpkg.com/vis-network/standalone/umd/vis-network.min.js"></script>
    <style>
        #grafo {
            width: 100%;
            height: 600px;
            border: 1px solid lightgray;
        }
    </style>
</head>
<body>
    <h2 style="text-align:center;">Grafo de Compras (Relaciones entre cursos)</h2>
    <div id="grafo"></div>

    <script>
        const nodes = new vis.DataSet(<?= json_encode(array_values($nodes)) ?>);
        const edges = new vis.DataSet(<?= json_encode($edges) ?>);

        const container = document.getElementById('grafo');
        const data = { nodes: nodes, edges: edges };
        const options = {
            nodes: {
                shape: 'dot',
                size: 20,
                font: { size: 14, color: "#000" },
                color: {
                    border: '#3c6e71',
                    background: '#d9ed92'
                }
            },
            edges: {
                arrows: 'to',
                font: { align: 'middle' },
                color: { color: '#999' }
            },
            physics: {
                enabled: true,
                barnesHut: { gravitationalConstant: -30000 }
            }
        };

        new vis.Network(container, data, options);


    </script>
</body>
</html>