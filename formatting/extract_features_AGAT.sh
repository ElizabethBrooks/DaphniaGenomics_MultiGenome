#!/bin/bash
#$ -M ebrooks5@nd.edu
#$ -m abe
#$ -r n
#$ -N extract_features_AGAT_jobOutput

# script to extract features
# usage: qsub extract_features_AGAT.sh inputFile

# load software
conda activate my_agat

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
#outputsPath=$(grep "outputs_EGAPx_v0.3.2_BC:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.3.2_BC://g")
#outputsPath=$(grep "outputs_EGAPx_v0.3.2_CNGBdb:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.3.2_CNGBdb://g")
#outputsPath=$(grep "outputs_EGAPx_v0.3.2_zenodo:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.3.2_zenodo://g")
#outputsPath=$(grep "outputs_EGAPx_v0.3.2_NCBI:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.3.2_NCBI://g")
#outputsPath=$(grep "outputs_EGAPx_v0.5.2_NCBI:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.5.2_NCBI://g")
#outputsPath=$(grep "outputs_EGAPx_v0.3.2_ZQ_V2:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.3.2_ZQ_V2://g")
outputsPath=$(grep "outputs_EGAPx_v0.3.2_ZQ_B2:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.3.2_ZQ_B2://g")
#outputsPath=$(grep "outputs_EGAPx_v0.3.2_ZQ_B1:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.3.2_ZQ_B1://g")

# setup outputs path
outputsPath=$outputsPath"/"$speciesName

# create outputs directory
mkdir $outputsPath"/AGAT_v1.4.2"

# move to the AGAT software directory
cd $outputsPath

# status message
echo "Beginning analysis of $speciesName..."

# pre clean
rm $outputsPath"/AGAT_v1.4.2/lncRNAs.fa"
rm $outputsPath"/AGAT_v1.4.2/lncRNAs_split.fa"
rm $outputsPath"/AGAT_v1.4.2/five_prime_utrs.fa"
rm $outputsPath"/AGAT_v1.4.2/three_prime_utrs.fa"
rm $outputsPath"/AGAT_v1.4.2/five_prime_utrs_split.fa"
rm $outputsPath"/AGAT_v1.4.2/three_prime_utrs_split.fa"
rm $outputsPath"/AGAT_v1.4.2/exons.fa"
rm $outputsPath"/AGAT_v1.4.2/cds.fa"
rm $outputsPath"/AGAT_v1.4.2/introns.fa"
rm $outputsPath"/AGAT_v1.4.2/introns_split.fa"

# extract lnc RNAs
agat_sp_extract_sequences.pl --gff $outputsPath"/complete.genomic.gff" --fasta $outputsPath"/complete.genomic.fna" --type lnc_RNA --output $outputsPath"/AGAT_v1.4.2/lncRNAs.fa"
#agat_sp_extract_sequences.pl --gff $outputsPath"/complete.genomic.gff" --fasta $outputsPath"/complete.genomic.fna" --type lncRNA --output $outputsPath"/AGAT_v1.4.2/lncRNAs.fa"

# extract split lnc RNAs
agat_sp_extract_sequences.pl --gff $outputsPath"/complete.genomic.gff" --fasta $outputsPath"/complete.genomic.fna" --type lnc_RNA --split --output $outputsPath"/AGAT_v1.4.2/lncRNAs_split.fa"
#agat_sp_extract_sequences.pl --gff $outputsPath"/complete.genomic.gff" --fasta $outputsPath"/complete.genomic.fna" --type lncRNA --split --output $outputsPath"/AGAT_v1.4.2/lncRNAs_split.fa"

# extract UTRs
agat_sp_extract_sequences.pl --gff $outputsPath"/complete.genomic.gff" --fasta $outputsPath"/complete.genomic.fna" --type five_prime_UTR --output $outputsPath"/AGAT_v1.4.2/five_prime_utrs.fa"
agat_sp_extract_sequences.pl --gff $outputsPath"/complete.genomic.gff" --fasta $outputsPath"/complete.genomic.fna" --type three_prime_UTR --output $outputsPath"/AGAT_v1.4.2/three_prime_utrs.fa"

# extract split UTRs
agat_sp_extract_sequences.pl --gff $outputsPath"/complete.genomic.gff" --fasta $outputsPath"/complete.genomic.fna" --type five_prime_UTR --split --output $outputsPath"/AGAT_v1.4.2/five_prime_utrs_split.fa"
agat_sp_extract_sequences.pl --gff $outputsPath"/complete.genomic.gff" --fasta $outputsPath"/complete.genomic.fna" --type three_prime_UTR --split --output $outputsPath"/AGAT_v1.4.2/three_prime_utrs_split.fa"

# extract exons
agat_sp_extract_sequences.pl --gff $outputsPath"/complete.genomic.gff" --fasta $outputsPath"/complete.genomic.fna" --type exon --keep_parent_attributes --output $outputsPath"/AGAT_v1.4.2/exons.fa"

# extract cds
agat_sp_extract_sequences.pl --gff $outputsPath"/complete.genomic.gff" --fasta $outputsPath"/complete.genomic.fna" --type cds --keep_parent_attributes --output $outputsPath"/AGAT_v1.4.2/cds.fa"

# extract introns
agat_sp_extract_sequences.pl --gff $outputsPath"/AGAT_v1.4.2/introns.gff" --fasta $outputsPath"/complete.genomic.fna" --type intron --keep_parent_attributes --output $outputsPath"/AGAT_v1.4.2/introns.fa"

# extract split introns
#agat_sp_extract_sequences.pl --gff $outputsPath"/AGAT_v1.4.2/introns.gff" --fasta $outputsPath"/complete.genomic.fna" --type intron --split --keep_parent_attributes --output $outputsPath"/AGAT_v1.4.2/introns_split.fa"


# status message
echo "Analysis of $speciesName complete!"
