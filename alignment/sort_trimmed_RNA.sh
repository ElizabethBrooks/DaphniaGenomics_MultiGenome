#!/bin/bash
#$ -M ebrooks5@nd.edu
#$ -m abe
#$ -r n
#$ -N sort_trimmed_RNA_jobOutput
#$ -pe smp 8

# script to perform samtools sorting of trimmed and aligned paired end reads
# usage: qsub sort_trimmed_RNA.sh inputsFile
# jobs 2574825 to 2574847

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

# loop through all reads and sort sam/bam files for input to samtools
for sampleFile in $resIn"/"*".fastq.fq_accepted_hits.sam"; do
	# get sample tag
	sampleTag=$(basename $sampleFile | sed "s/\.fastq\.fq_accepted_hits\.sam//g")
	# create directory for current sample outputs
	mkdir $sampleTag
	# run samtools to prepare mapped reads for sorting
	samtools sort -@ 8 -n -o $sampleTag"/sortedName.bam" -T "/tmp/"$sampleTag".sortedName.bam" $sampleFile
	# run fixmate -m to update paired-end flags for singletons
	samtools fixmate -m $sampleTag"/sortedName.bam" $sampleTag"/accepted_hits.bam"
	rm "$sampleTag"/sortedName.bam
	# remove duplicate reads
	samtools markdup -r $sampleTag"/accepted_hits.bam" $sampleTag"/noDups.bam"
done

# status message
echo "Analysis complete!"
