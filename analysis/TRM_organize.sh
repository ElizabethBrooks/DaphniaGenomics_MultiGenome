#!/bin/bash

# organize TRM data for analysis
for i in /Users/bamflappy/PfrenderLab/multi_genome_project/telomeres_min4_max12/*/*/tidk_0.2.65/telomeric_repeat.tsv; do echo $i; dirName=$(dirname $i); dirName2=$(dirname $dirName); specName=$(basename $dirName2); cat $i | tail -n+2 | sed "s/$/,$specName/g" | tr '\t' ','  > $i.fmt.csv; done

echo "TRM,counts,species" > /Users/bamflappy/PfrenderLab/multi_genome_project/telomeres_min4_max12/telomeric_repeat_formatted.csv

for i in /Users/bamflappy/PfrenderLab/multi_genome_project/telomeres_min4_max12/*/*/tidk_0.2.65/telomeric_repeat.tsv.fmt.csv; do cat $i >> /Users/bamflappy/PfrenderLab/multi_genome_project/telomeres_min4_max12/telomeric_repeat_formatted.csv; done        

# organize tree species including versions TRM data for analysis
for i in /Users/bamflappy/PfrenderLab/multi_genome_project/telomeres_min4_max12_tree_species_including_versions/*/*/tidk_0.2.65/telomeric_repeat.tsv; do echo $i; dirName=$(dirname $i); dirName2=$(dirname $dirName); specName=$(basename $dirName2); cat $i | tail -n+2 | sed "s/$/,$specName/g" | tr '\t' ','  > $i.fmt.csv; done

echo "TRM,counts,species" > /Users/bamflappy/PfrenderLab/multi_genome_project/telomeres_min4_max12_tree_species_including_versions/telomeric_repeat_formatted.csv

for i in /Users/bamflappy/PfrenderLab/multi_genome_project/telomeres_min4_max12_tree_species_including_versions/*/*/tidk_0.2.65/telomeric_repeat.tsv.fmt.csv; do cat $i >> /Users/bamflappy/PfrenderLab/multi_genome_project/telomeres_min4_max12_tree_species_including_versions/telomeric_repeat_formatted.csv; done        

# organize tree species TRM data for analysis
for i in /Users/bamflappy/PfrenderLab/multi_genome_project/telomeres_min4_max12_tree_species/*/*/tidk_0.2.65/telomeric_repeat.tsv; do echo $i; dirName=$(dirname $i); dirName2=$(dirname $dirName); specName=$(basename $dirName2); cat $i | tail -n+2 | sed "s/$/,$specName/g" | tr '\t' ','  > $i.fmt.csv; done

echo "TRM,counts,species" > /Users/bamflappy/PfrenderLab/multi_genome_project/telomeres_min4_max12_tree_species/telomeric_repeat_formatted.csv

for i in /Users/bamflappy/PfrenderLab/multi_genome_project/telomeres_min4_max12_tree_species/*/*/tidk_0.2.65/telomeric_repeat.tsv.fmt.csv; do cat $i >> /Users/bamflappy/PfrenderLab/multi_genome_project/telomeres_min4_max12_tree_species/telomeric_repeat_formatted.csv; done        
