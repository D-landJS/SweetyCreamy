<?php
include "config.php";
include "util.php";

$dbConn = connect($db);
//Se conecta con la base de datos

//Se incidca el método de envio: GET, POST, PUT, DELETE
if ($_SERVER['REQUEST_METHOD'] == 'GET')
{
    if(isset($_GET["idcategoria"])){


    }
    else{
        $sql = $dbConn->prepare("SELECT * FROM postres");
        $sql->execute();//Se ejecuta la consulta
        $sql->setFetchMode(PDO::FETCH_ASSOC);//Se indica el modo de recuperacion
        header("HTTP/1.1 200 OK");//Mensaje de error
        echo json_encode( $sql->fetchAll()  ); //Se devuelve toda la consulta en formato json
        exit();
    }
    
}
if ($_SERVER['REQUEST_METHOD'] == 'POST'){
    $sql = $dbConn->prepare("SELECT * FROM postres where idCategoria=:idcategoria");
    $sql->bindValue(':idcategoria', $_POST['idcategoria']);;
    $sql->execute();//Se ejecuta la consulta
    $sql->setFetchMode(PDO::FETCH_ASSOC);//Se indica el modo de recuperacion
    header("HTTP/1.1 200 OK");//Mensaje de error
    echo json_encode( $sql->fetchAll()  ); //Se devuelve toda la consulta en formato json
     exit();
}

?>