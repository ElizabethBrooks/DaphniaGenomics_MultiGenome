# script to drive the sorting of paired end reads
# usage: bash sort_trimmed_RNA_driver.sh
# run 1
# jobs 2581726 to 2581747
# run 2
# jobs 

# loop over each input file
for inputsFile in ../inputData/counting/*/*; do
	# submit alignment job
	qsub sort_trimmed_RNA.sh $inputsFile
done

# Print status message
echo "Analysis complete!"
