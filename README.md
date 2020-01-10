# intro

# install

    git clone https://github.com/lammps/lammps

    cd lammps/src
    make yes-USER-SDPD yes-MOLECULE
    make serial CCFLAGS='-Ofast -g' FFT_LIB=

    mkdir -p $HOME/bin
    cp lmp_serial $HOME/bin/lmp

Add $HOME/bin to the PATH.
