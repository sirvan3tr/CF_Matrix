
<script src="js/bootstrap.min.js"></script>
<script src="js/bootstrap-datepicker.js"></script>

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

  $("#date_btn").click(function(){
    dateajax();
  });

  dateajax();
    
});
</script>
</body>
</html>