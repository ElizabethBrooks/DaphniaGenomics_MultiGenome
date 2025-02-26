#!/bin/bash
#$ -M ebrooks5@nd.edu
#$ -m abe
#$ -r n
#$ -N download_ENA_jobOutput

# script to download D pulex ENA data
# usage: qsub download_ENA.sh speciesTag enaIDs
# usage ex: qsub download_ENA.sh D_galeata_M5 ERP112242

# load software module
module load bio/2.0

# retrieve input species tag
speciesTag=$1

# retrieve input SRA ID(s)
inputIDs=${@:2}

# retrieve outputs path
outputsPath=$(grep "outputs_ENA:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_ENA://g")

# setup outputs directory
outputsPath=$outputsPath"/"$speciesTag

# make outputs folder
mkdir $outputsPath

# move to outputs directory
cd $outputsPath

# download ENA data
enaBrowserTools-1.6/python3/enaGroupGet -f fastq inputIDs
