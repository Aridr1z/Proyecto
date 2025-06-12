<?php
// Conexión a la base de datos
include "../ProductoManager/User/conexion.php";

// Inicializamos la estructura que almacenará las relaciones del grafo de intereses
$grafo_intereses = [];

// Consulta para obtener todos los registros del grafo de intereses
$res = mysqli_query($con, "SELECT * FROM grafo_intereses");

// Arrays para nodos y conexiones (aristas)
$nodes = [];     // Contendrá todos los nodos: claves (intereses) y cursos
$edges = [];     // Contendrá las relaciones clave → curso

// Este arreglo agrupa los intereses por curso para luego crear etiquetas con sus claves
$cursoLabels = [];

while ($rel = mysqli_fetch_assoc($res)) {
    $interes = $rel['interes'];       // Clave o categoría de interés (ej: "programación")
    $curso_id = $rel['curso_id'];     // ID del curso relacionado con ese interés

    // Si el nodo de clave aún no ha sido creado, lo agregamos como elipse de color distintivo
    $nodes[$interes] = [
        "id" => $interes,
        "label" => $interes,
        "shape" => "ellipse",
        "color" => "#ffd6a5" // naranja claro
    ];

    // Agrupamos los intereses asociados a un curso para mostrar en su etiqueta
    if (!isset($cursoLabels[$curso_id])) {
        $cursoLabels[$curso_id] = [];
    }
    $cursoLabels[$curso_id][] = $interes;

    // Creamos una conexión entre la clave y el curso
    $edges[] = ["from" => $interes, "to" => $curso_id];
}

// Ahora creamos los nodos de los cursos y les asignamos etiquetas con sus intereses
foreach ($cursoLabels as $curso_id => $intereses) {
    $label = "Curso $curso_id\n(" . implode(", ", $intereses) . ")";

    $nodes[$curso_id] = [
        "id" => $curso_id,
        "label" => $label,
        "shape" => "box",        // Nodo tipo caja para distinguir cursos
        "color" => "#b5ead7"     // verde claro
    ];
}
?>


<!DOCTYPE html>
<html>
<head>
  <title>Grafo de Intereses</title>

  <!-- Librería para visualizar grafos (vis-network) -->
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
  <h2 style="text-align:center;">Grafo de Intereses (categoría → cursos)</h2>
  <div id="grafo"></div>

  <script>
    // Convertimos los nodos y aristas desde PHP a estructuras de JavaScript
    const nodes = new vis.DataSet(<?php echo json_encode(array_values($nodes)); ?>);
    const edges = new vis.DataSet(<?php echo json_encode($edges); ?>);

    // Definimos el contenedor donde se visualizará el grafo
    const container = document.getElementById("grafo");
    const data = { nodes, edges };

    // Configuración del grafo
    const options = {
      nodes: {
        font: { size: 14 } // Tamaño de fuente de los nodos
      },
      edges: {
        arrows: "to" // Las conexiones apuntan del interés hacia el curso
      },
      layout: {
        improvedLayout: true // Mejora el posicionamiento automático
      }
    };

    // Creación del grafo visual en pantalla
    const network = new vis.Network(container, data, options);
  </script>
</body>
</html>