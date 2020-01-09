#! /bin/bash

set -e
set -u
rm -rf dum* im* poly* log.lammps
lmp -in sdpd-polymer3D-inti.lmp

awk -v cutoff=3.0 -v Nbeads=10 -v Nsolvent=1000 -v Npoly=full \
    -f addpolymer.awk poly3d.txt > poly3.txt
nbound=$(tail -n 1 poly3.txt | awk '{print $1}')
sed "s/_NUMBER_OF_BOUNDS_/$nbound/1" poly3.txt > poly3d.txt

lmp -in sdpd-polymer3D-run.lmp
