
<?php
$server = "localhost";
$database = "proyecto";
$user = "root";
$password = "1221";



$con = mysqli_connect ($server,$user,$password,$database);

if ($con){

    echo "Conexion Existosa <br>";


}else{

    echo "No se pudo conectar";
}

?>

