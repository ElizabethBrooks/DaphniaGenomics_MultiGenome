#!/bin/bash
#$ -M ebrooks5@nd.edu
#$ -m abe
#$ -r n
#$ -N short_introns_AGAT_jobOutput

# script to list all the introns inferior to a certain size (default = 10) in the input gff
# usage: qsub list_short_introns_AGAT.sh inputFile
# usage ex: qsub list_short_introns_AGAT.sh EGAPx_v0.3.2/D_melanica/inputs_CON6_BC_clean.txt

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
#softwarePath=$(grep "software_AGAT:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/software_AGAT://g")
softwarePath=$(grep "software_AGAT_new:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/software_AGAT_new://g")

# retrieve inputs directory
# change this for different test runs
inputsDir=$(grep "outputs_EGAPx_v0.3.2_ZQ_V2:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.3.2_ZQ_V2://g")
#inputsDir=$(grep "outputs_EGAPx_v0.3.2_NCBI:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.3.2_NCBI://g")
#inputsDir=$(grep "outputs_EGAPx_v0.3.2_zenodo:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.3.2_zenodo://g")
#inputsDir=$(grep "outputs_EGAPx_v0.3.2_CNGBdb:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.3.2_CNGBdb://g")
#inputsDir=$(grep "outputs_EGAPx_v0.3.2_ZQ_B1:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.3.2_ZQ_B1://g")
#inputsDir=$(grep "outputs_EGAPx_v0.3.2_ZQ_B2:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.3.2_ZQ_B2://g")

# setup inputs directory path
inputsDir=$inputsDir"/"$speciesName

# retrieve outputs path
outputsPath=$(grep "outputs_EGAPx_v0.3.2_analysis:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.3.2_analysis://g")

# setup outputs path
outputsPath=$outputsPath"/"$speciesName

# create outputs directory
mkdir $outputsPath"/AGAT_v1.4.2"

# move to the outputs directory
cd $outputsPath"/AGAT_v1.4.2"

# status message
echo "Beginning analysis of $speciesName..."

# run AGAT
singularity exec --bind $PWD:/AGAT_v1.4.2 $softwarePath"/agat_1.4.2--pl5321hdfd78af_0.sif" agat_sp_list_short_introns.pl -gff $inputsDir"/complete.genomic.gff" -o $outputsPath"/AGAT_v1.4.2/short_introns.txt"

# status message
echo "Analysis of $speciesName complete!"
