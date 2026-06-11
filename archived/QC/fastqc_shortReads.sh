#!/bin/bash
#$ -M ebrooks5@nd.edu
#$ -m abe
#$ -r n
#$ -N fastqc_MultiGenome_jobOutput

# Script to perform fastqc quality control of paired end reads
# usage: qsub fastqc_shortReads.sh inputsFile
# usage Ex: qsub fastqc_shortReads.sh EGAPx_v0.3.2/D_melanica/inputs_CON6_BC.txt

# required modules for ND CRC servers
module load bio

# retrieve input file
inputFile=$1

# set input species
inputSpecies=$(grep "species:" ../"inputData/"$inputFile | tr -d " " | sed "s/species://g")

# setup yaml path
inputYaml=$(echo $inputFile | sed "s/\.txt/.yaml/g")

# retrieve the input RNA
inputRNA=$(grep -A1 "reads:" ../"inputData/"$inputYaml | tail -1 | sed "s/^.*-\ //g")
inputRNA=$(dirname $inputRNA)

# set the outputs directory
outputsPath="/scratch365/ebrooks5/multi_genome_project/data/Daphnia_RNAseq/pooled_annotation_RNA/QC"

# create the outputs directory
mkdir $outputsPath

# set the outputs directory
outputsPath="/scratch365/ebrooks5/multi_genome_project/data/Daphnia_RNAseq/pooled_annotation_RNA/QC/"$inputSpecies

# make a new directory for analysis
mkdir $outputsPath

# check if the folder already exists
if [ $? -ne 0 ]; then
	echo "The $outputsPath directory already exsists... please remove before proceeding."
	exit 1
fi

# move to the new directory
cd $outputsPath

# name version output file
versionFile=$outputsPath"/software_version_summary.txt"

# report software version
fastqc -version > $versionFile

# perform QC
fastqc $inputRNA"/"* -o $outputsPath

# print status message
echo "Analysis complete!"
