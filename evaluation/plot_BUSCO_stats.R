# script to plot annotation stats

# create and set working directory
dir.create("/Users/bamflappy/PfrenderLab/multi_genome_project/evaluation_tree_species/BUSCO_v6.0.0")
setwd("/Users/bamflappy/PfrenderLab/multi_genome_project/evaluation_tree_species/BUSCO_v6.0.0")

# turn off scientific notation
options(scipen=999)

# load libraries
library(ggplot2)

# read in BUSCO genome stats csv
genome_stats_batch_1 <- read.csv("/Users/bamflappy/PfrenderLab/multi_genome_project/evaluation_tree_species/batch_1/BUSCO_v6.0.0/short_summary.specific.crustacea_odb12.genome.csv", colClasses = c("character", "numeric"))
genome_stats_batch_2 <- read.csv("/Users/bamflappy/PfrenderLab/multi_genome_project/evaluation_tree_species/batch_2/BUSCO_v6.0.0/short_summary.specific.crustacea_odb12.genome.csv.fmt.csv", colClasses = c("character", "numeric"))
genome_stats_version_2 <- read.csv("/Users/bamflappy/PfrenderLab/multi_genome_project/evaluation_tree_species/version_2/BUSCO_v6.0.0/short_summary.specific.crustacea_odb12.genome.csv.fmt.csv", colClasses = c("character", "numeric"))
genome_stats_add <- read.csv("/Users/bamflappy/PfrenderLab/multi_genome_project/evaluation_tree_species/additional/BUSCO_v6.0.0/short_summary.specific.crustacea_odb12.genome.csv.fmt.csv", colClasses = c("character", "numeric"))
genome_stats_egapx <- read.csv("/Users/bamflappy/PfrenderLab/multi_genome_project/evaluation_tree_species/EGAPx_v0.5.2/BUSCO_v6.0.0/short_summary.specific.crustacea_odb12.genome.csv", colClasses = c("character", "numeric"))

# read in BUSCO proteins stats csv
proteins_stats_batch_1 <- read.csv("/Users/bamflappy/PfrenderLab/multi_genome_project/evaluation_tree_species/batch_1/BUSCO_v6.0.0/short_summary.specific.crustacea_odb12.proteins.csv", colClasses = c("character", "numeric"))
proteins_stats_batch_2 <- read.csv("/Users/bamflappy/PfrenderLab/multi_genome_project/evaluation_tree_species/batch_2/BUSCO_v6.0.0/short_summary.specific.crustacea_odb12.proteins.csv.fmt.csv", colClasses = c("character", "numeric"))
proteins_stats_version_2 <- read.csv("/Users/bamflappy/PfrenderLab/multi_genome_project/evaluation_tree_species/version_2/BUSCO_v6.0.0/short_summary.specific.crustacea_odb12.proteins.csv.fmt.csv", colClasses = c("character", "numeric"))
proteins_stats_add <- read.csv("/Users/bamflappy/PfrenderLab/multi_genome_project/evaluation_tree_species/additional/BUSCO_v6.0.0/short_summary.specific.crustacea_odb12.proteins.csv.fmt.csv", colClasses = c("character", "numeric"))
proteins_stats_egapx <- read.csv("/Users/bamflappy/PfrenderLab/multi_genome_project/evaluation_tree_species/EGAPx_v0.5.2/BUSCO_v6.0.0/short_summary.specific.crustacea_odb12.proteins.csv", colClasses = c("character", "numeric"))

# read in AGAT BUSCO proteins stats csv
agat_stats_batch_1 <- read.csv("/Users/bamflappy/PfrenderLab/multi_genome_project/evaluation_tree_species/batch_1/AGAT_v1.4.2/BUSCO_v6.0.0/short_summary.specific.crustacea_odb12.proteins.csv", colClasses = c("character", "numeric"))
agat_stats_batch_2 <- read.csv("/Users/bamflappy/PfrenderLab/multi_genome_project/evaluation_tree_species/batch_2/AGAT_v1.4.2/BUSCO_v6.0.0/short_summary.specific.crustacea_odb12.proteins.csv.fmt.csv", colClasses = c("character", "numeric"))
agat_stats_version_2 <- read.csv("/Users/bamflappy/PfrenderLab/multi_genome_project/evaluation_tree_species/version_2/AGAT_v1.4.2/BUSCO_v6.0.0/short_summary.specific.crustacea_odb12.proteins.csv.fmt.csv", colClasses = c("character", "numeric"))
agat_stats_add <- read.csv("/Users/bamflappy/PfrenderLab/multi_genome_project/evaluation_tree_species/additional/AGAT_v1.4.2/BUSCO_v6.0.0/short_summary.specific.crustacea_odb12.proteins.csv.fmt.csv", colClasses = c("character", "numeric"))
agat_stats_egapx <- read.csv("/Users/bamflappy/PfrenderLab/multi_genome_project/evaluation_tree_species/EGAPx_v0.5.2/AGAT_v1.4.2/BUSCO_v6.0.0/short_summary.specific.crustacea_odb12.proteins.csv", colClasses = c("character", "numeric"))

