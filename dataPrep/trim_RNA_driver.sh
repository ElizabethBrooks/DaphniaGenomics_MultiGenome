# script to drive the alignment of paired end reads
# usage: bash trim_RNA_driver.sh
# jobs 2563671 to 2563692
# jobs 2564444 to 2564447

# get the current directory
curDir=$(pwd)

# loop over each input file
for inputsFile in ../inputData/counting/*/*; do
#for inputsFile in ../inputData/counting/multiple/*; do
	# submit job script
	qsub trim_RNA.sh $inputsFile
done

# Print status message
echo "Analysis complete!"
