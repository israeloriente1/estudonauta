<?php
    /* 
        Arquivo usado para realizar a conexão com o banco de dados (utilizado o XAMPP)
    */

    $banco = new mysqli("localhost", "root", "", "estudonauta");

    if ($banco->connect_errno){
        echo "Não foi possível se conectar ao servidor, erro ($banco->connect_errno): $banco->connect_error";
        die();
    }