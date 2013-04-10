<?php
$hours = $_POST['hours'];
$taskid = $_POST['taskid'];
$userid = $_POST['userid'];
$date = $_POST['date'];

include('config.php');


mysqli_query($con,"INSERT INTO task_repetition (task_id, date, user_id, duration)
VALUES ('$taskid', '$date', '$userid', '$hours' )");

?>