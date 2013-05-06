<?php include('header.php'); ?>
<div class="container-fluid">
  <div class="row-fluid">
    <div class="span12">
      <table id="skill-report" class="table table-striped">
        <thead>
     <?php
      include("config.php");
      echo '<th>';
  for ($i = 0; $i <= 11; $i++) {
        echo '<td class="content">'.date("F",strtotime($i."Months")).'</td>';
  }
      echo '</th>';

      echo "</thead><tbody>";
      $query = mysqli_query($con, "SELECT * FROM skill_type");
        while($row = mysqli_fetch_array($query))
        {
        echo "<tr>";
        echo '<td ><span class="matrixtaskname fl"><span data-toggle="tooltip" title="" data-original-title="' . $row['skill_full'] . '" class="matrixhours" style="background-color:'.$row['color'].';">'. $row['skill'] . '</span> '.$row['skill_full'].'</td>';
        $skilltypeid = $row['id'];

for ($i = 0; $i <= 11; $i++) {
        echo '<td class="content">';
        $date = date("Y-m-d",strtotime($i."Months"));
        list($year, $month, $day) = explode('-', $date);

    $firstdate = date('Y-m-d', mktime(0, 0, 0, $month, 1, $year));
    $lastdate = date('Y-m-t', mktime(0, 0, 0, $month, 1, $year));

    $queryhours = mysqli_query($con, "SELECT * FROM task_repetition WHERE skill_type_id='$skilltypeid' and date >= '$firstdate' and date <= '$lastdate' ");
    $totalhrs = 0;
    while($rowhours = mysqli_fetch_array($queryhours))
      {
        $totalhrs = $totalhrs + $rowhours['duration'];
        
      }
      echo '<div data-toggle="tooltip" data-original-title="Click here to add bulk hours for this skill type">'.$totalhrs.'</div>';
      echo "</td>";

}




        echo "</tr>";
        }
     ?>
    </table>
    </div><!-- /span12 -->
  </div>
</div>

<?php

include("calendar.php");
     $dateComponents = getdate();
     

     $month = $dateComponents['mon'];            
     $year = $dateComponents['year'];
      $dateArray = array('S','M','T','W','T','F','S');
      
     
     echo build_calendar($month,$year,$dateArray);

     


?>


</table>
<script>
$(document).ready(function() {
      $("span").tooltip();
      $("div").tooltip();

})
</script>
<?php include('footer.php'); ?>