# add genome batch column
genome_stats_batch_1$batch <- "batch_1"
genome_stats_batch_2$batch <- "batch_2"
genome_stats_version_2$batch <- "version_2"
genome_stats_add$batch <- "additional"
genome_stats_egapx$batch <- "egapx"

# add proteins batch column
proteins_stats_batch_1$batch <- "batch_1"
proteins_stats_batch_2$batch <- "batch_2"
proteins_stats_version_2$batch <- "version_2"
proteins_stats_add$batch <- "additional"
proteins_stats_egapx$batch <- "egapx"

# add agat batch column
agat_stats_batch_1$batch <- "batch_1"
agat_stats_batch_2$batch <- "batch_2"
agat_stats_version_2$batch <- "version_2"
agat_stats_add$batch <- "additional"
agat_stats_egapx$batch <- "egapx"

# combine data sets
genome_stats <- rbind(genome_stats_batch_1, genome_stats_batch_2, genome_stats_version_2, genome_stats_add, genome_stats_egapx)
proteins_stats <- rbind(proteins_stats_batch_1, proteins_stats_batch_2, proteins_stats_version_2, proteins_stats_add, proteins_stats_egapx)
agat_stats <- rbind(agat_stats_batch_1, agat_stats_batch_2, agat_stats_version_2, agat_stats_add, agat_stats_egapx)
num_species <- length(genome_stats$species)
busco_stats <- data.frame(
  species = c(genome_stats$species, proteins_stats$species, agat_stats$species), 
  stat = c(rep("genome", num_species), rep("proteins", num_species), rep("AGAT", num_species)),
  number = c(genome_stats$busco, proteins_stats$busco, agat_stats$busco) 
)

# set species order
#species_order <- rev(c("D_pulicaria", "D_schodleri", "D_melanica_v2", "D_melanica", "D_pulex_KAP4", "D_pulex_BEL2", 
#                       "D_arenata", "D_mitsukuri", "D_catawba", "D_retrocurva", "D_obtusa", "D_ambigua", "D_parvula",
#                       "D_magniceps", "D_dentifera", "D_galeata_v2", "D_galeata", "D_mendotae_v2", "D_mendotae", "D_mediterranea", 
#                       "D_salina", "D_magna_LRVO", "D_magna_MLC", "D_similis", "D_carinata", "D_longicephala", 
#                       "D_lumholtzi_v2", "D_lumholtzi", "D_arabica", "D_sinensis_WSL", "D_sinensis_CHINA", 
#                       "Ceriodaphnia_sp_dubia_v2", "Ceriodaphnia_sp_dubia", "Simocephalus_vetulus", "Chydorus_sphaericus",
#                       "Diaphanosoma_dubium", "Latona_sp", "Eulimnadia_texana", "Branchinecta_lindahli", 
#                       "Branchinecta_lynchi", "Branchinecta_sandiegonensis", "Artemia_sinica", "Artemia_tibetiana"))
species_order <- rev(c("D_pulicaria", "D_schodleri", "D_melanica", "D_pulex_KAP4", "D_pulex_BEL2", 
                       "D_arenata", "D_mitsukuri", "D_catawba", "D_retrocurva", "D_obtusa", "D_ambigua",
                       "D_magniceps", "D_dentifera", "D_galeata", "D_mendotae", "D_mediterranea", 
                       "D_salina", "D_magna_LRVO", "D_magna_MLC", "D_similis", "D_carinata", "D_longicephala", 
                       "D_lumholtzi", "D_arabica", "D_sinensis", "Ceriodaphnia_sp_dubia", "Simocephalus_vetulus", "Chydorus_sphaericus",
                       "Diaphanosoma_dubium", "Latona_sp", "Eulimnadia_texana", "Branchinecta_lindahli", 
                       "Branchinecta_lynchi", "Branchinecta_sandiegonensis", "Artemia_sinica", "Artemia_tibetiana", "Artemia_franciscana"))

# dodged bar plot of stats for genome
busco_plot <- ggplot(busco_stats, aes(fill=stat, y=number, x=factor(species, species_order))) + 
  geom_bar(position="dodge", stat="identity") +
  coord_flip() +
  labs(x="Species", y="Percent", fill = "BUSCO") +
  theme_bw() 
ggsave("BUSCO_stats.png", plot = busco_plot, device = "png", width = 12, height = 8, units = "in")
