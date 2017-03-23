<?php

if (isset($_GET['name']) && isset($_GET['password'])) {
	
	$name = $_GET['name'];
	$password = sha1($_GET['password']);
	
	
	require_once __DIR__ . "/db_config.php";
	$db = new PDO(DB_CONNEXION, DB_USER, DB_PASSWORD);
	
	$query = "SELECT COUNT(*) AS TOTAL FROM utilisateur WHERE nom_utilisateur = '".$name."' AND passe_utilisateur = '".$password."'";
	
	$result = $db->query($query);
	$result = $result->fetch(PDO::FETCH_ASSOC);
	

	if ($result['TOTAL'] == 0)
	{
		$responses = '{"query_result" : "FALSE"}';
	} else {
		$responses = '{"query_result" : "TRUE"}';
	}
	
	echo $responses;
	
}
