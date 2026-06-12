#!/bin/bash
#$ -M ebrooks5@nd.edu
#$ -m abe
#$ -r n
#$ -N clean_EGAPx_outputs_jobOutput

# script to clean up outputs from the EGAPx pipeline
# usage: qsub clean_EGAPx_outputs.sh inputFile
# usage ex: qsub clean_EGAPx_outputs.sh EGAPx_v0.3.2/D_melanica/inputs_CON6_BC_clean.txt

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
#softwarePath=$(grep "software_EGAPx_v0.3.2:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/software_EGAPx_v0.3.2://g")
softwarePath=$(grep "software_EGAPx_v0.3.2_new:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/software_EGAPx_v0.3.2_new://g")

# retrieve outputs path
# change this for different test runs
#outputsPath=$(grep "outputs_EGAPx_v0.3.2:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.3.2://g")
#outputsPath=$(grep "outputs_EGAPx_v0.3.2_BC2:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.3.2_BC2://g")
#outputsPath=$(grep "outputs_EGAPx_v0.3.2_ZQ2:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.3.2_ZQ2://g")
#outputsPath=$(grep "outputs_EGAPx_v0.3.2_ZQ_V2:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.3.2_ZQ_V2://g")
#outputsPath=$(grep "outputs_EGAPx_v0.3.2_NCBI:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.3.2_NCBI://g")
#outputsPath=$(grep "outputs_EGAPx_v0.3.2_zenodo:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.3.2_zenodo://g")
outputsPath=$(grep "outputs_EGAPx_v0.3.2_CNGBdb:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.3.2_CNGBdb://g")

# setup outputs directory
outputsPath=$outputsPath"/"$speciesName

# move to outputs directory
cd $outputsPath

# status message
echo "Beginning cleaning of $speciesName..."

# clean up, if accept.gff output file exsists
rm -r $outputsPath"/temp_datapath"
rm -r $outputsPath"/local_cache"
rm -r $outputsPath"/work"
rm -r $outputsPath"/annot_builder_output"
rm -r $outputsPath"/egapx_config"
rm -r $outputsPath"/execution_logs"
rm -r $outputsPath"/validated"
rm -r $outputsPath"/.nextflow"
rm $outputsPath"/dag.dot"
rm $outputsPath"/egapx_reads_metadata_"*".tsv"
rm $outputsPath"/work_dir_singularity.last"
rm $outputsPath"/resume.sh"

# status message
echo "Analysis of $speciesName complete!"
