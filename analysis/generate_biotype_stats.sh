#!/bin/bash

# usage: bash generate_biotype_stats.sh inputsFile
## NCBI EGAP
# usage ex: bash generate_biotype_stats.sh /Users/bamflappy/Downloads/ncbi_dataset_CSIRO-1/ncbi_dataset/data/GCF_022539665.2/genomic.gff
# usage ex: bash generate_biotype_stats.sh /Users/bamflappy/Downloads/ncbi_dataset_NIES/ncbi_dataset/data/GCF_020631705.1/genomic.gff
# usage ex: bash generate_biotype_stats.sh /Users/bamflappy/Downloads/ncbi_dataset_Xinb3/ncbi_dataset/data/GCA_001632505.1/genomic.gff
# usage ex: bash generate_biotype_stats.sh /Users/bamflappy/Downloads/ncbi_dataset_LRV0_1/ncbi_dataset/data/GCA_030254905.1/genomic.gff
# usage ex: bash generate_biotype_stats.sh /Users/bamflappy/Downloads/ncbi_dataset_SK/ncbi_dataset/data/GCF_003990815.1/genomic.gff
# usage ex: bash generate_biotype_stats.sh /Users/bamflappy/Downloads/ncbi_dataset_V1.0/ncbi_dataset/data/GCA_000187875.1/genomic.gff
# usage ex: bash generate_biotype_stats.sh /Users/bamflappy/Downloads/ncbi_dataset_KAP4_gff/ncbi_dataset/data/GCF_021134715.1/genomic.gff
# usage ex: bash generate_biotype_stats.sh /Users/bamflappy/Downloads/ncbi_dataset_SCF1_1A/ncbi_dataset/data/GCF_021234035.1/genomic.gff
# usage ex: bash generate_biotype_stats.sh /Users/bamflappy/Downloads/ncbi_dataset_WSL/ncbi_dataset/data/GCA_013167095.2/genomic.gff
## EGAPx v0.2
# usage ex: bash generate_biotype_stats.sh /Users/bamflappy/PfrenderLab/multi_genome_project/annotation_analysis/EGAPx_v0.2/SUCCEEDED/D_magna_NIES_SRA/accept.gff
# usage ex: bash generate_biotype_stats.sh /Users/bamflappy/PfrenderLab/multi_genome_project/annotation_analysis/EGAPx_v0.2/SUCCEEDED/D_pulex_KAP4_SRA/accept.gff
# usage ex: bash generate_biotype_stats.sh /Users/bamflappy/PfrenderLab/multi_genome_project/annotation_analysis/EGAPx_v0.2/SUCCEEDED/D_pulicaria_LK16_NCBI_trimmed/accept.gff
# usage ex: bash generate_biotype_stats.sh /Users/bamflappy/PfrenderLab/multi_genome_project/annotation_analysis/EGAPx_v0.2/SUCCEEDED/D_pulicaria_LK16_SRA/accept.gff
# usage ex: bash generate_biotype_stats.sh /Users/bamflappy/PfrenderLab/multi_genome_project/annotation_analysis/EGAPx_v0.2/SUCCEEDED/D_pulicaria_SC_F1_1A_NCBI_SRA/accept.gff
# usage ex: bash generate_biotype_stats.sh /Users/bamflappy/PfrenderLab/multi_genome_project/annotation_analysis/EGAPx_v0.2/SUCCEEDED/D_pulex_KAP106_NCBI_SRA/accept.gff
# usage ex: bash generate_biotype_stats.sh /Users/bamflappy/PfrenderLab/multi_genome_project/annotation_analysis/EGAPx_v0.2/SUCCEEDED/D_pulex_KAP106_SRA/accept.gff
# usage ex: bash generate_biotype_stats.sh /Users/bamflappy/PfrenderLab/multi_genome_project/annotation_analysis/EGAPx_v0.2/KILLED/D_pulex_KAP106_NCB_SRA/accept.gff
# usage ex: bash generate_biotype_stats.sh /Users/bamflappy/PfrenderLab/multi_genome_project/annotation_analysis/EGAPx_v0.2/SUCCEEDED/D_obtusa_FS6_NCBI_trimmed/accept.gff
# usage ex: bash generate_biotype_stats.sh /Users/bamflappy/PfrenderLab/multi_genome_project/annotation_analysis/EGAPx_v0.1/D_pulex_KAP4_NCBI/accept.gff
# usage ex: bash generate_biotype_stats.sh /Users/bamflappy/PfrenderLab/multi_genome_project/annotation_analysis/EGAPx_v0.1/D_pulicaria_LK16_NCBI/accept.gff
# usage ex: bash generate_biotype_stats.sh /Users/bamflappy/PfrenderLab/multi_genome_project/annotation_analysis/EGAPx_v0.2/SUCCEEDED/D_obtusa_FS6_ZQ_trimmed/accept.gff

# retrieve inputs file
inputsFile=$1

# status message
echo "Analyzing "$inputsFile

# output the unique list of features
echo "Biotypes:"
cat $inputsFile | grep "biotype=" | sed "s/^.*biotype=//g" | sed "s/;.*$//g" | sort -u

# generate stats
echo "Biotype counts:"
echo -n "protein_coding, "
cat $inputsFile | grep -c "biotype=protein_coding"
echo -n "lncRNA, "
cat $inputsFile | grep -c "biotype=lncRNA"
echo -n "ncRNA, "
cat $inputsFile | grep -c "biotype=ncRNA"
echo -n "pseudogene, "
cat $inputsFile | grep -c "biotype=pseudogene"
echo -n "rRNA, "
cat $inputsFile | grep -c "biotype=rRNA"
echo -n "snRNA, "
cat $inputsFile | grep -c "biotype=snRNA"
echo -n "snoRNA, "
cat $inputsFile | grep -c "biotype=snoRNA"
echo -n "tRNA, "
cat $inputsFile | grep -c "biotype=tRNA"
echo -n "guide_RNA, "
cat $inputsFile | grep -c "biotype=guide_RNA"
echo -n "transcribed_pseudogene, "
cat $inputsFile | grep -c "biotype=transcribed_pseudogene"
echo -n "misc_RNA, "
cat $inputsFile | grep -c "biotype=misc_RNA"

# status message
echo "Analysis complete!"
