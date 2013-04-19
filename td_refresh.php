<?php
include('config.php');

		 	$testdate = $_POST['date'];
		 	$userid = $_POST['userid'];


          //echo '<div class="username">' . $row['firstname'] . " " . $row['surname'] . '</div>';
         $repetition = mysqli_query($con,"SELECT * FROM task_repetition WHERE date='$testdate' && user_id='$userid'");

         $taskhours = 0;

           while($rowtwo = mysqli_fetch_array($repetition))
              {
                $taskhours = $taskhours + $rowtwo['duration'];
                // Get task name
                $taskid = $rowtwo['task_id'];
                $taskfinder = mysqli_query($con,"SELECT * FROM tasks WHERE id='$taskid' ");
                $taskfinderchild = mysqli_fetch_array($taskfinder);

                //Get Contacts name
                $contactsid = $taskfinderchild['contact'];
                $contactfinder = mysqli_query($con,"SELECT * FROM users WHERE id='$contactsid' ");
                $contactfinderarray = mysqli_fetch_array($contactfinder);

                
                echo '<div class="tasks"><span class="matrixtaskname fl">' . $taskfinderchild['project_name'] .  '</span><span class="matrixhours fr"><i class="icon-time"></i> ' . $rowtwo['duration'] . '</span>
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
              echo '<p class="text-center task-addition" userid="' . $userid .'" date="'.$testdate.'" >Add new task!</p>';
              
              ?>
                <div class="newtaskform">
                  <form>
                    <fieldset>
                      <input class="allocated-hours" type="text" placeholder="0.00">
                      <select class="selected-task">
                        <?php
                          $tasksAddition = mysqli_query($con,"SELECT id, project_name FROM tasks");
                          while($row = mysqli_fetch_array($tasksAddition))
                            {
                            echo '<option taskid="'.$row['id'].'">' . $row['project_name'] .'</option>';
                            }
                        ?>
                      </select>
                      <div class="btn newtask" <?php echo 'date="'.$testdate.'"' ?>>Submit</div>
                    </fieldset>
                  </form>
                </div> <!-- /newtaskform -->
              <?php


?>