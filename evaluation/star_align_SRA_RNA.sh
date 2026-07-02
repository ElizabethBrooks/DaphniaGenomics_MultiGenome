#!/bin/bash
#$ -M ebrooks5@nd.edu
#$ -m abe
#$ -r n
#$ -N star_align_SRA_RNA_jobOutput
#$ -pe smp 8

# script to align paired end reads
# usage: qsub align_SRA_RNA.sh inputsFile

# load software
module load bio
conda activate my_star

# retrieve input file
inputFile=$1

# retrieve species name
speciesName=$(grep "species:" ../"inputData/"$inputFile | cut -d " " -f2)

# retrieve inputs path
inputsPath=$(grep "inputs_EGAPx:" ../"inputData/"$inputFile | cut -d " " -f2)

# retrieve repository directory
repoDir=$(dirname $PWD)

# setup inputs path
inputsPath=$repoDir"/inputData/"$inputsPath

# retrieve genome reference
refPath=$(grep "genome:" $inputsPath | cut -d " " -f2)

# retrieve inputs directory
# change this for different test runs
#inputsDir=$(grep "outputs_EGAPx_v0.3.2_ZQ_V2:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.3.2_ZQ_V2://g")
inputsDir=$(grep "outputs_EGAPx_v0.3.2_NCBI:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.3.2_NCBI://g")
#inputsDir=$(grep "outputs_EGAPx_v0.3.2_zenodo:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.3.2_zenodo://g")
#inputsDir=$(grep "outputs_EGAPx_v0.3.2_CNGBdb:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.3.2_CNGBdb://g")
#inputsDir=$(grep "outputs_EGAPx_v0.3.2_ZQ_B1:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.3.2_ZQ_B1://g")
#inputsDir=$(grep "outputs_EGAPx_v0.3.2_ZQ_B2:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.3.2_ZQ_B2://g")
#inputsDir=$(grep "outputs_EGAPx_v0.3.2_BC:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.3.2_BC://g")

# retrieve outputs path
outputsPath=$(grep "outputs_EGAPx_v0.3.2_analysis:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.3.2_analysis://g")

# setup inputs and outputs paths
inputsDir=$inputsDir"/"$speciesName
outputsPath=$outputsPath"/"$speciesName

# retrieve paired reads absolute path for alignment
readPath=$outputsPath"/SRA/"*".fastq"

# pre clean
rm -r $outputsPath"/STAR_v2.7.11b"

# create outputs directory
mkdir $outputsPath"/STAR_v2.7.11b"
mkdir $outputsPath"/STAR_v2.7.11b/MultiQC_v1.33"

# move to the outputs directory
cd $outputsPath"/STAR_v2.7.11b"

# status message
echo "Beginning analysis of $speciesName..."

# get read length
firstFile=$(ls -1 $readPath | head -1)
readLength=$(zcat -f $firstFile | head -n 2 | awk 'NR%4==2' | awk '{print length}')
overhangInput=$(($readLength-1))

# get genome size
nBases=$(cat $inputsDir"/complete.genomic.fna" | grep -v "^>" | tr -d -c "AGCTNagtcn" | wc -m)
logSize=$(awk "BEGIN { print log($nBases) / log(2) }")
gSize=$(echo "($logSize / 2) - 1" | bc)

# generate reference genome build files
mkdir $speciesName"_star_index"
STAR --runMode genomeGenerate \
     --runThreadN 8 \
     --genomeDir $speciesName"_star_index" \
     --genomeFastaFiles $refPath \
     --sjdbGTFfile $inputsDir"/complete.genomic.gff" \
     --sjdbOverhang $overhangInput \
     --genomeSAindexNbases $gSize

# check read type, assuming the second read file is listed last
readTest=$(echo $readPath | tail -1)
if [[ $readTest == *"_R2_001"* ]]; then
	readType="paired"
else
	readType="unpaired"
fi

# loop over each sample
loopNum=1
for sampleFile in $readPath; do
	# get sample tag
	sampleTag=$(basename $sampleFile | rev | cut -d "." -f2- | rev)
	# check read type
	if [[ $readType == "unpaired" ]]; then # single reads
		# compress reads, if not already
		if [[ "$sampleFile" != *.gz ]]; then gzip "$sampleFile"; fi
		# align samples to the refence genome
		STAR \
		  --runMode alignReads \
		  --readFilesCommand zcat \
		  --runThreadN 8 \
		  --genomeDir $speciesName"_star_index" \
		  --readFilesIn $sampleFile \
		  --outSAMtype BAM SortedByCoordinate \
		  --outFileNamePrefix $sampleTag	
	else # paired reads
		if [[ $(($loopNum % 2)) == 0 ]]; then # handle in pairs
			# setup second read path
			readTwo=$(echo $sampleFile | sed "s/_R1_/_R2_/g" | sed "s/_1\./_2./g")
			# compress reads, if not already
			if [[ "$sampleFile" != *.gz ]]; then gzip "$sampleFile"; fi
			if [[ "$readTwo" != *.gz ]]; then gzip "$readTwo"; fi
			# align samples to the refence genome
			STAR \
			  --runMode alignReads \
			  --readFilesCommand zcat \
			  --runThreadN 8 \
			  --genomeDir $speciesName"_star_index" \
			  --readFilesIn $sampleFile $readTwo \
			  --outSAMtype BAM SortedByCoordinate \
			  --outFileNamePrefix $sampleTag		
		fi
	fi
	# run samtolls stats
	samtools stats -@ 8 $sampleTag".fastqAligned.sortedByCoord.out.bam" > $sampleTag".stats"
	# incrememnt counter
	loopNum=$(($loopNum+1))
done

# run multiqc to aggegrate the reports
multiqc $outputsPath"/STAR_v2.7.11b" -o $outputsPath"/STAR_v2.7.11b/MultiQC_v1.33" -n "multiqc"

# Print status message
echo "Finished processing!"
