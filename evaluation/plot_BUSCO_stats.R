# script to plot annotation stats

# create and set working directory
dir.create("/Users/bamflappy/PfrenderLab/multi_genome_project/evaluation/tree_RNA/BUSCO_v6.0.0")
setwd("/Users/bamflappy/PfrenderLab/multi_genome_project/evaluation/tree_RNA/BUSCO_v6.0.0")

# turn off scientific notation
options(scipen=999)

# load libraries
library(ggplot2)

# read in BUSCO genome stats csv
genome_stats_batch_1 <- read.csv("/Users/bamflappy/PfrenderLab/multi_genome_project/evaluation/tree_RNA/batch_1/BUSCO_v6.0.0/short_summary.specific.crustacea_odb12.genome.csv", colClasses = c("character", "numeric"))
genome_stats_batch_2 <- read.csv("/Users/bamflappy/PfrenderLab/multi_genome_project/evaluation/tree_RNA/batch_2/BUSCO_v6.0.0/short_summary.specific.crustacea_odb12.genome.csv", colClasses = c("character", "numeric"))
genome_stats_version_2 <- read.csv("/Users/bamflappy/PfrenderLab/multi_genome_project/evaluation/tree_RNA/version_2/BUSCO_v6.0.0/short_summary.specific.crustacea_odb12.genome.csv", colClasses = c("character", "numeric"))
genome_stats_add <- read.csv("/Users/bamflappy/PfrenderLab/multi_genome_project/evaluation/tree_RNA/additional/BUSCO_v6.0.0/short_summary.specific.crustacea_odb12.genome.csv", colClasses = c("character", "numeric"))

# read in BUSCO proteins stats csv
proteins_stats_batch_1 <- read.csv("/Users/bamflappy/PfrenderLab/multi_genome_project/evaluation/tree_RNA/batch_1/BUSCO_v6.0.0/short_summary.specific.crustacea_odb12.proteins.csv", colClasses = c("character", "numeric"))
proteins_stats_batch_2 <- read.csv("/Users/bamflappy/PfrenderLab/multi_genome_project/evaluation/tree_RNA/batch_2/BUSCO_v6.0.0/short_summary.specific.crustacea_odb12.proteins.csv", colClasses = c("character", "numeric"))
proteins_stats_version_2 <- read.csv("/Users/bamflappy/PfrenderLab/multi_genome_project/evaluation/tree_RNA/version_2/BUSCO_v6.0.0/short_summary.specific.crustacea_odb12.proteins.csv", colClasses = c("character", "numeric"))
proteins_stats_add <- read.csv("/Users/bamflappy/PfrenderLab/multi_genome_project/evaluation/tree_RNA/additional/BUSCO_v6.0.0/short_summary.specific.crustacea_odb12.proteins.csv", colClasses = c("character", "numeric"))

# read in AGAT BUSCO proteins stats csv
agat_stats_batch_1 <- read.csv("/Users/bamflappy/PfrenderLab/multi_genome_project/evaluation/tree_RNA/batch_1/AGAT_v1.4.2/BUSCO_v6.0.0/short_summary.specific.crustacea_odb12.proteins.csv", colClasses = c("character", "numeric"))
agat_stats_batch_2 <- read.csv("/Users/bamflappy/PfrenderLab/multi_genome_project/evaluation/tree_RNA/batch_2/AGAT_v1.4.2/BUSCO_v6.0.0/short_summary.specific.crustacea_odb12.proteins.csv", colClasses = c("character", "numeric"))
agat_stats_version_2 <- read.csv("/Users/bamflappy/PfrenderLab/multi_genome_project/evaluation/tree_RNA/version_2/AGAT_v1.4.2/BUSCO_v6.0.0/short_summary.specific.crustacea_odb12.proteins.csv", colClasses = c("character", "numeric"))
agat_stats_add <- read.csv("/Users/bamflappy/PfrenderLab/multi_genome_project/evaluation/tree_RNA/additional/AGAT_v1.4.2/BUSCO_v6.0.0/short_summary.specific.crustacea_odb12.proteins.csv", colClasses = c("character", "numeric"))

# add mrna batch column
mrna_stats_batch_1$batch <- "batch_1"
mrna_stats_batch_2$batch <- "batch_2"
mrna_stats_version_2$batch <- "version_2"
mrna_stats_add$batch <- "additional"

# add rna batch column
rna_stats_batch_1$batch <- "batch_1"
rna_stats_batch_2$batch <- "batch_2"
rna_stats_version_2$batch <- "version_2"
rna_stats_add$batch <- "additional"

