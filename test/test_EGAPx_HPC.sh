#!/bin/bash
#$ -M ebrooks5@nd.edu
#$ -m abe
#$ -r n
#$ -N run_EGAPx_jobOutput
#$ -pe smp 31

# script to test run the EGAPx pipeline using HPC jobs
# NOTE: the $softwarePath"/"egapx/ui/assets/config/process_resources.config file specifies up to 31 cores (huge_Job)
# usage: qsub test_EGAPx_HPC.sh

# retrieve software path
softwarePath=$(grep "software_EGAPx:" ../"inputData/inputPaths.txt" | tr -d " " | sed "s/software_EGAPx://g")

# make test working directory
mkdir $softwarePath"/EGAPx_test_HPC"

# move to working directory
cd $softwarePath"/EGAPx_test_HPC"

# make temp data directory
mkdir $softwarePath"/EGAPx_test_HPC/temp_datapath_HPC"

# Run EGAPx for the first time to copy the config files so you can edit them
python3 $softwarePath"/egapx/ui/egapx.py" \
	$softwarePath"/egapx/examples/input_D_farinae_small.yaml" \
	-o $softwarePath"/EGAPx_test_HPC/example_out" 

# Run EGAPx with the following command for real this time
python3 $softwarePath"/egapx/ui/egapx.py" \
	$softwarePath"/egapx/examples/input_D_farinae_small.yaml" \
	-e singularity -w $softwarePath"/EGAPx_test_HPC/temp_datapath_HPC/D_farinae" \
	-o $softwarePath"/EGAPx_test_HPC/example_out"

# clean up
#rm -r $softwarePath"/EGAPx_test_HPC/temp_datapath_HPC"
