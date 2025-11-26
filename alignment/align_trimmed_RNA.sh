#!/bin/bash
#$ -M ebrooks5@nd.edu
#$ -m abe
#$ -r n
#$ -N align_trimmed_RNA_jobOutput
#$ -pe smp 8

# script to align paired end reads
# usage: qsub align_trimmed_RNA.sh inputsFile

# required modules for ND CRC servers
module load bio

# retrieve inputsFile
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
resIn=$outputsPath"/trimmed"

# make a directory for the QC results
resOut=$outputsPath"/aligned_trimmed"
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

# report software version
hisat2 --version > $versionFile

# generate reference genome build files
hisat2-build $refPath $speciesTag"_build"

# loop over each sample
for sampleFile in $resIn"/"*".fq.gz"; do
	# get sample tag
	sampleTag=$(basename $sampleFile | rev | cut -d "." -f2- | rev)
	# check read type
	if [[ $readType == "unpaired" ]]; then
		# align samples to the refence genome
		hisat2 --threads 8 -x $speciesTag"_build" -U $sampleFile -S $sampleTag"_accepted_hits.sam" --summary-file $sampleTag"_alignedSummary.txt"
	else
		# check the read direction
		if [[ $sampleFile == *"R1"* || $sampleFile == *"_1."* ]]; then
			# setup second read path
			readTwo=$(echo $sampleFile | sed "s/R1_/R2_/g" | sed "s/_1\./_2./g")
			# align samples to the refence genome
			hisat2 --threads 8 -x $speciesTag"_build" -1 $sampleFile -2 $readTwo -S $sampleTag"_accepted_hits.sam" --summary-file $sampleTag"_alignedSummary.txt"
		fi
	fi	
done

# print status message
echo "Finished processing!"
