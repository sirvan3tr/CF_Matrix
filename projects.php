<?php include('header.php'); ?>
    <div class="container-fluid">
      <div class="row-fluid">
       
        <div class="span12">
          <!--Body content-->
          <style>
          .arc path {
            stroke: #fff;
          }
          </style>

            <?php
            include('config.php');

            $userid = $_GET['userid'];
            $user = mysqli_query($con,"SELECT * FROM users WHERE id='$userid'");
            $userrow = mysqli_fetch_array($user);
            echo '<h4>'.$userrow['firstname'] . ' ' . $userrow['surname'] . '</h4>';



            $filename = tempnam('temp/', 'data').'.csv';

            $handle = fopen($filename, "w");
            fwrite($handle, "age,population\n");
            
            
            
            $searchdate = '2013-03-25';
            $result = mysqli_query($con,"SELECT * FROM task_repetition WHERE date='$searchdate' && user_id='$userid'");
            $results = array();

              $totalhours = 0;
              while($row = mysqli_fetch_array($result)) {

                $totalhours = $totalhours + $row['duration'];
                $taskid = $row['task_id'];
                $taskname = mysqli_query($con,"SELECT * FROM tasks WHERE id='$taskid'");
                while($row2 = mysqli_fetch_array($taskname)) {
                  echo $row2['name'] . ',';
                   fwrite($handle, $row2['name'] .'(' . $row['duration'] . ") ,");
                }
                fwrite($handle, $row['duration'] . "\n");
                echo $row['duration'] . '<br />';

                $results[] = $row['duration'];
              }
              $freetime = 0;
              if ($totalhours < 7.5) {
                $freetime = 7.5 - $totalhours;
                fwrite($handle, 'Free time,' . $freetime . "\n");
              }
              echo "Toal hours: <strong>".$totalhours."</strong><br />";
              echo "Toal free hours: <strong>".$freetime."</strong>";

            fclose($handle);
            ?>

          <script src="http://d3js.org/d3.v3.min.js"></script>
          <script>
          var width = 200,
              height = 200,
              radius = Math.min(width, height) / 2;

          var color = d3.scale.ordinal()
              .range(["#98abc5", "#8a89a6", "#7b6888", "#6b486b", "#a05d56", "#d0743c", "#ff8c00"]);

          var arc = d3.svg.arc()
              .outerRadius(radius - 10)
              .innerRadius(0);

          var pie = d3.layout.pie()
              .sort(null)
              .value(function(d) { return d.population; });

          var svg = d3.select("body").append("svg")
              .attr("width", width)
              .attr("height", height)
            .append("g")
              .attr("transform", "translate(" + width / 2 + "," + height / 2 + ")");

          d3.csv("<?php echo 'temp/'.basename($filename); ?>", function(error, data) {

            data.forEach(function(d) {
              d.population = +d.population;
            });

            var g = svg.selectAll(".arc")
                .data(pie(data))
              .enter().append("g")
                .attr("class", "arc");

            g.append("path")
                .attr("d", arc)
                .style("fill", function(d) {
                  if (d.data.age == "Free time") {
                    return "#fff"
                  } else {
                    return color(d.data.age);
                  }
                });

            g.append("text")
                .attr("transform", function(d) { return "translate(" + arc.centroid(d) + ")"; })
                .attr("dy", ".35em")
                .style("text-anchor", "middle")
                .text(function(d) { return d.data.age; });


          });

          </script>
          <?php //delete our temp file
          //unlink($filename);
          ?>
         
        </div><!-- /span12 -->
      </div>
    </div>
<?php include('footer.php'); ?>