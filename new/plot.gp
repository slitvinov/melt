set term png lw 4
set output "plot.png"
unset xtics
unset key

l = 1.803e-03
plot [0:l] \
     "<./bin dump.000[0-1][7-9]???.dat" u 1:2 w lp
