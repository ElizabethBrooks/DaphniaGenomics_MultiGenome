#!/bin/bash

# script to install and test run the EGAPx pipeline
# https://github.com/ncbi/egapx?tab=readme-ov-file

# Install Nextflow
pip install nextflow

# Clone the EGAPx repo
git clone https://github.com/ncbi/egapx.git
cd egapx

# Create a virtual environment where you can run EGAPx. There is a requirements.txt file. PyYAML will be installed in this environment
python -m venv /afs/crc.nd.edu/user/e/ebrooks5/EGAPx_env
source /afs/crc.nd.edu/user/e/ebrooks5/EGAPx_env/bin/activate
pip install -r /afs/crc.nd.edu/user/e/ebrooks5/egapx/ui/requirements.txt
