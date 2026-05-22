#!/bin/bash
#$ -M ebrooks5@nd.edu
#$ -m abe
#$ -r n
#$ -N find_orthos_BC_jobOutput
#$ -pe smp 32

# script to find orthologs
# usage: qsub find_orthos_orthofinder_BC.sh

# setup inputs path
#inputsPath="/scratch365/ebrooks5/multi_genome_project/OrthoFinder_v3.1.4/data/BC/EGAPx_v0.3.2/AGAT_v1.4.2/all"
#inputsPath="/scratch365/ebrooks5/multi_genome_project/OrthoFinder_v3.1.4/data/BC/EGAPx_v0.3.2/AGAT_v1.4.2/DE_set"
inputsPath="/groups/mpfrende/Projects_2026/multi_genome/OrthoFinder_v3.1.4/data/BC/compare_set"

# setup outputs path
#outputsPath="/scratch365/ebrooks5/multi_genome_project/OrthoFinder_v3.1.4/BC/EGAPx_v0.3.2/AGAT_v1.4.2/all"
#outputsPath="/scratch365/ebrooks5/multi_genome_project/OrthoFinder_v3.1.4/BC/EGAPx_v0.3.2/AGAT_v1.4.2/DE_set"
outputsPath="/groups/mpfrende/Projects_2026/multi_genome/OrthoFinder_v3.1.4/BC/compare_set"

# status message
echo "Beginning analysis of orthologs..."

# activate conda environment
conda activate of_env

# run orthofinder
orthofinder -t 32 -a 8 -f $inputsPath -o $outputsPath

# status message
echo "Analysis of orthologs complete!"
