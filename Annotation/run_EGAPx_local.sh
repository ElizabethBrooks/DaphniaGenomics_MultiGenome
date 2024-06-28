#!/bin/bash

# script to run the EGAPx pipeline
# usage: bash run_EGAPx_local.sh

# move to working directory
cd /scratch365/ebrooks5/multi_genome_project/D_pulex_KAP4

# run EGAPx to copy config files
python3 /afs/crc.nd.edu/user/e/ebrooks5/egapx/ui/egapx.py /afs/crc.nd.edu/group/hoth/eBrooks/DaphniaGenomics_MultiGenome/inputs_KAP4_EGAPx.yaml -e singularity -w /scratch365/ebrooks5/multi_genome_project/temp_datapath -o /scratch365/ebrooks5/multi_genome_project/D_pulex_KAP4

# run EGAPx
python3 /afs/crc.nd.edu/user/e/ebrooks5/egapx/ui/egapx.py /afs/crc.nd.edu/group/hoth/eBrooks/DaphniaGenomics_MultiGenome/inputs_KAP4_EGAPx.yaml -e singularity -w /scratch365/ebrooks5/multi_genome_project/temp_datapath -o /scratch365/ebrooks5/multi_genome_project/D_pulex_KAP4

# run nextflow
nextflow -C /afs/crc.nd.edu/group/hoth/eBrooks/DaphniaGenomics_MultiGenome/egapx_config/singularity.config,/afs/crc.nd.edu/user/e/ebrooks5/egapx/ui/assets/config/default.config,/afs/crc.nd.edu/user/e/ebrooks5/egapx/ui/assets/config/docker_image.config,/afs/crc.nd.edu/user/e/ebrooks5/egapx/ui/assets/config/process_resources.config -log /scratch365/ebrooks5/multi_genome_project/D_pulex_KAP4/nextflow.log run /afs/crc.nd.edu/user/e/ebrooks5/egapx/ui/../nf/ui.nf --output /scratch365/ebrooks5/multi_genome_project/D_pulex_KAP4 -with-report /scratch365/ebrooks5/multi_genome_project/D_pulex_KAP4/run.report.html -with-timeline /scratch365/ebrooks5/multi_genome_project/D_pulex_KAP4/run.timeline.html -with-trace /scratch365/ebrooks5/multi_genome_project/D_pulex_KAP4/run.trace.txt -params-file /scratch365/ebrooks5/multi_genome_project/D_pulex_KAP4/run_params.yaml -resume
