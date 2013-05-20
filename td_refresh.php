<?php
include('config.php');

		 	$testdate = $_POST['date'];
		 	$userid = $_POST['userid'];

         $repetition = mysqli_query($con,"SELECT * 
          FROM task_repetition 
          INNER JOIN users ON task_repetition.user_id=users.id
          INNER JOIN tasks ON task_repetition.task_id=tasks.id
          INNER JOIN skill_type ON task_repetition.skill_type_id=skill_type.id
          WHERE date='$testdate' && user_id='$userid' ");

         $taskhours = 0;

           while($rowtwo = mysqli_fetch_array($repetition))
              {
 $taskhours = $taskhours + $rowtwo['duration'];

                if($rowtwo['rep_status']==1) {
                  $divtasksclass = 'class="tasks usertaskstatus-done"';
                  $fakecheckboxclass = 'class="fakecheckbox fakecheckboxfilled fl"';
                } else {
                  $divtasksclass = 'class="tasks"';
                  $fakecheckboxclass = 'class="fakecheckbox fl"';
                }

                $person = null;
                $isuseronline = null;
                if(isset($_SESSION['user_id'])){
                $person = ORM::for_table('users')->find_one($_SESSION['user_id']);
                  if($_SESSION['user_id']==$userid) {
                    $isuseronline = '<div class="taskstatuscontainer" data-toggle="tooltip" data-original-title="Toggle the status of this task"><div '.$fakecheckboxclass.'></div><span></span></div>';
                  }
                }

                echo '<div '.$divtasksclass.'><span class="matrixtaskname fl"><span data-toggle="tooltip" title="" data-original-title="' . $rowtwo['skill_full'] . '" class="matrixhours" style="background-color:'.$rowtwo['color'].';">'. $rowtwo['skill'] . '</span> <a href="project.php?projectid=' . $rowtwo['id'] .  '">' . $rowtwo['project_name'] .  '</a></span><span class="matrixhours fr"><i class="icon-time"></i> ' . $rowtwo['duration'] . '</span>
                <div class="clear"></div>
                <div class="matrixdetails">
                  <a href="https://mail.google.com/mail/#inbox?compose=new" title="GMAIL Contact" target="_blank"><i class="icon-user"></i> ' . $rowtwo['firstname'] . ' ' . $rowtwo['surname'] .'</a> <br /> 
                  <i class="icon-globe"></i> <a href="' . $rowtwo['redmine_url'] . '" title="Redmine URL" target="_blank">Redmine URL</a>
                  <i class="icon-folder-open"></i> <a class="ndrivelink copy-button" data-clipboard-text="' . $rowtwo['n_url'] . '" title="Clients Drive Folder" target="_blank">N Drive</a>
                  <i userid="' . $userid .'" date="'.$testdate.'" taskid="'.$rowtwo['id'].'"class="removetask icon-remove" title="Remove this task." data-toggle="tooltip" data-original-title="Remove this task."></i>
                  <div class="thetaskcomment">' . $rowtwo['comment'] . '</div>
                  '.$isuseronline.'
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
              if(isset($_SESSION['user_id'])){
                $person = ORM::for_table('users')->find_one($_SESSION['user_id']);
                if ($person->ability=="architect" || $person->ability=="oracle") {
                  echo '<p class="text-center task-addition" userid="' . $row['id'] .'" username="' . $row['firstname'] . $row['surname'] . '"  date="'.$testdate.'" >Add new task!</p>';
                } else {
                  // Do nothing
                }
              }

              

?>
<script>
$(document).ready(function() {
        $("span").tooltip();
        $("div").tooltip();
        $("i").tooltip();
})
</script>