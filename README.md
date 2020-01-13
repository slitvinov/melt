# intro

# install

    git clone https://github.com/lammps/lammps

    cd lammps/src
    make yes-USER-SPH yes-USER-SDPD yes-MOLECULE
    make mpi CC=mpic++ LINK=mpicxx

    mkdir -p $HOME/bin
    cp lmp_mpi $HOME/bin/

Add $HOME/bin to the PATH.

# run

    cd new
    sh run

Produces image.*.ppm. I use feh to open ppm files.

# results

<p align="center"><img src="img/s.gif"/></p>

- feh https://feh.finalrewind.org
