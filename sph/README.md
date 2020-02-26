# Run

    sh run

# Plot

../new/bin should be on the path

Velocity

    plot "<bin 00050000.dat" u 'y':'vx' w lp t "t = 5", "<bin 00100000.dat" u 'y':'vx'  w lp t "t = 10"


Stresses

   plot "<bin 00050000.dat" u 'y':'v_xy' w lp t "t = 5", "<bin 00100000.dat" u 'y':'v_xy'  w lp t "t = 10"
