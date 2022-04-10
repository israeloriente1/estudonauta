<?php
    /*
        encrypt() = Irá aplicar uma criptografia simples apenas para servir de exemplo
        a string passada por parâmetro

        passwordValidate() = Irá validar se a string passada por parâmetro é válida
        com o hash passado no segundo parâmetro.
    */

    function encrypt(string $txt = null){
        $encrypt = "";

        for ($l = 0; $l < strlen($txt); $l++){
            $encrypt .= chr(ord($txt[$l]) + 1);
        }

        return $encrypt;
    }
    
    function passwordValidate(string $password = null, string $hash = null){
        if (password_verify($password, $hash)){
            return "Success";
        }else {
            return "Fail";
        }
    }
?>