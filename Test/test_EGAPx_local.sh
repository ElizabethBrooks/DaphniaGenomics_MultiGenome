#!/bin/bash

# script to test run the EGAPx pipeline
# usage: bash test_EGAPx_local.sh

# move to working directory
cd /afs/crc.nd.edu/user/e/ebrooks5/EGAPx_test_local

# Run EGAPx for the first time to copy the config files so you can edit them
python3 /afs/crc.nd.edu/user/e/ebrooks5/egapx/ui/egapx.py /afs/crc.nd.edu/user/e/ebrooks5/egapx/examples/input_D_farinae_small.yaml -o example_out 

# Run EGAPx with the following command for real this time
python3 /afs/crc.nd.edu/user/e/ebrooks5/egapx/ui/egapx.py /afs/crc.nd.edu/user/e/ebrooks5/egapx/examples/input_D_farinae_small.yaml -e singularity -w /afs/crc.nd.edu/user/e/ebrooks5/egapx_temp_datapath/D_farinae -o example_out
