<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <title>Document</title>
    <style>
        
    </style>
</head>
<body>
    <!-- Arquivo usado apenas para teste e exemplos para outras páginas -->
    <?php 
        echo password_hash("Nevilles1526", PASSWORD_DEFAULT, ["cost" => 13]);
    ?>
</body>
</html>