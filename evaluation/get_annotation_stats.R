#!/usr/bin/env Rscript

# Capture trailing command line arguments
args <- commandArgs(trailingOnly = TRUE)

# script to get annotation mode data

# import libraries
library(txdbmaker)
library(GenomicRanges)
library(rtracklayer)
library(rstatix)

# create and set working directory
dir.create("/Users/bamflappy/PfrenderLab/multi_genome_project/evaluation_tree_species/annotation_stats")
setwd("/Users/bamflappy/PfrenderLab/multi_genome_project/evaluation_tree_species/annotation_stats")

# turn off scientific notation
options(scipen=999)

# gff file path
path_gff <- "/Users/bamflappy/PfrenderLab/multi_genome_project/evaluation_tree_species/introns_annotations/Artemia_franciscana_JAVRJZ01_NCBI_introns.gff"
#path_gff <- args[1]

# get species
species_name <- gsub("_introns.gff", "", basename(path_gff))

# read in gff
input_gff <- import(path_gff)

# load GFF file into a TxDb object
txdb <- txdbmaker::makeTxDbFromGFF(path_gff)

# number of protein_coding 'gene' features
prot_gene_number <- length(input_gff[input_gff$type == "gene" & input_gff$gene_biotype == "protein_coding"]) # matches AGAT

# number of protein_coding 'lncRNA' features
lnc_rna_gene_number <- length(input_gff[input_gff$type == "lncRNA" | input_gff$type == "lnc_RNA"]) # matches AGAT

# number of protein_coding 'rRNA' features
#r_rna_gene_number <- length(input_gff[input_gff$type == "rRNA"])

# number of protein_coding 'tRNA' features
#t_rna_gene_number <- length(input_gff[input_gff$type == "tRNA"])

# number of protein_coding 'miRNA' features
#mi_rna_gene_number <- length(input_gff[input_gff$type == "miRNA"])

# filter for protein_coding 'gene' features & calculate length (width)
#prot_gene_gr <- input_gff[input_gff$type == "gene" & input_gff$gene_biotype == "protein_coding"]
#prot_gene_lengths <- width(prot_gene_gr)
# calculate total of the protein_coding gene lengths <- matches AGAT
#prot_gene_sum <- sum(prot_gene_lengths)
# calculate the mean of the protein_coding gene lengths <- matches AGAT
#prot_gene_mean <- mean(prot_gene_lengths)
# calculate the mode of the protein_coding gene lengths
#prot_gene_mode <- get_mode(prot_gene_lengths)

# filter for 'exon' features & calculate length (width)
#exon_gr <- input_gff[input_gff$type == "exon"]
#exon_lengths <- width(reduce(exon_gr))
#exon_lengths <- width(exon_gr)
# calculate total of the gene lengths <- nearly matches AGAT
#exon_sum <- sum(exon_lengths)
# calculate the mean of the exon lengths <- nearly matches AGAT
#exon_mean <- mean(exon_lengths)
# calculate the mode of the exon lengths
#exon_mode <- get_mode(exon_lengths)

# filter for gene = CDS + intron features & calculate length (width)
#gene_gr <- input_gff[input_gff$type == "CDS" | (input_gff$type == "intron" & input_gff$gbkey == "mRNA")]
#gene_lengths <- width(gene_gr)
# calculate total of the gene lengths
#gene_sum <- sum(gene_lengths)
# calculate the mean of the gene lengths
#gene_mean <- mean(gene_lengths)
# calculate the mode of the gene lengths
#gene_mode <- get_mode(gene_lengths)

# filter for 'CDS' features & calculate length (width)
#cds_gr <- input_gff[input_gff$type == "CDS"]
#cds_lengths <- width(cds_gr)
# calculate total of the cds lengths <- matches AGAT
#cds_sum <- sum(cds_lengths)
# calculate the mean of the cds lengths <- matches AGAT "mean_cds_piece_length"
#cds_mean <- mean(cds_lengths)
# calculate the mode of the cds lengths
#cds_mode <- get_mode(cds_lengths)

# filter for 'lncRNA' features & calculate length (width)
lnc_RNA_gr <- input_gff[input_gff$type == "lncRNA" | input_gff$type == "lnc_RNA"]
lnc_RNA_lengths <- width(lnc_RNA_gr)
# calculate total of the lncRNA lengths <- matches AGAT
#lnc_RNA_sum <- sum(lnc_RNA_lengths)
# calculate the mean of the lncRNA lengths <- matches AGAT
lnc_RNA_mean <- mean(lnc_RNA_lengths)
# calculate the mode of the lncRNA lengths
lnc_RNA_mode <- get_mode(lnc_RNA_lengths)

