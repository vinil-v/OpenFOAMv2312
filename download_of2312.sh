#!/bin/bash

################################################################################
# OpenFOAM v2312 Download Script 
################################################################################

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

# Set installation directory
export INSTALL_DIR="$HOME/OpenFOAM"
mkdir -p "$INSTALL_DIR"
cd "$INSTALL_DIR"

# Download OpenFOAM v2312 and ThirdParty package
echo "Downloading OpenFOAM v2312..."
wget -q https://dl.openfoam.com/source/v2312/OpenFOAM-v2312.tgz
echo "Downloading ThirdParty package..."
wget -q https://dl.openfoam.com/source/v2312/ThirdParty-v2312.tgz

# Extract downloaded files
echo "Extracting OpenFOAM v2312..."
tar -xf OpenFOAM-v2312.tgz
echo "Extracting ThirdParty package..."
tar -xf ThirdParty-v2312.tgz

echo "Download and extraction completed."
