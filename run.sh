#!/bin/bash

#PBS -l nodes=4:ppn=32:xe
#PBS -l walltime=00:30:00
##PBS -l advres=wenmeixe
#PBS -q debug
#cd $PBS_O_WORKDIR

export NUMFREQ=128
export MAXFREQ=1
export MINFREQ=0.25

export NUMRX=128
export NUMTX=32
export TXPROC=32

export MLFMA=1
export OMP_NUM_THREADS=16
aprun -n 128 -N 1 -d $OMP_NUM_THREADS -j 1 ./mom
