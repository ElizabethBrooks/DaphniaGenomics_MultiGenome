#!/bin/bash
#$ -M ebrooks5@nd.edu
#$ -m abe
#$ -r n
#$ -N QC_SRA_RNA_jobOutput

# script to align paired end reads
# usage: qsub QC_SRA_RNA.sh inputsFile

# Required modules for servers
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

# retrieve paired reads absolute path for alignment
readPath=$(awk '/reads:/{flag=1; next} flag' $inputsPath | sed "s/^.*-\ //g")

# retrieve outputs path
# change this for different test runs
#outputsPath=$(grep "outputs_EGAPx_v0.3.2_analysis:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.3.2_analysis://g")
outputsPath=$(grep "outputs_EGAPx_v0.5.2_analysis:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.5.2_analysis://g")

# setup outputs path
outputsPath=$outputsPath"/"$speciesName

# create outputs directories
mkdir $outputsPath
mkdir $outputsPath"/SRA"
mkdir $outputsPath"/FastQC_v0.12.1"
mkdir $outputsPath"/FastQC_v0.12.1/MultiQC_v1.33"

# move to outputs directory, since SRA tools caches data in the working directory
cd $outputsPath"/SRA"

# loop over each SRA ID
for inputID in $readPath; do
	# download formated reads
	prefetch $inputID --max-size 70G
	# status message
	echo "Beginning SRA read processing..."
	# retrieve SRA data
	fasterq-dump $inputID --threads 8 --split-files -O $outputsPath"/SRA/"
	# print status message
	echo "Finished SRA read processing!"
done

# status message
echo "Beginning analysis of $speciesName..."

# move to the outputs directory
cd $outputsPath"/FastQC_v0.12.1"

# perform QC
fastqc $outputsPath"/SRA/"*".fastq" -o $outputsPath"/FastQC_v0.12.1"

# run multiqc
multiqc $outputsPath"/FastQC_v0.12.1" -o $outputsPath"/FastQC_v0.12.1/MultiQC_v1.33" -n "multiqc"

# print status message
echo "Finished processing!"
