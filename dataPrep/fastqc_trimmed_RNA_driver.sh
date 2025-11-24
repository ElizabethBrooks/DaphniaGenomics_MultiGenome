# script to perform fastqc quality control of paired end reads
# usage: bash fastqc_trimmed_RNA_driver.sh
# jobs 2564457 to 2564478

# loop over each input file
for inputsFile in ../inputData/counting/*/*; do
	# submit job script
	qsub fastqc_trimmed_RNA.sh $inputsFile
done

# run multiqc
#multiqc $qcOut -o $qcOut -n "multiqc_raw"

# Print status message
echo "Analysis complete!"
