#!/bin/bash
#$ -M ebrooks5@nd.edu
#$ -m abe
#$ -r n
#$ -N run_EGAPx_v0.5_jobOutput
#$ -pe smp 15

# script to run the EGAPx v0.5 pipeline
# usage: qsub run_EGAPx_v0.5_HPC.sh inputFile
# usage ex: qsub run_EGAPx_v0.5_HPC.sh EGAPx_v0.5/D_melanica/inputs_CON6_BC.txt

# NOTE: the default /egapx/ui/assets/config/process_resources.config file specifies up to 31 cores (huge_Job)
# our afs system has 263Gb RAM, 64 cores
# make sure to always leave 1 core free for general processes, so request up to 63 cores per job on our afs system
# smaller annotation jobs do not need to request as many resources (for example, 15 cores is sufficient for the average run)

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
softwarePath=$(grep "software_EGAPx_v0.5:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/software_EGAPx_v0.5://g")

# retrieve outputs path
# change this for different test runs
#outputsPath=$(grep "outputs_EGAPx_v0.3.2:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.5://g")
outputsPath=$(grep "outputs_EGAPx_v0.5_BC:" ../"inputData/inputs_annotations.txt" | tr -d " " | sed "s/outputs_EGAPx_v0.5_BC://g")

# setup outputs directory
outputsPath=$outputsPath"/"$speciesName

# make outputs directory
mkdir $outputsPath

#Check if the folder already exists
if [ $? -ne 0 ]; then
	echo "The $outputsPath directory already exsists... please remove before proceeding."
	exit 1
fi

# make temporary data path
mkdir $outputsPath"/temp_datapath"

# move to outputs directory
cd $outputsPath

# status message
echo "Beginning analysis of $speciesName..."

# the normal workflow uses remote NCBI data, which has been giving errors
# https://github.com/ncbi/egapx/issues/214
# run EGAPx script to download necessary data for local running
python3 $softwarePath"/egapx/ui/egapx.py" $inputsPath -dl -lc $outputsPath"/local_cache"

# run EGAPx to edit config files
ui/egapx.py $inputsPath -e biowulf_cluster -w dfs_work -o dfs_out -lc ../local_cache
echo "process.container = '/path_to_/egapx_0.5.0.sif'"  >> $softwarePath"/egapx_config/biowulf_cluster.config"

# run EGAPx
python3 $softwarePath"/egapx/ui/egapx.py" $inputsPath -e biowulf_cluster -w dfs_work -o dfs_out -lc ../local_cache

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
