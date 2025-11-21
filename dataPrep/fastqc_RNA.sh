#!/bin/bash
#$ -M ebrooks5@nd.edu
#$ -m abe
#$ -r n
#$ -N fastqc_RNA_jobOutput

# script to perform fastqc quality control of paired end reads
# usage: qsub fastqc_RNA.sh

# Required modules for ND CRC servers
module load bio

# loop over each input file
for inputsFile in ../inputData/counting/*; do
	# Print status message
	echo "Processing: $inputsFile"

	# retrieve paired reads absolute path for alignment
	readPath=$(grep "pairedReads:" $inputsFile | tr -d " " | sed "s/pairedReads://g")
	# retrieve analysis outputs absolute path
	outputsPath=$(grep "outputs:" $inputsFile | tr -d " " | sed "s/outputs://g")

	# make a new directory for the analysis	
	mkdir $outputsPath

	# make a directory for the QC results
	qcOut=$outputsPath"/QC"
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
	fastqc $readPath -o $qcOut
	
	# Print status message
	echo "Finished processing!"
done

# run multiqc
#multiqc $qcOut -o $qcOut -n "multiqc_raw"

# Print status message
echo "Analysis complete!"
