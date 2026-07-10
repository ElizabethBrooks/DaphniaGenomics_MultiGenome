#!/bin/bash
#$ -M ebrooks5@nd.edu
#$ -m abe
#$ -r n
#$ -N resume_EGAPx_v0.5_jobOutput
#$ -pe smp 15

# script to run the EGAPx v0.5 pipeline
# usage: qsub resume_EGAPx_v0.5_HPC.sh inputFile

# NOTE: the default /egapx/ui/assets/config/process_resources.config file specifies up to 31 cores (huge_Job)
# our afs system has 263Gb RAM, 64 cores
# make sure to always leave 1 core free for general processes, so request up to 63 cores per job on our afs system
# smaller annotation jobs do not need to request as many resources (for example, 15 cores is sufficient for the average run)

# load java
conda activate my_python
conda activate --stack java_env

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
softwarePath=$(grep "software_EGAPx_v0.5.2:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/software_EGAPx_v0.5.2://g")

# retrieve outputs path
#outputsPath=$(grep "outputs_EGAPx_v0.5.2_ZQ_B1:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.5.2_ZQ_B1://g")
#outputsPath=$(grep "outputs_EGAPx_v0.5.2_ZQ_B2:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.5.2_ZQ_B2://g")
#outputsPath=$(grep "outputs_EGAPx_v0.5.2_ZQ_V2:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.5.2_ZQ_V2://g")
#outputsPath=$(grep "outputs_EGAPx_v0.5.2_BC:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.5.2_BC://g")
outputsPath=$(grep "outputs_EGAPx_v0.5.2_NCBI:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.5.2_NCBI://g")
#outputsPath=$(grep "outputs_EGAPx_v0.5.2_zenodo:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.5.2_zenodo://g")
#outputsPath=$(grep "outputs_EGAPx_v0.5.2_CNGBdb:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.5.2_CNGBdb://g")

# make outputs directory
mkdir $outputsPath

# setup outputs directory
outputsPath=$outputsPath"/"$speciesName

# move to outputs directory
cd $outputsPath

# status message
echo "Resuming analysis of $speciesName..."

# run EGAPx
python3 $softwarePath"/ui/egapx.py" $inputsPath -e singularity -w $outputsPath"/temp_datapath" -o $outputsPath -resume

# instead run EGAPx in offline mode, if necessary
#python3 $softwarePath"/ui/egapx.py" $inputsPath -e singularity -w $outputsPath"/temp_datapath" -o $outputsPath -lc $outputsPath"/local_cache" -resume


# status message
echo "Analysis of $speciesName complete!"
