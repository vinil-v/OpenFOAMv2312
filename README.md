# OpenFOAM-v2312 Scripts

This repository contains a set of scripts for downloading, installing dependencies, building, and running simulations with OpenFOAM-v2312. Below is a brief description of each script in Azure CycleCloud context. The scripts are designed to be used in a Slurm environment, but can be modified to work with other job schedulers as well. The scripts are provided as-is and may require modifications to suit your specific system configuration and requirements. Please review and test the scripts before using them in production environments.:

## Scripts:

### 1. `download_of2312.sh`

- **Purpose**: Downloads OpenFOAM-v2312 and extracts the contents.
- **Usage**: Simply execute the script in your desired directory where you want to install OpenFOAM-v2312.

### 2. `install_deps_of2312.sh`

- **Purpose**: Installs dependencies required for OpenFOAM-v2312 installation.
- **Usage**: Run the script to automatically install necessary dependencies.

### 3. `build_of2312-job.sh`

- **Purpose**: Compiles OpenFOAM-v2312 through a Slurm job.
- **Usage**: Submit this script as a Slurm job to compile OpenFOAM-v2312. Ensure proper configuration of Slurm environment variables.

### 4. `motorbike_sim_job_of2312.sh`

- **Purpose**: Test job for running an OpenFOAM simulation.
- **Usage**: Submit this script as a Slurm job to run an OpenFOAM simulation. Modify the script as per your simulation requirements.

## Prerequisites:

- **Slurm**: For running the compilation and simulation jobs, ensure that Slurm is properly configured on your system.
- **Dependencies**: Make sure to install necessary dependencies using `install_deps_of2312.sh` script before building OpenFOAM-v2312.
- **OpenFOAM**: You need to have OpenFOAM-v2312 source code available for compilation.

## Usage:

1. Clone this repository: `https://github.com/vinil-v/of2312-build-repo.git`
2. Navigate to the directory: `cd of2312-build-repo`
3. Execute the scripts as per your requirements.

## Disclaimer:

These scripts are provided as-is and may require modifications to suit your specific system configuration and requirements. Please review and test the scripts before using them in production environments.


