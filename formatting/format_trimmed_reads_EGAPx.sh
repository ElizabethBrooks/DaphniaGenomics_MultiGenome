#!/bin/bash
#$ -M ebrooks5@nd.edu
#$ -m abe
#$ -r n
#$ -N format_trimmed_jobOutput

# script to download formatted SRA reads for EGAPx
# usage: qsub format_trimmed_reads_EGAPx.sh inputSpecies inputsPath

# retrieve input species
inputSpecies=$1

# retrieve inputs path
inputsPath=$2

# retrieve outputs path
outputsPath=$(grep "outputs_formatted:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_formatted://g")

# create the outputs data directory
mkdir $outputsPath

# name species directory
outputsPath=$outputsPath"/"$inputSpecies

# make species directory
mkdir $outputsPath

# move to outputs directory, since SRA tools caches data in the working directory
cd $outputsPath

# status message
echo "Beginning analysis..."

# unzip fasta files
gunzip -v $inputsPath"/"*

# loop over each file and re-format the reads
for i in $inputsPath"/"*"/.fq"; do
	# status message
	echo "Processing $i ..."
	# retrieve read name
	newName=$(basename $i | sed "s/\.fq/\.fmt.fa/g")
	# format read headers and keep only header and sequence data
	cat $i | sed 's/ /\./' | cut -d" " -f1 | awk 'NR%4==1 || NR%4==2' | sed "s/^@/>/g" > $outputsPath"/"$newName
done

# status message
echo "Analysis complete!"
