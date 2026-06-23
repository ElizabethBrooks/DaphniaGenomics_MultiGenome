#!/bin/bash
#$ -M ebrooks5@nd.edu
#$ -m abe
#$ -r n
#$ -N QC_RNA_jobOutput

# script to align paired end reads
# usage: qsub QC_RNA.sh inputsFile
# usage: qsub QC_RNA.sh EGAPx_v0.3.2/Ceriodaphnia_sp/inputs_dubia_v2_ZQ.txt

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
outputsPath=$(grep "outputs_EGAPx_v0.3.2_analysis:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.3.2_analysis://g")

# setup outputs path
outputsPath=$outputsPath"/"$speciesName

# create outputs directories
mkdir $outputsPath
mkdir $outputsPath"/FastQC_v0.12.1"
mkdir $outputsPath"/FastQC_v0.12.1/MultiQC_v1.33"

# move to the outputs directory
cd $outputsPath"/FastQC_v0.12.1"

# status message
echo "Beginning analysis of $speciesName..."

# perform QC
fastqc $readPath -o $outputsPath"/FastQC_v0.12.1"

# run multiqc
multiqc $outputsPath -o $outputsPath"/FastQC_v0.12.1/MultiQC_v1.33" -n "multiqc"

# Print status message
echo "Finished processing!"
