set datafile separator ","
set terminal png size 900,400
set title "Comparison of methods 1 and 2 (after 430 frames)"
set ylabel "Total time to process a frame (ms)"
set xlabel "Frame Number"
set key above
set grid
stats 'time1.txt' every ::1 using 2 nooutput
total1 = int(STATS_sum) / 1000
avg1 = int(STATS_sum) / 984
stats 'no-omp.log' every ::1 using 2 nooutput
total2 = int(STATS_sum) / 1000
avg2 = int(STATS_sum) / 984
plot "no-omp.log"   using 1:2 with lines lw 2 title sprintf('Refactored (total: %ds, average: %dms/frame)', total2, avg2), \
     "original.log" using 1:2 with lines lw 2 title sprintf('Original (total: %ds, average: %dms/frame)', total3, avg3)
