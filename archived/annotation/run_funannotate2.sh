#!/bin/bash
#$ -M ebrooks5@nd.edu
#$ -m abe
#$ -r n
#$ -N run_gfftk_jobOutput

# script to clean the input gff
# usage: qsub clean_gff_gfftk.sh inputFile
# usage ex: qsub clean_gff_gfftk.sh EGAPx_v0.3.2/D_melanica/inputs_CON6_BC_clean.txt

# retrieve input file
inputFile=$1

# retrieve species name
speciesName=$(grep "species:" ../"inputData/"$inputFile | tr -d " " | sed "s/species://g")
speciesTag=$(echo $speciesName | cut -d"_" -f1,2)
strainTag=$(echo $speciesName | cut -d"_" -f3-)

# retrieve inputs path
inputsPath=$(grep "inputs_EGAPx:" ../"inputData/"$inputFile | tr -d " " | sed "s/inputs_EGAPx://g")

# retrieve repository directory
repoDir=$(dirname $PWD)

# setup inputs path
inputsPath=$repoDir"/inputData/"$inputsPath

# retrieve outputs path
# change this for different test runs
outputsPath=$(grep "outputs_EGAPx_v0.3.2_BC:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.3.2_BC://g")

# setup outputs path
outputsPath=$outputsPath"/"$speciesName

# create outputs directory
mkdir $outputsPath"/funannotate2"

# move to the AGAT software directory
cd $outputsPath

# status message
echo "Beginning analysis of $speciesName..."

# export paths
export FUNANNOTATE2_DB=/scratch365/ebrooks5/software/funannotate2_db
#export AUGUSTUS_CONFIG_PATH=/afs/crc.nd.edu/user/e/ebrooks5/miniconda3/envs/funannotate2/config
export AUGUSTUS_CONFIG_PATH=/afs/crc.nd.edu/user/e/ebrooks5/miniconda3/envs/augustus_env/config

# train ab initio prediction tools
funannotate2 train -f $outputsPath"/complete.genomic.fna" -s $speciesTag --strain $strainTag --cpus 8 -o $outputsPath"/funannotate2" 

# predict genes
funannotate2 predict -i $outputsPath"/funannotate2" --cpus 8 --strain $strainTag

# functionally annotate genes
funannotate2 annotate -i $outputsPath"/funannotate2" --cpus 8

# status message
echo "Analysis of $speciesName complete!"
