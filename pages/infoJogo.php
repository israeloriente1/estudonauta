<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../styles/infoJogo.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <title>Informações</title>
</head>
<body>
    <main>
        <?php
            require_once "../includes/mysql/banco.php";
            require_once "../includes/functions/thumb.php";
            require_once "../includes/functions/back.php";
            require_once "../includes/functions/messages.php";
            
            $idJogo = $_GET["id"] ?? 0; // id do jogo passado pelo por parâmetro GET
            $backButton = backButton();

            if ($idJogo <= 0){ // id inexistente
                echo "
                        <div class='jogo'>
                            <p>Ops! Parece que tivemos um problema, tente novamente mais tarde !</p>
                            <a href='../index.php' target='_self' rel='prev'>$backButton</a>
                        </div>
                    ";
            }elseif ($idJogo > 0) {
                $jogoInfo = $banco->query("call getJogoInfo($idJogo)"); // Irá retornar as informações do jogo com o id passado

                if (!$jogoInfo or $jogoInfo->num_rows <> 1){
                    echo "
                            <div class='jogo'>
                                <p>Ops! Parece que tivemos um problema, tente novamente mais tarde !</p>
                                <a href='../index.php' target='_self' rel='prev'>$backButton</a>
                            </div>
                        ";
                }else {
                    $jogoInfo = $jogoInfo->fetch_object();
                    $capa = thumb("..", $jogoInfo->capa);                
                    
                    echo "
                            <div class='jogo'>
                            <img src='$capa' alt='$jogoInfo->nome'>
                                <div class='info'>
                                    <h1>$jogoInfo->nome</h1>
                                    <p><strong>Nota</strong>: $jogoInfo->nota/10</p>
                                    <p><strong>Descrição</strong>: $jogoInfo->descricao</p>
                                </div>
                                <a href='../index.php' target='_self' rel='prev'>$backButton</a>
                            </div>
                        ";
                }                
            }
        ?>
    </main>

    <?php $banco->close()?>
</body>
</html>