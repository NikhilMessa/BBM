<?php
	include('../connection.php');

	$id = $_GET['city_id'];

	$code = $_POST['code'];
	$city = $_POST['name'];
	$state = $_POST['state'];

	$update = $connection->query("UPDATE city SET city_code = '$code', city_name='$city', state_fk='$state' WHERE city_id='$id'");
	header('location:city.php');
?>