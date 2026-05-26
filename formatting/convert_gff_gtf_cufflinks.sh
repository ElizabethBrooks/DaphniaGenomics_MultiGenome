#!/bin/bash
#$ -M ebrooks5@nd.edu
#$ -m abe
#$ -r n
#$ -N convert_gff_cufflinks_jobOutput

# script to keep only the longest isoforms in the input gff
# usage: qsub convert_gff_gtf_cufflinks.sh inputFile
# usage ex: qsub convert_gff_gtf_cufflinks.sh EGAPx_v0.3.2/D_melanica/inputs_CON6_BC_clean.txt

# load software
module load bio

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
#outputsPath=$(grep "outputs_EGAPx_v0.3.2_BC:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.3.2_BC://g")
#outputsPath=$(grep "outputs_EGAPx_v0.3.2_BC2:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.3.2_BC2://g")
outputsPath=$(grep "outputs_EGAPx_v0.3.2_ZQ2:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.3.2_ZQ2://g")

# setup outputs path
outputsPath=$outputsPath"/"$speciesName

# create outputs directory
mkdir $outputsPath"/AGAT_v1.4.2/Cufflinks_v2.2.1"

# move to the AGAT software directory
cd $outputsPath"/AGAT_v1.4.2/Cufflinks_v2.2.1"

# status message
echo "Beginning analysis of $speciesName..."

# extract longest proteins
gffread $outputsPath"/AGAT_v1.4.2/output_longest.gff" -F -T -o $outputsPath"/AGAT_v1.4.2/Cufflinks_v2.2.1/output_longest.gtf"

# status message
echo "Analysis of $speciesName complete!"
