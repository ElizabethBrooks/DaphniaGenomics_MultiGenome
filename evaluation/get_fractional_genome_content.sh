#!/bin/bash
#$ -M ebrooks5@nd.edu
#$ -m abe
#$ -r n
#$ -N fractional_genome_content_jobOutput

# script to extract features
# usage: qsub get_fractional_genome_content.sh inputFile

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
#outputsPath=$(grep "outputs_EGAPx_v0.3.2_CNGBdb:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.3.2_CNGBdb://g")
outputsPath=$(grep "outputs_EGAPx_v0.3.2_zenodo:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.3.2_zenodo://g")
#outputsPath=$(grep "outputs_EGAPx_v0.3.2_NCBI:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.3.2_NCBI://g")
#outputsPath=$(grep "outputs_EGAPx_v0.5.2_NCBI:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.5.2_NCBI://g")
#outputsPath=$(grep "outputs_EGAPx_v0.3.2_ZQ_V2:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.3.2_ZQ_V2://g")
#outputsPath=$(grep "outputs_EGAPx_v0.3.2_ZQ_B2:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.3.2_ZQ_B2://g")
#outputsPath=$(grep "outputs_EGAPx_v0.3.2_ZQ_B1:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.3.2_ZQ_B1://g")

# setup outputs path
outputsPath=$outputsPath"/"$speciesName

# create outputs directory
mkdir $outputsPath"/AGAT_v1.4.2"

# move to the AGAT software directory
cd $outputsPath

# status message
echo "Beginning analysis of $speciesName..."

# genome size
size=$(cat $outputsPath"/complete.genomic.fna" | grep -v "^>" | tr -d -c "ACGTNacgtn" | wc -c)

# protein coding exon length total
exonLength=$(cat $outputsPath"/AGAT_v1.4.2/exons_merged.fa" | awk '/^>/ {printf("\n%s\n",$0);next;} {printf("%s",$0);}' | grep -A1 "gene_biotype=protein_coding" | sed '/^$/d' | awk '!/^>/ {total += length($0)} END {print total}')

# protein coding intron length total
intronLength=$(cat $outputsPath"/AGAT_v1.4.2/introns.fa" | awk '/^>/ {printf("\n%s\n",$0);next;} {printf("%s",$0);}' | grep -A1 "gene_biotype=protein_coding" | sed '/^$/d' | awk '!/^>/ {total += length($0)} END {print total}')

# protein coding UTR length total
threePrimeUTRLength=$(cat $outputsPath"/AGAT_v1.4.2/three_prime_utrs_merged.fa" | awk '!/^>/ {total += length($0)} END {print total}')
fivePrimeUTRLength=$(cat $outputsPath"/AGAT_v1.4.2/five_prime_utrs_merged.fa" | awk '!/^>/ {total += length($0)} END {print total}')
utrLength=$(($threePrimeUTRLength+$fivePrimeUTRLength))

# lnc RNA exon length total
lncRNAExonLength=$(cat $outputsPath"/AGAT_v1.4.2/exons_merged.fa" | awk '/^>/ {printf("\n%s\n",$0);next;} {printf("%s",$0);}' | grep -A1 "lncRNA" | sed '/^$/d' | awk '!/^>/ {total += length($0)} END {print total}')

# lnc RNA intron length total
lncRNAIntronLength=$(cat $outputsPath"/AGAT_v1.4.2/introns.fa" | awk '/^>/ {printf("\n%s\n",$0);next;} {printf("%s",$0);}' | grep -A1 "lncRNA" | sed '/^$/d' | awk '!/^>/ {total += length($0)} END {print total}')

# fractional genome content
exonFrac=$(echo "scale=10; $exonLength/$size" | bc)
intronFrac=$(echo "scale=10; $intronLength/$size" | bc)
utrFrac=$(echo "scale=10; $utrLength/$size" | bc)
lncRNAExonFrac=$(echo "scale=10; $lncRNAExonLength/$size" | bc)
lncRNAIntronFrac=$(echo "scale=10; $lncRNAIntronLength/$size" | bc)

# output results
echo "species,exon,intron,utr,lncRNA_exon,lncRNA_intron" > $outputsPath"/AGAT_v1.4.2/fractional_genome_content.fa"
echo $speciesName","$exonFrac","$intronFrac","$utrFrac","$lncRNAExonFrac","$lncRNAIntronFrac >> $outputsPath"/AGAT_v1.4.2/fractional_genome_content.fa"

# status message
echo "Analysis of $speciesName complete!"
