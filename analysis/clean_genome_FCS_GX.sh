#!/bin/bash

# script to clean a genome fasta of contamination
# usage: bash clean_genome_FCS_GX.sh inputFile
# usage ex: qsub clean_genome_FCS_GX.sh EGAPx_v0.3.2/D_melanica/inputs_CON6_BC.txt

# retrieve input file
inputFile=$1

# set input species
inputSpecies=$(grep "species:" ../"inputData/"$inputFile | tr -d " " | sed "s/species: //g")

# setup yaml path
inputYaml=$(echo $inputFile | sed "s/\.txt/.yaml/g")

# retrieve the input genome
inputGenome=$(grep "genome:" ../"inputData/"$inputYaml | tr -d " " | sed "s/genome: //g")

# retrieve input tax id
taxInput=$(grep "taxid:" ../"inputData/"$inputYaml | tr -d " " | sed "s/taxid: //g")

# set the outputs directory
outputsPath="/scratch365/ebrooks5/multi_genome_project/data/Daphnia_genomes/cleaned_FCS_GX/"$inputSpecies

# create the outputs directory
mkdir $outputsPath

# set DB directory
GXDB_LOC="/scratch365/ebrooks5/software/FCS_GX"

# set the software path
softwarePath="/scratch365/ebrooks5/software/FCS_GX"

# retrieve the input report
inputReport=$(ls $softwarePath"/"$inputSpecies"_gx_out/"*.fcs_gx_report.txt)

# set output file names
outputGenome=$outputsPath"/clean.fasta"
outputContam=$outputsPath"/contam.fasta"

# move to the software directory
cd $softwarePath

# export the fcs-gx sif
export FCS_DEFAULT_IMAGE=fcs-gx.sif

# run fcs to clean the genome
cat $inputGenome | python3 ./fcs.py clean genome --action-report $inputReport --output $GXDB_LOC"/"$inputSpecies"_gx_out/"$outputGenome --contam-fasta-out $GXDB_LOC"/"$inputSpecies"_gx_out/"$outputContam
