#!/bin/bash
#$ -M ebrooks5@nd.edu
#$ -m abe
#$ -r n
#$ -N download_SRA_EGAPx_jobOutput
#$ -pe smp 8

# script to download formatted SRA reads for EGAPx
# usage: download_SRA_reads_EGAPx.sh species ID
# usage ex: download_SRA_reads_EGAPx.sh KAP4 SRR24750566

# load necessary software
module load bio/2.0

# retrieve input species
inputSpecies=$2

# retrieve input SRA ID
inputID=$2

# name outputs directory
outDir="dump_"$inputSpecies

# make directory for the formatted data
mkdir $outDir

# download formated reads
prefetch $inputID

fasterq-dump --skip-technical --threads 8 --split-files --seq-defline ">\$ac.\$si.\$ri" --fasta -O $outDir"/"  ./$inputID

