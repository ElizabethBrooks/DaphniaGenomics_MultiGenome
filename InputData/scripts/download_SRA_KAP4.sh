#!/bin/bash
#$ -M ebrooks5@nd.edu
#$ -m abe
#$ -r n
#$ -N SRA_KAP4_jobOutput

# script to download D pulex SRA data

module load bio/2.0

fasterq-dump DRP002580 ERP110882 SRP068113 SRP102491 SRP134187 SRP135935 SRP151839 SRP249545 SRP253589 SRP270794 SRP300422 SRP351713 SRR17282827
