<?php
$taskid = $_POST['taskid'];
$status = $_POST['status'];

include('config.php');
$query = mysqli_query($con,"UPDATE task_repetition SET rep_status='$status' WHERE id='$taskid'");

if($query) {
	echo "Success";
}else {
	echo "Failed";
}

mysqli_close($con);
?>