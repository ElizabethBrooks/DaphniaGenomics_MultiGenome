#!/bin/bash
#$ -M ebrooks5@nd.edu
#$ -m abe
#$ -r n
#$ -N functional_annotation_emapper_jobOutput
#$ -pe smp 15

# script to clean the input gff
# usage: qsub functional_annotation_emapper.sh inputFile
# usage ex: qsub functional_annotation_emapper.sh EGAPx_v0.3.2/D_melanica/inputs_CON6_BC_clean.txt

# retrieve input file
inputFile=$1

# retrieve species name
speciesName=$(grep "species:" ../"inputData/"$inputFile | tr -d " " | sed "s/species://g")
speciesTag=$(echo $speciesName | cut -d"_" -f1,2)
strainTag=$(echo $speciesName | cut -d"_" -f3-)

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
outputsPath=$outputsPath"/"$speciesName"/AGAT_v1.4.2"

# create outputs directory
mkdir $outputsPath"/emapper_v2.1.3"

# move to the outputs directory
cd $outputsPath"/emapper_v2.1.3"

# status message
echo "Beginning analysis of $speciesName..."

# run eggnog mapper
emapper.py --cpu 15 -i $outputsPath"/longest_protein_cleaned.fa" --itype "proteins" -m "diamond" --data_dir "/groups/mpfrende/Projects_2026/software/eggnog_db" -o $outputsPath"/emapper_v2.1.3"

# status message
echo "Analysis of $speciesName complete!"
