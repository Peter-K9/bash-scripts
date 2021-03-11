set terminal pngcairo  transparent enhanced font "arial,10" fontscale 1.0 size 1200, 800 
set output 'output.png'
set format x "%D %E" geographic
set format y "%D %N" geographic
unset key
set style data lines
set yzeroaxis
set title "Gnuplot of IP Address Geolocation" 
set xrange [ -180.000 : 180.000 ] noreverse nowriteback
set x2range [ * : * ] noreverse writeback
set yrange [ -90.0000 : 90.0000 ] noreverse nowriteback
set y2range [ * : * ] noreverse writeback
set zrange [ * : * ] noreverse writeback
set cbrange [ * : * ] noreverse writeback
set rrange [ * : * ] noreverse writeback
NO_ANIMATION = 1
## Last datafile plotted: "world.cor"

plot 'world_10m.txt' with lines lc rgb "blue", 'ip.cor' with points lt 1 pt 7 lc rgb "orange"
#plot 'world_10m.txt' with lines lc rgb "blue", 'ip.cor' with points lt 1 pt 2
#plot 'world.dat' with lines lc rgb "blue" , 'world.cor' with points lt 1 pt 2
