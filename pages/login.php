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
        session_start();
        $erroMsg = "";

        if (!isset($_SESSION["userID"])){ // Caso o usuário não esteja logado.

            if (isset($_POST["userEmail"]) && isset($_POST["userPassword"])){ // Se o usuário tiver passado os dados.

                // Irá verificar se o email e senha estão no formato correto.
                $userEmail = filter_var($_POST["userEmail"], FILTER_VALIDATE_EMAIL) ? $_POST["userEmail"] : "";
                $userPassword = preg_match("/^\S+$/i", $_POST["userPassword"]) ? $_POST["userPassword"] : "";

                if (!empty($userEmail) && !empty($userPassword)){ // Caso os valores estejam no formato correto.
                    require_once "../includes/mysql/banco.php";

                    // Irá retornar uma string segura para ser usada na consulta SQL.
                    $userEmail = $banco->real_escape_string($userEmail);
                    $userPassword = $banco->real_escape_string($userPassword);
                    $userInfo = $banco->query("select id, nome, senha, tipo from usuario where email = '$userEmail';");

                    switch($userInfo->num_rows){
                        case 1:
                            $userInfo = $userInfo->fetch_object();

                            if (password_verify($userPassword, $userInfo->senha)){
                                $_SESSION["userID"] = $userInfo->id;
                                $_SESSION["userName"] = $userInfo->nome;
                                $_SESSION["userType"] = $userInfo->tipo;
                                header("location: ../index.php");
                            }else {
                                $erroMsg = "Senha inválida";
                                $userEmail = "";
                                $userPassword = "";
                            }
                            
                            break;
                        default:
                            $erroMsg = "Email não encontrado";
                            $userEmail = "";
                            $userPassword = "";
                    }

                    $banco->close();
                }

                /* 
                    Se as variáveis ($userEmail) e ($userPassword) estiverem vazias,
                    isso significa que os dados informados não foram encontrado no banco de dados
                    ou não possui o formato válido de email e senha. 
                */
                if (empty($userEmail) || empty($userPassword)){
                    $erroMsg = empty($erroMsg) ? erroMsg("Email ou Senha inválido.") : erroMsg($erroMsg);
                    echo "
                        <div id='login'>
                            <div class='form'>
                                <h1>Fazer login</h1>
                                $erroMsg
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
                }
            }else {
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
            }
        }else { // Caso o usuário esteja logado.
            header("location: ./index.php");
        }
    ?>

    <script>
        divForm = document.getElementsByClassName("form")[0];
        inputEmail = document.getElementById("userEmail");
        inputPassword = document.getElementById("userPassword");

        inputEmail.addEventListener("keydown", verify);
        inputPassword.addEventListener("keydown", verify);

        function verify(){
            if (divForm.children.length > 2){
                divForm.removeChild(divForm.children[1]);
            }
        }
    </script>
</body>
</html>