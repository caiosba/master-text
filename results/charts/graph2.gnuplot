set datafile separator ","
set terminal png size 900,400
set title "Comparison of methods 1 and 2"
set ylabel "Total time to process a frame (ms)"
set xlabel "Frame Number"
set key above
set grid
stats 'time1.csv' every ::1 using 2 nooutput
total1 = int(STATS_sum) / 1000
avg1 = int(STATS_sum) / 800
stats 'time2.csv' every ::1 using 2 nooutput
total2 = int(STATS_sum) / 1000
avg2 = int(STATS_sum) / 800
plot "time1.csv"   using 1:2 with lines lw 2 title sprintf('Method 1 (average: %dms/frame)', avg1), \
     "time2.csv" using 1:2 with lines lw 2 title sprintf('Method 2 (average: %dms/frame)', avg2)
