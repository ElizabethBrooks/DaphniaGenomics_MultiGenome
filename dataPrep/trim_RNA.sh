#!/bin/bash
#$ -M ebrooks5@nd.edu
#$ -m abe
#$ -r n
#$ -N trim_RNA_jobOutput

# script to align paired end reads
# usage: qsub trim_RNA.sh inputsFile

# Required modules for ND CRC servers
module load bio

# set the adapter path
adapterPath="/scratch365/ebrooks5/util/TruSeq3-PE.fa"

# retrieve inputsFile
inputsFile=$1

# Print status message
echo "Processing: $inputsFile"

# retrieve paired reads absolute path for alignment
readType=$(grep "Reads:" $inputsFile | cut -d " " -f1 | sed "s/Reads://g")
# retrieve paired reads absolute path for alignment
readPath=$(grep "Reads:" $inputsFile | cut -d " " -f2)
# retrieve genome reference
refPath=$(grep "genomeReference:" $inputsFile | cut -d " " -f2)
# retrieve analysis outputs absolute path
outputsPath=$(grep "outputs:" $inputsFile | cut -d " " -f2)

# retrieve species
speciesTag=$(basename $outputsPath)

# make a new directory for the analysis	
mkdir $outputsPath

# make a directory for the results
resOut=$outputsPath"/trimmed"
mkdir $resOut
# Check if the folder already exists
if [ $? -ne 0 ]; then
	echo "The $resOut directory already exsists... skipping!"
	exit 1
fi
# Move to the new directory
cd $resOut

# Name version output file
versionFile=$resOut"/software_version_summary.txt"

# Report software version
fastqc -version > $versionFile

# unzip the QC results
unzip $outputsPath"/QC/"*"_fastqc.zip"

# set default phred score for trimming (Illumina 1.9)
score=33

# loop over each sample
for sampleFile in $readPath; do
	# get sample directory and tag
	readsPath=$(dirname $sampleFile)
	sampleTag=$(basename $sampleFile | rev | cut -d "." -f2- | rev)
	# determine phred score for trimming
	if grep -iF "Illumina 1.5" *"_fastqc/fastqc_data.txt"; then
		score=64
	elif grep -iF "Illumina 1.9" *"_fastqc/fastqc_data.txt"; then
		score=33
	else
		echo "WARNING: Illumina encoding not found... using default."
	fi
	# check read type
	if [[ $readType == "unpaired" ]]; then
		# align samples to the refence genome
		trimmomatic SE -threads 8 -phred"$score" $sampleFile $sampleTag".fq.gz" ILLUMINACLIP:$adapterPath":2:30:10" LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 HEADCROP:10
	else
		# setup second read path
		readTwo=$(basename $readPath | sed "s/R1_/R2_/g" | sed "s/_1\./_2./g")
		# Perform adapter trimming on paired reads using 8 threads
		trimmomatic PE -threads 8 -phred"$score" $sampleFile $readsPath"/"$readTwo $sampleTag".fq.gz" $sampleTag"_uForward.fq.gz" $readTwo".fq.gz" $readTwo"_uReverse.fq.gz" ILLUMINACLIP:$adapterPath":2:30:10" LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 HEADCROP:10
	fi	
done

# Print status message
echo "Finished processing!"
