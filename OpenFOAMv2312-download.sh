#!/bin/bash

# OpenFOAM v2312 Download Script README
# --------------------------------------

# Description:
# This script is designed to download OpenFOAM v2312 onto your system.

# Author:
# Vinil Vadakkepurakkal

# Usage:
# 1. Run this script to initiate the download of OpenFOAM v2312.
# 2. After downloading, follow the installation instructions provided by the OpenFOAM documentation.

# Note:
# Make sure you have sufficient disk space and a stable internet connection for downloading OpenFOAM v2312.
# Ensure that you have the necessary permissions to execute the script and save the downloaded files.

# For any questions or issues, feel free to contact the author.

# Happy downloading!

export INSTALL_DIR=$HOME/OpenFOAM
mkdir -p $INSTALL_DIR
cd $INSTALL_DIR
wget https://dl.openfoam.com/source/v2312/OpenFOAM-v2312.tgz
wget https://dl.openfoam.com/source/v2312/ThirdParty-v2312.tgz
tar -xf OpenFOAM-v2312.tgz 
tar -xf ThirdParty-v2312.tgz