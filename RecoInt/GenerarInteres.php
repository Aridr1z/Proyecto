<?php
// Incluye el archivo de conexión a la base de datos.
// Se asume que $con es la variable que mantiene la conexión activa.
include "../ProductoManager/User/conexion.php";

/**
 * Este script genera un grafo de intereses a partir de los cursos registrados.
 * La tabla grafo_intereses representará conexiones del tipo:
 *    interés (categoría) → curso_id
 * Este grafo es útil para recomendaciones personalizadas con base en afinidad temática.
 */

// Elimina todos los datos existentes en la tabla grafo_intereses.
// Esto asegura que el grafo se reconstruya limpio cada vez que se ejecute este script.
mysqli_query($con, "TRUNCATE TABLE grafo_intereses");

// Ejecuta una consulta para obtener todos los cursos y sus tipos asociados.
$resultadoCursos = mysqli_query($con, "SELECT id, tipoCurso FROM productos");

// Recorre cada fila del resultado de cursos
while ($curso = mysqli_fetch_assoc($resultadoCursos)) {

    // $curso['id'] es el identificador único del curso en la base de datos
    $idCurso = $curso['id'];

    // $curso['tipoCurso'] es una cadena con las categorías del curso separadas por comas.
    // 
    // Usamos explode para convertir esa cadena en un arreglo
    $intereses = explode(',', $curso['tipoCurso']); // arreglo con los intereses individuales

    // Recorre cada uno de los intereses del curso actual
    foreach ($intereses as $interesBruto) {

        // $interesBruto puede tener espacios, por ejemplo " Web"
        // trim elimina espacios al inicio y al final
        $interes = trim($interesBruto);

        // Verifica que la cadena de interés no esté vacía
        if ($interes !== '') {

            // Inserta una fila en la tabla grafo_intereses
            // Se registra la relación entre ese interés y el ID del curso
            // Esto se usará luego para sugerencias basadas en afinidad
            mysqli_query($con, "
                INSERT INTO grafo_intereses (interes, curso_id)
                VALUES ('$interes', $idCurso)
            ");
        }
    }
}

echo "Grafo de intereses generado correctamente.";


?>