#!/bin/bash
#$ -M ebrooks5@nd.edu
#$ -m abe
#$ -r n
#$ -N fastqc_MultiGenome_jobOutput

# Script to perform fastqc quality control of paired end reads
# Usage: qsub fastqc_shortReads.sh inputsFile
# Usage Ex: qsub fastqc_shortReads.sh shortReads/inputPaths_D_melanica.txt CON6 raw
## job: 1803329
# Usage Ex: qsub fastqc_shortReads.sh shortReads/inputPaths_D_melanica.txt CON6 trimmed
## job: 1804238

# Required modules for ND CRC servers
module load bio

# retrieve input arguments
inputsFile=$1
inputGenotype=$2
inputsType=$3

# Retrieve paired reads absolute path for alignment
readPath=$(grep "pairedReads:" ../"inputData/"$inputsFile | tr -d " " | sed "s/pairedReads://g")
# Retrieve analysis outputs absolute path
outputsPath=$(grep "outputs:" ../"inputData/"$inputsFile | tr -d " " | sed "s/outputs://g")

# Make a new directory for project analysis
projectDir=$(basename $readPath)
outputsPath=$outputsPath"/"$projectDir
#mkdir $outputsPath

# check inputs type
if [[ $inputsType == "trimmed" ]]; then
	# set the directory for inputs
	readPath=$outputsPath"/trimmed"
	# set the directory for analysis
	qcOut=$outputsPath"/qc_trimmed_"$inputGenotype
elif [[ $inputsType == "raw" ]]; then
	# set the directory for analysis
	qcOut=$outputsPath"/qc_raw_"$inputGenotype
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
fastqc $readPath"/"$inputGenotype*\.f*q.gz -o $qcOut

# run multiqc
multiqc $qcOut -o $qcOut -n "multiqc_raw"

# Print status message
echo "Analysis complete!"
