#!/bin/bash

# OpenFOAM MotorBike Simulation README
# -----------------------

# Description:
# This script is designed to run OpenFOAM simulations using Slurm job scheduler.

# Author:
# Vinil Vadakkepurakkal

# Instructions:
# 1. Modify the `#SBATCH --ntasks` parameter according to the number of CPUs you want to use for the simulation.
# 2. Ensure that you have set up the OpenFOAM environment correctly in your system.
# 3. Place this script in the directory where you want to run the OpenFOAM simulation.
# 4. Ensure that the necessary case files are available in the directory specified in the script.
# 5. Execute the script using `sbatch openfoam_script.sh`.

# Notes:
# - This script assumes that you have already set up Slurm job scheduler and MPI on your system.
# - Make sure to adjust the paths and commands according to your specific setup and requirements.

# For any questions or issues, feel free to contact the author.

# Happy simulating!

#SBATCH --job-name=OpenFOAM-MotorBike-Sim
#SBATCH --ntasks=192
#SBATCH --output=%x_%j.out
#SBATCH --partition=hpc

module purge
module load mpi/hpcx

export INSTALL_DIR=$HOME/OpenFOAM
. $INSTALL_DIR/OpenFOAM-v2312/etc/bashrc

# Nodefile generation
for i in `scontrol show hostname $SLURM_JOB_NODELIST | sort -u`; do echo "$i"; done > $HOME/nodefile-$SLURM_JOB_ID

# Setting up the case for testing
mkdir $HOME/run
cp -r $FOAM_TUTORIALS/incompressible/simpleFoam/motorBike $HOME/run
cd $HOME/run/motorBike

# Setting up the parameters and running OpenFOAM
cp system/decomposeParDict.6 system/decomposeParDict.$SLURM_NTASKS
sed -i "s/numberOfSubdomains.*/numberOfSubdomains $SLURM_NTASKS;/" system/decomposeParDict.$SLURM_NTASKS
sed -i "s/ n           (3 2 1)/ n           (48 4 1);/" system/decomposeParDict.$SLURM_NTASKS
sed -i "s/(20 8 8)/(100 40 40)/" system/blockMeshDict
sed -i "s#system/decomposeParDict.6#system/decomposeParDict.$SLURM_NTASKS#" Allrun
mpiopts="$mpiopts -np $SLURM_NTASKS --hostfile $HOME/nodefile-$SLURM_JOB_ID"
./Allrun
