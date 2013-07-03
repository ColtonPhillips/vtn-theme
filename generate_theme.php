<?php

//$lines = file('verbs.txt', FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES);

//foreach ($lines as $line_num => $line) {
//    echo "Line #<b>{$line_num}</b> : " . htmlspecialchars($line) . " <br />\n";
//}


if(defined('STDIN') ) 
      echo("Running from CLI"); 
else 
      echo("Not Running from CLI"); 

?>
