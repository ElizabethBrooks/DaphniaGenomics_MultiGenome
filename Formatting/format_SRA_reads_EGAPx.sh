#!/bin/bash

# script to format SRA reads for EGAPx

for i in *
do 
	# status message
	echo "Processing "$i
	# format reag headers and keep only header and sequence data
	cat $i | sed "s/^@/>/g" | sed "s/.HWI.*$//g" | grep -A1 --no-group-separator "^>" > ../dump_fmt/$i
done
