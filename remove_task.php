<?php
$taskid = $_POST['taskid'];
include('config.php');

$query = mysqli_query($con,"DELETE FROM task_repetition WHERE id='$taskid'");

if($query) {
	echo "Task has been removed.";
}else {
	echo "Error: Task has not been removed.";
}
?>