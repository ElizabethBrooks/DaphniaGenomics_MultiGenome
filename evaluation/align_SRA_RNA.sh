#!/bin/bash
#$ -M ebrooks5@nd.edu
#$ -m abe
#$ -r n
#$ -N align_SRA_RNA_jobOutput
#$ -pe smp 8

# script to align paired end reads
# usage: qsub align_SRA_RNA.sh inputsFile
# usage: qsub align_SRA_RNA.sh EGAPx_v0.3.2/Ceriodaphnia_sp/inputs_dubia_v2_ZQ.txt

# Required modules for ND CRC servers
module load bio

# retrieve input file
inputFile=$1

# retrieve species name
speciesName=$(grep "species:" ../"inputData/"$inputFile | cut -d " " -f2)

# retrieve inputs path
inputsPath=$(grep "inputs_EGAPx:" ../"inputData/"$inputFile | cut -d " " -f2)

# retrieve repository directory
repoDir=$(dirname $PWD)

# setup inputs path
inputsPath=$repoDir"/inputData/"$inputsPath

# retrieve genome reference
refPath=$(grep "genome:" $inputsPath | cut -d " " -f2)

# retrieve outputs path
# change this for different test runs
#outputsPath=$(grep "outputs_EGAPx_v0.3.2_analysis:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.3.2_analysis://g")
outputsPath=$(grep "outputs_EGAPx_v0.5.2_analysis:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.5.2_analysis://g")

# setup outputs path
outputsPath=$outputsPath"/"$speciesName

# retrieve paired reads absolute path for alignment
readPath=$outputsPath"/SRA/"*".fastq"

# create outputs directory
mkdir $outputsPath"/HISAT2_v2.2.2"
mkdir $outputsPath"/HISAT2_v2.2.2/MultiQC_v1.33"

# move to the outputs directory
cd $outputsPath"/HISAT2_v2.2.2"

# status message
echo "Beginning analysis of $speciesName..."

# generate reference genome build files
hisat2-build $refPath $speciesName"_build"

# check read type, assuming the second read file is listed last
readTest=$(echo $readPath | tail -1)
if [[ $readTest == *"_R2_001"* ]]; then
	readType="paired"
else
	readType="unpaired"
fi

# loop over each sample
loopNum=1
for sampleFile in $readPath; do
	# get sample tag
	sampleTag=$(basename $sampleFile | rev | cut -d "." -f2- | rev)
	# check read type
	if [[ $readType == "unpaired" ]]; then # single reads
		# align samples to the refence genome
		hisat2 --threads 8 -x $speciesName"_build" -U $sampleFile -S $sampleTag"_accepted_hits.bam" --summary-file $sampleTag"_alignedSummary.txt"
	else # paired reads
		if [[ $(($loopNum % 2)) == 0 ]]; then # handle in pairs
			# setup second read path
			readTwo=$(echo $sampleFile | sed "s/_R1_/_R2_/g" | sed "s/_1\./_2./g")
			# align samples to the refence genome
			hisat2 --threads 8 -x $speciesName"_build" -1 $sampleFile -2 $readTwo -S $sampleTag"_accepted_hits.bam" --summary-file $sampleTag"_alignedSummary.txt"
		fi
	fi
	# run samtolls stats
	samtools stats -@ 8 $sampleTag"_accepted_hits.bam" > $sampleTag".stats"
	# incrememnt counter
	loopNum=$(($loopNum+1))
done

# run multiqc to aggegrate the reports
multiqc $outputsPath"/HISAT2_v2.2.2" -o $outputsPath"/HISAT2_v2.2.2/MultiQC_v1.33" -n "multiqc"

# Print status message
echo "Finished processing!"
