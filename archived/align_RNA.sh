#!/bin/bash
#$ -M ebrooks5@nd.edu
#$ -m abe
#$ -r n
#$ -N align_RNA_jobOutput
#$ -pe smp 8

# script to align paired end reads
# usage: qsub align_RNA.sh inputsFile

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
	exit 1
fi
# Move to the new directory
cd $resOut

# Name version output file
versionFile=$resOut"/software_version_summary.txt"

# Report software version
hisat2 --version > $versionFile

# generate reference genome build files
hisat2-build $refPath $speciesTag"_build"

# loop over each sample
for sampleFile in $readPath; do
	# get sample tag
	sampleTag=$(basename $sampleFile | rev | cut -d "." -f2- | rev)
	# check read type
	if [[ $readType == "unpaired" ]]; then
		# align samples to the refence genome
		hisat2 --threads 8 -x $speciesTag"_build" -U $sampleFile -S $sampleTag"_accepted_hits.sam" --summary-file $sampleTag"_alignedSummary.txt"
	else
		# setup second read path
		readTwo=$(echo $sampleFile | sed "s/R1_/R2_/g" | sed "s/_1\./_2./g")
		# align samples to the refence genome
		hisat2 --threads 8 -x $speciesTag"_build" -1 $sampleFile -2 $readTwo -S $sampleTag"_accepted_hits.sam" --summary-file $sampleTag"_alignedSummary.txt"
	fi	
done

# Print status message
echo "Finished processing!"
