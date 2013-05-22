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
include('setup.php');
echo '<table class="table table-hover" border="0">';
echo '<tr>';
echo '<td class="dateheader"></td>';
$resultone = mysqli_query($con,"SELECT * FROM users");
  while($row = mysqli_fetch_array($resultone))
    {
    echo '<td class="username"><a href="projects.php?userid='.$row['id'].'">' . $row['firstname'] . " " . $row['surname'] . '</a> <div class="matrixhours dark" data-toggle="tooltip" title="" data-original-title="Working hours per day">'.$row['working_hrs'].'</div></td>';
    }
echo '</tr><tbody>';

do 
{ 
    $test_date = $start_date + ($day_incrementer * 60 * 60 * 24);
    
    $testdate = date('Y-m-d', $test_date);
    $weekend = date('l', $test_date);

    if ($weekend == "Saturday" || $weekend == "Sunday") { echo '<tr class="matrixrows weekendsdate">'; } else { echo '<tr class="matrixrows">'; }
    if ($todaysdate == $testdate) { echo '<td class="date todaysdate">'; } else { echo '<td class="date">'; }

     echo '<div class="day">' . date('l', $test_date) . '</div>' . date('jS \of  F Y', $test_date); 

   echo "</td>";
  

   $result = mysqli_query($con,"SELECT id,firstname,surname, working_hrs FROM users");
   while($row = mysqli_fetch_array($result))
      {
        $userid = $row['id'];
        $working_hrs = $row['working_hrs'];

          //echo '<div class="username">' . $row['firstname'] . " " . $row['surname'] . '</div>';

         $repetition = mysqli_query($con,"SELECT *, task_repetition.id AS taskrepID, users.id AS userID, tasks.id AS tasksID, skill_type.id AS skilltypeID
          FROM task_repetition 
          INNER JOIN users ON task_repetition.user_id=users.id
          INNER JOIN tasks ON task_repetition.task_id=tasks.id
          INNER JOIN skill_type ON task_repetition.skill_type_id=skill_type.id
          WHERE date='$testdate' && user_id='$userid' ");

         echo '<td date="'.$testdate.'" userid="'.$userid.'" id="id'.$testdate.$userid.'" class="alltasks" workinghrs="'.$working_hrs.'">';
         $taskhours = 0;

           while($rowtwo = mysqli_fetch_array($repetition))
              {
                $taskhours = $taskhours + $rowtwo['duration'];

                if($rowtwo['rep_status']==1) {
                  $divtasksclass = 'class="tasks usertaskstatus-done"';
                  $taskstatusA = 'class="taskstatusA taskstatusComplete fl"';
                } else {
                  $divtasksclass = 'class="tasks"';
                  $taskstatusA = 'class="taskstatusA fl"';
                }

                $person = null;
                $isuseronline = null;
                if(isset($_SESSION['user_id'])){
                $person = ORM::for_table('users')->find_one($_SESSION['user_id']);
                  if($_SESSION['user_id']==$userid) {
                    $isuseronline = '<li><a '.$taskstatusA.' href="" taskid="'.$rowtwo['taskrepID'].'"><i class="icon-check"></i> Completed</a></li>';

                  }
                }
                if ($rowtwo['comment']==null) {
                  $comment = "No Comment";
                } else {
                  $comment = $rowtwo['comment'];
                }

                echo '<div '.$divtasksclass.'><span class="matrixtaskname fl"><a href="project.php?projectid=' . $rowtwo['id'] .  '">' . $rowtwo['project_name'] .  '</a></span>
                  <div class="taskhoursbig">'.$rowtwo['duration'].'</div>
                  <div class="actions fl">
                    <span class="matrixhours dark"><i class="icon-time"></i> ' . $rowtwo['duration'] . '</span>
                    <span data-toggle="tooltip" title="" data-original-title="' . $rowtwo['skill_full'] . '" class="matrixhours light" style="background-color:'.$rowtwo['color'].';">'. $rowtwo['skill'] . '</span>
                    <div class="btn-group">
                      <button class="btn btn-mini">Action</button>
                      <button class="btn btn-mini dropdown-toggle" data-toggle="dropdown">
                        <span class="caret"></span>
                      </button>
                      <ul class="dropdown-menu">
                        <li><a userid="' . $userid .'" date="'.$testdate.'" taskid="'.$rowtwo['taskrepID'].'" class="removetask" title="Remove this task." data-toggle="tooltip" data-original-title="Remove this task"><i class="icon-remove"></i> Delete</a></li>
                        '.$isuseronline.'                      
                      </ul>
                    </div>
                  </div>
                <div class="clear"></div>
                <div class="matrixdetails">
                  <a href="https://mail.google.com/mail/#inbox?compose=new" title="GMAIL Contact" target="_blank"><i class="icon-user"></i> ' . $rowtwo['firstname'] . ' ' . $rowtwo['surname'] .'</a> <br /> 
                  <i class="icon-globe"></i> <a href="' . $rowtwo['redmine_url'] . '" title="Redmine URL" target="_blank">Redmine URL</a>
                  <i class="icon-folder-open"></i> <a class="ndrivelink copy-button" data-clipboard-text="' . $rowtwo['n_url'] . '" title="Clients Drive Folder" target="_blank">N Drive</a>
                  <div class="thetaskcomment">'.$comment.'</div>

                </div>

                <div class="clear"></div>
                </div>';
              }
              
              
              if ($taskhours > $working_hrs) {
                echo '<div class="totalend overbooked">Total hrs: '.$taskhours.'</div>';
              } elseif ($taskhours == $working_hrs) {
                echo '<div class="totalend booked">Total hrs: '.$taskhours.'</div>';
              } else {
                echo '<div class="totalend underbooked">Total hrs: '.$taskhours.'</div>';
              }
              if(isset($_SESSION['user_id'])){
                $person = ORM::for_table('users')->find_one($_SESSION['user_id']);
                if ($person->ability=="architect" || $person->ability=="oracle") {
                  echo '<p class="text-center task-addition" userid="'. $userid.'" date="'.$testdate.'" >Add new task!</p>';
                } else {
                  // Do nothing
                }
              }

          echo '</td>';
      }
      echo '<div class="clear"></div>';
      echo "</tr>";
     
      
} while ( $test_date < $end_date && ++$day_incrementer);
echo '</tbody></table>';


?>

<script>
$(document).ready(function() {
        $("span").tooltip();
        $("div").tooltip();
        $("i").tooltip();


})
</script>