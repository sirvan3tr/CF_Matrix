<?php
$date = $_POST['date'];
$userid = $_POST['userid'];
$status = $_POST['status'];

include('config.php');
$query = mysqli_query($con,"UPDATE task_repetition SET rep_status='$status'
WHERE date='$date' AND user_id='$userid'");

if($query) {
	echo "Success";
}else {
	echo "Failed";
}

mysqli_close($con);
?>