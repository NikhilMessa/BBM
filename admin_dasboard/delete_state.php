<?php
	include('../connection.php');

	$id = $_GET['state_id'];

	$delete = $connection->query("DELETE FROM state WHERE state_id='$id'");
	header('location:state.php');
?>