#!/bin/bash
#$ -M ebrooks5@nd.edu
#$ -m abe
#$ -r n
#$ -N fastqc_trimmed_RNA_jobOutput

# script to perform fastqc quality control of paired end reads
# usage: qsub fastqc_trimmed_RNA.sh inputsFile

# Required modules for ND CRC servers
module load bio

# retrieve inputsFile
inputsFile=$1

# Print status message
echo "Processing: $inputsFile"

# move back to the original directory
cd $curDir

# retrieve analysis outputs absolute path
outputsPath=$(grep "outputs:" $inputsFile | tr -d " " | sed "s/outputs://g")

# setup the directory for the input results
resIn=$outputsPath"/trimmed"

# make a directory for the QC results
qcOut=$outputsPath"/QC_trimmed"
mkdir $qcOut
# Check if the folder already exists
if [ $? -ne 0 ]; then
	echo "The $qcOut directory already exsists... skipping!"
	continue
fi
# Move to the new directory
cd $qcOut

# Name version output file
versionFile=$qcOut"/software_version_summary.txt"

# Report software version
fastqc -version > $versionFile

# perform QC
fastqc $resIn"/"*".fq.gz" -o $qcOut

# Print status message
echo "Finished processing!"
