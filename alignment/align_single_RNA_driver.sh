# script to drive the alignment of paired end reads
# usage: bash align_single_RNA.sh

# Required modules for ND CRC servers
module load bio

# get the current directory
curDir=$(pwd)

# loop over each input file
for inputsFile in ../inputData/counting/single/*; do
	# submit alignment job
	qsub align_single_RNA.sh $inputsFile
done

# Print status message
echo "Analysis complete!"
