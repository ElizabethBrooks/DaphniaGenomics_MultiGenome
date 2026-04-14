#!/bin/bash
#$ -M ebrooks5@nd.edu
#$ -m abe
#$ -r n
#$ -N run_FCS_GX_jobOutput
#$ -pe smp 4

# script to screen a genome fasta for contamination
# usage: qsub screen_genome_FCS_GX.sh inputsFile
# usage ex: qsub screen_genome_FCS_GX.sh EGAPx_v0.3.2/D_melanica/inputs_CON6_BC.txt

# retrieve input file
inputFile=$1

# set input species
inputSpecies=$(grep "species:" ../"inputData/"$inputFile | tr -d " " | sed "s/species://g")

# setup yaml path
inputYaml=$(echo $inputFile | sed "s/\.txt/.yaml/g")

# retrieve the input genome
inputGenome=$(grep "genome:" ../"inputData/"$inputYaml | tr -d " " | sed "s/genome://g")

# retrieve input tax id
taxInput=$(grep "taxid:" ../"inputData/"$inputYaml | tr -d " " | sed "s/taxid://g")

# set DB directory
GXDB_LOC="/scratch365/ebrooks5/software/FCS_GX"

# set the software path
softwarePath="/scratch365/ebrooks5/software/FCS_GX"

# move to the software directory
cd $softwarePath

# export the fcs-gx sif
export FCS_DEFAULT_IMAGE=fcs-gx.sif

# run fcs to screen the genome
python3 ./fcs.py screen genome --fasta $inputGenome --out-dir $GXDB_LOC"/"$inputSpecies"_gx_out" --gx-db $GXDB_LOC"/gxdb" --tax-id $taxInput
