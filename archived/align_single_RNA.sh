#!/bin/bash
#$ -M ebrooks5@nd.edu
#$ -m abe
#$ -r n
#$ -N align_single_RNA_jobOutput

# script to align paired end reads
# usage: qsub align_single_RNA.sh inputsFile

# Required modules for ND CRC servers
module load bio

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

# make a directory for the QC results
resOut=$outputsPath"/aligned"
mkdir $resOut
# Check if the folder already exists
if [ $? -ne 0 ]; then
	echo "The $resOut directory already exsists... skipping!"
	continue
fi
# Move to the new directory
cd $resOut

# Name version output file
versionFile=$resOut"/software_version_summary.txt"

# Report software version
fastqc -version > $versionFile

# generate reference genome build files
hisat2-build $refPath $speciesTag"_build"

# check read type
if [[ $readType == "unpaired" ]]; then
	# align samples to the refence genome
	hisat2 -x $speciesTag"_build" -U $readPath -S accepted_hits.sam --summary-file alignedSummary.txt
else
	# setup second read path
	readTwo=$(echo $readPath | sed "s/R1_/R2_/g")
	# align samples to the refence genome
	hisat2 -x $speciesTag"_build" -1 $readPath -2 $readTwo -S accepted_hits.sam --summary-file alignedSummary.txt
fi

# Print status message
echo "Finished processing!"
