#!/bin/bash
# OpenFOAM v2312 Dependencies Installation Script

# Author: Vinil Vadakkepurakkal

# This script installs the dependencies required for OpenFOAM v2312 through CycleCloud Cloud-init.
# Refer to https://develop.openfoam.com/Development/openfoam/blob/develop/doc/Requirements.md
# for detailed information on OpenFOAM v2312 dependencies.
# OpenMPI is used from the OS image. 

# Update package index
echo "Updating package index..."
sudo apt update

# Install required dependencies
echo "Installing required dependencies..."
sudo apt-get install -y \
    build-essential \
    autoconf \
    autotools-dev \
    cmake \
    gawk \
    gnuplot \
    flex \
    libfl-dev \
    libreadline-dev \
    zlib1g-dev \
    libgmp-dev \
    libmpfr-dev \
    libmpc-dev \
    libfftw3-dev \
    libscotch-dev \
    libptscotch-dev \
    libboost-system-dev \
    libboost-thread-dev \
    libcgal-dev

echo "Dependencies installation complete."
