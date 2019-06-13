set multiplot layout 2, 1 title "Training" font ",14"
set datafile separator ';'
set key autotitle columnhead
set title "Full graph"
set y2range [0:100]
set y2tics
set autoscale y
plot 'log.csv' using 1:2 with lines, '' using 1:3 with lines
set title "Zoomed in"
set yrange [0:15];
plot 'log.csv' using 1:2 with lines, '' using 1:3 with lines
pause 5
reread