<?php
$hours = $_POST['hours'];
$taskid = $_POST['taskid'];
$userid = $_POST['userid'];
$date = $_POST['date'];
$skillid = $_POST['skillid'];

include('config.php');
$query = mysqli_query($con,"INSERT INTO task_repetition (task_id, date, user_id, duration, skill_type_id)
VALUES ('$taskid', '$date', '$userid', '$hours', '$skillid' )");

if($query) {
	echo "Successful task addition";
}else {
	echo "Failed task addition";
}

mysqli_close($con);
?>