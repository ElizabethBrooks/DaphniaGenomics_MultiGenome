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
#module load bio/trinity

# retrieve software path
softPath=$(grep "software_Trinity:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/software_Trinity://g")

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
readPath=$(cat $inputsPath | awk '/reads:/{flag=1; next} flag' | sed "s/^.*-\ //g")

# retrieve outputs path
outputsPath=$(grep "outputs_Trinity:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_Trinity://g")

# setup outputs path
outputsPath=$outputsPath"/"$speciesName

# create outputs directory
mkdir $outputsPath
mkdir $outputsPath"/trinity_out_dir"

# move to the software directory
cd $outputsPath

# status message
echo "Beginning analysis of $speciesName..."

# check read type, assuming the second read file is listed last
if [[ $readPath == *"R2_001"* ]]; then
	readType="paired"
else
	readType="unpaired"
fi

# check read type
if [[ $readType == "unpaired" ]]; then # single reads
	# setup read paths
	readsOne=$(echo $readPath | tr ' ' ',' | sed "s/,$//g")
	# run trinity
	singularity exec -e $softPath"/trinityrnaseq.v2.15.2.simg" Trinity \
		--seqType fq \
		--SS_lib_type F  \
		--single $readsOne \
	    --CPU 8 \
	    --max_memory 10G \
	    --output $outputsPath"/trinity_out_dir"
else # paired reads
	# setup read paths
	readsOne=$(cat $inputsPath | awk '/reads:/{flag=1; next} flag' | sed "s/^.*-\ //g" | grep "R1_001" | tr '\n' ',' | sed "s/,$//g")
	readsTwo=$(cat $inputsPath | awk '/reads:/{flag=1; next} flag' | sed "s/^.*-\ //g" | grep "R2_001" | tr '\n' ',' | sed "s/,$//g")
	# run trinity
	singularity exec -e $softPath"/trinityrnaseq.v2.15.2.simg" Trinity \
		--seqType fq \
		--SS_lib_type RF  \
		--left $readsOne \
	    --right $readsTwo \
	    --CPU 8 \
	    --max_memory 10G \
	    --output $outputsPath"/trinity_out_dir"
fi

# Print status message
echo "Finished processing!"
