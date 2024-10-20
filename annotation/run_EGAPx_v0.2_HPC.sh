#!/bin/bash
#$ -M ebrooks5@nd.edu
#$ -m abe
#$ -r n
#$ -N run_EGAPx_v0.2_jobOutput
#$ -pe smp 63

# script to run the EGAPx pipeline
# usage: qsub run_EGAPx_v0.2_HPC.sh inputFile
# NCBI test set -> KILLED
# usage ex: qsub run_EGAPx_v0.2_HPC.sh inputs_KAP4_NCBI.txt
## job 747604 -> KILLED -> NOTE: Process `egapx:rnaseq_short_plane:star:run_star (180)` terminated with an error exit status (1) -- Execution is retried (1)
# usage ex: qsub run_EGAPx_v0.2_HPC.sh inputs_KAP106.txt
## job 747606 -> KILLED -> NOTE: Process `egapx:rnaseq_short_plane:star:run_star (174)` terminated with an error exit status (3) -- Execution is retried (1)
# usage ex: qsub run_EGAPx_v0.2_HPC.sh inputs_LK16_NCBI.txt
## job 773689 -> KILLED -> ERROR ~ Unable to re-submit task `egapx:rnaseq_short_plane:bam2asn:convert (376)`
# usage ex: qsub run_EGAPx_v0.2_HPC.sh inputs_SC_F0-13Bv2.txt
## job 773695 -> KILLED -> NOTE: Process `egapx:rnaseq_short_plane:fetch_sra_fasta:run_fetch_sra_fasta (85)` terminated with an error exit status (23) -- Execution is retried (1) -> ERROR ~ Unable to re-submit task `egapx:rnaseq_short_plane:fetch_sra_fasta:run_fetch_sra_fasta (85)`
# usage ex: qsub run_EGAPx_v0.2_HPC.sh inputs_NIES_NCBI.txt
## job 773797 -> KILLED -> NOTE: Process `egapx:rnaseq_short_plane:fetch_sra_fasta:run_fetch_sra_fasta (58)` terminated with an error exit status (23) -- Execution is retried (1)
# SRA test set
# usage ex: qsub run_EGAPx_v0.2_HPC.sh inputs_KAP4_SRA.txt
## job 800519 -> ERROR ~ Error executing process > 'egapx:rnaseq_short_plane:star:run_star (124)' -> Process `egapx:rnaseq_short_plane:star:run_star` input file name collision -- There are multiple input files for each of the following file names: SRR17282827_1.fasta
## job 808160 -> SUCCEEDED
# usage ex: qsub run_EGAPx_v0.2_HPC.sh inputs_KAP106_SRA.txt
## job 800520 -> ERROR ~ Error executing process > 'egapx:rnaseq_short_plane:star:run_star (124)' -> Process `egapx:rnaseq_short_plane:star:run_star` input file name collision -- There are multiple input files for each of the following file names: SRR17282827_1.fasta
## job 808161 -> RUNNING
# usage ex: qsub run_EGAPx_v0.2_HPC.sh inputs_LK16_SRA.txt
## job 800521 -> SUCCEEDED
# usage ex: qsub run_EGAPx_v0.2_HPC.sh inputs_NIES_SRA.txt
## job 800522 -> SUCCEEDED
# usage ex: qsub run_EGAPx_v0.2_HPC.sh inputs_SC_F1_1A_NCBI_SRA.txt
## job 823853 -> RUNNING
# usage ex: qsub run_EGAPx_v0.2_HPC.sh inputs_KAP106_NCBI_SRA.txt
## job 821229 -> KILLED -> /scratch365/ebrooks5/multi_genome_project/EGAPx_v0.2/D_pulex_KAP106_NCBI_SRA/accept.gff
# usage ex: qsub run_EGAPx_v0.2_HPC.sh inputs_LK16_NCBI_trimmed.txt
## job 821670 -> SUCCEEDED
# usage ex: qsub run_EGAPx_v0.2_HPC.sh inputs_CSIRO_1_NCBI_SRA.txt
## job 854120
# usage ex: qsub run_EGAPx_v0.2_HPC.sh inputs_Xinb3_NCBI_SRA.txt
## job 854121 -> ERROR
# EXITING because of FATAL ERROR in reads input: Lread of the pair = 856   while DEF_readSeqLengthMax=650
#   Read Name=>SRR2671679.1952.2
#   SOLUTION: increase DEF_readSeqLengthMax in IncludeDefine.h and re-compile STAR
# usage ex: qsub run_EGAPx_v0.2_HPC.sh inputs_LRV0_1_NCBI_SRA.txt
## job 854182
# usage ex: qsub run_EGAPx_v0.2_HPC.sh inputs_SK_NCBI_SRA.txt
## job 854669
# usage ex: qsub run_EGAPx_v0.2_HPC.sh inputs_FS6_NCBI_trimmed.txt
## job
# usage ex: qsub run_EGAPx_v0.2_HPC.sh inputs_FS6_ZQ_trimmed.txt
## job

# NOTE: the default /egapx/ui/assets/config/process_resources.config file specifies up to 31 cores (huge_Job)
# our afs system has 263Gb RAM, 64 cores
# make sure to always leave 1 core free for general processes, so request up to 63 cores per job on our afs system

# retrieve input file
inputFile=$1

# retrieve species name
speciesName=$(grep "species:" ../"inputData/"$inputFile | tr -d " " | sed "s/species://g")

# retrieve inputs path
inputsPath=$(grep "inputs_EGAPx:" ../"inputData/"$inputFile | tr -d " " | sed "s/inputs_EGAPx://g")

# retrieve repository directory
repoDir=$(dirname $PWD)

# setup inputs path
inputsPath=$repoDir"/inputData/"$inputsPath

# retrieve software path
softwarePath=$(grep "software_EGAPx_v0.2:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/software_EGAPx_v0.2://g")

# retrieve outputs path
outputsPath=$(grep "outputs_EGAPx_v0.2:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.2://g")

# setup outputs directory
outputsPath=$outputsPath"/"$speciesName

# make outputs directory
mkdir $outputsPath

# make temporary data path
mkdir $outputsPath"/temp_datapath"

# move to outputs directory
cd $outputsPath

# status message
echo "Beginning analysis of $speciesName..."

# run EGAPx to copy config files
python3 $softwarePath"/ui/egapx.py" $inputsPath -e singularity -w $outputsPath"/temp_datapath" -o $outputsPath

# run EGAPx
python3 $softwarePath"/ui/egapx.py" $inputsPath -e singularity -w $outputsPath"/temp_datapath" -o $outputsPath

# clean up, if accept.gff output file exsists
if [ ! -f $outputsPath"/accept.gff" ]; then
	# run to resume annotation
	sh $outputsPath"/resume.sh"
else
    rm -r $outputsPath"/temp_datapath"
	#rm -r $outputsPath"/work"
	rm -r $outputsPath"/annot_builder_output"
fi

# status message
echo "Analysis of $speciesName complete!"
