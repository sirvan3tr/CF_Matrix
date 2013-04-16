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

  var dateajax = function() {
    firstdate = $("#firstdate").val();
    seconddate = $("#seconddate").val();

    //Ajax function
    $.ajax({ url: 'date_script.php',
      data: {firstdate: firstdate, seconddate: seconddate},
      type: 'post',
      success: function(data) {
        $("#msg").html(data);

        // Toggle Task Details
        $(".tasks").click(function() {
          $(this).find('.matrixdetails').toggle('fast', function() {
          // Animation complete.
          });
        }); // End of task details click

      } // Success function
    }); // Ajax Function
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