<?php
//define search parameter to load in to array
$searchthis = "Build";
$matches = array();

//open file get lines that match searchthis
$handle = @fopen("sumfile.conf", "r");
if ($handle)
{
      while (!feof($handle))
               {
                 $buffer = fgets($handle);
                    if(strpos($buffer, $searchthis) !== FALSE)
                       $matches[] = $buffer;
               }
  fclose($handle);
}

//show results:
foreach ($matches as $m)
    {
        echo $m."<br>";
    }
?>
