<?php
	include('../connection.php');
	session_start();

	$code = $_POST['code'];
	$state = $_POST['state'];
	$city = $_POST['city'];
	$description = $_POST['description'];

	if(!$_SERVER['REQUEST_METHOD'] == 'POST'){
		$_SESSION['state_error'] = '';
	}else {
		$insert = $connection->query("INSERT INTO city(city_code, city_name, description, state_fk) VALUES('$code', '$city', '$description', '$state')");
		$_SESSION['state_success'] = '';
		header('location:city.php');
	}
?>