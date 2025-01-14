#!/bin/bash

# script to run the EGAPx pipeline
# usage: bash run_EGAPx_local.sh inputFile
# usage ex: bash run_EGAPx_local.sh inputs_KAP4_NCBI.txt
# usage ex: bash run_EGAPx_local.sh inputs_KAP106.txt
# usage ex: bash run_EGAPx_local.sh inputs_LK16.txt
# usage ex: bash run_EGAPx_local.sh inputs_LK16_NCBI.txt
# usage ex: bash run_EGAPx_HPC.sh inputs_LK16_raw.txt

# load the egapx software module
#module load bio/egapx/0.1.1

# retrieve input file
inputFile=$1

# retrieve species name
speciesName=$(grep "species:" ../"inputData/"$inputFile | tr -d " " | sed "s/species://g")

# retrieve inputs file name
inputsPath=$(grep "inputs_EGAPx:" ../"inputData/"$inputFile | tr -d " " | sed "s/inputs_EGAPx://g")

# retrieve repository directory
repoDir=$(dirname $PWD)

# setup inputs path
inputsPath=$repoDir"/inputData/"$inputsPath

# retrieve software path
softwarePath=$(grep "software_EGAPx:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/software_EGAPx://g")

# retrieve outputs path
outputsPath=$(grep "outputs_EGAPx:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx://g")

# setup outputs directory
outputsPath=$outputsPath"/"$speciesName

#Check if the folder already exists
if [ $? -ne 0 ]; then
	echo "The $outputsPath directory already exsists... please remove before proceeding."
	exit 1
fi

# make outputs directory
mkdir $outputsPath

# make temporary data path
mkdir $outputsPath"/temp_datapath"

# move to outputs directory
cd $outputsPath

# status message
echo "Beginning analysis of $speciesName..."

# run EGAPx to copy config files
#python3 $softwarePath"/ui/egapx.py" $inputsPath -e singularity -w $outputsPath"/temp_datapath" -o $outputsPath
python3 $softwarePath"/ui/egapx.py" $inputsPath -o $outputsPath

# run EGAPx
python3 $softwarePath"/ui/egapx.py" $inputsPath -e singularity -w $outputsPath"/temp_datapath" -o $outputsPath

# run nextflow
nextflow -C $outputsPath"/egapx_config/singularity.config",$softwarePath"/ui/assets/config/default.config",$softwarePath"/ui/assets/config/docker_image.config",$softwarePath"/ui/assets/config/process_resources.config" \
	-log $outputsPath"/nextflow.log" run $softwarePath"/ui/"../nf/ui.nf \
	--output $outputsPath \
	-with-report $outputsPath"/run.report.html" \
	-with-timeline $outputsPath"/run.timeline.html" \
	-with-trace $outputsPath"/run.trace.txt" \
	-params-file $outputsPath"/run_params.yaml" \
	#-resume

# clean up
#rm -r $outputsPath"/temp_datapath"
#rm -r $outputsPath"/work"

# status message
echo "Analysis of $speciesName complete!"
