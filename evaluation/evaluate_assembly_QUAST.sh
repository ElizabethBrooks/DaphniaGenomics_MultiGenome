#!/bin/bash
#$ -M ebrooks5@nd.edu
#$ -m abe
#$ -r n
#$ -N evaluate_assembly_QUAST_jobOutput

# script to run QUAST to evaluate genome assemblies by computing various metrics
# usage: qsub evaluate_assembly_QUAST.sh inputFile
# usage ex: qsub evaluate_assembly_QUAST.sh EGAPx_v0.3.2/D_melanica/inputs_CON6_BC_clean.txt

# load software
conda activate my_quast

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
mkdir $outputsPath"/QUAST_v5.3.0"

# status message
echo "Beginning analysis of $speciesName..."

# create contig files
mkdir $outputsPath"/QUAST_v5.3.0/contigs"
cd $outputsPath"/QUAST_v5.3.0/contigs"
awk '/^>/ {gsub(/[ \t]/, "_", $0); out=substr($1,2)".fasta"; print $0 > out; next} {print >> out}' $inputsDir"/complete.genomic.fna"

# move to the outputs directory
cd $outputsPath

# run QUAST
quast $outputsPath"/QUAST_v5.3.0/contigs/"* -t 8 -r $inputsDir"/complete.genomic.fna" -g $inputsDir"/complete.genomic.gff" -o $outputsPath"/QUAST_v5.3.0" -e -f --rna-finding

# clean up
rm -r $outputsPath"/QUAST_v5.3.0/contigs"

# status message
echo "Analysis of $speciesName complete!"
