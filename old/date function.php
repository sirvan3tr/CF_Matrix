          <?php
            
            function dates_between($start_date, $end_date = false) { 
              $todaysdate = date('Y-m-d');
               if ( !$end_date ) 
               { 
                   $end_date = date("Y-m-d"); 
               } 
                
               $start_date = is_int($start_date) ? $start_date : strtotime($start_date); 
               $end_date = is_int($end_date) ? $end_date : strtotime($end_date); 
                
               $end_date -= (60 * 60 * 24); 
                
               $test_date = $start_date; 
               $day_incrementer = 1; 
                
               do  
               { 
                    $test_date = $start_date + ($day_incrementer * 60 * 60 * 24);
                    
                    $testdate = date('Y-m-d', $test_date);
                    if ($todaysdate == $testdate) {
                      echo '<div class="date todaysdate">';
                    } else {
                      echo '<div class="date">';
                    }
                    
                     echo '<div class="day">' . date('l', $test_date) . '</div>'; 
                     echo date('jS \of  F Y', $test_date); 
                   echo "</div>";
               } while ( $test_date < $end_date && ++$day_incrementer ); 
            } // /dates_between fn
            
              $todaysdate = date('Y-m-d');
              $firstdate = date('Y-m-d', strtotime('-5 day', strtotime($todaysdate)));
              $seconddate = date('Y-m-d', strtotime('+30 day', strtotime($todaysdate)));
            dates_between($firstdate, $seconddate);

          ?>