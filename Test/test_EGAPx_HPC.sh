#!/bin/bash
#$ -M ebrooks5@nd.edu
#$ -m abe
#$ -r n
#$ -N run_EGAPx_jobOutput
#$ -pe smp 31

# script to test run the EGAPx pipeline
# NOTE: the /egapx/ui/assets/config/process_resources.config file specifies up to 31 cores (huge_Job)
# usage: qsub test_EGAPx_HPC.sh

# move to working directory
cd /afs/crc.nd.edu/user/e/ebrooks5/EGAPx_test_HPC

# make temp data directory
mkdir /afs/crc.nd.edu/user/e/ebrooks5/egapx_temp_datapath_HPC

# Run EGAPx for the first time to copy the config files so you can edit them
python3 /afs/crc.nd.edu/user/e/ebrooks5/egapx/ui/egapx.py /afs/crc.nd.edu/user/e/ebrooks5/egapx/examples/input_D_farinae_small.yaml -o example_out 

# Run EGAPx with the following command for real this time
python3 /afs/crc.nd.edu/user/e/ebrooks5/egapx/ui/egapx.py /afs/crc.nd.edu/user/e/ebrooks5/egapx/examples/input_D_farinae_small.yaml -e singularity -w /afs/crc.nd.edu/user/e/ebrooks5/egapx_temp_datapath_HPC/D_farinae -o example_out

# run nextflow
nextflow -C /afs/crc.nd.edu/user/e/ebrooks5/EGAPx_test_HPC/egapx_config/singularity.config,/afs/crc.nd.edu/user/e/ebrooks5/egapx/ui/assets/config/default.config,/afs/crc.nd.edu/user/e/ebrooks5/egapx/ui/assets/config/docker_image.config,/afs/crc.nd.edu/user/e/ebrooks5/egapx/ui/assets/config/process_resources.config -log /afs/crc.nd.edu/user/e/ebrooks5/EGAPx_test_HPC/example_out/nextflow.log run /afs/crc.nd.edu/user/e/ebrooks5/egapx/ui/../nf/ui.nf --output /afs/crc.nd.edu/user/e/ebrooks5/EGAPx_test_HPC/example_out -with-report /afs/crc.nd.edu/user/e/ebrooks5/EGAPx_test_HPC/example_out/run.report.html -with-timeline /afs/crc.nd.edu/user/e/ebrooks5/EGAPx_test_HPC/example_out/run.timeline.html -with-trace /afs/crc.nd.edu/user/e/ebrooks5/EGAPx_test_HPC/example_out/run.trace.txt -params-file /afs/crc.nd.edu/user/e/ebrooks5/EGAPx_test_HPC/example_out/run_params.yaml -resume

# clean up
rm -r /afs/crc.nd.edu/user/e/ebrooks5/egapx_temp_datapath_HPC
