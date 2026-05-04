#!/bin/bash
#$ -M ebrooks5@nd.edu
#$ -m abe
#$ -r n
#$ -N run_gfftk_jobOutput

# script to clean the input gff
# usage: qsub clean_gff_gfftk.sh inputFile
# usage ex: qsub clean_gff_gfftk.sh EGAPx_v0.3.2/D_melanica/inputs_CON6_BC_clean.txt

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

# retrieve outputs path
# change this for different test runs
outputsPath=$(grep "outputs_EGAPx_v0.3.2_BC:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.3.2_BC://g")

# setup outputs path
outputsPath=$outputsPath"/"$speciesName

# create outputs directory
mkdir $outputsPath"/GFFtk"

# move to the AGAT software directory
cd $outputsPath

# status message
echo "Beginning analysis of $speciesName..."

# run gfftk
gfftk sanitize -f $outputsPath"/complete.genomic.fna" -g $outputsPath"/AGAT/output_longest.gff" -o $outputsPath"/GFFtk/clean.gff3"

# check stats
gfftk stats -f $outputsPath"/complete.genomic.fna" -i $outputsPath"/GFFtk/clean.gff3"

# status message
echo "Analysis of $speciesName complete!"
