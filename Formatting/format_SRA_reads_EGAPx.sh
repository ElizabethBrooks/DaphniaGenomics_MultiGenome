#!/bin/bash

# script to format SRA reads for EGAPx

mkdir ../"dump_fmt"

for i in *
do 
	# status message
	echo "Processing "$i
	# retrieve read number
	readNum=$(echo $i | sed "s/\.fastq//g" | sed "s/.*_//g")
	# update file name
	newName=$(echo $i | sed "s/_.\.fastq/\.$readNum/g")
	# format reag headers and keep only header and sequence data
	cat $i | cut -d" " -f1 | sed "s/^@/>/g" | grep -A1 --no-group-separator "^>" > ../"dump_fmt/"$newName
done
