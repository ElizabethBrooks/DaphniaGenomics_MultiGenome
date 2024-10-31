#!/bin/bash
#$ -M ebrooks5@nd.edu
#$ -m abe
#$ -r n
#$ -N download_SRA_jobOutput
#$ -pe smp 31

# script to download D pulex SRA data
# usage: qsub download_SRA.sh speciesTag sraIDs
# usage ex: qsub download_SRA.sh KAP4_KAP106 DRP002580 ERP110882 SRP068113 SRP102491 SRP134187 SRP135935 SRP151839 SRP249545 SRP253589 SRP270794 SRP300422 SRP351713 SRR17282827

# load software module
module load bio/2.0

# retrieve input species tag
speciesTag=$1

# retrieve input SRA ID(s)
inputIDs=${@:2}

# retrieve outputs path
outputsPath=$(grep "outputs_SRA:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_SRA://g")

# setup outputs directory
outputsPath=$outputsPath"/"$speciesTag

# make outputs folder
mkdir $outputsPath

# move to outputs directory
cd $outputsPath

# download SRA data
fasterq-dump --threads 31 -v --seq-defline $ac,$sn,$sg,$si,$ri,$rl $inputIDs
