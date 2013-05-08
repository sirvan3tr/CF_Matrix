<?php
$hours = $_POST['hours'];
$skilltypeid = $_POST['skilltypeid'];
$date = $_POST['date'];
$bulktotalhrs = $_POST['bulktotalhrs'];

include('config.php');

if ($bulktotalhrs==0) {
	$query = mysqli_query($con,"INSERT INTO skill_hrs_bulk_addition (hrs, skill_type_id, date)
	VALUES ('$hours', '$skilltypeid', '$date')");
} else {
	$query = mysqli_query($con,"UPDATE skill_hrs_bulk_addition SET hrs='$hours'
	WHERE date='$date' AND skill_type_id='$skilltypeid'");	
}





if($query) {
	echo "Success";
}else {
	echo "Failed";
}

mysqli_close($con);
?>