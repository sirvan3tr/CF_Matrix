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
echo '<table class="defaulttableview" border="0">';
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

    if ($weekend == "Saturday" || $weekend == "Sunday") {
      echo '<tr class="matrixrows weekendsdate">';
    } else {
      echo '<tr class="matrixrows">';
    }
    
    if ($todaysdate == $testdate) {
      echo '<td class="date todaysdate">';
    } else {
      echo '<td class="date">';
    }
     echo '<div class="day">' . date('l', $test_date) . '</div>'; 
     echo date('jS \of  F Y', $test_date); 
   echo "</td>";
  

   $result = mysqli_query($con,"SELECT * FROM users");
   while($row = mysqli_fetch_array($result))
      {
        $userid = $row['id'];

          //echo '<div class="username">' . $row['firstname'] . " " . $row['surname'] . '</div>';
         $repetition = mysqli_query($con,"SELECT * FROM task_repetition WHERE date='$testdate' && user_id='$userid' ");
         echo '<td date="'.$testdate.'" userid="'.$userid.'" id="id'.$testdate.$userid.'" class="alltasks">';
         $taskhours = 0;

           while($rowtwo = mysqli_fetch_array($repetition))
              {
                $taskhours = $taskhours + $rowtwo['duration'];
                // Get task name
                $taskid = $rowtwo['task_id'];
                $taskfinder = mysqli_query($con,"SELECT * FROM tasks WHERE id='$taskid' ");
                $taskfinderchild = mysqli_fetch_array($taskfinder);

                //Get Contacts name
                $contactsid = $taskfinderchild['Contact'];
                $contactfinder = mysqli_query($con,"SELECT * FROM users WHERE id='$contactsid' ");
                $contactfinderarray = mysqli_fetch_array($contactfinder);

                
                echo '<div class="tasks"><span class="matrixtaskname fl">' . $taskfinderchild['name'] .  '</span><span class="matrixhours fr"><i class="icon-time"></i> ' . $rowtwo['duration'] . '</span>
                <div class="clear"></div>
                <div class="matrixdetails">
                  <a href="https://mail.google.com/mail/#inbox?compose=new" title="GMAIL Contact" target="_blank"><i class="icon-user"></i> ' . $contactfinderarray['firstname'] . ' ' . $contactfinderarray['surname'] .'</a> <br /> 
                  <i class="icon-globe"></i> <a href="' . $taskfinderchild['redmine_url'] . '" title="Redmine URL" target="_blank">Redmine URL</a>
                  <i class="icon-folder-open"></i> <a class="ndrivelink copy-button" data-clipboard-text="' . $taskfinderchild['n_url'] . '" title="Clients Drive Folder" target="_blank">N Drive</a>
                  <i taskid="'.$taskid.'"class="removetask icon-remove" title="Remove this task."></i>
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
              
              ?>
                <div class="newtaskform">
                  <form>
                    <fieldset>
                      <input class="allocated-hours" type="text" placeholder="0.00">
                      <select class="selected-task">
                        <?php
                          $tasksAddition = mysqli_query($con,"SELECT * FROM tasks");
                          while($row = mysqli_fetch_array($tasksAddition))
                            {
                            echo '<option taskid="'.$row['id'].'">' . $row['name'] .'</option>';
                            }
                        ?>
                      </select>
                      <button type="submit" class="btn newtask" <?php echo 'date="'.$testdate.'"' ?>>Submit</button>
                    </fieldset>
                  </form>
                </div> <!-- /newtaskform -->
              <?php
          echo '</td>';
      }
      echo '<div class="clear"></div>';
      echo "</tr>";
     
      
} while ( $test_date < $end_date && ++$day_incrementer);
echo '</table>';


?>

<script>
$(document).ready(function() {
                           
  $(".task-addition").click(function() {
    $(this).next().show();
    userid = $(this).attr('userid');

    $('.newtask').click(function () {
      parent = $(this).parent();

      hours = $(parent).find('.allocated-hours').val();

      task = $(parent).find('.selected-task');
      taskid = $("option:selected", task).attr("taskid");  

      date = $(this).attr('date');
      //Ajax function
      $.ajax({ url: 'new_task_script.php',
          data: {hours: hours, taskid: taskid, userid: userid, date: date},
          type: 'post',
          success: function(data) {
            alert(data);

          } // Success function
      }); // Ajax Function
    }) // Click fn

    $('.removetask').click(function() {
      taskid = $(this).attr('taskid');
      console.log(taskid);

    }) //removetask click fn

  }) // Click fn
})
</script>