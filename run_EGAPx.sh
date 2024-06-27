#!/bin/bash
#$ -M ebrooks5@nd.edu
#$ -m abe
#$ -r n
#$ -N run_EGAPx_jobOutput
#$ -pe smp 8

# script to run the EGAPx pipeline

# move to working directory
cd /scratch365/ebrooks5/multi_genome_project/D_pulex_KAP4_run0

# run EGAPx to copy config files
python3 /afs/crc.nd.edu/user/e/ebrooks5/egapx/ui/egapx.py /afs/crc.nd.edu/group/hoth/eBrooks/DaphniaGenomics_MultiGenome/inputs_KAP4_EGAPx.yaml -e singularity -w /scratch365/ebrooks5/multi_genome_project/temp_datapath_run0 -o /scratch365/ebrooks5/multi_genome_project/D_pulex_KAP4_run0

# run EGAPx
python3 /afs/crc.nd.edu/user/e/ebrooks5/egapx/ui/egapx.py /afs/crc.nd.edu/group/hoth/eBrooks/DaphniaGenomics_MultiGenome/inputs_KAP4_EGAPx.yaml -e singularity -w /scratch365/ebrooks5/multi_genome_project/temp_datapath_run0 -o /scratch365/ebrooks5/multi_genome_project/D_pulex_KAP4_run0

# run nextflow
nextflow -C /afs/crc.nd.edu/group/hoth/eBrooks/DaphniaGenomics_MultiGenome/egapx_config/singularity.config,/afs/crc.nd.edu/user/e/ebrooks5/egapx/ui/assets/config/default.config,/afs/crc.nd.edu/user/e/ebrooks5/egapx/ui/assets/config/docker_image.config,/afs/crc.nd.edu/user/e/ebrooks5/egapx/ui/assets/config/process_resources.config -log /scratch365/ebrooks5/multi_genome_project/D_pulex_KAP4_run0/nextflow.log run /afs/crc.nd.edu/user/e/ebrooks5/egapx/ui/../nf/ui.nf --output /scratch365/ebrooks5/multi_genome_project/D_pulex_KAP4_run0 -with-report /scratch365/ebrooks5/multi_genome_project/D_pulex_KAP4_run0/run.report.html -with-timeline /scratch365/ebrooks5/multi_genome_project/D_pulex_KAP4_run0/run.timeline.html -with-trace /scratch365/ebrooks5/multi_genome_project/D_pulex_KAP4_run0/run.trace.txt -params-file /scratch365/ebrooks5/multi_genome_project/D_pulex_KAP4_run0/run_params.yaml -resume
