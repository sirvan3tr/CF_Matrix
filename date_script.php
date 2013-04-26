<?php						
		 	$start_date = $_POST['firstdate'];
		 	$end_date = $_POST['seconddate'];
    
$todaysdate = date('Y-m-d');
if ( !$end_date ) 
{ 
   $end_date = date("Y-m-d"); 
} 

$start_date = is_int($start_date) ? $start_date : strtotime($start_date); 
$end_date = is_int($end_date) ? $end_date : strtotime($end_date); 

$end_date -= (60 * 60 * 24); 

$test_date = $start_date; 
$day_incrementer = 1; 
include('config.php');
echo '<table class="defaulttableview " border="0">';
echo '<tr>';
echo '<td class="dateheader"></td>';
$resultone = mysqli_query($con,"SELECT * FROM users");
  while($row = mysqli_fetch_array($resultone))
    {
    echo '<td class="username"><a href="projects.php?userid='.$row['id'].'">' . $row['firstname'] . " " . $row['surname'] . '</a></td>';
    }
echo '</tr>';

do 
{ 
    $test_date = $start_date + ($day_incrementer * 60 * 60 * 24);
    
    $testdate = date('Y-m-d', $test_date);
    $weekend = date('l', $test_date);

    if ($weekend == "Saturday" || $weekend == "Sunday") { echo '<tr class="matrixrows weekendsdate">'; } else { echo '<tr class="matrixrows">'; }
    if ($todaysdate == $testdate) { echo '<td class="date todaysdate">'; } else { echo '<td class="date">'; }

     echo '<div class="day">' . date('l', $test_date) . '</div>' . date('jS \of  F Y', $test_date); 

   echo "</td>";
  

   $result = mysqli_query($con,"SELECT id,firstname,surname FROM users");
   while($row = mysqli_fetch_array($result))
      {
        $userid = $row['id'];

          //echo '<div class="username">' . $row['firstname'] . " " . $row['surname'] . '</div>';
         $repetition = mysqli_query($con,"SELECT * 
          FROM task_repetition 
          INNER JOIN users ON task_repetition.user_id=users.id
          INNER JOIN tasks ON task_repetition.task_id=tasks.id
          INNER JOIN skill_type ON task_repetition.skill_type_id=skill_type.id
          WHERE date='$testdate' && user_id='$userid' ");

         echo '<td date="'.$testdate.'" userid="'.$userid.'" id="id'.$testdate.$userid.'" class="alltasks">';
         $taskhours = 0;

           while($rowtwo = mysqli_fetch_array($repetition))
              {
                $taskhours = $taskhours + $rowtwo['duration'];

                echo '<div class="tasks"><span class="matrixtaskname fl"><span data-toggle="tooltip" title="" data-original-title="' . $rowtwo['skill_full'] . '" class="matrixhours" style="background-color:'.$rowtwo['color'].';">'. $rowtwo['skill'] . '</span> <a href="project.php?projectid=' . $rowtwo['id'] .  '">' . $rowtwo['project_name'] .  '</a></span><span class="matrixhours fr"><i class="icon-time"></i> ' . $rowtwo['duration'] . '</span>
                <div class="clear"></div>
                <div class="matrixdetails">
                  <a href="https://mail.google.com/mail/#inbox?compose=new" title="GMAIL Contact" target="_blank"><i class="icon-user"></i> ' . $rowtwo['firstname'] . ' ' . $rowtwo['surname'] .'</a> <br /> 
                  <i class="icon-globe"></i> <a href="' . $rowtwo['redmine_url'] . '" title="Redmine URL" target="_blank">Redmine URL</a>
                  <i class="icon-folder-open"></i> <a class="ndrivelink copy-button" data-clipboard-text="' . $rowtwo['n_url'] . '" title="Clients Drive Folder" target="_blank">N Drive</a>
                  <i userid="' . $userid .'" date="'.$testdate.'" taskid="'.$rowtwo['id'].'"class="removetask icon-remove" title="Remove this task."></i>
                </div>
                <div class="clear"></div>
                </div>';
              }
              
              if ($taskhours > 7.5) {
                echo '<div class="totalend overbooked">Total hrs: '.$taskhours.'</div>';
              } elseif ($taskhours == 7.5) {
                echo '<div class="totalend booked">Total hrs: '.$taskhours.'</div>';
              } else {
                echo '<div class="totalend underbooked">Total hrs: '.$taskhours.'</div>';
              }
              echo '<p class="text-center task-addition" userid="' . $row['id'] .'" username="' . $row['firstname'] . $row['surname'] . '"  date="'.$testdate.'" >Add new task!</p>';
              

          echo '</td>';
      }
      echo '<div class="clear"></div>';
      echo "</tr>";
     
      
} while ( $test_date < $end_date && ++$day_incrementer);
echo '</table>';


?>

<script>
$(document).ready(function() {
        $("span").tooltip();

})
</script>