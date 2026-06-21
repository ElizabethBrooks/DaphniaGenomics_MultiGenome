#!/bin/bash
#$ -M ebrooks5@nd.edu
#$ -m abe
#$ -r n
#$ -N extract_mRNA_AGAT_jobOutput

# script to keep only the longest isoforms in the input gff
# usage: qsub extract_longest_transcripts_AGAT.sh inputFile
# usage ex: qsub extract_longest_transcripts_AGAT.sh EGAPx_v0.3.2/D_melanica/inputs_CON6_BC_clean.txt

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

# retrieve outputs path
# change this for different test runs
#outputsPath=$(grep "outputs_EGAPx_v0.3.2:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.3.2://g")
#outputsPath=$(grep "outputs_EGAPx_v0.3.2_BC2:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.3.2_BC2://g")
#outputsPath=$(grep "outputs_EGAPx_v0.3.2_ZQ2:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.3.2_ZQ2://g")
#outputsPath=$(grep "outputs_EGAPx_v0.3.2_ZQ_B1:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.3.2_ZQ_B1://g")
#outputsPath=$(grep "outputs_EGAPx_v0.3.2_ZQ_B2:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.3.2_ZQ_B2://g")
#outputsPath=$(grep "outputs_EGAPx_v0.3.2_ZQ_V2:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.3.2_ZQ_V2://g")
#outputsPath=$(grep "outputs_EGAPx_v0.3.2_CNGBdb:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.3.2_CNGBdb://g")
outputsPath=$(grep "outputs_EGAPx_v0.3.2_NCBI:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.3.2_NCBI://g")
#outputsPath=$(grep "outputs_EGAPx_v0.3.2_zenodo:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.3.2_zenodo://g")

# setup outputs path
outputsPath=$outputsPath"/"$speciesName

# create outputs directory
mkdir $outputsPath"/AGAT_v1.4.2"

# move to the AGAT software directory
cd $outputsPath

# status message
echo "Beginning analysis of $speciesName..."

# extract longest mRNA
singularity exec --bind $PWD:/AGAT_v1.4.2 $softwarePath"/agat_1.4.2--pl5321hdfd78af_0.sif" agat_sp_extract_sequences.pl -gff $outputsPath"/AGAT_v1.4.2/output_longest.gff" -f $outputsPath"/complete.genomic.fna" -t mRNA -o $outputsPath"/AGAT_v1.4.2/longest_mRNA.fa"

# status message
echo "Analysis of $speciesName complete!"
