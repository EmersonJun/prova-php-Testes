<?php
$senhaDigitada = 'usuario123';
$hash = '$2y$10$0vo68ceuv/ten3/BPIedCevLTUzdWudtdpbfCQvJTYW4mVyAf6/Ru'; // hash da senha admin123

if (password_verify($senhaDigitada, $hash)) {
    echo "Senha válida!";
} else {
    echo "Senha inválida!";
}
?>