# filter for 'five_prime_UTR' features & calculate length (width)
five_prime_UTR_gr <- input_gff[input_gff$type == "five_prime_UTR"]
five_prime_UTR_lengths <- width(five_prime_UTR_gr)
# calculate total of the five_prime_UTR lengths <- matches AGAT
#five_prime_UTR_sum <- sum(five_prime_UTR_lengths)
# calculate the mean of the five_prime_UTR lengths <- matches AGAT "mean_five_prime_utr_piece_length"
five_prime_UTR_mean <- mean(five_prime_UTR_lengths)
# calculate the mode of the five_prime_UTR lengths
five_prime_UTR_mode <- get_mode(five_prime_UTR_lengths)

# filter for 'three_prime_UTR' features & calculate length (width)
three_prime_UTR_gr <- input_gff[input_gff$type == "three_prime_UTR"]
three_prime_UTR_lengths <- width(three_prime_UTR_gr)
# calculate total of the three_prime_UTR lengths <- matches AGAT
#three_prime_UTR_sum <- sum(three_prime_UTR_lengths)
# calculate the mean of the three_prime_UTR lengths <- matches AGAT "mean_three_prime_utr_piece_length"
three_prime_UTR_mean <- mean(three_prime_UTR_lengths)
# calculate the mode of the three_prime_UTR lengths
three_prime_UTR_mode <- get_mode(three_prime_UTR_lengths)

# filter for 'intron' features & calculate length (width)
intron_gr <- input_gff[input_gff$type == "intron" & input_gff$gbkey == "mRNA"]
intron_lengths <- width(intron_gr)
# calculate total of the gene lengths <- matches AGAT "Total_intron_length" and "Total_intron_length_per_exon"
#intron_sum <- sum(intron_lengths)
# calculate the mean of the intron lengths <- matches AGAT "mean_intron_length" and "mean_intron_in_exon_length"
intron_mean <- mean(intron_lengths)
# calculate the mode of the intron lengths
intron_mode <- get_mode(intron_lengths)

# filter for 'intron' features & calculate length (width)
#intron_lnc_rna_gr <- input_gff[input_gff$type == "intron" & input_gff$gene_biotype == "lncRNA"]
#intron_lnc_rna_lengths <- width(intron_lnc_rna_gr)
# calculate total of the gene lengths
#intron_sum <- sum(intron_lnc_rna_lengths)
# calculate the mean of the intron lengths
#intron_mean <- mean(intron_lnc_rna_lengths)
# calculate the mode of the intron lengths
#intron_mode <- get_mode(intron_lnc_rna_lengths)

# extract introns (gaps between consecutive exons) grouped by transcript
#intron_list <- intronsByTranscript(txdb, use.names=TRUE)
# map transcript introns to their corresponding genes
#tx_to_gene <- transcripts(txdb, columns=c("tx_name", "gene_id"))
#tx_gene_map <- setNames(tx_to_gene$gene_id, tx_to_gene$tx_name)
# determine the number of introns per gene
#gene_intron_counts <- sapply(names(intron_list), function(tx) {
#  gene <- tx_gene_map[tx]
  # Return the number of introns for this transcript
#  length(intron_list[[tx]])
#})
# calculate the mean number of introns per gene
#introns_per_gene_mean <- mean(unlist(gene_intron_counts))
# calculate the mode number of introns per gene
#introns_per_gene_mode <- get_mode(unlist(gene_intron_counts))

# create stats summary
stats_list <- c("prot_gene_number", "lnc_rna_gene_number",
                   "gene_mean", "gene_mode",
                   "lnc_RNA_mean", "lnc_RNA_mode",
                   "five_prime_UTR_mean", "five_prime_UTR_mode",
                   "three_prime_UTR_mean", "three_prime_UTR_mode",
                   "intron_mean", "intron_mode")
stats_summary <- c(prot_gene_number, lnc_rna_gene_number,
                   gene_mean, gene_mode,
                   lnc_RNA_mean, lnc_RNA_mode,
                   five_prime_UTR_mean, five_prime_UTR_mode,
                   three_prime_UTR_mean, three_prime_UTR_mode,
                   intron_mean, intron_mode)
species <- rep(species_name, length(stats_list))
annot_stats <- cbind(species, stats_list, stats_summary)
# write stats summary to csv file
write.csv(annot_stats, paste0(species_name, "_annotations_stats.csv"), row.names = FALSE, quote = FALSE)
