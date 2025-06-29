<?php
$senha = 'usuario123';
$hash = password_hash($senha, PASSWORD_DEFAULT);
echo "Hash gerado para 'usuario123': <br>";
echo "<pre>$hash</pre>";
?>
