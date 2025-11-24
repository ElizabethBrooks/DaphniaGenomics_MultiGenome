# script to drive the alignment of paired end reads
# usage: bash trim_RNA_driver.sh
# jobs 

# Required modules for ND CRC servers
module load bio

# get the current directory
curDir=$(pwd)

# loop over each input file
for inputsFile in ../inputData/counting/*/*; do
	# submit alignment job
	qsub trim_RNA.sh $inputsFile
done

# Print status message
echo "Analysis complete!"
