<?php
$handle = fopen("jobtracking.csv", "r");
// Read first (headers) record only)

while(! feof($handle))
  {
  $data = fgetcsv($handle, 0, ",");
  $sql= '(';
  for($i=0;$i<count($data); $i++) {
  $sql .= "'".$data[$i]."', ";
  }
  //The line below gets rid of the comma
  $sql = substr($sql,0,strlen($sql)-2);
  echo $sql .'), <br />';
  }
fclose($handle);
?>