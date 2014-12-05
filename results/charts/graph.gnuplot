set datafile separator ","
set terminal png size 900,400
set title "Comparison of KinectFusion approaches (after 984 frames)"
set ylabel "Time (ms)"
set xlabel "Frame Number"
set key above
set grid
stats 'yes-omp.log' every ::1 using 2 nooutput
total1 = int(STATS_sum) / 1000
avg1 = int(STATS_sum) / 984
stats 'no-omp.log' every ::1 using 2 nooutput
total2 = int(STATS_sum) / 1000
avg2 = int(STATS_sum) / 984
stats 'original.log' every ::1 using 2 nooutput
total3 = int(STATS_sum) / 1000
avg3 = int(STATS_sum) / 984
plot "no-omp.log"   using 1:2 with lines lw 2 title sprintf('Refactored (total: %ds, average: %dms/frame)', total2, avg2), \
     "original.log" using 1:2 with lines lw 2 title sprintf('Original (total: %ds, average: %dms/frame)', total3, avg3)
