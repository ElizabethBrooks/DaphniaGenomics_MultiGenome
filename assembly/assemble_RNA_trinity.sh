#!/bin/bash
#$ -M ebrooks5@nd.edu
#$ -m abe
#$ -r n
#$ -N assemble_RNA_jobOutput
#$ -pe smp 8

# script to align paired end reads
# usage: qsub assemble_RNA_trinity.sh inputsFile
# usage: qsub assemble_RNA_trinity.sh EGAPx_v0.3.2/Ceriodaphnia_sp/inputs_dubia_v2_ZQ.txt

# Required modules for ND CRC servers
module load bio/trinity

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
outputsPath=$(grep "outputs_Trinity:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_Trinity://g")

# setup outputs path
outputsPath=$outputsPath"/"$speciesName

# create outputs directory
mkdir $outputsPath"/Trinity_v2.15.2"

# move to the outputs directory
cd $outputsPath"/Trinity_v2.15.2"

# status message
echo "Beginning analysis of $speciesName..."

# check read type, assuming the second read file is listed last
readTest=$(echo $readPath | tail -1)
if [[ $readTest == *"R2_"* ]]; then
	readType="paired"
else
	readType="unpaired"
fi

# check read type
if [[ $readType == "unpaired" ]]; then # single reads
# run trinity
	Trinity --seqType fq --SS_lib_type F  \
		--single $readPath \
	    --CPU 8 --max_memory 10G
else # paired reads
	# setup read paths
	readsOne=$(echo $readPath | grep "R1_" | tr '\n' ',' | sed "s/,$//g")
	readsTwo=$(echo $readPath | grep "R2_" | tr '\n' ',' | sed "s/,$//g")
	# run trinity
	Trinity --seqType fq --SS_lib_type RF  \
		--left $readsOne \
	    --right $readsTwo \
	    --CPU 8 --max_memory 10G
fi

# Print status message
echo "Finished processing!"
