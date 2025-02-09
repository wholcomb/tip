<?php // -*- C++ -*-
header("Content-type: text/plain");
set_time_limit(0);
$iterations=10000;

function utime()
{
    $time = explode(" ", microtime());
    $usec = (double)$time[0];
    $sec = (double)$time[1];
    return $sec + $usec;
}

function print_progress ($i)
{
    if ($i%400==0) {
	echo "\r$i  |";
	flush();
    } elseif ($i%400==100) {
	echo "\r$i  \\";
	flush();
    } elseif ($i%400==200) {
	echo "\r$i  -";
	flush();
    } elseif ($i%400==300) {
	echo "\r$i  /";
	flush();
    }
}

function mul($i,$j)
{
    return $i*$j;
}

echo "PHP3 benchmark - $iterations iterations\n\n";
echo "Benchmarking idle while loop:\n";
$starttime=utime();
$i=1;
while ($i<=$iterations) {
    print_progress($i);
    $i++;
}
printf("\rDone, took %.2f seconds.\n", ($idle_while=utime()-$starttime));

echo "Benchmarking while loop with internal mul() function calls:\n";
$starttime=utime();
$i=1;
$sum=0;
while ($i<=$iterations) {
    $sum += mul($i,$i);
    print_progress($i);
    $i++;
}
printf("\rDone, took %.2f seconds.\n", ($full_while=utime()-$starttime));
printf("That means the extra function was adding %.5f secs per iteration.\n",
       (($full_while-$idle_while)/doubleval($iterations)));
//echo "\rDone, took ".($full_while=time()-$starttime)." seconds.\n";
//echo "That means the extra function was adding ".(($full_while-$idle_while)/doubleval($iterations))." seconds per iteration.\n";

echo "Benchmarking idle for loop, $iterations iterations:\n";
$starttime=utime();
for ($i=1; $i<=$iterations; $i++) {
    print_progress($i);
}
printf("\rDone, took %.2f seconds.\n", ($idle_for=utime()-$starttime));
printf("That means for loops are %.2f%% slower than while loops.\n",
       ((doubleval($idle_for-$idle_while)*100)/$idle_while));

echo "Benchmarking for loop with internal mul() function calls:\n";
$sum=0;
$starttime=utime();
for ($i=1; $i<=$iterations; $i++) {
    $sum += mul($i,$i);
    print_progress($i);
}
echo "\rDone, took ".($full_for=utime()-$starttime)." seconds.\n";
printf("That means for loops are %.2f%% slower than while loops.\n",
       ((doubleval($full_for-$full_while)*100)/$full_while));

?>
