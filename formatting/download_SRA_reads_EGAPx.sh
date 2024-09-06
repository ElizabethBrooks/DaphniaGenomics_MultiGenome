#!/bin/bash
#$ -M ebrooks5@nd.edu
#$ -m abe
#$ -r n
#$ -N download_SRA_EGAPx_jobOutput
#$ -pe smp 8

# script to download formatted SRA reads for EGAPx
# usage: qsub download_SRA_reads_EGAPx.sh species ID
# usage ex: qsub download_SRA_reads_EGAPx.sh KAP4_KAP106 DRP002580
# usage ex: qsub download_SRA_reads_EGAPx.sh KAP4_KAP106 ERP110882
# usage ex: qsub download_SRA_reads_EGAPx.sh KAP4_KAP106 SRP068113
# usage ex: qsub download_SRA_reads_EGAPx.sh KAP4_KAP106 SRP102491
# usage ex: qsub download_SRA_reads_EGAPx.sh KAP4_KAP106 SRP134187
# usage ex: qsub download_SRA_reads_EGAPx.sh KAP4_KAP106 SRP135935
# usage ex: qsub download_SRA_reads_EGAPx.sh KAP4_KAP106 SRP151839
# usage ex: qsub download_SRA_reads_EGAPx.sh KAP4_KAP106 SRP249545
# usage ex: qsub download_SRA_reads_EGAPx.sh KAP4_KAP106 SRP253589
# usage ex: qsub download_SRA_reads_EGAPx.sh KAP4_KAP106 SRP270794
# usage ex: qsub download_SRA_reads_EGAPx.sh KAP4_KAP106 SRP300422
# usage ex: qsub download_SRA_reads_EGAPx.sh KAP4_KAP106 SRP351713
# usage ex: qsub download_SRA_reads_EGAPx.sh KAP4_KAP106 SRR17282827
## jobs 798391, 798392, 798393, 798394, 798395, 798396, 798397, 798398, 798399, 798400, 798401, 798402, 798403
# usage ex: qsub download_SRA_reads_EGAPx.sh NIES SRP057045
# usage ex: qsub download_SRA_reads_EGAPx.sh NIES SRP113320
# usage ex: qsub download_SRA_reads_EGAPx.sh NIES SRP142416
# usage ex: qsub download_SRA_reads_EGAPx.sh NIES SRP151236
# usage ex: qsub download_SRA_reads_EGAPx.sh NIES SRP161660
# usage ex: qsub download_SRA_reads_EGAPx.sh NIES SRP168044
# usage ex: qsub download_SRA_reads_EGAPx.sh NIES SRP173886
# usage ex: qsub download_SRA_reads_EGAPx.sh NIES SRP256437
# usage ex: qsub download_SRA_reads_EGAPx.sh NIES SRP259943
# usage ex: qsub download_SRA_reads_EGAPx.sh NIES SRP262286
# usage ex: qsub download_SRA_reads_EGAPx.sh NIES SRP262288
# usage ex: qsub download_SRA_reads_EGAPx.sh NIES SRP278637
# usage ex: qsub download_SRA_reads_EGAPx.sh NIES SRP282875
# usage ex: qsub download_SRA_reads_EGAPx.sh NIES SRP326419
# usage ex: qsub download_SRA_reads_EGAPx.sh NIES SRP330012
## jobs 798404, 798405, 798407, 798409, 798410, 798411, 798412, 798413, 798414, 798415, 798416, 798417, 798418, 798419, 798420
 
# retrieve input species
inputSpecies=$1

# retrieve input SRA ID
inputID=$2

# retrieve software path
softwarePath=$(grep "software_SRA:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/software_SRA://g")

# retrieve outputs path
outputsPath=$(grep "outputs_SRA:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_SRA://g")

# create the outputs data directory
mkdir $outputsPath

# name species outputs directory
outDir=$outputsPath"/"$inputSpecies

# make species directory for the formatted data
mkdir $outDir

# name SRA ID outputs directory
outDir=$outDir"/"$inputID

# make SRA ID directory for the formatted data
mkdir $outDir

# move to outputs directory, since SRA tools caches data in the working directory
cd $outDir

# download formated reads
prefetch $inputID

# status message
echo "Beginning analysis..."

# loop over each SRA ID retrieved using prefetch
for i in $outDir"/"*"/"; do
	# retrieve SRA ID
	sraID=$(basename $i)
	# status message
	echo "Processing $sraID ..."
	# retrieve SRA data
	$softwarePath"/"fasterq-dump --skip-technical --threads 8 --split-files --seq-defline ">\$ac.\$si.\$ri" --fasta -O $outDir"/"  ./$sraID
done

# status message
echo "Analysis complete!"
