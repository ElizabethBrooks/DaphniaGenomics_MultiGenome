#!/bin/bash

# script to format SRA reads for EGAPx

mkdir ../dump_fmt

for i in *
do 
	# status message
	echo "Processing "$i
	# format reag headers and keep only header and sequence data
	#cat $i | sed "s/^@/>/g" | sed "s/.HWI.*$//g" | grep -A1 --no-group-separator "^>" > ../dump_fmt/$i
	cat $i | sed "s/^@/>/g" | cut -d" " -f1 | grep -A1 --no-group-separator "^>" > ../dump_fmt/$i
done
