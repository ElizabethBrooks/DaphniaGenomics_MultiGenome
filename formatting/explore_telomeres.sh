#!/bin/bash

# script to extract telomere sequences
# usage: bash explore_telomeres.sh inputFile

# load software
conda activate my_tidk

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

# retrieve inputs directory
# change this for different test runs
#inputsDir=$(grep "outputs_EGAPx_v0.3.2_BC:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.3.2_BC://g")
#inputsDir=$(grep "outputs_EGAPx_v0.3.2_CNGBdb:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.3.2_CNGBdb://g")
#inputsDir=$(grep "outputs_EGAPx_v0.3.2_zenodo:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.3.2_zenodo://g")
#inputsDir=$(grep "outputs_EGAPx_v0.3.2_NCBI:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.3.2_NCBI://g")
#inputsDir=$(grep "outputs_EGAPx_v0.3.2_ZQ_V2:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.3.2_ZQ_V2://g")
#inputsDir=$(grep "outputs_EGAPx_v0.3.2_ZQ_B2:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.3.2_ZQ_B2://g")
inputsDir=$(grep "outputs_EGAPx_v0.3.2_ZQ_B1:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.3.2_ZQ_B1://g")

# setup inputs directory path
inputsDir=$inputsDir"/"$speciesName

# retrieve outputs path
#outputsPath=$(grep "outputs_EGAPx_v0.3.2_telomeres:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.3.2_telomeres://g")
outputsPath=$(grep "outputs_EGAPx_v0.3.2_telomeres_min4_max12:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.3.2_telomeres_min4_max12://g")

# create outputs directory
mkdir $outputsPath

# setup species directory
outputsPath=$outputsPath"/"$speciesName

# create outputs directory
mkdir $outputsPath
mkdir $outputsPath"/tidk_0.2.65"

# move to the outputs directory
cd $outputsPath"/tidk_0.2.65"

# status message
echo "Beginning analysis of $speciesName..."

# explore for telomeric repeats
tidk explore --minimum 4 --maximum 12 $inputsDir"/complete.genomic.fna" > $outputsPath"/tidk_0.2.65/telomeric_repeat.tsv"

# status message
echo "Analysis of $speciesName complete!"
