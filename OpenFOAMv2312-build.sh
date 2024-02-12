#!/bin/bash

################################################################################
# OpenFOAM Compilation Script
################################################################################

# Description:
# This script automates the compilation process of OpenFOAM-v2312 using Slurm.
# It reduces the compilation time to approximately 30 minutes.

# Author:
# Vinil Vadakkepurakkal

# Usage:
# 1. Update the SLURM parameters such as --ntasks according to your system's configuration.
# 2. Execute this script with sbatch to start the OpenFOAM compilation process.

# Note:
# - Ensure your system meets the dependencies for compiling OpenFOAM-v2312.
# - Adjust script parameters and configurations as needed for your environment.

# For inquiries or assistance, please contact the author.

# Enjoy compiling OpenFOAM!

################################################################################
# SLURM Directives
################################################################################
#SBATCH --job-name=OpenFOAMv2312-Build-Job
#SBATCH --ntasks=96
#SBATCH --output=%x_%j.out
#SBATCH --partition=hpc

################################################################################
# Load MPI and Prepare Software
################################################################################
module purge
module load mpi/hpcx

################################################################################
# Software Installation and Configuration
################################################################################
export INSTALL_DIR="$HOME/OpenFOAM"
# Downloading and extracting software can be added here

################################################################################
# Compiling OpenFOAM
################################################################################
# Load OpenFOAM environment
. "$INSTALL_DIR/OpenFOAM-v2312/etc/bashrc"
cd "$INSTALL_DIR/OpenFOAM-v2312/"

# Set the number of compilation processes
export WM_NCOMPPROCS=$SLURM_NTASKS

# Start compilation
echo "Starting the compilation job at $(date)" > "$HOME/compilejobtime"
./Allwmake -j -s -q -l
echo "Finishing the compilation job at $(date)" >> "$HOME/compilejobtime"

################################################################################
# Post-compilation Check
################################################################################
foamInstallationTest