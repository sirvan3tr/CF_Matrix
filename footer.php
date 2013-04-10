<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/bootstrap-datepicker.js"></script>
<script src="js/ZeroClipboard-1.1.7/ZeroClipboard.js"></script>
<script src="js/ZeroClipboard-1.1.7/main.js"></script>

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

          $(".copy-button").click(function() {
              copyButton = this;
          })
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