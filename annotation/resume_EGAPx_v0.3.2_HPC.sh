#!/bin/bash
#$ -M ebrooks5@nd.edu
#$ -m abe
#$ -r n
#$ -N resume_EGAPx_v0.3.2_jobOutput
#$ -pe smp 15
#$ -q largemem

# script to run the EGAPx v0.3.2 pipeline
# usage: qsub run_EGAPx_v0.3.2_HPC.sh inputFile

# NOTE: the default /egapx/ui/assets/config/process_resources.config file specifies up to 31 cores (huge_Job)
# our afs system has 263Gb RAM, 64 cores
# make sure to always leave 1 core free for general processes, so request up to 63 cores per job on our afs system

# retrieve input file
inputFile=$1

# retrieve species name
speciesName=$(grep "species:" ../"inputData/"$inputFile | tr -d " " | sed "s/species://g")

# retrieve inputs path
inputsPath=$(grep "inputs_EGAPx:" ../"inputData/"$inputFile | tr -d " " | sed "s/inputs_EGAPx://g")

# retrieve repository directory
repoDir=$(dirname $PWD)

# setup inputs path
inputsPath=$repoDir"/inputData/"$inputsPath

# retrieve software path
softwarePath=$(grep "software_EGAPx_v0.3.2:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/software_EGAPx_v0.3.2://g")

# retrieve outputs path
outputsPath=$(grep "outputs_EGAPx_v0.3.2:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.3.2://g")

# setup outputs directory
outputsPath=$outputsPath"/"$speciesName

# move to outputs directory
cd $outputsPath

# status message
echo "Resuming analysis of $speciesName..."

# run EGAPx
python3 $softwarePath"/ui/egapx.py" $inputsPath -e singularity -w $outputsPath"/temp_datapath" -o $outputsPath -resume

# clean up, if accept.gff output file exsists
#if [ ! -f $outputsPath"/accept.gff" ]; then
	# run to resume annotation
#	bash $outputsPath"/resume.sh"
#else
#    rm -r $outputsPath"/temp_datapath"
	#rm -r $outputsPath"/work"
	#rm -r $outputsPath"/annot_builder_output"
#fi

# status message
echo "Analysis of $speciesName complete!"
