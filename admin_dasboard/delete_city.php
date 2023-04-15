<?php
	include('../connection.php');

	$id = $_GET['city_id'];

	$delete = $connection->query("DELETE FROM city WHERE city_id='$id'");
	header('location:city.php');
?>