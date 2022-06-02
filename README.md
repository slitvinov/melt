<h1>intro</h1>

<h1>install</h1>

<pre>
git clone https://github.com/lammps/lammps

cd lammps/src
make yes-DPD-SMOOTH yes-MOLECULE
make -j4 mpi CC=mpic++ LINK=mpicxx

mkdir -p $HOME/.local/bin
cp lmp_mpi $HOME/.local/bin/
</pre>    

Add `$HOME/.local/bin` to the `PATH`.

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
