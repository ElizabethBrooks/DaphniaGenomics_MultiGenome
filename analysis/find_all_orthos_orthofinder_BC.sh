#!/bin/bash
#$ -M ebrooks5@nd.edu
#$ -m abe
#$ -r n
#$ -N find_all_orthos_BC_jobOutput
#$ -pe smp 32

# script to clean the input gff
# usage: qsub find_all_orthos_orthofinder_BC.sh
# usage ex: qsub find_all_orthos_orthofinder_BC.sh

# setup inputs path
inputsPath="/scratch365/ebrooks5/multi_genome_orthology/data/BC/all"

# setup outputs path
outputsPath="/scratch365/ebrooks5/multi_genome_orthology/BC/all"

# status message
echo "Beginning analysis of orthologs..."

# activate conda environment
conda activate of_env

# run orthofinder
orthofinder -t 32 -a 8 -f $inputsPath -o $outputsPath

# status message
echo "Analysis of orthologs complete!"
