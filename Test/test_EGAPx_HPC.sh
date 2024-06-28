#!/bin/bash
#$ -M ebrooks5@nd.edu
#$ -m abe
#$ -r n
#$ -N run_EGAPx_jobOutput
#$ -pe smp 8

# script to test run the EGAPx pipeline
# usage: qsub test_EGAPx_HPC.sh

# move to working directory
cd /afs/crc.nd.edu/user/e/ebrooks5/EGAPx_test

# Run EGAPx for the first time to copy the config files so you can edit them
python3 /afs/crc.nd.edu/user/e/ebrooks5/egapx/ui/egapx.py /afs/crc.nd.edu/user/e/ebrooks5/egapx/examples/input_D_farinae_small.yaml -o example_out 

# Run EGAPx with the following command for real this time
python3 /afs/crc.nd.edu/user/e/ebrooks5/egapx/ui/egapx.py /afs/crc.nd.edu/user/e/ebrooks5/egapx/examples/input_D_farinae_small.yaml -e slurm -w /afs/crc.nd.edu/user/e/ebrooks5/egapx_temp_datapath/D_farinae -o example_out
