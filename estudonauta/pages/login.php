<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="../styles/login.css">
    <title>Login</title>
</head>
<body>
    <?php
        require_once "../includes/functions/messages.php";
        require_once "../includes/functions/back.php";

        /*
            As variáveis $_SESSION irão receber o valor passado por POST, porém serão verificado se estão de acordo
            com os padrões de Email e Senha como devem.
        */

        $_SESSION["userEmail"] = $_POST["userEmail"] ?? null;
        $_SESSION["userEmail"] = preg_match("/^\w+@\w+\.\w{2,3}$|^\w+@\w+\.\w{2,3}\.\w{2,3}$/i", $_SESSION["userEmail"]) ? $_SESSION["userEmail"] : null;

        $_SESSION["userPassword"] = $_POST["userPassword"] ?? null;
        $_SESSION["userPassword"] = preg_match("/^[\S]+$/i", $_SESSION["userPassword"]) ? $_SESSION["userPassword"] : null;

        

        if (is_null($_SESSION["userEmail"]) || is_null($_SESSION["userPassword"])){
            echo "
                <div id='login'>
                    <div class='form'>
                        <h1>Fazer login</h1>
                        <form action='../pages/login.php' method='post'>
                            <p>Email</p>
                            <input type='email' name='userEmail' id='userEmail' required>
                            <p>Senha</p>
                            <input type='password' name='userPassword' id='userPassword' required>
                            <input type='submit' value='Entrar' class='button'>
                        </form>
                    </div>
                </div>
            ";
        }else {
            $msg = successMsg("Login realizado");
            $button = "<a href='../index.php'>". backButton(). "</a>";
            echo "
                <div id='login'>
                    <div class='form'>
                        $msg </br>
                        $button
                    </div>
                </div>
            ";
        }
    ?>
</body>
</html>