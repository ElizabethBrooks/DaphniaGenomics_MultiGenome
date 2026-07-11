#!/bin/bash

# script to extract telomere sequences
# usage: bash extract_telomeres.sh inputFile

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
inputsDir=$(grep "outputs_EGAPx_v0.3.2_CNGBdb:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.3.2_CNGBdb://g")
#inputsDir=$(grep "outputs_EGAPx_v0.3.2_zenodo:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.3.2_zenodo://g")
#inputsDir=$(grep "outputs_EGAPx_v0.3.2_NCBI:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.3.2_NCBI://g")
#inputsDir=$(grep "outputs_EGAPx_v0.3.2_ZQ_V2:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.3.2_ZQ_V2://g")
#inputsDir=$(grep "outputs_EGAPx_v0.3.2_ZQ_B2:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.3.2_ZQ_B2://g")
#inputsDir=$(grep "outputs_EGAPx_v0.3.2_ZQ_B1:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.3.2_ZQ_B1://g")

# setup inputs directory path
inputsDir=$inputsDir"/"$speciesName

# retrieve outputs path
#outputsPath=$(grep "outputs_EGAPx_v0.3.2_telomeres:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.3.2_telomeres://g")
#outputsPath=$(grep "outputs_EGAPx_v0.3.2_telomeres_min4_max12:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.3.2_telomeres_min4_max12://g")
outputsPath=$(grep "outputs_EGAPx_v0.3.2_telomeres_min4_max15:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.3.2_telomeres_min4_max15://g")

# setup species directory
outputsPath=$outputsPath"/"$speciesName

# move to the outputs directory
cd $outputsPath"/tidk_0.2.65"

# status message
echo "Beginning analysis of $speciesName..."

# retrieve most abundant telomeric repeat
telomere1=$(head -2 $outputsPath"/tidk_0.2.65/telomeric_repeat.tsv" | tail -1 | cut -f1)
telomere2="AACCT"
telomere3="AACCTAACCT"

# extract telomere sequences
tidk search -s $telomere1 -o "most_common" -d $outputsPath"/tidk_0.2.65" $inputsDir"/complete.genomic.fna"
tidk search -s $telomere2 -o "AACCT" -d $outputsPath"/tidk_0.2.65" $inputsDir"/complete.genomic.fna"
tidk search -s $telomere3 -o "AACCTAACCT" -d $outputsPath"/tidk_0.2.65" $inputsDir"/complete.genomic.fna"
#tidk search -s $telomere1 -o "most_common" -d $outputsPath"/tidk_0.2.65" /groups/mpfrende/Projects_2026/multi_genome/data/NCBI_genomes/Artemia_franciscana.fna
#tidk search -s $telomere2 -o "AACCT" -d $outputsPath"/tidk_0.2.65" /groups/mpfrende/Projects_2026/multi_genome/data/NCBI_genomes/Artemia_franciscana.fna
#tidk search -s $telomere3 -o "AACCTAACCT" -d $outputsPath"/tidk_0.2.65" /groups/mpfrende/Projects_2026/multi_genome/data/NCBI_genomes/Artemia_franciscana.fna

# status message
echo "Analysis of $speciesName complete!"
