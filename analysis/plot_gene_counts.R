# script to analyze TRMs across species

# load libraries
library(tidyr)
library(ggplot2)

# set working directory
work_dir <- "/Users/bamflappy/PfrenderLab/multi_genome_project/gene_analysis"
setwd(work_dir)

# read in gene data
single_exon_gene_data <- read.csv("/Users/bamflappy/PfrenderLab/multi_genome_project/gene_analysis/single_exon_gene_counts.csv.fmt.csv")
embedded_gene_data <- read.csv("/Users/bamflappy/PfrenderLab/multi_genome_project/gene_analysis/embedded_gene_counts.csv.fmt.csv")

# add stat column
single_exon_gene_data$stat <- "single_exon"
embedded_gene_data$stat <- "embedded"

# merge data frames
gene_data <- rbind(single_exon_gene_data, embedded_gene_data)

# set species order
species_order <- rev(c("D_pulicaria", "D_schodleri", "D_melanica", "D_pulex_KAP4", "D_pulex_BEL2", 
                       "D_arenata", "D_mitsukuri", "D_catawba", "D_retrocurva", "D_obtusa", 
                       "D_ambigua", "D_magniceps", "D_dentifera", "D_galeata", 
                       "D_mendotae", "D_mediterranea", "D_salina", "D_magna_LRVO", "D_magna_MLC", 
                       "D_similis", "D_carinata", "D_longicephala", "D_lumholtzi", "D_arabica", 
                       "D_sinensis", "Ceriodaphnia_sp_dubia", "Simocephalus_vetulus", 
                       "Chydorus_sphaericus", "Diaphanosoma_dubium", "Latona_sp", "Eulimnadia_texana", 
                       "Branchinecta_lindahli", "Branchinecta_lynchi", "Branchinecta_sandiegonensis", 
                       "Artemia_sinica", "Artemia_tibetiana", "Artemia_franciscana"))

# dodged bar plot of stats for total gene counts
gene_counts_stats_plot <- ggplot(gene_data, aes(fill=stat, y=count, x=factor(species, species_order))) + 
  geom_bar(position="dodge", stat="identity") +
  coord_flip() +
  labs(x="Species", y="Number", fill = "Gene Counts") +
  theme_bw() 
ggsave("gene_counts_stats.png", plot = gene_counts_stats_plot, device = "png", width = 12, height = 8, units = "in")
