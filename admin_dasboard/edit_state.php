<?php
	include('../connection.php');

	$id = $_GET['state_id'];

	$code = $_POST['code'];
	$state = $_POST['name'];

	$update = $connection->query("UPDATE state SET state_code = '$code', state_name='$state' WHERE state_id='$id'");
	header('location:state.php');
?>