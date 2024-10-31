#!/bin/bash

# script to create dual synteny plots
# usage: bash create_dual_synteny.sh

# set species comparison tag
compTag="arabadopsis_ailanthifolia"

# retrieve inputs
cntlFile="/Users/bamflappy/Repos/GBCF_Chloroplasts/InputData/inputs_dual_synteny.ctl"

# setup outputs directory
outputFolder=$(grep "outputs:" ../InputData/inputs_local.txt | tr -d " " | sed "s/outputs://g")
outputFolder=$outputFolder"/orthology_MCScanX"

# setup outputs subdirectory
outputFolder=$outputFolder"/"$compTag

# setup MCScanX inputs directory
dataFolder=$outputFolder"/data"

# Generate the dual synteny plot by using the above .ctl file, the .gff input file for MCScanX (from Step 13) and the ‘.collinearity’ file generated by MCScanX
java dual_synteny_plotter -g $dataFolder"/master.gff" -s $dataFolder"/master.collinearity" -c $cntlFile -o $dataFolder"/dual_synteny.png"