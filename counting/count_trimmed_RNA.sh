#!/bin/bash
#$ -M ebrooks5@nd.edu
#$ -m abe
#$ -r n
#$ -N count_htseq_jobOutput

# script to run htseq-count on trimmed, aligned, and name sorted paired end reads
# usage: qsub count_htseq.sh inputsFile

#Required modules for ND CRC servers
module load bio/2.0

#Retrieve input argument of a inputs file
inputsFile=$1

# Print status message
echo "Processing: $inputsFile"

# retrieve paired reads absolute path for alignment
readType=$(grep "Reads:" $inputsFile | cut -d " " -f1 | sed "s/Reads://g")
# retrieve genome features
genomeFile=$(grep "genomeFeatures:" $inputsFile | cut -d " " -f2)
# retrieve analysis outputs absolute path
outputsPath=$(grep "outputs:" $inputsFile | cut -d " " -f2)
# retrieve species
speciesTag=$(basename $outputsPath)

# setup inputs path
resIn=$outputsPath"/sorted_trimmed"

# make a directory for the QC results
resOut=$outputsPath"/counted_trimmed"
mkdir $resOut
# Check if the folder already exists
if [ $? -ne 0 ]; then
	echo "The $resOut directory already exsists... skipping!"
	exit 1
fi
# move to the new directory
cd $resOut

# mame version output file
versionFile=$resOut"/software_version_summary.txt"

# add software versions to outputs
htseq-count --help | tail -1 >> $versionFile

# loop through all sorted forward and reverse paired reads and store the file locations in an array
for samplePath in "$resIn"/*/; do
	# name of aligned file
	sampleFile=$samplePath"accepted_hits.bam"
	# trim file path from current folder name
	sampleTag=$(basename $samplePath)
	# create directory for current sample outputs
	mkdir $sampleTag
	# status message
	echo "Processing $sampleTag ..."
	# count reads using htseq-count
	htseq-count -f bam -s no -t gene $sampleFile $genomeFile > $sampleTag"/counts.txt"
done

# status message
echo "Analysis complete!"