# add lnc_rna batch column
lnc_rna_stats_batch_1$batch <- "batch_1"
lnc_rna_stats_batch_2$batch <- "batch_2"
lnc_rna_stats_version_2$batch <- "version_2"
lnc_rna_stats_add$batch <- "additional"

# combine data sets
mrna_stats <- rbind(mrna_stats_batch_1, mrna_stats_batch_2, mrna_stats_version_2, mrna_stats_add)
rna_stats <- rbind(rna_stats_batch_1, rna_stats_batch_2, rna_stats_version_2, rna_stats_add)
lnc_rna_stats <- rbind(lnc_rna_stats_batch_1, lnc_rna_stats_batch_2, lnc_rna_stats_version_2, lnc_rna_stats_add)

# set species order
species_order <- rev(c("D_pulicaria", "D_schodleri", "D_melanica_v2", "D_melanica", "D_pulex_KAP4", "D_pulex_BEL2", 
                   "D_arenata", "D_mitsukuri", "D_catawba", "D_retrocurva", "D_obtusa", "D_ambigua", "D_parvula",
                   "D_magniceps", "D_dentifera", "D_galeata_v2", "D_galeata", "D_mendotae", "D_mediterranea", 
                   "D_salina", "D_magna_LRVO", "D_magna_MLC", "D_similis", "D_carinata", "D_longicephala", 
                   "D_lumholtzi_v2", "D_lumholtzi", "D_arabica", "D_sinensis_WSL", "D_sinensis_CHINA", 
                   "Ceriodaphnia_sp_dubia_v2", "Ceriodaphnia_sp_dubia", "Simocephalus_vetulus", "Chydorus_sphaericus",
                   "Diaphanosoma_dubium", "Latona_sp", "Eulimnadia_texana", "Branchinecta_lindahli", 
                   "Branchinecta_lynchi", "Branchinecta_sandiegonensis", "Artemia_sinica", "Artemia_tibetiana"))

# set of gene counts
num_species <- length(unique(mrna_stats$species))
gene_counts_stats <- data.frame(
  species = c(unique(mrna_stats$species), unique(rna_stats$species), unique(lnc_rna_stats$species)), 
  stat = c(rep("mRNA", num_species), rep("RNA", num_species), rep("lncRNA", num_species)),
  number = c(mrna_stats[mrna_stats$stat == "Number_of_gene", "number"], rna_stats[rna_stats$stat == "Number_of_pseudogene", "number"], lnc_rna_stats[lnc_rna_stats$stat == "Number_of_gene", "number"])
)
gene_counts_comb <- data.frame(
  species = unique(mrna_stats$species), 
  mRNA = as.numeric(mrna_stats[mrna_stats$stat == "Number_of_gene", "number"]), 
  RNA = as.numeric(rna_stats[rna_stats$stat == "Number_of_pseudogene", "number"]), 
  lncRNA = as.numeric(lnc_rna_stats[lnc_rna_stats$stat == "Number_of_gene", "number"])
)
gene_counts <- data.frame(
  species = gene_counts_comb[, "species"],
  counts = rowSums(gene_counts_comb[, c("mRNA", "RNA", "lncRNA")])
)

# mrna subset 1 of Number_of_gene, Number_of_mrna, Number_of_cds, Number_of_exon
#mrna_stats_subset1 <- mrna_stats[mrna_stats$stat == "Number_of_gene" | mrna_stats$stat == "Number_of_mrna" | mrna_stats$stat == "Number_of_cds" | mrna_stats$stat == "Number_of_exon",]
mrna_stats_subset1 <- mrna_stats[mrna_stats$stat == "Number_of_gene" | mrna_stats$stat == "Number_of_mrna",]

# mrna subset 2 of Number_gene_overlapping, Number_of_single_exon_gene, Number_of_single_exon_mrna
mrna_stats_subset2 <- mrna_stats[mrna_stats$stat == "Number_gene_overlapping" | mrna_stats$stat == "Number_of_single_exon_gene" | mrna_stats$stat == "Number_of_single_exon_mrna",]

# rna subset 1 of Number_of_pseudogene, Number_of_rna, Number_of_exon
rna_stats_subset1 <- rna_stats[rna_stats$stat == "Number_of_pseudogene" | rna_stats$stat == "Number_of_rna" | rna_stats$stat == "Number_of_exon",]

# rna subset 2 of Number_pseudogene_overlapping, Number_of_single_exon_pseudogene, Number_of_single_exon_rna
rna_stats_subset2 <- rna_stats[rna_stats$stat == "Number_gene_overlapping" | rna_stats$stat == "Number_of_single_exon_gene" | rna_stats$stat == "Number_of_single_exon_rna",]

