<?php
require_once('header.php');
require_once('config.php');
?>
    <div class="container-fluid">
      <div class="row-fluid">
       
        <div class="span12">
          <!--Body content-->

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
          		$modaltasks = ORM::for_table('tasks')->select('id')->select('project_name')->find_many();
          		foreach ($modaltasks as $modaltasks) {
          		echo '<option taskid="'.htmlspecialchars($modaltasks->id).'">'.htmlspecialchars($modaltasks->project_name).'</option>';
          		}
                ?>
              </select>
              <br />
              <select class="selected-skill-type">
                <?php
          	  $taskaddSkill = ORM::for_table('skill_type')->select('id')->select('skill')->select('skill_full')->find_many();
          		foreach ($taskaddSkill as $taskaddSkill) {
          		echo '<option skillid="'.htmlspecialchars($taskaddSkill->id).'">['.htmlspecialchars($taskaddSkill->skill).'] '.htmlspecialchars($taskaddSkill->skill_full).'</option>';
          		}
                ?>
              </select><br />
              <textarea class="task-comment" placeholder="type your comment here..."></textarea>
            </form>
            </div>
            <div class="modal-footer">
              <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
              <button class="btn btn-primary newtask">Save changes</button>
            </div>
          </div><!-- end of modal -->

          <form class="form-inline">
            <?php
            $filterusers = ORM::for_table('users')->select('name')->find_many();


            $todaysdate = date('Y-m-d');
            $firstdate = date('Y-m-d', strtotime('-5 day', strtotime($todaysdate)));
            $seconddate = date('Y-m-d', strtotime('+5 day', strtotime($todaysdate)));
            echo '<input id="firstdate" type="text" placeholder="From y-m-d" value="'.$firstdate.'" class="input-small"> ';
            echo '<input id="seconddate" type="text" placeholder="To y-m-d" value="'.$seconddate.'" class="input-small"> ';
            echo '<select>
                    <option>All users</option>';
            foreach ($filterusers as $filterusers) {
              echo '<option>'.htmlspecialchars($filterusers->name).'</option>';
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
                        $(document).on("click", ".fakecheckbox", function (e) {
                          e.stopPropagation();
                          var date = $(this).parent().closest("td").attr("date");
                          var userid = $(this).parent().closest("td").attr("userid")

                          var checkboxupdate = function() {
                                //Ajax function
                                $.ajax({ url: 'update_rep_status.php',
                                  data: {date: date, userid: userid, status: status},
                                  type: 'post',
                                  beforeSend: function(){
                                    $("#loading").show();
                                  },
                                  success: function(data) {
                                    alert(data);
                                    $("#id" + date + userid).html("Loading").load("td_refresh.php", {date: date, userid: userid });
                                    $("#loading").hide();
                                  }, // Success function
                                })
                          }
                          if($(this).hasClass("fakecheckboxfilled")) {
                            $(this).removeClass("fakecheckboxfilled");
                            var status = 0;
                            checkboxupdate();
                          } else {
                            $(this).addClass("fakecheckboxfilled");
                            var status = 1;
                            checkboxupdate();
                          }
                        });


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
                            var comment = $("#newtaskform").find('.task-comment').val();

                            var task = $("#newtaskform").find('.selected-task');
                            var taskid = $("option:selected", task).attr("taskid");

                            var skill = $("#newtaskform").find('.selected-skill-type');
                            var skillid = $("option:selected", skill).attr("skillid"); 

                            //Ajax function
                            var request = $.ajax({ url: 'new_task_script.php',
                                type: 'post',
                                data: {hours: hours, comment: comment, taskid: taskid, userid: userid, date: date, skillid: skillid},
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