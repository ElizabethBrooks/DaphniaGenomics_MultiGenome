#!/bin/bash
#$ -M ebrooks5@nd.edu
#$ -m abe
#$ -r n
#$ -N check_AGAT_proteins_busco_jobOutput
#$ -pe smp 8

# script to clean the input gff
# usage: qsub check_AGAT_proteins_busco.sh inputFile
# usage ex: qsub check_AGAT_proteins_busco.sh EGAPx_v0.3.2/D_melanica/inputs_CON6_BC_clean.txt

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
outputsPath=$(grep "outputs_EGAPx_v0.3.2_ZQ_V2:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.3.2_ZQ_V2://g")
#outputsPath=$(grep "outputs_EGAPx_v0.3.2_NCBI:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.3.2_NCBI://g")
#outputsPath=$(grep "outputs_EGAPx_v0.3.2_zenodo:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.3.2_zenodo://g")
#outputsPath=$(grep "outputs_EGAPx_v0.3.2_CNGBdb:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.3.2_CNGBdb://g")

# setup outputs path
#outputsPath=$outputsPath"/"$speciesName
outputsPath=$outputsPath"/"$speciesName"/AGAT_v1.4.2"

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
#busco -i $outputsPath"/complete.proteins.faa" -m "proteins" -l "crustacea_odb12" -c 8 -o "proteins" -f
busco -i $outputsPath"/longest_protein_cleaned.fa" -m "proteins" -l "crustacea_odb12" -c 8 -o "proteins" -f

# clean up
rm -r $outputsPath"/BUSCO_v6.0.0/busco_downloads"
rm -r $outputsPath"/BUSCO_v6.0.0/proteins/run_crustacea_odb12/busco_sequences"
rm -r $outputsPath"/BUSCO_v6.0.0/proteins/run_crustacea_odb12/hmmer_output"
rm -r $outputsPath"/BUSCO_v6.0.0/proteins/run_crustacea_odb12/miniprot_output"
rm -r $outputsPath"/BUSCO_v6.0.0/proteins/logs"
rm -r $outputsPath"/BUSCO_v6.0.0/proteins/tmp"

# status message
echo "Analysis of $speciesName complete!"
