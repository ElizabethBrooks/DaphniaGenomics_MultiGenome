#!/bin/bash
#$ -M ebrooks5@nd.edu
#$ -m abe
#$ -r n
#$ -N clean_EGAPx_outputs_jobOutput

# script to clean up outputs from the EGAPx pipeline
# usage: qsub clean_EGAPx_v0.5.2_outputs.sh inputFile

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

# retrieve outputs path
# change this for different test runs
#outputsPath=$(grep "outputs_EGAPx_v0.5.2_ZQ_B1:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.5.2_ZQ_B1://g")
#outputsPath=$(grep "outputs_EGAPx_v0.5.2_ZQ_B2:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.5.2_ZQ_B2://g")
#outputsPath=$(grep "outputs_EGAPx_v0.5.2_ZQ_V2:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.5.2_ZQ_V2://g")
#outputsPath=$(grep "outputs_EGAPx_v0.5.2_BC:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.5.2_BC://g")
outputsPath=$(grep "outputs_EGAPx_v0.5.2_NCBI:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.5.2_NCBI://g")
#outputsPath=$(grep "outputs_EGAPx_v0.5.2_zenodo:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.5.2_zenodo://g")
#outputsPath=$(grep "outputs_EGAPx_v0.5.2_CNGBdb:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.5.2_CNGBdb://g")

# setup outputs directory
outputsPath=$outputsPath"/"$speciesName

# move to outputs directory
cd $outputsPath

# status message
echo "Beginning cleaning of $speciesName..."

# clean up, if accept.gff output file exsists
rm -r $outputsPath"/temp_datapath"
rm -r $outputsPath"/egapx_config"
rm -r $outputsPath"/nextflow/execution_logs"
rm -r $outputsPath"/.nextflow"

# status message
echo "Analysis of $speciesName complete!"
