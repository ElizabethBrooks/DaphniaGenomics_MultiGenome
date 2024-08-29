#!/bin/bash
#$ -M ebrooks5@nd.edu
#$ -m abe
#$ -r n
#$ -N resume_EGAPx_jobOutput
#$ -pe smp 63

# script to run the EGAPx pipeline
# NOTE: the default /egapx/ui/assets/config/process_resources.config file specifies up to 31 cores (huge_Job)
# our afs system has 263Gb RAM, 64 cores
# usage: qsub resume_EGAPx_HPC.sh inputFile
# usage ex: qsub resume_EGAPx_HPC.sh inputs_KAP4_NCBI.txt
## job 747590 -> DONE
## Wallclock Time   = 5:08:08:48
# usage ex: qsub resume_EGAPx_HPC.sh inputs_KAP106.txt
## job 747591 -> DONE
## Wallclock Time   = 5:22:04:05

# load the egapx software module (contains nextflow)
module load bio/egapx/0.1.1

# retrieve input file
inputFile=$1

# retrieve species name
speciesName=$(grep "species:" ../"InputData/"$inputFile | tr -d " " | sed "s/species://g")

# retrieve inputs path
inputsPath=$(grep "inputs_EGAPx:" ../"InputData/"$inputFile | tr -d " " | sed "s/inputs_EGAPx://g")

# retrieve repository directory
repoDir=$(dirname $PWD)

# setup inputs path
inputsPath=$repoDir"/InputData/"$inputsPath

# retrieve software path
softwarePath=$(grep "software_EGAPx:" ../"InputData/inputPaths.txt" | tr -d " " | sed "s/software_EGAPx://g")

# retrieve outputs path
outputsPath=$(grep "outputs_EGAPx:" ../"InputData/inputPaths.txt" | tr -d " " | sed "s/outputs_EGAPx://g")

# setup outputs directory
outputsPath=$outputsPath"/"$speciesName

# move to outputs directory
cd $outputsPath

# status message
echo "Resuming analysis of $speciesName..."

# run nextflow
nextflow -C $outputsPath"/egapx_config/singularity.config",$softwarePath"/ui/assets/config/default.config",$softwarePath"/ui/assets/config/docker_image.config",$softwarePath"/ui/assets/config/process_resources.config" \
	-log $outputsPath"/nextflow.log" run $softwarePath"/ui/"../nf/ui.nf \
	--output $outputsPath \
	-with-report $outputsPath"/run.report.html" \
	-with-timeline $outputsPath"/run.timeline.html" \
	-with-trace $outputsPath"/run.trace.txt" \
	-params-file $outputsPath"/run_params.yaml" \
	-resume

# clean up
#rm -r $outputsPath"/temp_datapath"
#rm -r $outputsPath"/work"

# status message
echo "Analysis of $speciesName complete!"
