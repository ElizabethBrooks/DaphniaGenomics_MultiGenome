#!/bin/bash

# script to install and test run the EGAPx pipeline

# Install Nextflow
pip install nextflow

# Clone the EGAPx repo
git clone https://github.com/ncbi/egapx.git
cd egapx

# Create a virtual environment where you can run EGAPx. There is a requirements.txt file. PyYAML will be installed in this environment
python -m venv /afs/crc.nd.edu/user/e/ebrooks5/EGAPx_env
source /afs/crc.nd.edu/user/e/ebrooks5/EGAPx_env/bin/activate
pip install -r ui/requirements.txt

# Run EGAPx for the first time to copy the config files so you can edit them
python3 ui/egapx.py ./examples/input_D_farinae_small.yaml -o example_out 

# Run EGAPx with the following command for real this time
python3 ui/egapx.py ./examples/input_D_farinae_small.yaml -e singularity -w /afs/crc.nd.edu/user/e/ebrooks5/egapx_temp_datapath/D_farinae -o example_out
