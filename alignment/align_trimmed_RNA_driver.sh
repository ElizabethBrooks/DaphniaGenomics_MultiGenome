# script to drive the alignment of paired end reads
# usage: bash align_RNA_driver.sh
# jobs 

# get the current directory
curDir=$(pwd)

# loop over each input file
#for inputsFile in ../inputData/counting/*/*; do
for inputsFile in ../inputData/counting/single/*; do
	# submit alignment job
	qsub align_trimmed_RNA.sh $inputsFile
done

# Print status message
echo "Analysis complete!"
