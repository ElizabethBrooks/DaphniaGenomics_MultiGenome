#!/bin/bash
#$ -M ebrooks5@nd.edu
#$ -m abe
#$ -r n
#$ -N get_genome_size_jobOutput

# script to get the genome size from the input fasta
# usage: qsub get_genome_size.sh inputFile

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
#outputsPath=$(grep "outputs_EGAPx_v0.3.2_BC:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.3.2_BC://g")
#outputsPath=$(grep "outputs_EGAPx_v0.3.2_CNGBdb:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.3.2_CNGBdb://g")
#outputsPath=$(grep "outputs_EGAPx_v0.3.2_zenodo:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.3.2_zenodo://g")
#outputsPath=$(grep "outputs_EGAPx_v0.3.2_NCBI:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.3.2_NCBI://g")
outputsPath=$(grep "outputs_EGAPx_v0.5.2_NCBI:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.5.2_NCBI://g")
#outputsPath=$(grep "outputs_EGAPx_v0.3.2_ZQ_V2:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.3.2_ZQ_V2://g")
#outputsPath=$(grep "outputs_EGAPx_v0.3.2_ZQ_B2:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.3.2_ZQ_B2://g")
#outputsPath=$(grep "outputs_EGAPx_v0.3.2_ZQ_B1:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.3.2_ZQ_B1://g")

# setup outputs path
outputsPath=$outputsPath"/"$speciesName

# create outputs directory
mkdir $outputsPath"/size"

# move to the outputs directory
cd $outputsPath"/size"

# status message
echo "Beginning analysis of $speciesName..."

# genome size in bp
size=$(cat $outputsPath"/complete.genomic.fna" | grep -v "^>" | tr -d -c "ACGTNacgtn" | wc -c)
sizeBP=$(cat $outputsPath"/complete.genomic.fna" | awk '/^>/ {next} {sum += length($0)} END {print sum}')

# calculate mb size
sizeMB=$(echo "scale=10; $size/1000000" | bc)

# output species and size
echo "species,size,bp,mb" > $outputsPath"/size/genome.csv"
echo $speciesName","$size","$sizeBP","$sizeMB >> $outputsPath"/size/genome.csv"

# status message
echo "Analysis of $speciesName complete!"
