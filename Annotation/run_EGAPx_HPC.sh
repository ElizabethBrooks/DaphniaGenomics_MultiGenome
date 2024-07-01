#!/bin/bash
#$ -M ebrooks5@nd.edu
#$ -m abe
#$ -r n
#$ -N run_EGAPx_jobOutput
#$ -pe smp 31

# script to run the EGAPx pipeline
# NOTE: the /egapx/ui/assets/config/process_resources.config file specifies up to 31 cores (huge_Job)
# NOTE: EGAPx expects that input "reads" are a list of FASTA read files, expects pairs in form SRAxxx.1, SRAxxx.2
# usage: qsub run_EGAPx_HPC.sh inputFile
# usage ex: qsub run_EGAPx_HPC.sh inputs_KAP4_NCBI.txt
# usage ex: qsub run_EGAPx_HPC.sh inputs_KAP106.txt
# usage ex: qsub run_EGAPx_HPC.sh inputs_LK16.txt
# usage ex: qsub run_EGAPx_HPC.sh inputs_LK16_NCBI.txt
# usage ex: qsub run_EGAPx_HPC.sh inputs_LK16_raw.txt

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

# make outputs directory
mkdir $outputsPath

# make temporary data path
mkdir $outputsPath"/temp_datapath"

# move to outputs directory
cd $outputsPath

# status message
echo "Beginning analysis of $speciesName..."

# run EGAPx to copy config files
python3 $softwarePath"/ui/egapx.py" $inputsPath -e singularity -w $outputsPath"/temp_datapath" -o $outputsPath

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
	-resume

# clean up
rm -r $outputsPath"/temp_datapath"
rm -r $outputsPath"/work"

# status message
echo "Analysis of $speciesName complete!"
