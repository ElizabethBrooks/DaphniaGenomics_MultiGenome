#!/bin/bash

# script to count embedded genes
# usage: bash count_embedded_genes.sh inputFile
# usage ex: bash count_embedded_genes.sh EGAPx_v0.3.2/D_melanica/inputs_CON6_BC_clean.txt

# load software 
#conda activate my_bedtools

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
#outputsPath=$(grep "outputs_EGAPx_v0.3.2_CNGBdb:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.3.2_CNGBdb://g")
#outputsPath=$(grep "outputs_EGAPx_v0.3.2_zenodo:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.3.2_zenodo://g")
#outputsPath=$(grep "outputs_EGAPx_v0.3.2_NCBI:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.3.2_NCBI://g")
#outputsPath=$(grep "outputs_EGAPx_v0.5.2_NCBI:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.5.2_NCBI://g")
#outputsPath=$(grep "outputs_EGAPx_v0.3.2_ZQ_V2:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.3.2_ZQ_V2://g")
#outputsPath=$(grep "outputs_EGAPx_v0.3.2_ZQ_B2:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.3.2_ZQ_B2://g")
#outputsPath=$(grep "outputs_EGAPx_v0.3.2_ZQ_B1:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.3.2_ZQ_B1://g")
#outputsPath=$(grep "outputs_EGAPx_v0.3.2_ZQ2:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.3.2_ZQ2://g")
#outputsPath=$(grep "outputs_EGAPx_v0.3.2_BC2:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.3.2_BC2://g")
#outputsPath=$(grep "outputs_EGAPx_v0.3.2:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.3.2://g")

# setup outputs path
outputsPath=$outputsPath"/"$speciesName

# create outputs directory
mkdir $outputsPath"/gene_analysis"

# move to the outputs directory
cd $outputsPath"/gene_analysis"

# status message
echo "Beginning analysis of $speciesName..."

# name of output files
outFile="embedded_gene_count.txt"
outFileLongest="embedded_longest_gene_count.txt"

# retrieve gene feature info
awk '$3 == "gene"' $outputsPath"/complete.genomic.gff" > $outputsPath"/gene_analysis/genes.gff"

# retrieve longest gene feature info
awk '$3 == "gene"' $outputsPath"/AGAT_v1.4.2/output_longest.gff" > $outputsPath"/gene_analysis/longest_genes.gff"

# find embedded genes using bedtools
bedtools intersect -a $outputsPath"/gene_analysis/genes.gff" -b $outputsPath"/gene_analysis/genes.gff" -f 1.0 -e -c | awk '$NF > 1' > $outputsPath"/gene_analysis/"$outFile

# find embedded longest genes using bedtools
bedtools intersect -a $outputsPath"/gene_analysis/longest_genes.gff" -b $outputsPath"/gene_analysis/longest_genes.gff" -f 1.0 -e -c | awk '$NF > 1' > $outputsPath"/gene_analysis/"$outFileLongest

# status message
echo "Analysis of $speciesName complete!"
