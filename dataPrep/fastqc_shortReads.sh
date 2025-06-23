#!/bin/bash
#$ -M ebrooks5@nd.edu
#$ -m abe
#$ -r n
#$ -N fastqc_MultiGenome_jobOutput

# Script to perform fastqc quality control of paired end reads
# Usage: qsub fastqc_shortReads.sh inputsFile
# Usage Ex: qsub fastqc_shortReads.sh shortReads/inputPaths_D_melanica.txt raw
## job: 1794738
# Usage Ex: qsub fastqc_shortReads.sh shortReads/inputPaths_D_melanica.txt trimmed
## job: 

# Required modules for ND CRC servers
module load bio

# Retrieve input argument of a inputs file
inputsFile=$1

# Retrieve paired reads absolute path for alignment
readPath=$(grep "pairedReads:" ../"inputData/"$inputsFile | tr -d " " | sed "s/pairedReads://g")
# Retrieve analysis outputs absolute path
outputsPath=$(grep "outputs:" ../"inputData/"$inputsFile | tr -d " " | sed "s/outputs://g")

# Make a new directory for project analysis
projectDir=$(basename $readPath)
outputsPath=$outputsPath"/"$projectDir
mkdir $outputsPath

# check inputs type
if [[ $2 == "trimmed" ]]; then
	# set the directory for inputs
	readPath=$outputsPath"/trimmed"
	# set the directory for analysis
	qcOut=$outputsPath"/qc_trimmed"
elif [[ $2 == "raw" ]]; then
	# set the directory for analysis
	qcOut=$outputsPath"/qc_raw"
fi

# Make a new directory for analysis
mkdir $qcOut
# Check if the folder already exists
if [ $? -ne 0 ]; then
	echo "The $qcOut directory already exsists... please remove before proceeding."
	exit 1
fi
# Move to the new directory
cd $qcOut

# Name version output file
versionFile=$qcOut"/software_version_summary.txt"

# Report software version
fastqc -version > $versionFile

# perform QC
fastqc $readPath"/"*\.fastq.gz -o $qcOut

# run multiqc
multiqc $qcOut -o $qcOut -n "multiqc_raw"

# Print status message
echo "Analysis complete!"