# lnc_rna subset 1 of Number_of_gene, Number_of_lnc_rna, Number_of_exon
lnc_rna_stats_subset1 <- lnc_rna_stats[lnc_rna_stats$stat == "Number_of_gene" | lnc_rna_stats$stat == "Number_of_lnc_rna" | lnc_rna_stats$stat == "Number_of_exon",]

# rna subset 2 of Number_gene_overlapping
lnc_rna_stats_subset2 <- lnc_rna_stats[lnc_rna_stats$stat == "Number_gene_overlapping",]

# dodged bar plot of stats for total gene counts
gene_counts_stats_plot <- ggplot(gene_counts_stats, aes(fill=stat, y=number, x=factor(species, species_order))) + 
  geom_bar(position="dodge", stat="identity") +
  coord_flip() +
  labs(x="Species", y="Number", fill = "Gene & Pseudogene Counts") +
  theme_bw() 
ggsave("gene_counts_stats.png", plot = gene_counts_stats_plot, device = "png", width = 12, height = 8, units = "in")

# bar plot of stats for total gene counts
gene_counts_plot <- ggplot(gene_counts, aes(y=counts, x=factor(species, species_order))) + 
  geom_col(fill = "#076fa2") +
  coord_flip() +
  labs(x="Species", y="Number") +
  theme_bw() 
ggsave("gene_counts.png", plot = gene_counts_plot, device = "png", width = 12, height = 8, units = "in")

# dodged bar plot of stats for mrna subset 1
mrna_stats_subset1_plot <- ggplot(mrna_stats_subset1, aes(fill=stat, y=number, x=factor(species, species_order))) + 
  geom_bar(position="dodge", stat="identity") +
  coord_flip() +
  labs(x="Species", y="Number", fill = "mRNA") +
  theme_bw() 
ggsave("mrna_stats_subset1.png", plot = mrna_stats_subset1_plot, device = "png", width = 12, height = 8, units = "in")

# dodged bar plot of stats for mrna subset 2
mrna_stats_subset2_plot <- ggplot(mrna_stats_subset2, aes(fill=stat, y=number, x=factor(species, species_order))) + 
  geom_bar(position="dodge", stat="identity") +
  coord_flip() +
  labs(x="Species", y="Number", fill = "mRNA") +
  theme_bw()
ggsave("mrna_stats_subset2.png", plot = mrna_stats_subset2_plot, device = "png", width = 12, height = 8, units = "in")

# dodged bar plot of stats for rna subset 1
rna_stats_subset1_plot <- ggplot(rna_stats_subset1, aes(fill=stat, y=number, x=factor(species, species_order))) + 
  geom_bar(position="dodge", stat="identity") +
  coord_flip() +
  labs(x="Species", y="Number", fill = "RNA") +
  theme_bw() 
ggsave("rna_stats_subset1.png", plot = rna_stats_subset1_plot, device = "png", width = 12, height = 8, units = "in")

# dodged bar plot of stats for rna subset 2
rna_stats_subset2_plot <- ggplot(rna_stats_subset2, aes(fill=stat, y=number, x=factor(species, species_order))) + 
  geom_bar(position="dodge", stat="identity") +
  coord_flip() +
  labs(x="Species", y="Number", fill = "RNA") +
  theme_bw()
ggsave("rna_stats_subset2.png", plot = rna_stats_subset2_plot, device = "png", width = 12, height = 8, units = "in")

# dodged bar plot of stats for lnc_rna subset 1
lnc_rna_stats_subset1_plot <- ggplot(lnc_rna_stats_subset1, aes(fill=stat, y=number, x=factor(species, species_order))) + 
  geom_bar(position="dodge", stat="identity") +
  coord_flip() +
  labs(x="Species", y="Number", fill = "lncRNA") +
  theme_bw() 
ggsave("lnc_rna_stats_subset1.png", plot = lnc_rna_stats_subset1_plot, device = "png", width = 12, height = 8, units = "in")

# dodged bar plot of stats for lnc_rna subset 2
lnc_rna_stats_subset2_plot <- ggplot(lnc_rna_stats_subset2, aes(fill=stat, y=number, x=factor(species, species_order))) + 
  geom_bar(position="dodge", stat="identity") +
  coord_flip() +
  labs(x="Species", y="Number", fill = "lncRNA") +
  theme_bw()
ggsave("lnc_rna_stats_subset2.png", plot = lnc_rna_stats_subset2_plot, device = "png", width = 12, height = 8, units = "in")
