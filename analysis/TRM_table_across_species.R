# script to analyze TRMs across species

# load libraries
library(tidyr)
library(dplyr)
library(stringr)

# set working directory
#work_dir <- "/Users/bamflappy/PfrenderLab/multi_genome_project/telomeres_min4_max12_tree_species_including_versions"
#work_dir <- "/Users/bamflappy/PfrenderLab/multi_genome_project/telomeres_min4_max12_tree_species"
work_dir <- "/Users/bamflappy/PfrenderLab/multi_genome_project/telomeres_min4_max15"
setwd(work_dir)

# read in TRM data
#trm_data <- read.csv("/Users/bamflappy/PfrenderLab/multi_genome_project/telomeres_min4_max12_tree_species_including_versions/telomeric_repeat_formatted.csv")
#trm_data <- read.csv("/Users/bamflappy/PfrenderLab/multi_genome_project/telomeres_min4_max12_tree_species/telomeric_repeat_formatted.csv")
#trm_data <- read.csv("/Users/bamflappy/PfrenderLab/multi_genome_project/telomeres_min4_max15/telomeric_repeat_formatted.csv")
trm_data <- read.csv("/Users/bamflappy/PfrenderLab/multi_genome_project/telomeres_min4_max15/telomeric_repeat_formatted.fmt2.csv")

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
write.csv(trm_sorted_desc, "telomeric_repeat_descending_wide.csv", quote = FALSE, row.names = FALSE)

# sort by ascending order (longest to shortest)
trm_sorted_asc <- trm_wide %>% arrange(str_length(TRM))

# export table
write.csv(trm_sorted_asc, "telomeric_repeat_ascending_wide.csv", quote = FALSE, row.names = FALSE)

# filter to the top 5 most common TRMs across species
trm_common <- trm_sorted_desc[trm_sorted_desc$TRM == "AACCT" | trm_sorted_desc$TRM == "AACCTAACCTAACCT" | trm_sorted_desc$TRM == "AACCTAACCT" | trm_sorted_desc$TRM == "AAAT" | trm_sorted_desc$TRM == "AAAAT",]

# export table
write.csv(trm_common, "telomeric_common_wide.csv", quote = FALSE, row.names = FALSE)

# data frame for TRM counts
trm_counts <- data.frame(
  species = colnames(trm_sorted_asc)[2:ncol(trm_sorted_asc)],
  total_repeats = 1:(ncol(trm_sorted_asc)-1)#,
  #per_telomere = 1:(ncol(trm_sorted_asc)-1)
)

# determine the number of TRMs per telomere for each species
for (i in 2:ncol(trm_sorted_asc)) {
  trm_counts$total_repeats[i-1] <- sum(trm_sorted_asc[,i])
  #trm_counts$per_telomere[i-1] <- sum(trm_sorted_asc[,i])/24
}

# export table
write.csv(trm_counts, "telomeric_counts_wide.csv", quote = FALSE, row.names = FALSE)
