#!/bin/bash
#$ -M ebrooks5@nd.edu
#$ -m abe
#$ -r n
#$ -N run_EGAPx_jobOutput
#$ -pe smp 63

# script to run the EGAPx pipeline
# NOTE: the default /egapx/ui/assets/config/process_resources.config file specifies up to 31 cores (huge_Job)
# our afs system has 263Gb RAM, 64 cores
# usage: qsub run_EGAPx_HPC.sh inputFile
# usage ex: qsub run_EGAPx_HPC.sh inputs_KAP4_NCBI.txt
## job 694733 -> DONE
##  Wallclock Time   = 10:23:29:22
# usage ex: qsub run_EGAPx_HPC.sh inputs_KAP106.txt
## job 699252 -> DONE
## Wallclock Time   = 8:15:36:18
# usage ex: qsub run_EGAPx_HPC.sh inputs_LK16_NCBI.txt
## job 773663 -> RUNNING
# usage ex: qsub run_EGAPx_HPC.sh inputs_SC_F0-13Bv2.txt
## job 773672 -> DONE
## Wallclock Time   = 4:16:23:22
# usage ex: qsub run_EGAPx_HPC.sh inputs_NIES_NCBI.txt
## job 773796 -> WAITING

# load the egapx software module (contains nextflow)
#module load bio/egapx/0.1.1

# retrieve input file
inputFile=$1

# retrieve species name
speciesName=$(grep "species:" ../"InputData/"$inputFile | tr -d " " | sed "s/species://g")

# retrieve inputs path
inputsPath=$(grep "inputs_EGAPx:" ../"InputData/"$inputFile | tr -d " " | sed "s/inputs_EGAPx://g")

# retrieve repository directory
repoDir=$(dirname $PWD)

# setup inputs path
inputsPath=$repoDir"/InputData/"$inputsPath

# retrieve software path
softwarePath=$(grep "software_EGAPx:" ../"InputData/inputPaths.txt" | tr -d " " | sed "s/software_EGAPx://g")

# retrieve outputs path
outputsPath=$(grep "outputs_EGAPx:" ../"InputData/inputPaths.txt" | tr -d " " | sed "s/outputs_EGAPx://g")

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

# run nextflow
nextflow -C $outputsPath"/egapx_config/singularity.config",$softwarePath"/ui/assets/config/default.config",$softwarePath"/ui/assets/config/docker_image.config",$softwarePath"/ui/assets/config/process_resources.config" \
	-log $outputsPath"/nextflow.log" run $softwarePath"/ui/"../nf/ui.nf \
	--output $outputsPath \
	-with-report $outputsPath"/run.report.html" \
	-with-timeline $outputsPath"/run.timeline.html" \
	-with-trace $outputsPath"/run.trace.txt" \
	-params-file $outputsPath"/run_params.yaml" \
	#-resume

# clean up
#rm -r $outputsPath"/temp_datapath"
#rm -r $outputsPath"/work"

# status message
echo "Analysis of $speciesName complete!"
