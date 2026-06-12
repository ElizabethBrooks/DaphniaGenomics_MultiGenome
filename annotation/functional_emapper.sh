#!/bin/bash
#$ -M ebrooks5@nd.edu
#$ -m abe
#$ -r n
#$ -N functional_emapper_jobOutput
#$ -pe smp 8

# script to clean the input gff
# usage: qsub functional_emapper.sh inputFile
# usage ex: qsub functional_emapper.sh EGAPx_v0.3.2/D_melanica/inputs_CON6_BC_clean.txt

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
outputsPath=$(grep "outputs_EGAPx_v0.3.2_CNGBdb:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.3.2_CNGBdb://g")

# setup outputs path
outputsPath=$outputsPath"/"$speciesName"/AGAT_v1.4.2"

# create outputs directory
mkdir $outputsPath"/emapper_v2.1.13"

# move to the outputs directory
cd $outputsPath"/emapper_v2.1.13"

# activate software environment
conda activate emapper_env

# status message
echo "Beginning analysis of $speciesName..."

# run eggnog mapper
emapper.py --cpu 8 -i $outputsPath"/longest_protein_cleaned.fa" --itype "proteins" -m "diamond" --evalue 0.00001 --go_evidence non-electronic --tax_scope 6656 --data_dir "/groups/mpfrende/Projects_2026/software/eggnog_db" -o "fa"

# re-format the annotations for topGO
cat $outputsPath"/emapper_v2.1.13/fa.emapper.annotations" | cut -f1,10 | sed "s/^.*egapxtmp/egapxtmp/g" | sed "s/\-R.\t/\t/g" | grep -v "#" | grep -v "-" > $outputsPath"/emapper_v2.1.13/fa.emapper.annotations.fmt.txt"

# status message
echo "Analysis of $speciesName complete!"
