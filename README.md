# intro

# install

    git clone https://github.com/lammps/lammps

    cd lammps/src
    make yes-USER-SPH yes-USER-SDPD yes-MOLECULE
    make mpi CC=mpic++ LINK=mpicxx

    mkdir -p $HOME/bin
    cp lmp_mpi $HOME/bin/

Add $HOME/bin to the PATH.
