<?php include('header.php'); ?>




<style>
.arc path {
  stroke: #fff;
}
</style>

<?php
include('config.php');

$projectid = $_GET['projectid'];
$user = mysqli_query($con,"SELECT * FROM tasks WHERE id='$projectid'");
$projectrow = mysqli_fetch_array($user);
$totalhrs = $projectrow['total_hrs'];
$hrsspent = $projectrow['hrs_spent'];
$totalgbp = $projectrow['gbp_total_amount'];
$hrsremaining = $totalhrs - $hrsspent;
$rate = round($totalgbp/$totalhrs,3);
$perchrsspent = round(($hrsspent/$totalhrs)*100, 3);
$profit = $totalgbp-($rate*$hrsspent);
$cost = $totalgbp - $profit;
?>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>


    <div class="container">
      <div class="row">

        <div class="span3">
          <!--Body content-->

            <?php
            echo '<div class="projecthours">
                    <h4 class="header"><i class="icon-time"></i> Hours</h4>
                    <div class="content">
                      <span class="hrsspent" title="Amount of hours that have been spent.">'.$hrsspent.'</span>/<span class="totalhrs" title="Total amount of hours available.">'.$totalhrs.'<span class="hrsannotation">total hrs</a></span>
                      <hr />
                      <div class="smallcontent text-info"><strong>'.$perchrsspent.'%</strong> of available hours have been used</div>
                      
                    </div>
                  </div>';
            echo '<div style="height:200px;" id="chart1"></div>';

            echo '<div class="projecthours">
                    <h4 class="header">Rate</h4>
                    <div class="content">
                      &#163;'.$rate.' /hr
                    </div>
                  </div>';

            echo '<div class="projecthours">
                    <h4 class="header">Total amount</h4>
                    <div class="content">
                      &#163;'.$totalgbp.'
                    </div>
            </div>';

        echo "</div>"; // /Span3
        echo '<div class="span9">';
            echo '<h1>'.$projectrow['name']. ' [' .$projectrow['status']. ']</h1>';
            echo '<h5>Project number: '.$projectrow['project_number']. '</h5>';
            echo '<div class="projecthours">
                    <h4>Profit</h4>
                    <div class="content text-info">
                      &#163;'.$profit.' <br />
                    </div>
                    <div class="smallcontent">
                      This figure is purely based on hours and the hourly rate.
                      <div style="height:200px;" id="chart2"></div>
                    </div>
                  </div>';
            ?>

         
        </div><!-- /span12 -->
      </div>
    </div>

<script class="code"  type="text/javascript">
$(document).ready(function(){
  var data = [
    ['Hours Spent', <?php echo $hrsspent; ?>],['Hours Remaining', <?php echo $hrsremaining; ?>]
  ];


  var plot1 = jQuery.jqplot ('chart1', [data],  {
     grid: {
            background: 'rgba(57,57,57,0.0)',
            drawBorder: false,
            shadow: false,
            gridLineColor: '#666666',
            gridLineWidth: 1
        },
      gridPadding: {top:0, bottom:0, left:0, right:0},
      seriesDefaults: {
        // Make this a pie chart.
        renderer: jQuery.jqplot.PieRenderer, 
        rendererOptions: {
          // Put data labels on the pie slices.
          // By default, labels show the percentage of the slice.
          showDataLabels: true,
          shadow: false,
          padding: 0,
          sliceMargin: 1,
        }
      }, 
        legend: {
            show: true,
            location:'s',
             rendererOptions: {
                numberRows: 1
            },
        }
    }
  );
});
</script>
<script class="code"  type="text/javascript">
$(document).ready(function(){
  var data = [
    ['Cost', <?php echo $cost; ?>],['Profit', <?php echo $profit; ?>]
  ];


  var plot1 = jQuery.jqplot ('chart2', [data],  {
     grid: {
            background: 'rgba(57,57,57,0.0)',
            drawBorder: false,
            shadow: false,
            gridLineColor: '#666666',
            gridLineWidth: 1
        },
      gridPadding: {top:0, bottom:0, left:0, right:0},
      seriesDefaults: {
        // Make this a pie chart.
        renderer: jQuery.jqplot.PieRenderer, 
        rendererOptions: {
          // Put data labels on the pie slices.
          // By default, labels show the percentage of the slice.
          showDataLabels: true,
          shadow: false,
          padding: 0,
          sliceMargin: 1,
        }
      }, 
        legend: {
            show: true,
            location:'s',
             rendererOptions: {
                numberRows: 1
            },
        }
    }
  );
});
</script>
<link class="include" rel="stylesheet" type="text/css" href="plugins/jqPlot/jquery.jqplot.min.css" />
<!--[if lt IE 9]><script language="javascript" type="text/javascript" src="plugins/jgPlot/excanvas.js"></script><![endif]-->
<script class="include" type="text/javascript" src="plugins/jqPlot/jquery.jqplot.min.js"></script>
<script class="include" type="text/javascript" src="plugins/jqPlot/plugins/jqplot.pieRenderer.min.js"></script>
<?php include('footer.php'); ?>