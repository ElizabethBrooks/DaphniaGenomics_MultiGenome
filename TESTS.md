# EGAPx Tests


## EGAPx v0.2


### NCBI test set

#### qsub run_EGAPx_v0.2_HPC.sh inputs_KAP4_NCBI.txt
##### job 747604 
KILLED 
NOTE: Process `egapx:rnaseq_short_plane:star:run_star (180)` terminated with an error exit status (1) -- Execution is retried (1)

#### qsub run_EGAPx_v0.2_HPC.sh inputs_KAP106.txt
##### job 747606 
KILLED 
NOTE: Process `egapx:rnaseq_short_plane:star:run_star (174)` terminated with an error exit status (3) -- Execution is retried (1)

#### qsub run_EGAPx_v0.2_HPC.sh inputs_LK16_NCBI.txt
##### job 773689 
KILLED 
ERROR ~ Unable to re-submit task `egapx:rnaseq_short_plane:bam2asn:convert (376)`

#### qsub run_EGAPx_v0.2_HPC.sh inputs_SC_F0-13Bv2.txt
##### job 773695 
KILLED 
NOTE: Process `egapx:rnaseq_short_plane:fetch_sra_fasta:run_fetch_sra_fasta (85)` terminated with an error exit status (23) -- Execution is retried (1) 
ERROR ~ Unable to re-submit task `egapx:rnaseq_short_plane:fetch_sra_fasta:run_fetch_sra_fasta (85)`

#### qsub run_EGAPx_v0.2_HPC.sh inputs_NIES_NCBI.txt
##### job 773797 
KILLED 
NOTE: Process `egapx:rnaseq_short_plane:fetch_sra_fasta:run_fetch_sra_fasta (58)` terminated with an error exit status (23) -- Execution is retried (1)


### SRA test set

#### qsub run_EGAPx_v0.2_HPC.sh inputs_KAP4_SRA.txt
##### job 800519 
ERROR ~ Error executing process > 'egapx:rnaseq_short_plane:star:run_star (124)' 
Process `egapx:rnaseq_short_plane:star:run_star` input file name collision -- There are multiple input files for each of the following file names: SRR17282827_1.fasta
##### job 808160 
SUCCEEDED

#### qsub run_EGAPx_v0.2_HPC.sh inputs_KAP106_ZQ_SRA.txt
##### job 800520 
ERROR ~ Error executing process > 'egapx:rnaseq_short_plane:star:run_star (124)' 
Process `egapx:rnaseq_short_plane:star:run_star` input file name collision -- There are multiple input files for each of the following file names: SRR17282827_1.fasta
##### job 808161 
SUCCEEDED

#### qsub run_EGAPx_v0.2_HPC.sh inputs_LK16_SRA.txt
##### job 800521 
SUCCEEDED

#### qsub run_EGAPx_v0.2_HPC.sh inputs_NIES_SRA.txt
##### job 800522 
SUCCEEDED

#### qsub run_EGAPx_v0.2_HPC.sh inputs_SC_F1_1A_NCBI_SRA.txt
##### job 823853 
SUCCEEDED

#### qsub run_EGAPx_v0.2_HPC.sh inputs_KAP106_NCBI_SRA.txt
##### job 821229 
KILLED 
/scratch365/ebrooks5/multi_genome_project/EGAPx_v0.2/D_pulex_KAP106_NCBI_SRA/accept.gff

#### qsub run_EGAPx_v0.2_HPC.sh inputs_LK16_NCBI_trimmed.txt
##### job 821670 
SUCCEEDED

#### qsub run_EGAPx_v0.2_HPC.sh inputs_CSIRO_1_NCBI_SRA.txt
##### job 854120 
ERROR? -> gff was produced but statistics were not output
Waiting for file transfers to complete (1 files)
Completed at: 31-Oct-2024 18:18:21
Duration    : 13h 21s
CPU hours   : 43'391.9 (98.1% cached)
Succeeded   : 363
Cached      : 427

#### qsub run_EGAPx_v0.2_HPC.sh inputs_Xinb3_NCBI_SRA.txt
##### job 854121 
ERROR
EXITING because of FATAL ERROR in reads input: Lread of the pair = 856   while DEF_readSeqLengthMax=650
 Read Name=>SRR2671679.1952.2
 SOLUTION: increase DEF_readSeqLengthMax in IncludeDefine.h and re-compile STAR

#### qsub run_EGAPx_v0.2_HPC.sh inputs_LRV0_1_NCBI_SRA.txt
##### job 854182 
SUCCEEDED

#### qsub run_EGAPx_v0.2_HPC.sh inputs_SK_NCBI_SRA.txt
##### job 854669 
SUCCEEDED

#### qsub run_EGAPx_v0.2_HPC.sh inputs_FS6_NCBI_trimmed.txt
##### job 892539 
SUCCEEDED

#### qsub run_EGAPx_v0.2_HPC.sh inputs_FS6_ZQ_trimmed.txt 
inputs_D_obtusa_2_ZQ_trimmed.txt
##### job 892541 
ERROR 
typo in yaml file
##### job 915292 
SUCCEEDED


### ZQ & WW test sets

