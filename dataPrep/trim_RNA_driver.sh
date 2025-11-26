# script to drive the alignment of paired end reads
# usage: bash trim_RNA_driver.sh
# jobs 2567634 to 2567655

# loop over each input file
for inputsFile in ../inputData/counting/*/*; do
	# submit job script
	qsub trim_RNA.sh $inputsFile
done

# Print status message
echo "Analysis complete!"
