# script to get intergenic DNA sizes

# create and set working directory
setwd("/Users/bamflappy/PfrenderLab/multi_genome_project/evaluation_tree_species")

# turn off scientific notation
options(scipen=999)

# read in genome sizes csv
genome_sizes <- read.csv("/Users/bamflappy/PfrenderLab/multi_genome_project/evaluation_tree_species/genome_sizes.fmt.csv", colClasses = c("character", "numeric"), header = FALSE)

# read gene lengths csv
gene_lengths <- read.csv("/Users/bamflappy/PfrenderLab/multi_genome_project/evaluation_tree_species/total_gene_lengths.csv", colClasses = c("character", "character", "numeric"), header = FALSE)

# calculate intergenic DNA sizes

