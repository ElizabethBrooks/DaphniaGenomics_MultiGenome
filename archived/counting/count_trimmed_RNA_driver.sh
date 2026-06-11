# script to drive the counting of paired end reads
# usage: bash count_trimmed_RNA_driver.sh
# jobs 2582566 to 2582590

# loop over each input file
for inputsFile in ../inputData/counting/*/*; do
	# submit alignment job
	qsub count_trimmed_RNA.sh $inputsFile
done

# Print status message
echo "Analysis complete!"
