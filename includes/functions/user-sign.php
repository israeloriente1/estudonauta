<?php
    /*
         Arquivos responsável por imprimir uma url para o usuário ser redirecionado
        para página de login, ou imprimir o nome do usuário caso já esteja logado. 
    */

    if (empty($_SESSION["userID"])){
        echo "<span id='userLogin'><a href='./pages/login.php'>Entrar</a></span>";
    }else {
        $userFirstName = explode(" ", $_SESSION["userName"])[0];
        $userFirstName = ucwords(strtolower($userFirstName));
        echo "<span id='userLogin'><a href='./pages/logout.php'>Olá, $userFirstName</a></span>";
    }
?>