#!/bin/bash
#$ -M ebrooks5@nd.edu
#$ -m abe
#$ -r n
#$ -N run_FCS_GX_jobOutput
#$ -pe smp 4

# script to screen a genome fasta for contamination
# usage: qsub screen_genome_FCS_GX.sh
# job 1170458

# retrieve the input genome
inputGenome="/afs/crc.nd.edu/group/pfrenderlab/mendel/DaphniaGenomes/1_all_chromosome_assemblies_and_annotation_June2024/D.lumholtzi.2.0_annotation/D.lumholtzi_3.0.masked.fasta"

# set input species
inputSpecies="D_lumholtzi"

# set DB directory
GXDB_LOC="/scratch365/ebrooks5/FCS_GX"

# pre clean up
#rm -r $GXDB_LOC"/D_lumholtzi_gx_out"

# move to DB directory
cd $GXDB_LOC

# export the fcs-gx sif
export FCS_DEFAULT_IMAGE=fcs-gx.sif

# run fcs to screen the genome
python3 ./fcs.py screen genome --fasta $inputGenome --out-dir $GXDB_LOC"/"$inputSpecies"_gx_out" --gx-db $GXDB_LOC"/gxdb" --tax-id 42856
