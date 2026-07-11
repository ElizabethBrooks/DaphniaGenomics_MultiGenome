# script to analyze TRMs across species

# load libraries
library(tidyr)
library(ggplot2)

# set working directory
#work_dir <- "/Users/bamflappy/PfrenderLab/multi_genome_project/telomeres_min4_max12_tree_species_including_versions"
work_dir <- "/Users/bamflappy/PfrenderLab/multi_genome_project/telomeres_min4_max12_tree_species"
setwd(work_dir)

# read in TRM data
#trm_data <- read.csv("/Users/bamflappy/PfrenderLab/multi_genome_project/telomeres_min4_max12_tree_species_including_versions/telomeric_repeat_formatted.csv")
trm_data <- read.csv("/Users/bamflappy/PfrenderLab/multi_genome_project/telomeres_min4_max12_tree_species/telomeric_repeat_formatted.csv")

# set species order
species_order <- rev(c("D_pulicaria", "D_schodleri", "D_melanica", "D_pulex_KAP4", "D_pulex_BEL2", 
                       "D_arenata", "D_mitsukuri", "D_catawba", "D_retrocurva", "D_obtusa", 
                       "D_ambigua", "D_parvula", "D_magniceps", "D_dentifera", "D_galeata", 
                       "D_mendotae", "D_mediterranea", "D_salina", "D_magna_LRVO", "D_magna_MLC", 
                       "D_similis", "D_carinata", "D_longicephala", "D_lumholtzi", "D_arabica", 
                       "D_sinensis", "Ceriodaphnia_sp_dubia", "Simocephalus_vetulus", 
                       "Chydorus_sphaericus", "Diaphanosoma_dubium", "Latona_sp", "Eulimnadia_texana", 
                       "Branchinecta_lindahli", "Branchinecta_lynchi", "Branchinecta_sandiegonensis", 
                       "Artemia_sinica", "Artemia_tibetiana", "Artemia_franciscana"))

# filter rows by TRM length
trm_data_4 <- trm_data[nchar(trm_data$TRM) == 4, ]
trm_data_5 <- trm_data[nchar(trm_data$TRM) == 5, ]
trm_data_6 <- trm_data[nchar(trm_data$TRM) == 6, ]
trm_data_7 <- trm_data[nchar(trm_data$TRM) == 7, ]
trm_data_8 <- trm_data[nchar(trm_data$TRM) == 8, ]
trm_data_9 <- trm_data[nchar(trm_data$TRM) == 9, ]
trm_data_10 <- trm_data[nchar(trm_data$TRM) == 10, ]
trm_data_11 <- trm_data[nchar(trm_data$TRM) == 11, ]
trm_data_12 <- trm_data[nchar(trm_data$TRM) == 12, ]

# plots of TRMs of length 4
trm_data_4_plot <- ggplot(trm_data_4, aes(x = TRM, y = factor(species, species_order), fill = counts)) +
  geom_tile(color = "white", lwd = 0.5, linetype = 1) +
  scale_fill_viridis_c(option = "magma") +
  labs(x = "TRM", y = "Species", fill = "Counts") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1)) +
  coord_fixed()
ggsave("trm_data_length_4.png", plot = trm_data_4_plot, device = "png", width = 12, height = 8, units = "in")

# plots of TRMs of length 5
trm_data_5_plot <- ggplot(trm_data_5, aes(x = TRM, y = factor(species, species_order), fill = counts)) +
  geom_tile(color = "white", lwd = 0.5, linetype = 1) +
  scale_fill_viridis_c(option = "magma") +
  labs(x = "TRM", y = "Species", fill = "Counts") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1)) +
  coord_fixed()
ggsave("trm_data_length_5.png", plot = trm_data_5_plot, device = "png", width = 12, height = 8, units = "in")

# plots of TRMs of length 6
trm_data_6_plot <- ggplot(trm_data_6, aes(x = TRM, y = factor(species, species_order), fill = counts)) +
  geom_tile(color = "white", lwd = 0.5, linetype = 1) +
  scale_fill_viridis_c(option = "magma") +
  labs(x = "TRM", y = "Species", fill = "Counts") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1)) +
  coord_fixed()
ggsave("trm_data_length_6.png", plot = trm_data_6_plot, device = "png", width = 12, height = 8, units = "in")

# plots of TRMs of length 7
trm_data_7_plot <- ggplot(trm_data_7, aes(x = TRM, y = factor(species, species_order), fill = counts)) +
  geom_tile(color = "white", lwd = 0.5, linetype = 1) +
  scale_fill_viridis_c(option = "magma") +
  labs(x = "TRM", y = "Species", fill = "Counts") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1)) +
  coord_fixed()
ggsave("trm_data_length_7.png", plot = trm_data_7_plot, device = "png", width = 12, height = 8, units = "in")

# plots of TRMs of length 8
trm_data_8_plot <- ggplot(trm_data_8, aes(x = TRM, y = factor(species, species_order), fill = counts)) +
  geom_tile(color = "white", lwd = 0.5, linetype = 1) +
  scale_fill_viridis_c(option = "magma") +
  labs(x = "TRM", y = "Species", fill = "Counts") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1)) +
  coord_fixed()
ggsave("trm_data_length_8.png", plot = trm_data_8_plot, device = "png", width = 12, height = 8, units = "in")

# plots of TRMs of length 9
trm_data_9_plot <- ggplot(trm_data_9, aes(x = TRM, y = factor(species, species_order), fill = counts)) +
  geom_tile(color = "white", lwd = 0.5, linetype = 1) +
  scale_fill_viridis_c(option = "magma") +
  labs(x = "TRM", y = "Species", fill = "Counts") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1)) +
  coord_fixed()
ggsave("trm_data_length_9.png", plot = trm_data_9_plot, device = "png", width = 12, height = 8, units = "in")

# plots of TRMs of length 10
trm_data_10_plot <- ggplot(trm_data_10, aes(x = TRM, y = factor(species, species_order), fill = counts)) +
  geom_tile(color = "white", lwd = 0.5, linetype = 1) +
  scale_fill_viridis_c(option = "magma") +
  labs(x = "TRM", y = "Species", fill = "Counts") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1)) +
  coord_fixed()
ggsave("trm_data_length_10.png", plot = trm_data_10_plot, device = "png", width = 12, height = 8, units = "in")

# plots of TRMs of length 11
trm_data_11_plot <- ggplot(trm_data_11, aes(x = TRM, y = factor(species, species_order), fill = counts)) +
  geom_tile(color = "white", lwd = 0.5, linetype = 1) +
  scale_fill_viridis_c(option = "magma") +
  labs(x = "TRM", y = "Species", fill = "Counts") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1)) +
  coord_fixed()
ggsave("trm_data_length_11.png", plot = trm_data_11_plot, device = "png", width = 12, height = 8, units = "in")

# plots of TRMs of length 12
trm_data_12_plot <- ggplot(trm_data_12, aes(x = TRM, y = factor(species, species_order), fill = counts)) +
  geom_tile(color = "white", lwd = 0.5, linetype = 1) +
  scale_fill_viridis_c(option = "magma") +
  labs(x = "TRM", y = "Species", fill = "Counts") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1)) +
  coord_fixed()
ggsave("trm_data_length_12.png", plot = trm_data_12_plot, device = "png", width = 12, height = 8, units = "in")
