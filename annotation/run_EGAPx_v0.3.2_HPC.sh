#!/bin/bash
#$ -M ebrooks5@nd.edu
#$ -m abe
#$ -r n
#$ -N run_EGAPx_v0.3.2_jobOutput
#$ -pe smp 15

# script to run the EGAPx v0.3.2 pipeline
# usage: qsub run_EGAPx_v0.3.2_HPC.sh inputFile
# usage ex: qsub run_EGAPx_v0.3.2_HPC.sh EGAPx_v0.3.2/D_melanica/inputs_CON6_BC.txt
## job (first test) -> NOTE: Nextflow is not tested with Java 1.8.0_462 -- It's recommended the use of version 11 up to 23
## job (java -version) -> openjdk version "1.8.0_462"
## job (module load bio) -> ImportError: /afs/crc.nd.edu/x86_64_linux/b/bio/0724/lib/python3.12/lib-dynload/_sqlite3.cpython-312-x86_64-linux-gnu.so: undefined symbol: sqlite3_deserialize
## job (module load java/25.0.1) -> ERROR: Cannot find Java or it's a wrong version -- please make sure that Java 8 or later (up to 22) is installed

# NOTE: the default /egapx/ui/assets/config/process_resources.config file specifies up to 31 cores (huge_Job)
# our afs system has 263Gb RAM, 64 cores
# make sure to always leave 1 core free for general processes, so request up to 63 cores per job on our afs system
# smaller annotation jobs do not need to request as many resources (for example, 15 cores is sufficient for the average run)

# load module with updated java version
module load bio/3.0

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
softwarePath=$(grep "software_EGAPx_v0.3.2:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/software_EGAPx_v0.3.2://g")

# retrieve outputs path
# change this for different test runs
#outputsPath=$(grep "outputs_EGAPx_v0.3.2:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.3.2://g")
outputsPath=$(grep "outputs_EGAPx_v0.3.2_BC:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.3.2_BC://g")

# setup outputs directory
outputsPath=$outputsPath"/"$speciesName

# make outputs directory
#mkdir $outputsPath

# check if the folder already exists
#if [ $? -ne 0 ]; then
#	echo "The $outputsPath directory already exsists... please remove before proceeding."
#	exit 1
#fi

# make temporary data path
mkdir $outputsPath"/temp_datapath"

# move to outputs directory
cd $outputsPath

# status message
echo "Beginning analysis of $speciesName..."

# the normal workflow uses remote NCBI data, which has been giving errors
# https://github.com/ncbi/egapx/issues/214
# run EGAPx script to download necessary data for local running
#python3 $softwarePath"/ui/egapx.py" $inputsPath -dl -lc $outputsPath"/local_cache"

# run EGAPx to copy config files
# test: 
# python3 /afs/crc.nd.edu/user/e/ebrooks5/egapx_v0.3.2/egapx/ui/egapx.py /afs/crc.nd.edu/group/hoth/eBrooks/DaphniaGenomics_MultiGenome/inputData/EGAPx_v0.3.2/D_melanica/inputs_CON6_ZQ_MP.yaml -e singularity -w /scratch365/ebrooks5/multi_genome_project/EGAPx_v0.3.2/tested_April2026/BC_tests/D_melanica_CON6_ZQ_MP/temp_datapath -o /scratch365/ebrooks5/multi_genome_project/EGAPx_v0.3.2/tested_April2026/BC_tests/D_melanica_CON6_ZQ_MP -lc /scratch365/ebrooks5/multi_genome_project/EGAPx_v0.3.2/tested_April2026/BC_tests/D_melanica_CON6_ZQ_MP/local_cache
python3 $softwarePath"/ui/egapx.py" $inputsPath -e singularity -w $outputsPath"/temp_datapath" -o $outputsPath -lc $outputsPath"/local_cache"

## copy the updated config files
## test: 
## first, updated cache dir path (/scratch365/ebrooks5/egapx_v0.3.2/data/singularity) in the biowulf_cluster.config, biowulf_local.config, and slurm.config files
## next, updated tmp dir path (/scratch365/ebrooks5/egapx_v0.3.2/data/tmp) in the slurm.config file
## cp -r /afs/crc.nd.edu/user/e/ebrooks5/egapx_v0.3.2/egapx/egapx_config .
##cp -r $softwarePath"/egapx_config" .

## update the process container path (if using the biowulf_cluster, but that appears to be for slurm machines)
## test:
##echo "process.container = '/scratch365/ebrooks5/multi_genome_project/EGAPx_v0.3.2/tested_April2026/BC_tests/D_melanica_CON6_ZQ_MP/temp_datapath/singularity/ncbi-egapx-0.3.2-alpha.img'"  >> egapx_config/biowulf_cluster.config
##echo "process.container = '/scratch365/ebrooks5/egapx_v0.3.2/data/singularity/ncbi-egapx-0.3.2-alpha.img'"  >> egapx_config/biowulf_cluster.config

# run EGAPx
# test:
# python3 /afs/crc.nd.edu/user/e/ebrooks5/egapx_v0.3.2/egapx/ui/egapx.py /afs/crc.nd.edu/group/hoth/eBrooks/DaphniaGenomics_MultiGenome/inputData/EGAPx_v0.3.2/D_melanica/inputs_CON6_ZQ_MP.yaml -e singularity -w /scratch365/ebrooks5/multi_genome_project/EGAPx_v0.3.2/tested_April2026/BC_tests/D_melanica_CON6_ZQ_MP/temp_datapath -o /scratch365/ebrooks5/multi_genome_project/EGAPx_v0.3.2/tested_April2026/BC_tests/D_melanica_CON6_ZQ_MP -lc /scratch365/ebrooks5/multi_genome_project/EGAPx_v0.3.2/tested_April2026/BC_tests/D_melanica_CON6_ZQ_MP/local_cache
python3 $softwarePath"/ui/egapx.py" $inputsPath -e singularity -w $outputsPath"/temp_datapath" -o $outputsPath -lc $outputsPath"/local_cache"

# uncomment the following lines to reduce data storage
# clean up, if accept.gff output file exsists
#if [ ! -f $outputsPath"/accept.gff" ]; then
	# run to resume annotation
#	bash $outputsPath"/resume.sh"
#else
#    rm -r $outputsPath"/temp_datapath"
	#rm -r $outputsPath"/work"
	#rm -r $outputsPath"/annot_builder_output"
#fi

# status message
echo "Analysis of $speciesName complete!"
