<?php 
include("config.php");

         $query = mysqli_query($con,"SELECT * FROM task_repetition INNER JOIN users ON task_repetition.user_id=users.id");

           while($row = mysqli_fetch_array($query))
              {
                echo '<div>'.$row['date'].' - '.$row['firstname'].'</div>';

              }
?>