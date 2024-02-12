#!/bin/bash

################################################################################
# OpenFOAM MotorBike Simulation
################################################################################

# Description:
# This script runs OpenFOAM simulations using Slurm job scheduler.

# Author:
# Vinil Vadakkepurakkal

# Instructions:
# 1. Modify the `#SBATCH --ntasks` parameter according to the desired number of CPUs (this script is based on 192 CPUs).
# 2. Set up the OpenFOAM environment correctly in your system.
# 3. Place this script in the simulation directory.
# 4. Ensure the necessary case files are available.
# 5. Execute the script using `sbatch motorbike_sim_job_of2312.sh`.

# Notes:
# - Assumes Slurm job scheduler and MPI are set up.
# - Adjust paths and commands according to your setup.

# For inquiries or assistance, contact the author.

################################################################################
# SLURM Directives
################################################################################
#SBATCH --job-name=OpenFOAM-MotorBike-Sim
#SBATCH --ntasks=192
#SBATCH --output=%x_%j.out
#SBATCH --partition=hpc

################################################################################
# Load MPI and OpenFOAM Environment
################################################################################
module purge
module load mpi/hpcx

export INSTALL_DIR="$HOME/OpenFOAM"
. "$INSTALL_DIR/OpenFOAM-v2312/etc/bashrc"

################################################################################
# Nodefile Generation
################################################################################
scontrol show hostname "$SLURM_JOB_NODELIST" | sort -u > "$HOME/nodefile-$SLURM_JOB_ID"

################################################################################
# Case Setup
################################################################################
mkdir "$HOME/run"
cp -r "$FOAM_TUTORIALS/incompressible/simpleFoam/motorBike" "$HOME/run"
cd "$HOME/run/motorBike"

################################################################################
# Parameter Setup and Simulation Run for 192 CPUs
################################################################################
cp "system/decomposeParDict.6" "system/decomposeParDict.$SLURM_NTASKS"
sed -i "s/numberOfSubdomains.*/numberOfSubdomains $SLURM_NTASKS;/" "system/decomposeParDict.$SLURM_NTASKS"
sed -i "s/ n           (3 2 1)/ n           (48 4 1);/" "system/decomposeParDict.$SLURM_NTASKS"
sed -i "s/(20 8 8)/(100 40 40)/" "system/blockMeshDict"
sed -i "s#system/decomposeParDict.6#system/decomposeParDict.$SLURM_NTASKS#" "Allrun"
mpiopts="$mpiopts -np $SLURM_NTASKS --hostfile $HOME/nodefile-$SLURM_JOB_ID"
./Allrun

