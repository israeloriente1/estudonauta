<?php
    /*
         Arquivos responsável por imprimir uma url para o usuário ser redirecionado
        para página de login, ou imprimir o nome do usuário caso já esteja logado. 
    */

    if (empty($_SESSION["userEmail"])){
        echo "<span id='userLogin'><a href='./pages/login.php'>Entrar</a></span>";
    }else {
        echo "<span id='userLogin'>Olá, Israel</span>";
    }
?>