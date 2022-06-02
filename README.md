<h1>intro</h1>

<h1>install</h1>

<pre>
git clone https://github.com/lammps/lammps

cd lammps/src
make yes-USER-SPH yes-USER-SDPD yes-MOLECULE
make mpi CC=mpic++ LINK=mpicxx

mkdir -p $HOME/bin
cp lmp_mpi $HOME/bin/
</pre>    

Add `$HOME/bin` to the `PATH`.

<h1>Kolmogorov flow</h1>

<pre>
cd kolmogorov
sh run
</pre>

Produces image.*.ppm. I use feh to open ppm files.

<h1>four-roll mill flow</h1>

<h1>results</h1>

<p align="center"><img src="img/s.gif"/></p>

- feh https://feh.finalrewind.org
