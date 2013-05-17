<?php include('header.php'); ?>

    <div class="container">
      <div class="row">

        <div class="span12">
          <!--Body content-->
          <table class="table table-hover">
            <thead>
              <tr>
                <th>Project name</th>
                <th>Job number</th>
                <th>Status</th>
                <th>Hours</th>
                <th>Total amount (GBP)</th>
                <th>Client main contact</th>
                <th>Sold by</th>
              </tr>
            </thead>
            <tbody>
            <?php
              $tasks = ORM::for_table('tasks')->find_many();
              foreach($tasks as $tasks) {
                echo '<tr class="taskstatus-'.$tasks->status.'"><td><a href="project.php?projectid='.$tasks->id.'">'.$tasks->project_name.'</a></td>';
                echo '<td>'.$tasks->job_nr.'</td>';
                echo '<td>'.$tasks->status.'</td>';
                echo '<td>'.$tasks->hours.'</td>';
                echo '<td>'.$tasks->gbp_total_amount.'</td>';
                echo '<td>'.$tasks->client_main_contact.'</td>';
                echo '<td>'.$tasks->sold_by.'</td></tr>';
              }
            ?>
            
            </tbody>
          </table>
        </div><!-- /span12 -->
      </div>
    </div>


<link class="include" rel="stylesheet" type="text/css" href="plugins/jqPlot/jquery.jqplot.min.css" />
<!--[if lt IE 9]><script language="javascript" type="text/javascript" src="plugins/jgPlot/excanvas.js"></script><![endif]-->
<script class="include" type="text/javascript" src="plugins/jqPlot/jquery.jqplot.min.js"></script>
<script class="include" type="text/javascript" src="plugins/jqPlot/plugins/jqplot.pieRenderer.min.js"></script>
<?php include('footer.php'); ?>