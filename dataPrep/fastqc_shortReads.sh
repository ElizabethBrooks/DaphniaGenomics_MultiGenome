#!/bin/bash
#$ -M ebrooks5@nd.edu
#$ -m abe
#$ -r n
#$ -N fastqc_MultiGenome_jobOutput

#S cript to perform fastqc quality control of paired end reads
# Usage: qsub fastqc_shortReads.sh inputsFile
# Usage Ex: qsub fastqc_shortReads.sh ShortReads/inputPaths_D_melanica.txt

# Required modules for ND CRC servers
module load bio/2.0

# Retrieve input argument of a inputs file
inputsFile=$1

# Retrieve paired reads absolute path for alignment
readPath=$(grep "pairedReads:" ../"InputData/"$inputsFile | tr -d " " | sed "s/pairedReads://g")
# Retrieve analysis outputs absolute path
outputsPath=$(grep "outputs:" ../"InputData/"$inputsFile | tr -d " " | sed "s/outputs://g")

# Make a new directory for project analysis
projectDir=$(basename $readPath)
outputsPath=$outputsPath"/"$projectDir
mkdir $outputsPath

# Name version output file
versionFile=$outputsPath"/software_version_summary.txt"

# Report software version
fastqc -version > $versionFile

# Make a new directory for analysis
qcOut=$outputsPath"/qc"
mkdir $qcOut
# Check if the folder already exists
if [ $? -ne 0 ]; then
	echo "The $qcOut directory already exsists... please remove before proceeding."
	exit 1
fi
# Move to the new directory
cd $qcOut

# perform QC
fastqc $readPath"/"*\.fastq.gz -o $outputsPath

# run multiqc
multiqc $outputsPath -o $outputsPath -n "multiqc_raw"

# Print status message
echo "Analysis complete!"
