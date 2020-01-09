git clone https://github.com/lammps/lammps

cd lammps/src
make yes-USER-SDPD yes-MOLECULE
make serial CC=mpic++ LINK=mpic++ CCFLAGS='-Ofast -g' FFT_LIB= MPI_LIB=
(cd ../tools/eff && make restart2data-pEFF)

mkdir -p $HOME/bin/
cp lmp_serial $HOME/bin/
(cd ../tools/eff && make restart2data-pEFF && cp restart2data-pEFF $HOME/bin/restart2data)
