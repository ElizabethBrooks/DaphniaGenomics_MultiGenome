#!/bin/bash
#$ -M ebrooks5@nd.edu
#$ -m abe
#$ -r n
#$ -N run_FCS_GX_jobOutput
#$ -pe smp 4

# set DB directory
GXDB_LOC="/scratch365/ebrooks5/FCS_GX"

# pre clean up
rm -r $GXDB_LOC"/D_lumholtzi_gx_out"

# move to DB directory
cd $GXDB_LOC

# export the fcs-gx sif
export FCS_DEFAULT_IMAGE=fcs-gx.sif

# run fcs to clean the genome
python3 ./fcs.py screen genome --fasta /afs/crc.nd.edu/group/pfrenderlab/mendel/DaphniaGenomes/1_all_chromosome_assemblies_and_annotation_June2024/D.lumholtzi.2.0_annotation/D.lumholtzi_3.0.masked.fasta --out-dir $GXDB_LOC"/D_lumholtzi_gx_out" --gx-db $GXDB_LOC"/gxdb" --tax-id 42856
