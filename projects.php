<?php include('header.php'); ?>

    <div class="container">
      <div class="row">

        <div class="span12">
          <!--Body content-->
          <?php
            $tasks = ORM::for_table('tasks')->find_many();
            foreach($tasks as $tasks) {
              echo '<div><a href="project.php?projectid='.$tasks->id.'">'.$tasks->project_name.'</a></div>';
            }
          ?>
        </div><!-- /span12 -->
      </div>
    </div>


<link class="include" rel="stylesheet" type="text/css" href="plugins/jqPlot/jquery.jqplot.min.css" />
<!--[if lt IE 9]><script language="javascript" type="text/javascript" src="plugins/jgPlot/excanvas.js"></script><![endif]-->
<script class="include" type="text/javascript" src="plugins/jqPlot/jquery.jqplot.min.js"></script>
<script class="include" type="text/javascript" src="plugins/jqPlot/plugins/jqplot.pieRenderer.min.js"></script>
<?php include('footer.php'); ?>