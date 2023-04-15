<?php
	include('../connection.php');
	session_start();

	$code = $_POST['code'];
	$state = $_POST['state'];
	$description = $_POST['description'];

	if(!$_SERVER['REQUEST_METHOD'] == 'POST'){
		$_SESSION['state_error'] = '';
	}else {
		$insert = $connection->query("INSERT INTO state(state_code, state_name, description) VALUES('$code', '$state', '$description')");
		$_SESSION['state_success'] = '';
		header('location:state.php');
	}
?>