#### WW Isoseq file formatting
```
for i in /scratch365/ebrooks5/multi_genome_project/data/Daphnia_RNA_assembly/isoseq/*.fasta; do echo $i; newName=$(echo $i | sed "s/\.fasta/.fmt.fasta/g" | sed "s/Daphnia\_RNA\_assembly\/isoseq/Daphnia_RNA_assembly_formatted/g"); cat $i | cut -d"|" -f1 > $newName; done
```

#### qsub run_EGAPx_v0.2_HPC.sh test/EGAPx_v0.2/D_ambigua/inputs_D_ambigua_2_ZQ_WW.txt 
##### job 915611 -> the output directory was not tagged with "\_test"
formatted WW data 
no error, no output gff either 
##### job 925031

#### qsub run_EGAPx_v0.2_HPC.sh test/EGAPx_v0.2/D_ambigua/inputs_D_ambigua_2_ZQ_ZQ_WW.txt
##### job 925032

#### qsub run_EGAPx_v0.2_HPC.sh test/EGAPx_v0.2/D_obtusa/inputs_D_obtusa_2_ZQ_ZQ_trimmed.txt
##### job 925033

#### qsub run_EGAPx_v0.2_HPC.sh test/EGAPx_v0.2/D_obtusa/inputs_D_obtusa_2_ZQ_WW.txt
##### job 925041

#### qsub run_EGAPx_v0.2_HPC.sh test/EGAPx_v0.2/D_obtusa/inputs_D_obtusa_2_ZQ_ZQ_WW.txt
##### job 925034

#### qsub run_EGAPx_v0.2_HPC.sh test/EGAPx_v0.2/D_pulicaria/inputs_LK16_ZQ_ZQ_trimmed.txt
##### job 917384
ERROR ->   [ERRO] stat 18CRep6_TTAGGC_L002_R1.concat.fmt.fa: no such file or directory
##### job 925036


### KAP106 Isoseq test sets

#### Primary tests

#### qsub run_EGAPx_v0.2_HPC.sh test/EGAPx_v0.2/D_pulex/inputs_KAP106_ZQ_WW.txt
##### job 917382 
not formatted D obtusa WW data (oops)
##### job 925025

#### qsub run_EGAPx_v0.2_HPC.sh test/EGAPx_v0.2/D_pulex/inputs_KAP106_NCBI_WW.txt
##### job 925026

#### qsub run_EGAPx_v0.2_HPC.sh test/EGAPx_v0.2/D_pulex/inputs_KAP106_NCBI_SRA.txt
##### job 917475 -> non test data subset (oops)
RUNNING
##### job 925027

#### qsub run_EGAPx_v0.2_HPC.sh test/EGAPx_v0.2/D_pulex/inputs_KAP106_ZQ_SRA.txt
##### job 917476 -> non test data subset (oops)
RUNNING
##### job 925028

#### Protein tests

#### qsub run_EGAPx_v0.2_HPC.sh inputs_KAP106_ZQ_ZQ_SRA.txt
##### job 917381 -> full data set
RUNNING

#### qsub run_EGAPx_v0.2_HPC.sh test/EGAPx_v0.2/D_pulex/inputs_KAP106_ZQ_ZQ_WW.txt
##### job 917383 
ERROR
not formatted D obtusa WW data (oops) 
samtools sort: failed to read header from "wrkarea/STAR.1180121497024erNMJ5/D.pulex_KAP106_NMP_1.3.masked-D.obtusa_isoseq_coding/D.pulex_KAP106_NMP_1.3.masked-D.obtusa_isoseq_coding-Aligned.out.bam"
##### job 917396
not formatted WW data
ERROR?
Plus 10 more processes waiting for tasks…
##### job 925029

#### qsub run_EGAPx_v0.2_HPC.sh test/EGAPx_v0.2/D_pulex/inputs_KAP106_ZQ_ZQ_SRA.txt
##### job 917477 -> non test data subset (oops)
RUNNING
##### job 925030


## EGAPx v0.1

#### qsub run_EGAPx_HPC.sh inputs_KAP4_NCBI.txt
##### job 694733 
DONE 
ERROR ~ Error executing process > 'egapx:star:exec (111)'
Wallclock Time   = 10:23:29:22

#### qsub run_EGAPx_HPC.sh inputs_KAP106.txt
##### job 699252 
DONE 
ERROR ~ Error executing process > 'egapx:star:exec (107)'
Wallclock Time   = 8:15:36:18

#### qsub run_EGAPx_HPC.sh inputs_LK16_NCBI.txt
##### job 773663 
KILLED 
Error: (CSQLITE_Exception::eStmtStep) Error from sqlite3: [778] disk I/O error

#### qsub run_EGAPx_HPC.sh inputs_SC_F0-13Bv2.txt
##### job 773672 
DONE 
curl: (52) Empty reply from server
Wallclock Time   = 4:16:23:22
Process `egapx:fetch_sra_fasta:run_fetch_sra_fasta (69)` terminated with an error exit status (52)

#### qsub run_EGAPx_HPC.sh inputs_NIES_NCBI.txt
##### job 773796 
KILLED 
ERROR ~ Error executing process > 'egapx:run_get_hmm'
