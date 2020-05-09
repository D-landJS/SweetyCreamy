<?php
include "config.php";
include "util.php";

$dbConn = connect($db);
//Se conecta con la base de datos

//Se incidca el método de envio: GET, POST, PUT, DELETE
if ($_SERVER['REQUEST_METHOD'] == 'GET')
{
    $sql = $dbConn->prepare("SELECT * FROM categorias");
      $sql->execute();//Se ejecuta la consulta
      $sql->setFetchMode(PDO::FETCH_ASSOC);//Se indica el modo de recuperacion
      header("HTTP/1.1 200 OK");//Mensaje de error
      echo json_encode( $sql->fetchAll()  ); //Se devuelve toda la consulta en formato json
      exit();

}

?>