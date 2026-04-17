#!/bin/bash

# script to perform fastqc quality control of paired end reads
# usage: bash multiqc_shortReads.sh

# required modules for ND CRC servers
module load bio

# set the outputs directory
outputsPath="/scratch365/ebrooks5/multi_genome_project/data/Daphnia_RNAseq/pooled_annotation_RNA/MultiQC"

# create the outputs directory
mkdir $outputsPath

# move to the new directory
cd $outputsPath

# name version output file
versionFile=$outputsPath"/software_version_summary.txt"

# report software version
multiqc -version > $versionFile

# run multiqc
multiqc $outputsPath -o $outputsPath -n "multiqc_raw"

# print status message
echo "Analysis complete!"
