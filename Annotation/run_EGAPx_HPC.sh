#!/bin/bash
#$ -M ebrooks5@nd.edu
#$ -m abe
#$ -r n
#$ -N run_EGAPx_jobOutput
#$ -pe smp 31

# script to run the EGAPx pipeline
# usage: qsub run_EGAPx_HPC.sh inputFile
# usage ex: qsub run_EGAPx_HPC.sh inputs_KAP4.txt

# retrieve species name
speciesName=$(grep "species:" ../"InputData/"$inputFile".txt" | tr -d " " | sed "s/species://g")

# retrieve inputs path
inputsPath=$(grep "inputs_EGAPx:" ../"InputData/"$inputFile".txt" | tr -d " " | sed "s/inputs_EGAPx://g")

# retrieve software path
softwarePath=$(grep "software_EGAPx:" ../"InputData/inputPaths.txt" | tr -d " " | sed "s/software_EGAPx://g")

# retrieve outputs path
outputsPath=$(grep "outputs_EGAPx:" ../"InputData/inputPaths.txt" | tr -d " " | sed "s/outputs_EGAPx://g")

# setup outputs directory
outputsPath=$outputsPath"/"$speciesName

# make temporary data path
mkdir $outputsPath"/"temp_datapath

# move to outputs directory
cd $outputsPath

# status message
echo "Beginning analysis..."

# run EGAPx to copy config files
python3 $softwarePath"/ui/"egapx.py $inputsPath -e singularity -w $outputsPath"/"temp_datapath -o $outputsPath

# run EGAPx
python3 $softwarePath"/ui/"egapx.py $inputsPath -e singularity -w $outputsPath"/"temp_datapath -o $outputsPath

# run nextflow
nextflow -C $outputsPath"/egapx_config/"singularity.config,$softwarePath"/ui/assets/config/"default.config,$softwarePath"/ui/assets/config/"docker_image.config,$softwarePath"/ui/assets/config/"process_resources.config -log $outputsPath"/"nextflow.log run $softwarePath"/ui/"../nf/ui.nf --output $outputsPath -with-report $outputsPath"/"run.report.html -with-timeline $outputsPath"/"run.timeline.html -with-trace $outputsPath"/"run.trace.txt -params-file $outputsPath"/"run_params.yaml -resume

# status message
echo "Analysis complete!"
