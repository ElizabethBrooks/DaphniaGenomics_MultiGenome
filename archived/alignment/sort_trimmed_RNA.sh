#!/bin/bash
#$ -M ebrooks5@nd.edu
#$ -m abe
#$ -r n
#$ -N sort_trimmed_RNA_jobOutput
#$ -pe smp 8

# script to perform samtools sorting of trimmed and aligned paired end reads
# usage: qsub sort_trimmed_RNA.sh inputsFile

# required modules for ND CRC servers
module load bio

# retrieve input argument of a inputs file
inputsFile=$1

# print status message
echo "Processing: $inputsFile"

# retrieve paired reads absolute path for alignment
readType=$(grep "Reads:" $inputsFile | cut -d " " -f1 | sed "s/Reads://g")
# retrieve genome reference
refPath=$(grep "genomeReference:" $inputsFile | cut -d " " -f2)
# retrieve analysis outputs absolute path
outputsPath=$(grep "outputs:" $inputsFile | cut -d " " -f2)
# retrieve species
speciesTag=$(basename $outputsPath)

# setup inputs path
resIn=$outputsPath"/aligned_trimmed"

# make a directory for the QC results
resOut=$outputsPath"/sorted_trimmed"
mkdir $resOut
# check if the folder already exists
if [ $? -ne 0 ]; then
	echo "The $resOut directory already exsists... skipping!"
	exit 1
fi
# move to the new directory
cd $resOut

# name version output file
versionFile=$resOut"/software_version_summary.txt"

# add software versions to outputs
samtools --version >> $versionFile

# TO-DO: add unpaired workflow
# loop through all reads and sort sam/bam files for input to samtools
for sampleFile in $resIn"/"*".fq_accepted_hits.sam"; do
	# get sample tag
	sampleTag=$(basename $sampleFile | sed "s/\.fq_accepted_hits\.sam//g")
	# create directory for current sample outputs
	mkdir $sampleTag
	# run samtools to prepare mapped reads for name sorting
	samtools sort -@ 8 -n -o $sampleTag"/sortedName.bam" -T "/tmp/"$sampleTag".sortedName.bam" $sampleFile
	# run fixmate -m to update paired-end flags for singletons
	samtools fixmate -m $sampleTag"/sortedName.bam" $sampleTag"/fixed.bam"
	rm "$sampleTag"/sortedName.bam
	# run samtools to prepare mapped reads for coordinate sorting
	samtools sort -@ 8 -o $sampleTag"/sortedCoord.bam" -T "/tmp/"$sampleTag".sortedCoord.bam" $sampleTag"/fixed.bam"
	# remove duplicate reads
	samtools markdup -r $sampleTag"/sortedCoord.bam" $sampleTag"/accepted_hits.bam"
done

# status message
echo "Analysis complete!"
