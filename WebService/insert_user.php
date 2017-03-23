<?php
require_once __DIR__ . "/db_config.php";

$name = $_GET['name'];
$password = sha1($_GET['password']);

$db = new PDO(DB_CONNEXION, DB_USER, DB_PASSWORD);
$result = $db->query("INSERT INTO utilisateur (nom_utilisateur, passe_utilisateur)	VALUES ('$name', '$password')");

if($result == true) {
	echo '{"query_result":"SUCCESS"}';
}
else{
	echo '{"query_result":"FAILURE"}';
}