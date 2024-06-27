#!/bin/bash
#$ -M ebrooks5@nd.edu
#$ -m abe
#$ -r n
#$ -N run_EGAPx_jobOutput

# script to run the EGAPx pipeline

# run EGAPx to copy config files
python3 /afs/crc.nd.edu/user/e/ebrooks5/egapx/ui/egapx.py /afs/crc.nd.edu/group/hoth/eBrooks/DaphniaGenomics_MultiGenome/inputs_KAP4_EGAPx.yaml -e singularity -w /scratch365/ebrooks5/multi_genome_project/temp_datapath_run0 -o /scratch365/ebrooks5/multi_genome_project/D_pulex_KAP4_run0

# run EGAPx
python3 /afs/crc.nd.edu/user/e/ebrooks5/egapx/ui/egapx.py /afs/crc.nd.edu/group/hoth/eBrooks/DaphniaGenomics_MultiGenome/inputs_KAP4_EGAPx.yaml -e singularity -w /scratch365/ebrooks5/multi_genome_project/temp_datapath_run0 -o /scratch365/ebrooks5/multi_genome_project/D_pulex_KAP4_run0
