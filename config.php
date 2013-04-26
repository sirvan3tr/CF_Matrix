<?php
// Create connection
$con=mysqli_connect("localhost","cf_matrix","password","cf_matrix");
//$con=mysqli_connect("localhost","root","rootwdp","cf_matrix");

// Check connection
if (mysqli_connect_errno($con))
  {
  echo "Failed to connect to MySQL: " . mysqli_connect_error();
  }
?>