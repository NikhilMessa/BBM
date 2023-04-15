<?php
	include('../connection.php');
	session_start();

	$name = $_POST['name'];
	$username = $_POST['username'];
	$password = $_POST['password'];
	$email = $_POST['email'];
	$phone = $_POST['phone'];
	$address = $_POST['address'];

	$fileInfo = PATHINFO($_FILES["photo"]["name"]);
	
	if (empty($_FILES["photo"]["name"])){
		$location="";
	}
	else{
		if ($fileInfo['extension'] == "jpg" OR $fileInfo['extension'] == "png") {
			$newFilename = $fileInfo['filename'] . "_" . time() . "." . $fileInfo['extension'];
			move_uploaded_file($_FILES["photo"]["tmp_name"], "../upload/" . $newFilename);
			$location = "upload/" . $newFilename;
		}
		else{
			$location="";
			?>
				<script>
					window.alert('Photo not added. Please upload JPG or PNG photo only!');
				</script>
			<?php
		}
	}


	if(!$_SERVER['REQUEST_METHOD'] == 'POST'){
		$_SESSION['state_error'] = '';
	}else {
		$insert = $connection->query("INSERT INTO member(name, username, password, email, phone, address, usertype, profile) VALUES('$name', '$username', '$password', '$email', '$phone', '$address', 'user', '$location')");
		$_SESSION['state_success'] = '';
		header('location:members.php');
	}
?>