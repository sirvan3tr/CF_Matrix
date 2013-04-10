<?php 
     $key = "THE KEY FOR YOUR SPREADSHEET";
     
     $url = "http://spreadsheets.google.com/feeds/cells/$key/1/public/values";
    
     $ch = curl_init();
  
     // set URL and other appropriate options
     curl_setopt($ch, CURLOPT_URL, $url);
     curl_setopt($ch, CURLOPT_HEADER, 0);
     curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
     
     // grab URL and pass it to the browser
     $google_sheet = curl_exec($ch);
     
     // close cURL resource, and free up system resources
     curl_close($ch);
  
     $doc = new DOMDocument();
     $doc->loadXML($google_sheet); 
     
     $nodes = $doc->getElementsByTagName("cell");
         
     if($nodes->length > 0)
     {
         foreach($nodes as $node)
         {
             // 2nd row is the email row.
             if ($node->getAttribute("row") == 2)
             {
                  if (eregi("^[\.\+_a-z0-9-]+@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,6})$", $node->nodeValue) ) 
                  {
                         mail($node->nodeValue, "Mail Subject", "Mail Message.", "From: email@yourdomain.com");
                   }
                  
        }
           }
   }
   
  4?>