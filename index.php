<?php
include('header.php');
include('config.php');
?>
    <div class="container-fluid">
      <div class="row-fluid">
       
        <div class="span12">
          <!--Body content-->
          <!-- Button to trigger modal -->
<a href="#taskAdditionModal" role="button" class="btn" data-toggle="modal">Launch demo modal</a>
 
<!-- Modal -->
<div id="taskAdditionModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
    <h3 id="myModalLabel">Modal header</h3>
  </div>
  <div class="modal-body">
  <form id="newtaskform">
   
    <input class="allocated-hours" type="text" placeholder="0.00"> <br />
    <select class="selected-task">
      <?php
        $tasksAddition = mysqli_query($con,"SELECT id, project_name FROM tasks");
        while($row = mysqli_fetch_array($tasksAddition))
          {
            $php_array[$row['id']] = $row['project_name'];
            $php_array2 = array('abc','def','ghi');
            $js_array = json_encode($php_array);

          echo '<option taskid="'.$row['id'].'">' . $row['project_name'] .'</option>';
          }
      ?>
    </select>
    <br />
    <select class="selected-skill-type">
      <?php
        $tasksAdditionSKILL = mysqli_query($con,"SELECT id, skill, skill_full FROM skill_type");
        while($row = mysqli_fetch_array($tasksAdditionSKILL))
          {
          echo '<option skillid="'.$row['id'].'">['.$row['skill'].'] '.$row['skill_full'].'</option>';
          }
      ?>
    </select><br />
    
  </form>
  </div>
  <div class="modal-footer">
    <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
    <button class="btn btn-primary newtask">Save changes</button>
  </div>
</div>

          <form class="form-inline">
            <?php
            $result = mysqli_query($con,"SELECT * FROM users");
             

            $todaysdate = date('Y-m-d');
            $firstdate = date('Y-m-d', strtotime('-5 day', strtotime($todaysdate)));
            $seconddate = date('Y-m-d', strtotime('+5 day', strtotime($todaysdate)));
            echo '<input id="firstdate" type="text" placeholder="From y-m-d" value="'.$firstdate.'" class="input-small"> ';
            echo '<input id="seconddate" type="text" placeholder="To y-m-d" value="'.$seconddate.'" class="input-small"> ';
            echo '<select>
                    <option>All users</option>';
              while($row = mysqli_fetch_array($result)) {
                echo '<option>' . $row['firstname'] . " " . $row['surname'] . '</option>';
              }

            echo '</select> ';
            ?>
            <button id="date_btn" class="btn btn-small btn-primary" type="button">Filter</button>
          </form>
              
              <div id="msg"></div>
        </div><!-- /span12 -->
      </div>
    </div>
<script>
  jQuery(function ($) {
  $('#firstdate').datepicker({
  format: 'yyyy-mm-dd'
  });
  $('#seconddate').datepicker({
  format: 'yyyy-mm-dd'
  });

  $.ajaxSetup({ cache: false });
  var dateajax = function() {
    firstdate = $("#firstdate").val();
    seconddate = $("#seconddate").val();

    //Ajax function
    $.ajax({ url: 'date_script.php',
      data: {firstdate: firstdate, seconddate: seconddate},
      type: 'post',
      beforeSend: function(){
        $("#loading").show();
      },
      success: function(data) {
        $("#loading").hide();
        $("#msg").html(data);

        // Toggle Task Details
        $(document).on('click', ".tasks", function () {
          $(this).find('.matrixdetails').toggle('fast', function() {
          // Animation complete.
          });
        }); // End of task details click
      }, // Success function
    }).done(function(data){
	                      $(document).on('click', ".removetask", function () {
                            taskid = $(this).attr('taskid');
                            userid = $(this).attr('userid');
                            date = $(this).attr('date');

                            //Ajax function
                            $.ajax({ url: 'remove_task.php',
                                type: 'post',
                                data: {taskid: taskid},
                                 beforeSend: function ( xhr ) {
                                xhr.overrideMimeType("text/plain; charset=x-user-defined");
                                },
                                success: function(data) {
                                    alert(data);
                                    $("#id" + date + userid).html("Loading").load("td_refresh.php", {date: date, userid: userid });
                                },
                                error: function (data) {
                                    alert("There was an error. Image could not be added, please try again");
                                } // Success function
                            }); // Ajax Function
                          }) //removetask click fn
						  
                        $(document).on("click", ".task-addition", function () {
                          $('#taskAdditionModal').modal('show');
                          var userid = $(this).attr('userid');
                          var date = $(this).attr('date');



                          $(".newtask").unbind('click').click(function() {

                            var hours = $("#newtaskform").find('.allocated-hours').val();

                            var task = $("#newtaskform").find('.selected-task');
                            var taskid = $("option:selected", task).attr("taskid");

                            var skill = $("#newtaskform").find('.selected-skill-type');
                            var skillid = $("option:selected", skill).attr("skillid"); 

                            //Ajax function
                            var request = $.ajax({ url: 'new_task_script.php',
                                type: 'post',
                                data: {hours: hours, taskid: taskid, userid: userid, date: date, skillid: skillid},
                                success: function(e) {

                                    $('#taskAdditionModal').modal('hide')
                                    $("#id" + date + userid).html("Loading").load("td_refresh.php", {date: date, userid: userid });
                                },
                                error: function (e) {
                                    alert("There was an error. Image could not be added, please try again");
                                } // Success function
                            }); // Ajax Function
                          }) // Click fn

                        }) // Click fn
    });
  }

    dateajax();

  $("#date_btn").click(function(){
    dateajax();
  });

  });
</script>
<?php
include('footer.php');
?>