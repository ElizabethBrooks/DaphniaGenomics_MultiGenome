# script to analyze TRMs across species

# load libraries
library(tidyr)
library(dplyr)

# set working directory
#work_dir <- "/Users/bamflappy/PfrenderLab/multi_genome_project/telomeres_min4_max12_tree_species_including_versions"
work_dir <- "/Users/bamflappy/PfrenderLab/multi_genome_project/telomeres_min4_max12_tree_species"
setwd(work_dir)

# read in TRM data
#trm_data <- read.csv("/Users/bamflappy/PfrenderLab/multi_genome_project/telomeres_min4_max12_tree_species_including_versions/telomeric_repeat_formatted.csv")
trm_data <- read.csv("/Users/bamflappy/PfrenderLab/multi_genome_project/telomeres_min4_max12_tree_species/telomeric_repeat_formatted.csv")

# split the TRM data by species
#split_trm <- split(trm_data, trm_data$species)

# change data frame from long to wide
trm_wide <- pivot_wider(
  trm_data, 
  names_from = species,   # new header names
  values_from = counts   # values to fill the table
)

# replace NAs with 0s
trm_wide[is.na(trm_wide)] <- 0

# sort by descending order (longest to shortest)
trm_sorted_desc <- trm_wide %>% arrange(desc(nchar(TRM)))

# export table
write.csv(trm_sorted_desc, "telomeric_repeat_formatted_wide.csv", quote = FALSE, row.names = FALSE)
