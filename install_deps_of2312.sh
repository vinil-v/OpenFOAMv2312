#!/bin/bash

################################################################################
# OpenFOAM v2312 Dependencies Installation Script
################################################################################

# Author:
# Vinil Vadakkepurakkal

# Description:
# This script installs the dependencies required for OpenFOAM v2312 for Ubuntu 22.04 through CycleCloud Cloud-init.
# Refer to the official documentation for detailed information on OpenFOAM v2312 dependencies.
# Refer to https://develop.openfoam.com/Development/openfoam/blob/develop/doc/Requirements.md

# Instructions:
# - Ensure that this script is executed with appropriate permissions.
# - Make sure you have an active internet connection.
# - Adjust the script parameters and configurations as needed for your environment.

# For any inquiries or assistance, contact the author.

################################################################################
# Update Package Index
################################################################################
echo "Updating package index..."
sudo apt update

################################################################################
# Install Required Dependencies
################################################################################
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
