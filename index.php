<?php
include('header.php');
?>
    <div class="container-fluid">
      <div class="row-fluid">
       
        <div class="span12">
          <!--Body content-->
          <form class="form-inline">
            <?php
            include('config.php');
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
						  
                        $(document).on('click', ".task-addition", function () {
                          $(this).next().show();
                          userid = $(this).attr('userid');


                          $('.newtask').click(function () {
                            parent = $(this).parent();

                            hours = $(parent).find('.allocated-hours').val();

                            task = $(parent).find('.selected-task');
                            taskid = $("option:selected", task).attr("taskid");

                            skill = $(parent).find('.selected-skill-type');
                            skillid = $("option:selected", skill).attr("skillid");  

                            date = $(this).attr('date');


                            //Ajax function
                            $.ajax({ url: 'new_task_script.php',
                                type: 'post',
                                data: {hours: hours, taskid: taskid, userid: userid, date: date, skillid: skillid},
                                 beforeSend: function ( xhr ) {
                                xhr.overrideMimeType("text/plain; charset=x-user-defined");
                                },
                                success: function(data) {
                                    $("#id" + date + userid).html("Loading").load("td_refresh.php", {date: date, userid: userid });
                                },
                                error: function (data) {
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