# script to drive the alignment of paired end reads
# usage: bash align_trimmed_RNA_driver.sh
# jobs 2575426 to 2575447

# loop over each input file
for inputsFile in ../inputData/counting/*/*; do
	# submit alignment job
	qsub align_trimmed_RNA.sh $inputsFile
done

# Print status message
echo "Analysis complete!"
