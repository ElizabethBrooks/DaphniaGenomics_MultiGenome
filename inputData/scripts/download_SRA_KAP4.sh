#!/bin/bash
#$ -M ebrooks5@nd.edu
#$ -m abe
#$ -r n
#$ -N SRA_KAP4_jobOutput
#$ -pe smp 31

# script to download D pulex SRA data
# usage: qsub download_SRA_KAP4.sh inputs_KAP4_NCBI.txt

# load software module
module load bio/2.0

# retrieve input file
inputFile=$1

# retrieve species name
speciesName=$(grep "species:" ../"inputData/"$inputFile | tr -d " " | sed "s/species://g")

# retrieve outputs path
outputsPath=$(grep "outputs_SRA:" ../"inputData/inputPaths.txt" | tr -d " " | sed "s/outputs_SRA://g")

# setup outputs directory
outputsPath=$outputsPath"/"$speciesName

# make outputs folder
mkdir $outputsPath

# move to outputs directory
cd $outputsPath

# download SRA data
fasterq-dump --threads 31 -v DRP002580 ERP110882 SRP068113 SRP102491 SRP134187 SRP135935 SRP151839 SRP249545 SRP253589 SRP270794 SRP300422 SRP351713 SRR17282827
