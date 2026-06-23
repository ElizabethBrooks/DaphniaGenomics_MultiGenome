#!/bin/bash

# usage: bash generate_feature_stats.sh inputsFile
# usage ex: bash generate_feature_stats.sh /Users/bamflappy/Downloads/ncbi_dataset_CSIRO-1/ncbi_dataset/data/GCF_022539665.2/genomic.gff
# usage ex: bash generate_feature_stats.sh /Users/bamflappy/Downloads/ncbi_dataset_NIES/ncbi_dataset/data/GCF_020631705.1/genomic.gff
# usage ex: bash generate_feature_stats.sh /Users/bamflappy/Downloads/ncbi_dataset_Xinb3/ncbi_dataset/data/GCA_001632505.1/genomic.gff
# usage ex: bash generate_feature_stats.sh /Users/bamflappy/Downloads/ncbi_dataset_LRV0_1/ncbi_dataset/data/GCA_030254905.1/genomic.gff
# usage ex: bash generate_feature_stats.sh /Users/bamflappy/Downloads/ncbi_dataset_SK/ncbi_dataset/data/GCF_003990815.1/genomic.gff
# usage ex: bash generate_feature_stats.sh /Users/bamflappy/Downloads/ncbi_dataset_V1.0/ncbi_dataset/data/GCA_000187875.1/genomic.gff
# usage ex: bash generate_feature_stats.sh /Users/bamflappy/Downloads/ncbi_dataset_KAP4_gff/ncbi_dataset/data/GCF_021134715.1/genomic.gff
# usage ex: bash generate_feature_stats.sh /Users/bamflappy/Downloads/ncbi_dataset_SCF1_1A/ncbi_dataset/data/GCF_021234035.1/genomic.gff
# usage ex: bash generate_feature_stats.sh /Users/bamflappy/Downloads/ncbi_dataset_WSL/ncbi_dataset/data/GCA_013167095.2/genomic.gff
## EGAPx v0.2
# usage ex: bash generate_feature_stats.sh /Users/bamflappy/PfrenderLab/multi_genome_project/annotation_analysis/EGAPx_v0.2/SUCCEEDED/D_magna_NIES_SRA/accept.gff
# usage ex: bash generate_feature_stats.sh /Users/bamflappy/PfrenderLab/multi_genome_project/annotation_analysis/EGAPx_v0.2/SUCCEEDED/D_pulex_KAP4_SRA/accept.gff
# usage ex: bash generate_feature_stats.sh /Users/bamflappy/PfrenderLab/multi_genome_project/annotation_analysis/EGAPx_v0.2/SUCCEEDED/D_pulicaria_LK16_NCBI_trimmed/accept.gff
# usage ex: bash generate_feature_stats.sh /Users/bamflappy/PfrenderLab/multi_genome_project/annotation_analysis/EGAPx_v0.2/SUCCEEDED/D_pulicaria_LK16_SRA/accept.gff
# usage ex: bash generate_feature_stats.sh /Users/bamflappy/PfrenderLab/multi_genome_project/annotation_analysis/EGAPx_v0.2/SUCCEEDED/D_pulicaria_SC_F1_1A_NCBI_SRA/accept.gff
# usage ex: bash generate_feature_stats.sh /Users/bamflappy/PfrenderLab/multi_genome_project/annotation_analysis/EGAPx_v0.2/SUCCEEDED/D_pulex_KAP106_NCBI_SRA/accept.gff
# usage ex: bash generate_feature_stats.sh /Users/bamflappy/PfrenderLab/multi_genome_project/annotation_analysis/EGAPx_v0.2/SUCCEEDED/D_pulex_KAP106_SRA/accept.gff
# usage ex: bash generate_feature_stats.sh /Users/bamflappy/PfrenderLab/multi_genome_project/annotation_analysis/EGAPx_v0.2/KILLED/D_pulex_KAP106_NCB_SRA/accept.gff
# usage ex: bash generate_feature_stats.sh /Users/bamflappy/PfrenderLab/multi_genome_project/annotation_analysis/EGAPx_v0.2/SUCCEEDED/D_obtusa_FS6_NCBI_trimmed/accept.gff
# usage ex: bash generate_feature_stats.sh /Users/bamflappy/PfrenderLab/multi_genome_project/annotation_analysis/EGAPx_v0.1/D_pulex_KAP4_NCBI/accept.gff
# usage ex: bash generate_feature_stats.sh /Users/bamflappy/PfrenderLab/multi_genome_project/annotation_analysis/EGAPx_v0.1/D_pulicaria_LK16_NCBI/accept.gff
# usage ex: bash generate_feature_stats.sh /Users/bamflappy/PfrenderLab/multi_genome_project/annotation_analysis/EGAPx_v0.1/D_pulex_KAP106/accept.gff
# usage ex: bash generate_feature_stats.sh /Users/bamflappy/PfrenderLab/multi_genome_project/annotation_analysis/EGAPx_v0.2/SUCCEEDED/D_obtusa_FS6_ZQ_trimmed/accept.gff
# usage ex: bash generate_feature_stats.sh /Users/bamflappy/PfrenderLab/multi_genome_project/annotation_analysis/EGAPx_v0.2/ERROR/D_carinata_CSIRO_1_NCBI_SRA/accept.gff

# retrieve inputs file
inputsFile=$1

# status message
echo "Analyzing "$inputsFile

# output the unique list of features
echo "Features:"
cat $inputsFile | cut -f3 | grep -v "#" | sort -u

# generate stats
echo "Feature counts:"
echo -n "CDS, "
cat $inputsFile | cut -f3 | grep -c "CDS"
echo -n "exon, "
cat $inputsFile | cut -f3 | grep -c "exon"
echo -n "gene, "
cat $inputsFile | cut -f3 | grep -c "gene"
echo -n "mRNA, "
cat $inputsFile | cut -f3 | grep -c "mRNA"
echo -n "transcript, "
cat $inputsFile | cut -f3 | grep -c "transcript"
echo -n "D_loop, "
cat $inputsFile | cut -f3 | grep -c "D_loop"
echo -n "cDNA_match, "
cat $inputsFile | cut -f3 | grep -c "cDNA_match"
echo -n "lnc_RNA, "
cat $inputsFile | cut -f3 | grep -c "lnc_RNA"   
echo -n "ncRNA, "
cat $inputsFile | cut -f3 | grep -c "ncRNA"  
echo -n "pseudogene, "
cat $inputsFile | cut -f3 | grep -c "pseudogene"
echo -n "rRNA, "
cat $inputsFile | cut -f3 | grep -c "rRNA"    
echo -n "region, "  
cat $inputsFile | cut -f3 | grep -c "region"
echo -n "snRNA, "
cat $inputsFile | cut -f3 | grep -c "snRNA" 
echo -n "snoRNA, "
cat $inputsFile | cut -f3 | grep -c "snoRNA"
echo -n "tRNA, "
cat $inputsFile | cut -f3 | grep -c "tRNA" 
echo -n "sequence_feature, "
cat $inputsFile | cut -f3 | grep -c "sequence_feature" 
echo -n "intron, "
cat $inputsFile | cut -f3 | grep -c "intron" 
echo -n "start_codon, "
cat $inputsFile | cut -f3 | grep -c "start_codon" 
echo -n "stop_codon, "
cat $inputsFile | cut -f3 | grep -c "stop_codon" 

# status message
echo "Analysis complete!"
