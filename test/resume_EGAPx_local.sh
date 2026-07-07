#!/bin/bash

# script to test run the EGAPx pipeline locally
# usage: bash test_EGAPx_local.sh

# retrieve software path
softwarePath=$(grep "software_EGAPx:" ../"inputData/inputPaths.txt" | tr -d " " | sed "s/software_EGAPx://g")

# make test working directory
mkdir $softwarePath"/EGAPx_test_local"

# move to working directory
cd $softwarePath"/EGAPx_test_local"

# run nextflow
nextflow -C $softwarePath"/EGAPx_test_local/egapx_config/singularity.config",$softwarePath"/egapx/ui/assets/config/default.config",$softwarePath"/egapx/ui/assets/config/docker_image.config",$softwarePath"/egapx/ui/assets/config/process_resources.config" \
	-log $softwarePath"/EGAPx_test_local/example_out/nextflow.log" run $softwarePath"/"egapx/ui/../nf/ui.nf \
	--output $softwarePath"/EGAPx_test_local/example_out" \
	-with-report $softwarePath"/EGAPx_test_local/example_out/run.report.html" \
	-with-timeline $softwarePath"/EGAPx_test_local/example_out/run.timeline.html" \
	-with-trace $softwarePath"/EGAPx_test_local/example_out/run.trace.txt" \
	-params-file $softwarePath"/EGAPx_test_local/example_out/run_params.yaml" \
	-resume

# clean up
rm -r $softwarePath"/EGAPx_test_local/temp_datapath_local"
