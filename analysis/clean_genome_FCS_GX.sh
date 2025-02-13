#!/bin/bash

# script to clean a genome fasta of contamination
# usage: bash clean_genome_FCS_GX.sh

# retrieve the input genome
#inputGenome="/afs/crc.nd.edu/group/pfrenderlab/mendel/DaphniaGenomes/1_all_chromosome_assemblies_and_annotation_June2024/D.lumholtzi.2.0_annotation/D.lumholtzi_3.0.masked.fasta"
inputGenome="/afs/crc.nd.edu/group/pfrenderlab/carson/Daphnia_raw_data_WW/D.sinensis_CHINA.masked.fasta"

# set input species
#inputSpecies="D_lumholtzi"
inputSpecies="D_sinensis_CHINA"

# retrieve the input report
#inputReport="/scratch365/ebrooks5/FCS_GX/D_lumholtzi_gx_out/D.lumholtzi_3.0.masked.42856.fcs_gx_report.txt"
inputReport=$(ls /scratch365/ebrooks5/FCS_GX/D_sinensis_CHINA_gx_out/D.sinensis_CHINA.masked.*.fcs_gx_report.txt)

# set output file names
outputGenome=$(basename $inputGenome | sed "s/\.fasta/_clean.fasta/g")
outputContam=$(basename $inputGenome | sed "s/\.fasta/_contam.fasta/g")

# set DB directory
GXDB_LOC="/scratch365/ebrooks5/FCS_GX"

# move to DB directory
cd $GXDB_LOC

# export the fcs-gx sif
export FCS_DEFAULT_IMAGE=fcs-gx.sif

# run fcs to clean the genome
cat $inputGenome | python3 ./fcs.py clean genome --action-report $inputReport --output $GXDB_LOC"/"$inputSpecies"_gx_out/"$outputGenome --contam-fasta-out $GXDB_LOC"/"$inputSpecies"_gx_out/"$outputContam
