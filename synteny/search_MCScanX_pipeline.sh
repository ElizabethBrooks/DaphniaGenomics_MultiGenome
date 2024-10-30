#!/bin/bash

# script to use blastp to search to build blast files for MCScanX 
# https://www-nature-com.proxy.library.nd.edu/articles/s41596-024-00968-2
# https://github.com/wyp1125/MCScanX?tab=readme-ov-file
# usage: bash search_MCScanX_pipeline.sh queryTag dgTag queryFileIn dbFileIn queryFileFeat dbFileFeat

# retrieve inputs
queryTag=$1
dgTag=$2
queryFileIn=$3
dbFileIn=$4
queryFileFeat=$5
dbFileFeat=$6

# retrieve software location
softLoc="/Users/bamflappy/MCScanX-master/downstream_analyses"

# setup outputs directory
outputFolder=$(grep "outputs:" ../InputData/inputs_local.txt | tr -d " " | sed "s/outputs://g")
outputFolder=$outputFolder"/orthology_MCScanX"

# make output directory
mkdir $outputFolder

# setup outputs subdirectory
outputFolder=$outputFolder"/"$queryTag"_"$dgTag

# make output subdirectory
mkdir $outputFolder
# check if the folder already exists
if [ $? -ne 0 ]; then
	echo "The $outputFolder directory already exsists... please remove before proceeding."
	exit 1
fi

# setup MCScanX inputs directory
dataFolder=$outputFolder"/data"

# make output subdirectory
mkdir $dataFolder

# set cleaned input file names
queryFile=$queryFileIn".cleaned.fa"
dbFile=$dbFileIn".cleaned.fa"

# clean up input files and remove hyphens for blastp
# CFastaReader: Hyphens are invalid and will be ignored
cat $queryFileIn | sed "s/^.*gene=/>/g" | sed "s/] \[locus_tag.*$/_jaC/g" > $queryFile
cat $dbFileIn | sed "s/^.*gene=/>/g" | sed "s/] \[locus_tag.*$/_atC/g" > $dbFile

# move to the scripts directory
cd scripts

# status message
echo "Beginning analysis..."

# 13. In the ‘intermediateData’ folder (from Step 11), concatenate the .gff file of all species into a ‘master.gff’ file
# copy the cleaned gff files for each species
cp $queryFileFeat $outputFolder"/"$queryTag".gff"
cp $dbFileFeat $outputFolder"/"$dgTag".gff"
# combine the gff files for MCScanX
cat $outputFolder"/"*.gff > $outputFolder"/"$queryTag"_"$dgTag"_master.gff"

# 15. Build the BLASTP database and place it in the ‘ncbiDB’ folder
# make the first blast able database
bash makeDB_blast.sh $dbFile $outputFolder"/"dgTag"_db" "prot"

# make the second blast able database
bash makeDB_blast.sh $queryFile $outputFolder"/"queryTag"_db" "prot"

# 16. Execute all-against-all BLASTP running all the desired pairwise genomes with an E-value cutoff of 1 × 10−10 and the best five non-self-hits reported in each target genome.
bash search_blast.sh $queryFile $outputFolder"/"dgTag"_db" $outputFolder $outputFolder"/"$dgTag"_"$queryTag".blast" 5 "blastp"

# 17. For each pair of genomes, switch the query and target genomes for a second execution.
bash search_blast.sh $dbFile $outputFolder"/"$queryTag"_db" $outputFolder $outputFolder"/"$queryTag"_"$dgTag".blast" 5 "blastp"

# 18. Because colinear genes may exist in the same genomes, perform within a genome all-against-all BLASTP for each genome, with the best six hits being kept.
bash search_blast.sh $dbFile $outputFolder"/"$dgTag"_db" $outputFolder $outputFolder"/"$dgTag"_"$dgTag".blast" 6 "blastp"

# perform second within genome all-against-all BLASTP search
bash search_blast.sh $queryFile $outputFolder"/"$queryTag"_db" $outputFolder $outputFolder"/"$queryTag"_"$queryTag".blast" 6 "blastp"

# 20. Concatenate the .blast files to generate a single ‘master.blast’ file
bash combineResults_blastp.sh $outputFolder $outputFolder"/"$dgTag"_"$queryTag"_master.blast"

# copy and re-name the inputs for MCScanX to the data folder
cp $outputFolder"/"$dgTag"_"$queryFile"_master.gff" $dataFolder"/master.gff"
cp $outputFolder"/"$dgTag"_"$queryFile"_master.blast" $dataFolder"/master.blast"

# move to software location
cd $softLoc

# create MCScanX files for downstream analysis
MCScanX data/master

# create dual synteny plots
bash create_dual_synteny.sh

# create dot plots
bash create_dot.sh

# create circle plots
bash create_circle.sh

# status message
echo "Analysis complete!"
