<?php
include "conexion.php"; // Se incluye la conexión a la base de datos

// Consulta que obtiene todos los usuarios registrados con rol "cliente"
$usuarios = mysqli_query($con, "SELECT id FROM usuarios WHERE rol = 'cliente'");

// Se itera sobre cada usuario para analizar sus compras
while ($user = mysqli_fetch_assoc($usuarios)) {
    $uid = $user['id']; // ID del usuario actual

    // Se obtienen todos los cursos comprados por este usuario, sin repeticiones
    $compras = mysqli_query($con, "
        SELECT DISTINCT id_producto 
        FROM compras 
        WHERE id_usuario = $uid
    ");

    // $cursos almacena los ID de los cursos que compró el usuario
    $cursos = [];
    while ($row = mysqli_fetch_assoc($compras)) {
        $cursos[] = $row['id_producto'];
    }

    // Se generan todas las combinaciones únicas entre los cursos comprados
    // Estas combinaciones representan conexiones entre cursos que han sido adquiridos juntos
    $n = count($cursos);
    for ($i = 0; $i < $n; $i++) {
        for ($j = $i + 1; $j < $n; $j++) {
            $a = $cursos[$i];
            $b = $cursos[$j];

            // Se asegura que los IDs se almacenen siempre en orden ascendente (para evitar duplicados invertidos)
            $origen  = min($a, $b);
            $destino = max($a, $b);

            // Se verifica si ya existe una relación entre estos dos cursos
            $existe = mysqli_query($con, "
                SELECT id, peso 
                FROM relaciones_cursos 
                WHERE curso_origen_id = $origen AND curso_destino_id = $destino
            ");

            // Si ya existe la relación, se incrementa el peso (cantidad de veces que han sido comprados juntos)
            if ($rel = mysqli_fetch_assoc($existe)) {
                $nuevo_peso = $rel['peso'] + 1;

                mysqli_query($con, "
                    UPDATE relaciones_cursos 
                    SET peso = $nuevo_peso 
                    WHERE id = {$rel['id']}
                ");
            } else {
                // Si no existe la relación, se crea con peso inicial 1
                mysqli_query($con, "
                    INSERT INTO relaciones_cursos (curso_origen_id, curso_destino_id, peso)
                    VALUES ($origen, $destino, 1)
                ");
            }
        }
    }
}




?>