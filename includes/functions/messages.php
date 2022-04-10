<?php
    /* 
        Sistema de mensagens usado para imprimir a string passada por parâmetro dentro de
        um elemento com configurações CSS modificadas, de acordo com a function chamada.
    */

    function successMsg(string $text = null){
        if (!is_null($text)){
            return "<div class='sucessMsg'><span class='material-icons'>check_circle</span> $text</div>";
        }

        return "";
    }

    function warningMsg(string $text = null){
        if (!is_null($text)){
            return "<div class='warningMsg'><span class='material-icons'>warning</span> $text</div>";
        }

        return "";
    }

    function erroMsg(string $text = null){
        if (!is_null($text)){
            return "<div class='erroMsg'><span class='material-icons'>error</span> $text</div>";
        }

        return "";
    }
?>