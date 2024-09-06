#!/bin/bash
#$ -M ebrooks5@nd.edu
#$ -m abe
#$ -r n
#$ -N format_SRA_jobOutput

# script to format SRA reads for EGAPx

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

# loop over each file and re-format the reads
# for i in *; do echo "Processing "$i; readNum=$(echo $i | sed "s/\.fastq//g" | sed "s/.*_//g"); newName=$(echo $i | sed "s/_.\.fastq/\.$readNum/g"); cat $i | cut -d" " -f1 | awk 'NR%4==1 || NR%4==2' | sed "s/^@/>/g" > ../"dump_fmt/"$newName; done
for i in *
do 
	# status message
	echo "Processing "$i
	# retrieve read number
	readNum=$(echo $i | sed "s/\.fastq//g" | sed "s/.*_//g")
	# update file name
	newName=$(echo $i | sed "s/_.\.fastq/\.$readNum/g")
	# format read headers and keep only header and sequence data
	#cat $i | cut -d" " -f1 | sed "s/^@/>/g" | grep -A1 --no-group-separator "^>" > ../$outDir"/"$newName
	cat $i | sed 's/ /\./' | cut -d" " -f1 | awk 'NR%4==1 || NR%4==2' | sed "s/^@/>/g" > ../$outDir"/"$newName
done
