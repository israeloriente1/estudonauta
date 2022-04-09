<?php

/*
    string $pontos = Será passado a pasta que a variável caminho deve seguir no ponto inicial
        ex: . = pasta atual, .. = pasta anterior e por ai vai
        
    string $nomeImagem = Nome do arquivos que deve ser encontrado, 
        ex: mario.png, menu.jpeg
*/

function thumb(string $pontos = null, string $nomeImagem = null){
    $caminho = "$pontos/images/jogos/$nomeImagem";

    if (file_exists($caminho)){
        return $caminho;
    }else {
        return "$pontos/images/jogos/indisponivel.png";
    }
}