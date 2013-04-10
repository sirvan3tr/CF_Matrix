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
<?php
include('footer.php');
?>