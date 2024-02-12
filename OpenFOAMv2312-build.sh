#!/bin/bash 
# OpenFOAM Compilation Script README
# -----------------------------------

# Description:
# This script is designed for compiling OpenFOAM-v2312 using Slurm.
# It automates the compilation process, reducing the compilation time to approximately 30 minutes.

# Author:
# Vinil Vadakkepurakkal

# Usage:
# 1. Update the Ntask value according to the number of CPUs in your VM/Machine.
# 2. Execute the sbatch script to initiate the OpenFOAM compilation process.

# Note:
# Ensure that your system meets the necessary dependencies for compiling OpenFOAM-v2312.
# Adjust the script parameters and configurations as needed for your environment.

# For any questions or issues, feel free to contact the author.

# Enjoy compiling OpenFOAM!

#SBATCH --job-name=OpenFOAMv2312-Build-Job
#SBATCH --ntasks=96
#SBATCH --output=%x_%j.out
#SBATCH --partition=hpc

#lodaing mpi
module purge
module load mpi/hpcx
#preparing software location and downloading software
export INSTALL_DIR=$HOME/OpenFOAM
#mkdir -p $INSTALL_DIR
#mkdir -p $HOME/OpenFOAM
#cd $INSTALL_DIR
#wget https://dl.openfoam.com/source/v2312/OpenFOAM-v2312.tgz
#wget https://dl.openfoam.com/source/v2312/ThirdParty-v2312.tgz
#tar -zxf OpenFOAM-v2312.tgz && tar -zxf ThirdParty-v2312.tgz
# Building the foam
. $INSTALL_DIR/OpenFOAM-v2312/etc/bashrc
cd $INSTALL_DIR/OpenFOAM-v2312/
export WM_NCOMPPROCS=$SLURM_NTASKS
echo " starting the compiling job `date` " > $HOME/compilejobtime
./Allwmake -j -s -q -l
echo " finishing the compiling job `date` " >> $HOME/compilejobtime
