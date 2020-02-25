set term png lw 4
set output "plot.png"
unset xtics
unset key

l = 1.803e-03
plot [0:l] "<./bin dump.0000[1]???.dat" u 1:3 w lp, "<./bin dump.0000[2]???.dat" u 1:3 w lp, "<./bin dump.0000[3]???.dat" u 1:3 w lp


