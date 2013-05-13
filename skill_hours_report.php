<?php include('header.php'); ?>
<div class="container-fluid">
  <div class="row-fluid">
    <div class="span12">

      <!-- Modal -->
<div id="bulkhrsadditionModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
    <h3 id="myModalLabel">Insert hours for skill-type</h3>
  </div>
  <div class="modal-body">
  <form id="bulkhrsaddition">
    <input class="allocated-hours" type="text" placeholder="0.00"> <br />
  </form>
  </div>
  <div class="modal-footer">
    <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
    <button class="btn btn-primary bulkhrsadditionbtn">Save changes</button>
  </div>
</div>

      <table id="skill-report" class="table table-striped">
        <thead>
     <?php
      include("config.php");
      echo '<th>';
  for ($i = 0; $i <= 11; $i++) {
        echo '<td class="content">'.date("F",strtotime($i."Months")).'</td>';
  }
      echo '</th>';

      echo "</thead><tbody>";
      $query = ORM::for_table('skill_type')->find_many();

        foreach ($query as $query) { 
        echo "<tr>";
        echo '<td ><span class="matrixtaskname fl"><span data-toggle="tooltip" title="" data-original-title="' .$query->skill_full. '" class="matrixhours" style="background-color:'.$query->color.';">'.$query->skill. '</span> '.$query->skill_full.'</td>';
        $skilltypeid = $query->id;

for ($i = 0; $i <= 11; $i++) {
        echo '<td class="content">';
        $date = date("Y-m-d",strtotime($i."Months"));
        list($year, $month, $day) = explode('-', $date);

    $firstdate = date('Y-m-d', mktime(0, 0, 0, $month, 1, $year));
    $lastdate = date('Y-m-t', mktime(0, 0, 0, $month, 1, $year));

    $queryhours = mysqli_query($con, "SELECT * FROM task_repetition WHERE skill_type_id='$skilltypeid' and date >= '$firstdate' and date <= '$lastdate' ");
    $queryhours = ORM::for_table('skill_type')->find_many();
    $querybulkhours = mysqli_query($con, "SELECT * FROM skill_hrs_bulk_addition WHERE skill_type_id='$skilltypeid' and date >= '$firstdate' and date <= '$lastdate' ");
    $querybulkhours = ORM::for_table('skill_type')->find_many();

    $querytotalhrs = 0;
    foreach ($querytotalhrs as $querytotalhrs) {
        $querytotalhrs = $querytotalhrs + $rowhours['duration'];
        
      }
      $querybulktotalhrs = 0;
    foreach ($querybulkhours as $querybulkhours) {
      {
        $querybulktotalhrs = $querybulktotalhrs + $rowbulkhours['hrs'];
        
      }
      $totalhrs = $querytotalhrs + $querybulktotalhrs;
      echo '<div class="hours-div" querytotalhrs="'.$querytotalhrs.'" querybulktotalhrs="'.$querybulktotalhrs.'" date="'.$firstdate.'" skilltypeid="'.$skilltypeid.'" data-toggle="tooltip" data-original-title="Click here to add bulk hours for this skill type">'.$totalhrs.'</div>';
     
      echo "</td>";

}
        echo "</tr>";
        }
     ?>
    </table>
    </div><!-- /span12 -->
  </div>
</div>



<?php

include("calendar.php");
     $dateComponents = getdate();
     

     $month = $dateComponents['mon'];            
     $year = $dateComponents['year'];
      $dateArray = array('S','M','T','W','T','F','S');
      
     
     echo build_calendar($month,$year,$dateArray);

     


?>
</table>
<script>
$(document).ready(function() {
  $("span").tooltip();
  $("div").tooltip();

$(document).on('click', ".hours-div", function () {
    $('#bulkhrsadditionModal').modal('show');
    var skilltypeid = $(this).attr('skilltypeid');
    var date = $(this).attr('date');

    var thisdiv = this;
    var currenthrs = $(this).attr("querytotalhrs");

    var querybulktotalhrs = $(this).attr("querybulktotalhrs");
    $("#bulkhrsaddition").find('.allocated-hours').val(querybulktotalhrs);

    $(".bulkhrsadditionbtn").unbind('click').click(function() {
      var hours = $("#bulkhrsaddition").find('.allocated-hours').val();

      //Ajax function
      var request = $.ajax({ url: 'bulk_hrs_addition_script.php',
          type: 'post',
          data: {skilltypeid: skilltypeid, date: date, hours: hours, bulktotalhrs: querybulktotalhrs},
          success: function(e) {
            $('#bulkhrsadditionModal').modal('hide');
            var updatehrs = parseFloat(currenthrs)+parseFloat(hours);
            $(thisdiv).text(updatehrs);
            alert(e);
          },
          error: function (e) {
              alert("There was an error. Image could not be added, please try again");
          } // Success function
      }); // Ajax Function
    }) // Click fn

}) //add bulk hours click fn

})
</script>
<?php include('footer.php'); ?>