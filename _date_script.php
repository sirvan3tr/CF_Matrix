<?php						
		 	$firstdate = $_POST['firstdate'];
		 	$seconddate = $_POST['seconddate'];
    
        

		 function dates_between($start_date, $end_date = false) { 
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

                echo '<div class="allusers">';
                $resultone = mysqli_query($con,"SELECT * FROM users");
                  while($row = mysqli_fetch_array($resultone))
                    {
                    echo '<div class="username">' . $row['firstname'] . " " . $row['surname'] . '</div>';
                    }
                    echo '<div class="clear"></div></div>';
                 
              do 
              { 
                    $test_date = $start_date + ($day_incrementer * 60 * 60 * 24);
                    
                    $testdate = date('Y-m-d', $test_date);
                    echo '<div class="matrix-row">';
                    if ($todaysdate == $testdate) {
                      echo '<div class="date todaysdate">';
                    } else {
                      echo '<div class="date">';
                    }
                     echo '<div class="day">' . date('l', $test_date) . '</div>'; 
                     echo date('jS \of  F Y', $test_date); 
                   echo "</div>";


                   $result = mysqli_query($con,"SELECT * FROM users");
                   while($row = mysqli_fetch_array($result))
                      {
                        $userid = $row['id'];

                      //echo '<div class="username">' . $row['firstname'] . " " . $row['surname'] . '</div>';
                         $repetition = mysqli_query($con,"SELECT * FROM task_repetition WHERE date='$testdate' && user_id='$userid' ");
                         echo '<div class="alltasks fl">';
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

                                echo '<div class="tasks">' . $taskfinderchild['name'] .  ' <i class="icon-time"></i> ' . $rowtwo['duration'] . ' hrs
                                <div class="matrixdetails">
                                  <a href="https://mail.google.com/mail/#inbox?compose=new" title="GMAIL Contact" target="_blank"><i class="icon-user"></i> ' . $contactfinderarray['firstname'] . ' ' . $contactfinderarray['surname'] .'</a> <br /> 
                                  <i class="icon-globe"></i> <a href="' . $taskfinderchild['redmine_url'] . '" title="Redmine URL" target="_blank">Redmine URL</a>
                                  <i class="icon-folder-open"></i> <a class="ndrivelink copy-button" data-clipboard-text="' . $taskfinderchild['n_url'] . '" title="Clients Drive Folder" target="_blank">N Drive</a>
                                </div>
                                </div>';
                              }
                              if ($taskhours > 7.5) {
                                echo '<div class="overbooked"></div>';
                              } elseif ($taskhours == 7.5) {
                                echo '<div class="booked"></div>';
                              } else {
                                echo '<div class="underbooked"></div>';
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
                                </div>
                              <?php
                          echo '</div>';
                      }
                      echo '<div class="clear"></div>';
                      echo '</div>';
                      
               } while ( $test_date < $end_date && ++$day_incrementer);
            } // /dates_between function
            
              //$todaysdate = date('Y-m-d');
              //$firstdate = date('Y-m-d', strtotime('-5 day', strtotime($todaysdate)));
              //$seconddate = date('Y-m-d', strtotime('+30 day', strtotime($todaysdate)));
			
			dates_between($firstdate, $seconddate)

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
            $("#msg").html(data);

          } // Success function
      }); // Ajax Function


    })

  })
})
</script>