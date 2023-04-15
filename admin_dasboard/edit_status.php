<?php
	include('../connection.php');

	$id = $_GET['status_id'];
	$status = $_POST['status'];

	$edit = $connection->query("UPDATE donor SET status='$status' WHERE donor_id='$id'");
	header('location:donor.php');
?>