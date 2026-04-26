#!/bin/bash
#$ -M ebrooks5@nd.edu
#$ -m abe
#$ -r n
#$ -N extract_prot_AGAT_jobOutput

# script to keep only the longest isoforms in the input gff
# usage: qsub extract_longest_proteins_AGAT.sh inputFile
# usage ex: qsub extract_longest_proteins_AGAT.sh EGAPx_v0.3.2/D_melanica/inputs_CON6_BC_clean.txt

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

# retrieve software path
softwarePath=$(grep "software_AGAT:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/software_AGAT://g")

# retrieve outputs path
# change this for different test runs
outputsPath=$(grep "outputs_EGAPx_v0.3.2_BC:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.3.2_BC://g")

# setup outputs path
outputsPath=$outputsPath"/"$speciesName

# create outputs directory
mkdir $outputsPath"/AGAT"

# move to the AGAT software directory
cd $outputsPath"/AGAT"

# status message
echo "Beginning analysis of $speciesName..."

# extract longest proteins
singularity exec --bind $PWD $softwarePath"/agat_1.4.2--pl5321hdfd78af_0.sif" agat_sp_extract_sequences.pl -gff $outputsPath"/AGAT/output_longest.gff" -f $outputsPath"/complete.genomic.fna" -p -o $outputsPath"/AGAT/longest_protein.fa"

# status message
echo "Analysis of $speciesName complete!"
