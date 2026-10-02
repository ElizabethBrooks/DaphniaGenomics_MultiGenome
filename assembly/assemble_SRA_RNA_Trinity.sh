#!/bin/bash
#$ -M ebrooks5@nd.edu
#$ -m abe
#$ -r n
#$ -N assemble_RNA_jobOutput
#$ -pe smp 8

# script to align paired end reads
# usage: qsub assemble_RNA_trinity.sh inputsFile
# usage: qsub assemble_RNA_trinity.sh EGAPx_v0.3.2/D_arabica/inputs_zenodo_SRA.txt

# Required modules for ND CRC servers
#module load bio/trinity

# retrieve software path
softPath=$(grep "software_Trinity:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/software_Trinity://g")

# retrieve input file
inputFile=$1

# retrieve species name
speciesName=$(grep "species:" ../"inputData/"$inputFile | cut -d " " -f2)

# retrieve inputs path
inputsPath=$(grep "outputs_SRA_Trinity:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_SRA_Trinity://g")

# setup inputs path
inputsPath=$inputsPath"/"$inputSpecies

# retrieve paired reads absolute path for alignment
readPath=$inputsPath"/"*"/"*".fastq"

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

# check read type
if [[ $readPath == *"_2.fastq" ]]; then
	readType="paired"
else
	readType="unpaired"
fi

# check read type
if [[ $readType == "unpaired" ]]; then # single reads
	# retrieve read path
	readPath=$(ls $inputsPath"/"*"/"*".fastq" | head -1)
	readPath=$(dirname $readPath)
	# setup read paths
	readsOne=$(echo $readPath | tr ' ' ',' | sed "s/,$//g")
	# run trinity
	singularity exec -B $readPath $softPath"/trinityrnaseq.v2.15.2.simg" Trinity --seqType fq --single $readsOne --CPU 8 --max_memory 10G --output $outputsPath"/trinity_out_dir"
else # paired reads
	# retrieve read path
	readPath=$(ls $inputsPath"/"*"/"*".fastq" | head -1)
	readPath=$(dirname $readPath)
	# setup read paths
	readsOne=$(ls $inputsPath"/"*"/"*".fastq" | grep "_1.fastq" | tr '\n' ',' | sed "s/,$//g")
	readsTwo=$(ls $inputsPath"/"*"/"*".fastq" | grep "_2.fastq" | tr '\n' ',' | sed "s/,$//g")
	# run trinity
	singularity exec -B $readPath $softPath"/trinityrnaseq.v2.15.2.simg" Trinity --seqType fq --left $readsOne --right $readsTwo --CPU 8 --max_memory 10G --output $outputsPath"/trinity_out_dir"
fi

# Print status message
echo "Finished processing!"
