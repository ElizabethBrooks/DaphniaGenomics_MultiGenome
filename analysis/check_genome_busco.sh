#!/bin/bash
#$ -M ebrooks5@nd.edu
#$ -m abe
#$ -r n
#$ -N check_genome_busco_jobOutput
#$ -pe smp 8

# script to clean the input gff
# usage: qsub check_genome_busco.sh inputFile
# usage ex: qsub check_genome_busco.sh EGAPx_v0.3.2/Artemia_franciscana/inputs_JAVRJZ01_NCBI.txt

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
#outputsPath=$(grep "outputs_EGAPx_v0.3.2:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.3.2://g")
#outputsPath=$(grep "outputs_EGAPx_v0.3.2_BC2:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.3.2_BC2://g")
#outputsPath=$(grep "outputs_EGAPx_v0.3.2_ZQ2:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.3.2_ZQ2://g")
#outputsPath=$(grep "outputs_EGAPx_v0.3.2_ZQ_B1:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.3.2_ZQ_B1://g")
#outputsPath=$(grep "outputs_EGAPx_v0.3.2_ZQ_B2:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.3.2_ZQ_B2://g")
#outputsPath=$(grep "outputs_EGAPx_v0.3.2_ZQ_V2:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.3.2_ZQ_V2://g")
#outputsPath=$(grep "outputs_EGAPx_v0.3.2_NCBI:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.3.2_NCBI://g")
#outputsPath=$(grep "outputs_EGAPx_v0.3.2_zenodo:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.3.2_zenodo://g")
#outputsPath=$(grep "outputs_EGAPx_v0.3.2_CNGBdb:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.3.2_CNGBdb://g")
#outputsPath=$(grep "outputs_EGAPx_v0.3.2_BC:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.3.2_BC://g")
outputsPath=$(grep "outputs_EGAPx_v0.5.2_NCBI:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.5.2_NCBI://g")

# setup outputs path
outputsPath=$outputsPath"/"$speciesName
#outputsPath="/temp180/mpfrende/ebrooks5/multi_genome/EGAPx_v0.3.2/test/Artemia_franciscana_JAVRJZ01_NCBI"

# create outputs directory
mkdir $outputsPath"/BUSCO_v6.0.0"

# move to the outputs directory
cd $outputsPath"/BUSCO_v6.0.0"

# status message
echo "Beginning analysis of $speciesName..."

# activate conda environment
conda activate busco_env

# export paths
export PATH="/afs/crc.nd.edu/user/e/ebrooks5/miniconda3/bin/augustus:$PATH"
export PATH="/afs/crc.nd.edu/user/e/ebrooks5/miniconda3/scripts:$PATH"
export AUGUSTUS_CONFIG_PATH="/afs/crc.nd.edu/user/e/ebrooks5/miniconda3/envs/augustus_env/config"

# run busco
busco -i $outputsPath"/complete.genomic.fna" -m "genome" -l "crustacea_odb12" -c 8 -o "genome" -f
#busco -i "/groups/mpfrende/Projects_2026/multi_genome/data/NCBI_genomes/Artemia_franciscana.fna" -m "genome" -l "crustacea_odb12" -c 8 -o "genome" -f

# clean up
rm -r $outputsPath"/BUSCO_v6.0.0/busco_downloads"
rm -r $outputsPath"/BUSCO_v6.0.0/genome/run_crustacea_odb12/busco_sequences"
rm -r $outputsPath"/BUSCO_v6.0.0/genome/run_crustacea_odb12/hmmer_output"
rm -r $outputsPath"/BUSCO_v6.0.0/genome/run_crustacea_odb12/miniprot_output"
rm -r $outputsPath"/BUSCO_v6.0.0/genome/logs"
rm -r $outputsPath"/BUSCO_v6.0.0/genome/tmp"

# status message
echo "Analysis of $speciesName complete!"
