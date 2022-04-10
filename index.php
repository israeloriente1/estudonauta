<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles/index.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <title>Catálogo</title>
</head>
<body>

    <?php
        require_once "./includes/mysql/banco.php";
        require_once "./includes/functions/thumb.php";
        require_once "./includes/functions/messages.php";

        $searchValue = $_GET["filter"] ?? ""; // Recebe o valor passado na caixa de pesquisa.
        $order = $_GET["order"] ?? ""; // Recebe o valor do parâmetro "order" passado por GET.
    ?>
    <header>
        <h1>Melhores jogos</h1>

        <nav>
            <span><a href="./index.php?order=nome&filter=<?php echo $searchValue;?>" >Nome</a></span>
            <span><a href="./index.php?order=produtora&filter=<?php echo $searchValue;?>" >Produtora</a></span>
            <span><a href="./index.php?order=maior&filter=<?php echo $searchValue;?>" >Maior nota</a></span>
            <span><a href="./index.php?order=menor&filter=<?php echo $searchValue;?>" >Menor nota</a></span>
            <span><a href="./index.php">Mostrar todos</a></span>
            <form action= "./index.php" method="get">
                <input type="text" name="filter" id="filterGame">
                <input type="submit" value="Buscar">
            </form>           
            <?php require_once "./includes/functions/user-sign.php"; ?>
        </nav>
    </header>

    <main>
        <?php

            # Consulta ao banco de dados de acordo com o valor dos parâmetros.

            $jogo = "select * from getJogos ";

            if (!empty($searchValue)){
                $jogo .= "where nome like '%$searchValue%' or produtora like '%$searchValue%' ";
            }

            if (!empty($order and preg_match("/^[a-z]+$/", $order))){
                switch($order){
                    case "nome":
                        $jogo .= "order by nome";
                        break;

                    case "produtora":
                        $jogo .= "order by produtora";
                        break;

                    case "maior":
                        $jogo .= "order by nota desc";
                        break;

                    case "menor":
                        $jogo .= "order by nota asc";
                        break;
                }
            }
            $jogo = $banco->query($jogo);

            # Retorno a página de acordo com o resultado da consulta realizada.

            if (!$jogo or $jogo->num_rows < 1){
                // Caso a solicitação não ocorra corretamente ou se não retornar nenhum registro.

                if (!$jogo){
                    echo "<p class='erro'>Ops! Parece que houve algum problema, por favor tente novamente mais tarde !</p>";
                }elseif ($jogo->num_rows < 1) {
                    echo "<p class='erro'>Não foi encontrado nenhum resultado</p>";
                }

            }else {
                while ($reg = $jogo->fetch_object()){ // Enquanto retonar um novo objeto com os registro da consulta
                    $capa = thumb(".", $reg->capa);
                    echo "
                        <a href='./pages/infoJogo.php?id=$reg->id' target='_self'>
                            <div class='jogo'>
                                <img src='$capa' alt='$reg->nome' class='cover'>
                                <div class='detalhesJogo'>
                                    <h3>$reg->nome</h3>
                                    <span>$reg->genero - $reg->produtora</span>
                                </div>
                            </div>
                        </a> 
                    ";
                }                
            }
        ?>               
    </main>

    <footer>
        <p>
            Desenvolvido por <a href="https://github.com/israeloriente1" target="_blank" rel="external">IsraelOriente</a>
        </p>
    </footer>
    <?php $banco->close(); ?>
</body>
</html>