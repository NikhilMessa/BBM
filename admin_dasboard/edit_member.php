<?php
	include('../connection.php');

	$id = $_GET['member_id'];

	$name = $_POST['name'];
	$type = $_POST['type'];

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

	$update = $connection->query("UPDATE member SET name = '$name', usertype='$type', profile='$location' WHERE member_id='$id'");
	header('location:members.php');
?>