<?php include('header.php'); ?>
<div class="container-fluid">
  <div class="row-fluid">
    <div class="span12">
     <h2>Video test</h2>
    </div><!-- /span12 -->
  </div>
</div>

<a id="test" href="#">Play</a>


</table>
<script>
$(document).ready(function() {
        $("#test").click(function() {
        
            ga('send', 'event', 'CategoryVideo', 'ActionClick', 'Labelnav-buttons');


        });




  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-40478842-1', {
  'cookieDomain': 'none'
});
  ga('send', 'pageview');


})
</script>
<?php include('footer.php'); ?>