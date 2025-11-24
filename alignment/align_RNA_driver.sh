# script to drive the alignment of paired end reads
# usage: bash align_RNA_driver.sh
# jobs 2559691 to 2559713, 2563669

# get the current directory
curDir=$(pwd)

# loop over each input file
for inputsFile in ../inputData/counting/*/*; do
	# submit alignment job
	qsub align_RNA.sh $inputsFile
done

# Print status message
echo "Analysis complete!"
