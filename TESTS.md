# EGAPx Tests

## EGAPx v0.4

#### qsub run_EGAPx_v0.4_HPC.sh EGAPx_v0.4/D_ambigua/inputs_3_WW_ZQ.txt
##### job 

#### qsub run_EGAPx_v0.4_HPC.sh EGAPx_v0.4/D_arenata/inputs_2_WW_ZQ.txt
##### job 

#### qsub run_EGAPx_v0.4_HPC.sh EGAPx_v0.4/D_catawba/inputs_3_WW_ZQ.txt
##### job 

#### qsub run_EGAPx_v0.4_HPC.sh EGAPx_v0.4/D_dentifera/inputs_3_WW_ZQ.txt
##### job 

#### qsub run_EGAPx_v0.4_HPC.sh EGAPx_v0.4/D_lumholtzi/inputs_2_WW_ZQ.txt
##### job

#### qsub run_EGAPx_v0.4_HPC.sh EGAPx_v0.4/D_lumholtzi/inputs_2_WW_ZQ_clean.txt
##### job

#### qsub run_EGAPx_v0.3.2_HPC.sh EGAPx_v0.3.2/D_obtusa/inputs_v2_WW_ZQ.txt
##### job


## EGAPx v0.3.2

## WW (assembly & RNA), ZQ (proteins), & NCBI (as needed) tests
Adding proteins appears to slightly shift the number of each identfied features.

#### qsub run_EGAPx_v0.3.2_HPC.sh EGAPx_v0.3.2/D_galeata/inputs_M5_WW_NCBI.txt
##### job 1096980
ABORTED?
#### qsub run_EGAPx_v0.3.2_HPC.sh EGAPx_v0.3.2/D_galeata/inputs_M5_WW_NCBI.txt
##### job 1098766
ABORTED?
## May need to email Matild, let Mike know what Wen says
#### qsub run_EGAPx_v0.3.2_HPC.sh EGAPx_v0.3.2/D_galeata/inputs_M5_WW_NCBI.txt
##### job 1122038
ABORTED?
-> no data
#### qsub run_EGAPx_v0.3.2_HPC.sh EGAPx_v0.3.2/D_galeata/inputs_M5_WW_NCBI.txt
##### job 1131689
FAILED
-> Feb-03 13:47:47.585 [TaskFinalizer-6] ERROR nextflow.processor.TaskProcessor - Error executing process > 'egapx:rnaseq_short_plane:fetch_sra_fasta:run_fetch_sra_fasta (1)'
Accidentally used WGA and WGS SRA data.
#### qsub run_EGAPx_v0.3.2_HPC.sh EGAPx_v0.3.2/D_galeata/inputs_M5_WW_ENA.txt
##### job 1170983
ABORTED
Exit Status      = -1
failed before writing exit_status because:
shepherd exited with exit status 19: before writing exit_status
#### qsub run_EGAPx_v0.3.2_HPC.sh EGAPx_v0.3.2/D_galeata/inputs_M5_WW_ENA.txt
##### job 1173604
ABORTED
#### qsub run_EGAPx_v0.3.2_HPC.sh EGAPx_v0.3.2/D_galeata/inputs_M5_WW_ENA.txt
##### job 1177025
ABORTED
#### qsub run_EGAPx_v0.3.2_HPC.sh EGAPx_v0.3.2/D_galeata/inputs_M5_ZQ_ENA_all.txt
##### job 1178865
ABORTED
#### qsub run_EGAPx_v0.3.2_HPC.sh EGAPx_v0.3.2/D_galeata/inputs_M5_ZQ_ENA_all.txt
##### job 1215729
ABORTED

#### qsub run_EGAPx_v0.3.2_HPC.sh EGAPx_v0.3.2/D_galeata/inputs_M5_WW_ERP112242.txt
##### job 1173587
ABORTED
#### qsub run_EGAPx_v0.3.2_HPC.sh EGAPx_v0.3.2/D_galeata/inputs_M5_WW_ERP112242.txt
##### job 1177024
ABORTED
#### qsub run_EGAPx_v0.3.2_HPC.sh EGAPx_v0.3.2/D_galeata/inputs_M5_ZQ_ENA.txt
##### job 1178863
ABORTED
#### qsub run_EGAPx_v0.3.2_HPC.sh EGAPx_v0.3.2/D_galeata/inputs_M5_ZQ_ENA.txt
##### job 1215730
ABORTED
#### qsub run_EGAPx_v0.3.2_HPC.sh EGAPx_v0.3.2/D_galeata/inputs_M5_ZQ_ENA.txt
##### job 1289018
ABORTED

#### qsub run_EGAPx_v0.3.2_HPC.sh EGAPx_v0.3.2/D_sinensis/inputs_CHINA_ZQ_NCBI.txt
##### job 1096999
FAILED
-> Process `egapx:gnomon_plane:chainer:run_chainer` input file name collision -- There are multiple input files for each of the following file names: indexed/D.sinensis_CHINA.masked.asn
Moved files to the scratch space
Updated SRA IDs
#### qsub run_EGAPx_v0.3.2_HPC.sh EGAPx_v0.3.2/D_sinensis/inputs_CHINA_ZQ_NCBI.txt
##### job 1157321
FAILED
-> Process `egapx:gnomon_plane:chainer:run_chainer` input file name collision -- There are multiple input files for each of the following file names: indexed/D.sinensis_CHINA.masked.asn
-> Feb-11 02:32:35.114 [Actor Thread 14] ERROR nextflow.processor.TaskProcessor - Error executing process > 'egapx:gnomon_plane:chainer:run_chainer (2)'
https://github.com/ncbi/egapx/issues/45
#### qsub run_EGAPx_v0.3.2_HPC.sh EGAPx_v0.3.2/D_sinensis/inputs_CHINA_ZQ_NCBI.txt
##### job 1172600
COMPLETED
CDS          194608
exon         236714
gene         19217
lnc_RNA      4379
mRNA         24279
pseudogene   1086
transcript   270

#### qsub run_EGAPx_v0.3.2_HPC.sh EGAPx_v0.3.2/D_sinensis/inputs_WSL_NCBI.txt
##### job 1101912
FAILED
-> WARN: Can't update history file: .nextflow/history
Ran out of space on franklin.
#### qsub resume_EGAPx_v0.3.2_HPC.sh EGAPx_v0.3.2/D_sinensis/inputs_WSL_NCBI.txt
##### job 1110363
ABORTED?
#### qsub run_EGAPx_v0.3.2_HPC.sh EGAPx_v0.3.2/D_sinensis/inputs_WSL_NCBI.txt
##### job 1122029
FAILED
-> Feb-02 06:51:49.718 [TaskFinalizer-4] ERROR nextflow.processor.TaskProcessor - Error executing process > 'egapx:annot_proc_plane:gnomon_biotype:run_gnomon_biotype'
#### qsub run_EGAPx_v0.3.2_HPC.sh EGAPx_v0.3.2/D_sinensis/inputs_WSL_NCBI.txt
##### job 1131690
FAILED
-> Feb-03 16:39:10.872 [TaskFinalizer-3] ERROR nextflow.processor.TaskProcessor - Error executing process > 'egapx:annot_proc_plane:gnomon_biotype:run_gnomon_biotype'
#### qsub run_EGAPx_v0.3.2_HPC.sh EGAPx_v0.3.2/D_sinensis/inputs_WSL_NCBI_clean.txt
##### job 1170072
COMPLETED
CDS          198192
exon         252983
gene         20335
lnc_RNA      5286
mRNA         25902
pseudogene   1524
transcript   158

#### qsub run_EGAPx_v0.3.2_HPC.sh EGAPx_v0.3.2/D_lumholtzi/inputs_2_WW_ZQ.txt
##### job 1098987
FAILED
-> Jan-23 10:33:36.407 [TaskFinalizer-2] ERROR nextflow.processor.TaskProcessor - Error executing process > 'egapx:annot_proc_plane:gnomon_biotype:run_gnomon_biotype'
#### qsub run_EGAPx_v0.3.2_HPC.sh EGAPx_v0.3.2/D_lumholtzi/inputs_2_WW_ZQ.txt
##### job 1102383
FAILED
-> Jan-24 23:57:35.405 [TaskFinalizer-10] ERROR nextflow.processor.TaskProcessor - Error executing process > 'egapx:annot_proc_plane:gnomon_biotype:run_gnomon_biotype'
Ask if this is the same genometpe of Lumholtzi? We can make RNA data
#### qsub run_EGAPx_v0.3.2_HPC.sh EGAPx_v0.3.2/D_lumholtzi/inputs_2_WW_ZQ_clean.txt
##### job 1170995
COMPLETED
CDS          199618
exon         253862
gene         17754
lnc_RNA      5690
mRNA         23766
pseudogene   728
transcript   309

#### qsub run_EGAPx_v0.3.2_HPC.sh EGAPx_v0.3.2/S_vetulus/inputs_WW_ZQ.txt
##### job 1094873
FAILED
-> miniprot: align.c:195: mp_extra_cal: Assertion `al == r->qe - r->qs' failed.
#### qsub resume_EGAPx_v0.3.2_HPC.sh EGAPx_v0.3.2/S_vetulus/inputs_WW_ZQ.txt
##### job 1096506
FAILED
-> miniprot: align.c:195: mp_extra_cal: Assertion \`al == r->qe - r->qs' failed.
-> Process \`egapx:target_proteins_plane:miniprot:run_miniprot (1)` terminated with an error exit status (134)
#### qsub run_EGAPx_v0.3.2_HPC.sh EGAPx_v0.3.2/S_vetulus/inputs_WW_ZQ.txt
changed genome assembly to ZQs from WWs
##### job 1097215
FAILED
-> miniprot: align.c:195: mp_extra_cal: Assertion `al == r->qe - r->qs' failed.
  .command.sh: line 3:    44 Aborted                 (core dumped) miniprot -t 31 -G 300000 -p 0.4 --outs=0.4 simocephalus_vetulus.masked.fasta 1.prots.faa > output/1.prots.paf
-> Jan-22 09:17:23.672 [TaskFinalizer-3] ERROR nextflow.processor.TaskProcessor - Error executing process > 'egapx:target_proteins_plane:miniprot:run_miniprot (1)'
#### qsub resume_EGAPx_v0.3.2_HPC.sh EGAPx_v0.3.2/S_vetulus/inputs_WW_ZQ.txt
##### job 1102408
FAILED
-> Jan-24 23:42:54.306 [TaskFinalizer-9] ERROR nextflow.processor.TaskProcessor - Error executing process > 'egapx:target_proteins_plane:miniprot:run_miniprot (1)'
#### qsub run_EGAPx_v0.3.2_HPC.sh EGAPx_v0.3.2/S_vetulus/inputs_WW_ZQ.txt
##### job 1141847
FAILED
-> Feb-04 12:16:29.868 [TaskFinalizer-2] ERROR nextflow.processor.TaskProcessor - Error executing process > 'egapx:target_proteins_plane:miniprot:run_miniprot (1)'
#### qsub run_EGAPx_v0.3.2_HPC.sh EGAPx_v0.3.2/S_vetulus/inputs_WW_ZQ.txt
##### job 1142592
FAILED
-> Feb-05 00:52:17.907 [TaskFinalizer-2] ERROR nextflow.processor.TaskProcessor - Error executing process > 'egapx:target_proteins_plane:miniprot:run_miniprot (1)'
#### qsub run_EGAPx_v0.3.2_HPC.sh EGAPx_v0.3.2/S_vetulus/inputs_WW_ZQ_clean_run1.txt
##### job 1170186
COMPLETED
CDS          210903
exon         252679
gene         22700
lnc_RNA      2812
mRNA         27437
pseudogene   4119
transcript   99
#### qsub run_EGAPx_v0.3.2_HPC.sh EGAPx_v0.3.2/S_vetulus/inputs_WW_ZQ_clean.txt
##### job 1171066
COMPLETED
CDS          212039
exon         252911
gene         22697
lnc_RNA      2812
mRNA         27434
pseudogene   4137
transcript   99

#### qsub run_EGAPx_v0.3.2_HPC.sh EGAPx_v0.3.2/D_magna/inputs_NIES_NCBI.txt
##### job 1095598
FAILED
-> WARN: Can't update history file: .nextflow/history
#### qsub run_EGAPx_v0.3.2_HPC.sh EGAPx_v0.3.2/D_magna/inputs_NIES_ZQ_NCBI.txt
Changed assembly to ZQ's from NCBI's (to match protein data)
##### job 1098949
FAILED
-> WARN: Can't update history file: .nextflow/history
Ran out of space on franklin.
#### qsub resume_EGAPx_v0.3.2_HPC.sh EGAPx_v0.3.2/D_magna/inputs_NIES_ZQ_NCBI.txt
##### job 1110362
ABORTED?
-> no data
#### qsub run_EGAPx_v0.3.2_HPC.sh EGAPx_v0.3.2/D_magna/inputs_NIES_ZQ_NCBI.txt
##### job 1131687
COMPLETED
CDS          208033
exon         271818
gene         25878
lnc_RNA      8606
mRNA         28421
pseudogene   3062
transcript   1022
#### qsub run_EGAPx_v0.3.2_HPC.sh EGAPx_v0.3.2/D_magna/inputs_NIES_ZQ_SRA.txt
##### job 1141864
COMPLETED
CDS          186937
exon         219015
gene         21108
lnc_RNA      2282
mRNA         24886
pseudogene   3036
transcript   226

#### qsub run_EGAPx_v0.3.2_HPC.sh EGAPx_v0.3.2/D_pulex/inputs_KAP4_NCBI.txt
##### job 1095613
FAILED
-> Jan-24 12:52:59.047 [TaskFinalizer-7] ERROR nextflow.processor.TaskProcessor - Error executing process > 'egapx:rnaseq_short_plane:star:run_star (8)'
#### qsub run_EGAPx_v0.3.2_HPC.sh EGAPx_v0.3.2/D_pulex/inputs_KAP4_NCBI.txt
Removed isoseq data
##### job 1102382
Aborted?
#### qsub run_EGAPx_v0.3.2_HPC.sh EGAPx_v0.3.2/D_pulex/inputs_KAP4_NCBI.txt
##### job 1122030
FAILED
-> Feb-11 19:12:54.425 [TaskFinalizer-6] ERROR nextflow.processor.TaskProcessor - Error executing process > 'egapx:rnaseq_short_plane:star:run_star (7)'
#### qsub run_EGAPx_v0.3.2_HPC.sh EGAPx_v0.3.2/D_pulex/inputs_KAP4_SRA.txt
##### job 1141859
COMPLETED
CDS          210878
exon         246608
gene         19542
lnc_RNA      3665
mRNA         25109
pseudogene   1095
transcript   79

#### qsub run_EGAPx_v0.3.2_HPC.sh EGAPx_v0.3.2/D_ambigua/inputs_3_WW_ZQ.txt
##### job 1094828
COMPLETED
CDS          187948
exon         216516
gene         17076
lnc_RNA      3406
mRNA         22188
pseudogene   376
transcript   101

#### qsub run_EGAPx_v0.3.2_HPC.sh EGAPx_v0.3.2/D_arenata/inputs_2_WW_ZQ.txt
##### job 1094830
COMPLETED
CDS          229038
exon         296364
gene         24682
lnc_RNA      5393
mRNA         31517
pseudogene   2425
transcript   319

#### qsub run_EGAPx_v0.3.2_HPC.sh EGAPx_v0.3.2/D_catawba/inputs_3_WW_ZQ.txt
##### job 1094831
COMPLETED
CDS          220412
exon         272830
gene         21684
lnc_RNA      4461
mRNA         28413
pseudogene   1568
transcript   205

#### qsub run_EGAPx_v0.3.2_HPC.sh EGAPx_v0.3.2/D_dentifera/inputs_3_WW_ZQ.txt
##### job 1094832
COMPLETED
CDS          213283
exon         248589
gene         21911
lnc_RNA      2823
mRNA         28383
pseudogene   1647
transcript   137

#### qsub run_EGAPx_v0.3.2_HPC.sh EGAPx_v0.3.2/D_magniceps/inputs_WW_ZQ.txt
##### job 1094833
COMPLETED
CDS          187933
exon         208363
gene         18394
lnc_RNA      2077
mRNA         23774
pseudogene   912
transcript   91

#### qsub run_EGAPx_v0.3.2_HPC.sh EGAPx_v0.3.2/D_obtusa/inputs_v2_WW_ZQ.txt
##### job 1094864
COMPLETED
CDS          195959
exon         242263
gene         22247
lnc_RNA      5314
mRNA         25837
pseudogene   1406
transcript   157

#### qsub run_EGAPx_v0.3.2_HPC.sh EGAPx_v0.3.2/D_parvula/inputs_2_WW_ZQ.txt
##### job 1094865
COMPLETED
CDS          189952
exon         221529
gene         17279
lnc_RNA      3731
mRNA         22520
pseudogene   558
transcript   131

#### qsub run_EGAPx_v0.3.2_HPC.sh EGAPx_v0.3.2/D_pulex/inputs_BEL2_WW_ZQ.txt
##### job 1094866
COMPLETED
CDS          201889
exon         260010
gene         20423
lnc_RNA      5130
mRNA         26170
pseudogene   983
transcript   241

#### qsub run_EGAPx_v0.3.2_HPC.sh EGAPx_v0.3.2/D_pulex/inputs_KAP106_NMP_1.3_WW_ZQ.txt
##### job 1095750
COMPLETED
CDS          186251
exon         213738
gene         21352
lnc_RNA      3473
mRNA         24472
pseudogene   1157
transcript   75

#### qsub run_EGAPx_v0.3.2_HPC.sh EGAPx_v0.3.2/D_pulex/inputs_PA42_5_WW_ZQ.txt
##### job 1094870
COMPLETED
CDS          200294
exon         243798
gene         23069
lnc_RNA      3643
mRNA         27379
pseudogene   3598
transcript   115

#### qsub run_EGAPx_v0.3.2_HPC.sh EGAPx_v0.3.2/D_pulex/inputs_STM2_asex_1.3_WW_ZQ.txt
##### job 1094871
COMPLETED
CDS          192209
exon         223374
gene         21803
lnc_RNA      3635
mRNA         25481
pseudogene   983
transcript   114

#### qsub run_EGAPx_v0.3.2_HPC.sh EGAPx_v0.3.2/D_mitsukuri/inputs_1_SZH4_WW_ZQ.txt
##### job 1094874
COMPLETED
CDS          201206
exon         267696
gene         21262
lnc_RNA      5410
mRNA         26812
pseudogene   1239
transcript   336

#### qsub run_EGAPx_v0.3.2_HPC.sh EGAPx_v0.3.2/D_pulicaria/inputs_LK16_MP_ZQ.txt
##### job 1095751
COMPLETED
CDS          210286
exon         261532
gene         26387
lnc_RNA      5769
mRNA         30051
pseudogene   2404
transcript   384

#### qsub run_EGAPx_v0.3.2_HPC.sh EGAPx_v0.3.2/D_pulex/inputs_CON21_WW_ZQ.txt
##### job 1098982
COMPLETED
CDS          131932
exon         146949
gene         22147
lnc_RNA      2670
mRNA         21099
pseudogene   1575
transcript   71


## WW tests (only assembly and RNA data, no proteins)

#### qsub run_EGAPx_v0.3.2_HPC.sh EGAPx_v0.3.2/D_magna/inputs_NIES_ZQ_SRA_noAA.txt
##### job 1204190
COMPLETED
CDS          162879
exon         193221
gene         16950
lnc_RNA      3567
mRNA         20146
pseudogene   944
transcript   61

#### qsub run_EGAPx_v0.3.2_HPC.sh EGAPx_v0.3.2/D_pulex/inputs_CON21_WW_ZQ_noAA.txt
##### job 1204191
COMPLETED
CDS          114720
exon         131683
gene         17040
lnc_RNA      2594
mRNA         16004
pseudogene   1664
transcript   19

#### qsub run_EGAPx_v0.3.2_HPC.sh EGAPx_v0.3.2/D_pulex/inputs_KAP4_SRA_noAA.txt
##### job 1204192
COMPLETED
CDS          188816
exon         222983
gene         19198
lnc_RNA      3678
mRNA         23485
pseudogene   886
transcript   80

#### qsub run_EGAPx_v0.3.2_HPC.sh EGAPx_v0.3.2/D_pulicaria/inputs_LK16_MP_ZQ_noAA.txt
##### job 1204193
COMPLETED
CDS          190365
exon         248853
gene         21806
lnc_RNA      6845
mRNA         25263
pseudogene   1603
transcript   241

#### qsub run_EGAPx_v0.3.2_HPC.sh EGAPx_v0.3.2/D_sinensis/inputs_CHINA_ZQ_NCBI_noAA.txt
##### job 1172603
COMPLETED
CDS          185634
exon         238058
gene         17806
lnc_RNA      5207
mRNA         23027
pseudogene   397
transcript   144

#### qsub run_EGAPx_v0.3.2_HPC.sh EGAPx_v0.3.2/D_sinensis/inputs_WSL_NCBI_noAA.txt
##### job 1142475
FAILED
-> Feb-04 17:20:36.433 [TaskFinalizer-1] ERROR nextflow.processor.TaskProcessor - Error executing process > 'egapx:annot_proc_plane:gnomon_biotype:run_gnomon_biotype'
#### qsub run_EGAPx_v0.3.2_HPC.sh EGAPx_v0.3.2/D_sinensis/inputs_WSL_NCBI_clean_noAA.txt
##### job 1170066
COMPLETED
CDS          189785
exon         242796
gene         18464
lnc_RNA      5501
mRNA         23561
pseudogene   439
transcript   122

#### qsub run_EGAPx_v0.3.2_HPC.sh test/EGAPx_v0.3.2/D_ambigua/inputs_3_WW.txt
##### job 1071029
COMPLETED

#### qsub run_EGAPx_v0.3.2_HPC.sh test/EGAPx_v0.3.2/D_arenata/inputs_2_WW.txt
##### job 1075892
COMPLETED

#### qsub run_EGAPx_v0.3.2_HPC.sh test/EGAPx_v0.3.2/D_catawba/inputs_3_WW.txt
##### job 1075893
COMPLETED

#### qsub run_EGAPx_v0.3.2_HPC.sh test/EGAPx_v0.3.2/D_dentifera/inputs_3_WW.txt
##### job 1075894
COMPLETED

#### qsub run_EGAPx_v0.3.2_HPC.sh test/EGAPx_v0.3.2/D_magniceps/inputs_WW.txt
##### job 1071026
COMPLETED

#### qsub run_EGAPx_v0.3.2_HPC.sh test/EGAPx_v0.3.2/D_obtusa/inputs_v2_WW.txt
##### job 1071027
COMPLETED

#### qsub run_EGAPx_v0.3.2_HPC.sh test/EGAPx_v0.3.2/D_parvula/inputs_2_WW.txt
##### job 1071025
COMPLETED

#### qsub run_EGAPx_v0.3.2_HPC.sh test/EGAPx_v0.3.2/D_pulex/inputs_BEL2_WW.txt
##### job 1075895
COMPLETED

#### qsub run_EGAPx_v0.3.2_HPC.sh test/EGAPx_v0.3.2/D_pulex/inputs_KAP106_NMP_1.3_WW.txt
##### job 1070991
FAILED
#### qsub resume_EGAPx_v0.3.2_HPC.sh test/EGAPx_v0.3.2/D_pulex/inputs_KAP106_NMP_1.3_WW.txt
##### job 1081931
COMPLETED

#### qsub run_EGAPx_v0.3.2_HPC.sh test/EGAPx_v0.3.2/D_pulex/inputs_PA42_5_WW.txt
##### job 1070992
FAILED
#### qsub resume_EGAPx_v0.3.2_HPC.sh test/EGAPx_v0.3.2/D_pulex/inputs_PA42_5_WW.txt
##### job 1081943
COMPLETED

#### qsub run_EGAPx_v0.3.2_HPC.sh test/EGAPx_v0.3.2/D_pulex/inputs_STM2_asex_1.3_WW.txt
##### job 1070993
FAILED
#### qsub resume_EGAPx_v0.3.2_HPC.sh test/EGAPx_v0.3.2/D_pulex/inputs_STM2_asex_1.3_WW.txt
##### job 1081962
COMPLETED

#### qsub run_EGAPx_v0.3.2_HPC.sh test/EGAPx_v0.3.2/S_vetulus/inputs_WW.txt
##### job 1071024
COMPLETED

#### qsub run_EGAPx_v0.3.2_HPC.sh test/EGAPx_v0.3.2/D_mitsukuri/inputs_1_SZH4_WW.txt
##### job 1082971
COMPLETED

#### qsub run_EGAPx_v0.3.2_HPC.sh EGAPx_v0.3.2/D_lumholtzi/inputs_2_WW_ZQ.txt
##### job 1099851
FAILED
-> Jan-23 23:12:03.260 [TaskFinalizer-10] ERROR nextflow.processor.TaskProcessor - Error executing process > 'egapx:annot_proc_plane:gnomon_biotype:run_gnomon_biotype'
#### qsub resume_EGAPx_v0.3.2_HPC.sh EGAPx_v0.3.2/D_lumholtzi/inputs_2_WW_ZQ.txt
##### job 1101901
FAILED
-> Jan-24 09:42:31.315 [TaskFinalizer-10] ERROR nextflow.processor.TaskProcessor - Error executing process > 'egapx:annot_proc_plane:gnomon_biotype:run_gnomon_biotype'
#### qsub run_EGAPx_v0.3.2_HPC.sh EGAPx_v0.3.2/D_lumholtzi/inputs_2_WW_ZQ_clean_noAA.txt
##### job 1170992
COMPLETED 
CDS          199258
exon         265754
gene         16622
lnc_RNA      6121
mRNA         23717
pseudogene   211
transcript   246

#### qsub run_EGAPx_v0.3.2_HPC.sh EGAPx_v0.3.2/D_galeata/inputs_M5_WW.txt
##### job 1102412
ABORTED
#### qsub run_EGAPx_v0.3.2_HPC.sh EGAPx_v0.3.2/D_galeata/inputs_M5_WW_ENA_noAA.txt
##### job 1170985
ABORTED
Exit Status      = -1
failed before writing exit_status because:
shepherd exited with exit status 19: before writing exit_status
#### qsub run_EGAPx_v0.3.2_HPC.sh EGAPx_v0.3.2/D_galeata/inputs_M5_WW_ENA_noAA.txt
##### job 1173610
COMPLETED
CDS          209242
exon         267131
gene         21052
lnc_RNA      7309
mRNA         26759
pseudogene   964
transcript   352
#### qsub run_EGAPx_v0.3.2_HPC.sh EGAPx_v0.3.2/D_galeata/inputs_M5_ZQ_ENA_all_noAA.txt
##### job 1178867
ABORTED
#### qsub run_EGAPx_v0.3.2_HPC.sh EGAPx_v0.3.2/D_galeata/inputs_M5_ZQ_ENA_all_noAA.txt
##### job 1215731
ABORTED

#### qsub run_EGAPx_v0.3.2_HPC.sh EGAPx_v0.3.2/D_galeata/inputs_M5_WW_ERP112242_noAA.txt
##### job 1177022
ABORTED
#### qsub run_EGAPx_v0.3.2_HPC.sh EGAPx_v0.3.2/D_galeata/inputs_M5_WW_ERP112242_noAA.txt
##### job 1178655
COMPLETED
CDS          183627
exon         224694
gene         19066
lnc_RNA      5158
mRNA         23159
pseudogene   1019
transcript   152
#### qsub run_EGAPx_v0.3.2_HPC.sh EGAPx_v0.3.2/D_galeata/inputs_M5_ZQ_ENA_noAA.txt
##### job 1178868
COMPLETED
CDS          184204
exon         225482
gene         19082
lnc_RNA      5163
mRNA         23210
pseudogene   1015
transcript   162
#### qsub run_EGAPx_v0.3.2_HPC.sh EGAPx_v0.3.2/D_galeata/inputs_M5_ZQ_ENA_noAA.txt
##### job 1215732
ABORTED


## EGAPx v0.3.1

## Small tests

#### qsub run_EGAPx_v0.3.1_HPC.sh test/EGAPx_v0.3/D_pulex/inputs_KAP4_NCBI_small.txt
##### job 1026412
Dec 11 21:34:43 ..... finished successfully

#### qsub run_EGAPx_v0.3.1_HPC.sh test/EGAPx_v0.3/D_pulex/inputs_KAP4_NCBI_medium.txt
##### job 1026414 -> https://github.com/ncbi/egapx/issues/66
Dec-11 17:04:37.683 [TaskFinalizer-4] ERROR nextflow.processor.TaskProcessor - Error executing process > 'egapx:rnaseq_short_plane:star:run_star (1)'
##### job 1026685
Dec-11 22:47:32.101 [TaskFinalizer-6] ERROR nextflow.processor.TaskProcessor - Error executing process > 'egapx:rnaseq_short_plane:star:run_star (3)'

#### qsub run_EGAPx_v0.3.1_HPC.sh test/EGAPx_v0.3/D_pulex/inputs_KAP4_NCBI_ms.txt
##### job 1026611
Dec 12 00:32:02 ..... finished successfully

#### qsub run_EGAPx_v0.3.1_HPC.sh test/EGAPx_v0.3/D_pulex/inputs_KAP4_NCBI_SRA_small.txt
##### job 1026212
Dec 11 18:56:53 ..... finished successfully

#### qsub run_EGAPx_v0.3.1_HPC.sh test/EGAPx_v0.3/D_pulex/inputs_KAP4_NCBI_SRA_medium.txt
##### job 1026220
Dec-11 14:33:29.811 [TaskFinalizer-4] ERROR nextflow.processor.TaskProcessor - Error executing process > 'egapx:rnaseq_short_plane:star:run_star (1)'
##### job 1026686
Dec-11 22:45:11.921 [TaskFinalizer-6] ERROR nextflow.processor.TaskProcessor - Error executing process > 'egapx:rnaseq_short_plane:star:run_star (1)'

### KAP106 NCBI, ZQ, & WW tests

#### qsub run_EGAPx_v0.3.1_HPC.sh D_pulex/inputs_KAP106_NCBI_SRA.txt 
##### job 984000
ERROR -> https://github.com/ncbi/egapx/issues/57
Nov-23 22:20:36.567 [TaskFinalizer-5] ERROR nextflow.processor.TaskProcessor - Error executing process > 'egapx:rnaseq_short_plane:star:run_star (1)'

#### qsub run_EGAPx_v0.3.1_HPC.sh D_pulex/inputs_KAP106_NCBI_SRA_WW.txt 
##### job 984001
ERROR
Nov-23 22:13:37.039 [TaskFinalizer-8] ERROR nextflow.processor.TaskProcessor - Error executing process > 'egapx:rnaseq_short_plane:star:run_star (2)'

#### qsub run_EGAPx_v0.3.1_HPC.sh D_pulex/inputs_KAP106_ZQ_SRA.txt 
##### job 984002
ERROR
Nov-24 00:16:54.675 [TaskFinalizer-5] ERROR nextflow.processor.TaskProcessor - Error executing process > 'egapx:rnaseq_short_plane:star:run_star (1)'

#### qsub run_EGAPx_v0.3.1_HPC.sh D_pulex/inputs_KAP106_ZQ_SRA_WW.txt 
##### job 984003
ERROR
Nov-23 23:32:25.927 [TaskFinalizer-8] ERROR nextflow.processor.TaskProcessor - Error executing process > 'egapx:rnaseq_short_plane:star:run_star (2)'

#### qsub run_EGAPx_v0.3.1_HPC.sh D_pulex/inputs_KAP4_NCBI_SRA.txt 
##### job 984005
ERROR
ERROR ~ Error executing process > 'egapx:rnaseq_short_plane:star:run_star (1)'
Nov-29 17:37:06.362 [TaskFinalizer-2] ERROR nextflow.processor.TaskProcessor - Error executing process > 'egapx:rnaseq_short_plane:star:run_star (1)'

#### qsub run_EGAPx_v0.3.1_HPC.sh D_pulex/inputs_KAP4_NCBI_SRA_WW.txt 
##### job 984006
ERROR
ERROR ~ Error executing process > 'egapx:rnaseq_short_plane:star:run_star (2)'
Nov-29 20:49:43.965 [TaskFinalizer-6] ERROR nextflow.processor.TaskProcessor - Error executing process > 'egapx:rnaseq_short_plane:star:run_star (1)'

### Software test

#### qsub run_EGAPx_v0.3_HPC.sh test/EGAPx_v0.2/D_pulex/inputs_KAP106_NCBI_SRA_RNA.txt
##### job 983971
SUCCEEDED
Nov 21 02:07:27 ..... finished successfully

#### qsub run_EGAPx_v0.3_HPC.sh test/EGAPx_v0.1/inputs_D_farinae.txt
##### job 982938
SUCCEEDED
Completed at: 20-Nov-2024 02:23:00
Duration    : 1m 47s
CPU hours   : 4.8 (100% cached)
Succeeded   : 0
Cached      : 83

### KAP106 Isoseq test sets

#### Primary tests

#### qsub run_EGAPx_v0.3.1_HPC.sh test/EGAPx_v0.2/D_lumholtzi/inputs_lumholtzi_WW_RNA.txt
##### job 980822 -> run0
ERROR 
-> https://github.com/ncbi/egapx/issues/52
-> https://github.com/ncbi/egapx/issues/61
-> https://github.com/ncbi/fcs
-> error [nextflow.exception.ProcessFailedException]: Process `egapx:annot_proc_plane:gnomon_biotype:run_gnomon_biotype` terminated with an error exit status (3)
-> ERROR ~ Error executing process > 'egapx:annot_proc_plane:gnomon_biotype:run_gnomon_biotype'
-> Error: (106.16) Application's execution failed (CException::eUnknown) Too many protein hits to proks (GP-23178)
##### job 982926
ERROR
-> Error: (106.16) Application's execution failed (CException::eUnknown) Too many protein hits to proks (GP-23178)

#### qsub run_EGAPx_v0.3.1_HPC.sh test/EGAPx_v0.2/D_lumholtzi/inputs_lumholtzi_WW.txt
##### job 980823
ERROR
-> error [nextflow.exception.ProcessFailedException]: Process `egapx:rnaseq_short_plane:star:run_star (1)` terminated with an error exit status (3)
-> [99/772862] NOTE: Process `egapx:rnaseq_short_plane:star:run_star (1)` terminated with an error exit status (3) -- Execution is retried (3)
-> [E::sam_parse1] CIGAR and query sequence are of different length
  [W::sam_read1_sam] Parse error at line 53
  samtools view: error reading file "-"
  Traceback (most recent call last):
    File "/img/gp/bin/star-with-filter", line 32, in <module>
      subprocess.run(main_cmd, shell=True, check=True)
    File "/usr/lib/python3.8/subprocess.py", line 516, in run
      raise CalledProcessError(retcode, process.args,
  subprocess.CalledProcessError: Command 'set -euo pipefail; /img/gp/bin//../third-party/STAR/bin/Linux_x86_64/STAR --alignSJoverhangMin 8 --outFilterMultimapNmax 200 --outFilterMismatchNmax 50 --runThreadN 31 --genomeLoad NoSharedMemory --outSAMtype SAM --outSAMattributes NH HI AS nM NM MD jM jI XS MC --outSAMprimaryFlag AllBestScore --outFilterMultimapScoreRange 50 --seedSearchStartLmax 15 --limitOutSAMoneReadBytes 1000000 --outSJtype None --genomeDir D.lumholtzi_format.index --outFileNamePrefix wrkarea/STAR.116017757157768zK0EW/D.lumholtzi_format-D.lumholtzi_isoseq_coding/D.lumholtzi_format-D.lumholtzi_isoseq_coding- --outStd SAM --readFilesIn ./D.lumholtzi_isoseq_coding.fasta --alignIntronMax 200000 | /img/gp/bin//compact_sam -max_intron 200000 -min_output_coverage 0.66 -min_query_len 21 -min_output_identity 0.9 | /img/gp/bin//samtools view -b' returned non-zero exit status 1.

#### qsub run_EGAPx_v0.3.1_HPC.sh test/EGAPx_v0.2/D_pulex/inputs_KAP106_ZQ_WW.txt
##### job 981468
ERROR
-> [W::hts_set_opt] Cannot change block size for this format
  samtools sort: failed to read header from "wrkarea/STAR.11001486083520O1Hzsx/D.pulex_KAP106_NMP_1.3.masked-KAP106_coding_transcripts_isoseq/D.pulex_KAP106_NMP_1.3.masked-KAP106_coding_transcripts_isoseq-Aligned.out.bam"
-> error [nextflow.exception.ProcessFailedException]: Process `egapx:rnaseq_short_plane:star:run_star (2)` terminated with an error exit status (3)
Nov-19 00:58:57.618 [TaskFinalizer-5] ERROR nextflow.processor.TaskProcessor - Error executing process > 'egapx:rnaseq_short_plane:star:run_star (2)'

#### qsub run_EGAPx_v0.3.1_HPC.sh test/EGAPx_v0.2/D_pulex/inputs_KAP106_ZQ_WW.fmt.txt
##### job 981479
ERROR
-> [W::hts_set_opt] Cannot change block size for this format
  samtools sort: failed to read header from "wrkarea/STAR.11202277877184Pmfy1D/D.pulex_KAP106_NMP_1.3.masked-KAP106_coding_transcripts_isoseq.fmt/D.pulex_KAP106_NMP_1.3.masked-KAP106_coding_transcripts_isoseq.fmt-Aligned.out.bam"

#### qsub run_EGAPx_v0.3.1_HPC.sh test/EGAPx_v0.2/D_pulex/inputs_KAP106_NCBI_WW.txt
##### job 981469
ERROR
-> [W::hts_set_opt] Cannot change block size for this format
  samtools sort: failed to read header from "wrkarea/STAR.11702967365056iMpBF3/GCA_028752575.1_ASM2875257v1_genomic-KAP106_coding_transcripts_isoseq/GCA_028752575.1_ASM2875257v1_genomic-KAP106_coding_transcripts_isoseq-Aligned.out.bam"

#### qsub run_EGAPx_v0.3.1_HPC.sh test/EGAPx_v0.2/D_pulex/inputs_KAP106_NCBI_WW.fmt.txt
##### job 981480
ERROR
-> [W::hts_set_opt] Cannot change block size for this format
  samtools sort: failed to read header from "wrkarea/STAR.116057435584ejT67Y/GCA_028752575.1_ASM2875257v1_genomic-KAP106_coding_transcripts_isoseq.fmt/GCA_028752575.1_ASM2875257v1_genomic-KAP106_coding_transcripts_isoseq.fmt-Aligned.out.bam"

#### qsub run_EGAPx_v0.3.1_HPC.sh test/EGAPx_v0.2/D_pulex/inputs_KAP106_NCBI_SRA.txt
##### job 981470
ERROR
-> [W::hts_set_opt] Cannot change block size for this format
  samtools sort: failed to read header from "wrkarea/STAR.22201597486528plBP4W/GCA_028752575.1_ASM2875257v1_genomic-SRR17282827/GCA_028752575.1_ASM2875257v1_genomic-SRR17282827-Aligned.out.bam"

#### qsub run_EGAPx_v0.3.1_HPC.sh test/EGAPx_v0.2/D_pulex/inputs_KAP106_ZQ_SRA.txt
##### job 981471
ERROR
-> [W::hts_set_opt] Cannot change block size for this format
  samtools sort: failed to read header from "wrkarea/STAR.2220139032000gp3sjX/D.pulex_KAP106_NMP_1.3.masked-SRR17282827/D.pulex_KAP106_NMP_1.3.masked-SRR17282827-Aligned.out.bam"

#### Protein tests

#### qsub run_EGAPx_v0.3.1_HPC.sh test/EGAPx_v0.2/D_pulex/inputs_KAP106_ZQ_ZQ_WW.txt
##### job 981472
ERROR
-> [W::hts_set_opt] Cannot change block size for this format
  samtools sort: failed to read header from "wrkarea/STAR.11403162346944Z6V3qQ/D.pulex_KAP106_NMP_1.3.masked-KAP106_coding_transcripts_isoseq/D.pulex_KAP106_NMP_1.3.masked-KAP106_coding_transcripts_isoseq-Aligned.out.bam"

#### qsub run_EGAPx_v0.3.1_HPC.sh test/EGAPx_v0.2/D_pulex/inputs_KAP106_ZQ_ZQ_WW.fmt.txt
##### job 981481
ERROR
-> [W::hts_set_opt] Cannot change block size for this format
  samtools sort: failed to read header from "wrkarea/STAR.11603239368128M97yJZ/D.pulex_KAP106_NMP_1.3.masked-KAP106_coding_transcripts_isoseq.fmt/D.pulex_KAP106_NMP_1.3.masked-KAP106_coding_transcripts_isoseq.fmt-Aligned.out.bam"

#### qsub run_EGAPx_v0.3.1_HPC.sh test/EGAPx_v0.2/D_pulex/inputs_KAP106_ZQ_ZQ_SRA.txt
##### job 981473
ERROR
-> [W::hts_set_opt] Cannot change block size for this format
  samtools sort: failed to read header from "wrkarea/STAR.22502089457088srqrFf/D.pulex_KAP106_NMP_1.3.masked-SRR17282827/D.pulex_KAP106_NMP_1.3.masked-SRR17282827-Aligned.out.bam"


## EGAPx v0.2

#### qsub run_EGAPx_v0.2_HPC.sh test/EGAPx_v0.3/D_pulex/inputs_KAP4_NCBI_small.txt
##### job 1026416
CDS          127684
exon         138413
gene         18152
mRNA         17787
transcript   2549 

#### qsub run_EGAPx_v0.2_HPC.sh test/EGAPx_v0.3/D_pulex/inputs_KAP4_NCBI_medium.txt
##### job 1026417
CDS          137446
exon         153191
gene         19301
mRNA         18721
transcript   3795

#### qsub run_EGAPx_v0.2_HPC.sh test/EGAPx_v0.3/D_pulex/inputs_KAP4_NCBI_ms.txt
##### job 1026612
CDS          137622
exon         153365
gene         19300
mRNA         18719
transcript   3795

#### qsub run_EGAPx_v0.2_HPC.sh test/EGAPx_v0.3/D_pulex/inputs_KAP4_NCBI_SRA_small.txt
##### job 1026399
CDS          127684
exon         138413
gene         18152
mRNA         17787
transcript   2549

#### qsub run_EGAPx_v0.2_HPC.sh test/EGAPx_v0.3/D_pulex/inputs_KAP4_NCBI_SRA_medium.txt
##### job 1026400
CDS          137622
exon         153365
gene         19300
mRNA         18719
transcript   3795

### KAP106 NCBI, ZQ, & WW tests

#### qsub run_EGAPx_v0.2_HPC.sh D_pulex/inputs_KAP106_NCBI_SRA.txt 
##### job 980812
Waiting for file transfers to complete (1 files)
Completed at: 09-Dec-2024 21:50:27
Duration    : 7d 12h 8m 20s
CPU hours   : 18'643.2 (39.2% cached)
Succeeded   : 1'399
Cached      : 61
Failed      : 4

#### qsub run_EGAPx_v0.2_HPC.sh D_pulex/inputs_KAP106_NCBI_SRA_WW.txt 
##### job 980814
COMPLETED

#### qsub run_EGAPx_v0.2_HPC.sh D_pulex/inputs_KAP106_ZQ_SRA.txt 
##### job 980815
COMPLETED

#### qsub run_EGAPx_v0.2_HPC.sh D_pulex/inputs_KAP106_ZQ_SRA_WW.txt 
##### job 980816
COMPLETED

#### qsub run_EGAPx_v0.2_HPC.sh D_pulex/inputs_KAP4_NCBI_SRA.txt 
##### job 980817
COMPLETED

#### qsub run_EGAPx_v0.2_HPC.sh D_pulex/inputs_KAP4_NCBI_SRA_WW.txt 
##### job 980818
KILLED


### KAP106 Isoseq test sets

#### Primary tests

#### qsub run_EGAPx_v0.2_HPC.sh test/EGAPx_v0.2/D_lumholtzi/inputs_lumholtzi_WW_RNA.txt
##### job 977147
SUCCEEDED
CDS          195421
exon         279971
gene         17462
mRNA         22527
transcript   9112

#### qsub run_EGAPx_v0.2_HPC.sh test/EGAPx_v0.2/D_lumholtzi/inputs_lumholtzi_WW.txt
##### job 956395
ERROR 
-> ERROR ~ Error executing process > 'egapx:rnaseq_short_plane:star:run_star (1)'
-> [E::sam_parse1] CIGAR and query sequence are of different length
  [W::sam_read1_sam] Parse error at line 53
  samtools view: error reading file "-"
  Traceback (most recent call last):
    File "/img/gp/bin/star-with-filter", line 32, in <module>
      subprocess.run(main_cmd, shell=True, check=True)
    File "/usr/lib/python3.8/subprocess.py", line 516, in run
      raise CalledProcessError(retcode, process.args,
  subprocess.CalledProcessError: Command 'set -euo pipefail; /img/gp/bin//../third-party/STAR/bin/Linux_x86_64/STAR --alignSJoverhangMin 8 --outFilterMultimapNmax 200 --outFilterMismatchNmax 50 --runThreadN 16 --genomeLoad NoSharedMemory --outSAMtype SAM --outSAMattributes NH HI AS nM NM MD jM jI XS MC --outSAMprimaryFlag AllBestScore --outFilterMultimapScoreRange 50 --seedSearchStartLmax 15 --limitOutSAMoneReadBytes 1000000 --outSJtype None --genomeDir D.lumholtzi_format.index --outFileNamePrefix wrkarea/STAR.1210575948224L4T8cm/D.lumholtzi_format-D.lumholtzi_isoseq_coding/D.lumholtzi_format-D.lumholtzi_isoseq_coding- --outStd SAM --readFilesIn ./D.lumholtzi_isoseq_coding.fasta --alignIntronMax 200000 | /img/gp/bin//compact_sam -max_intron 200000 -min_output_coverage 0.66 -min_query_len 21 -min_output_identity 0.9 | /img/gp/bin//samtools view -b' returned non-zero exit status 1.

#### qsub run_EGAPx_v0.2_HPC.sh test/EGAPx_v0.2/D_pulex/inputs_KAP106_ZQ_WW.txt
##### job 917382 
not formatted D obtusa WW data (oops)
##### job 925025
ERROR -> Plus 10 more processes waiting for tasks…
##### job 954911
SUCCEEDED
CDS          127742
exon         138430
gene         17947
mRNA         17642
transcript   2484

#### qsub run_EGAPx_v0.2_HPC.sh test/EGAPx_v0.2/D_pulex/inputs_KAP106_NCBI_WW.txt
##### job 925026
ERROR -> Plus 10 more processes waiting for tasks…
##### job 954912
SUCCEEDED
CDS          127742
exon         138430
gene         17947
mRNA         17642
transcript   2484

#### qsub run_EGAPx_v0.2_HPC.sh test/EGAPx_v0.2/D_pulex/inputs_KAP106_NCBI_SRA.txt
##### job 917475 -> non test data subset (oops)
COMPLETED
##### job 925027
ERROR -> ERROR ~ Error executing process > 'egapx:rnaseq_short_plane:rnaseq_collapse:generate_jobs'
##### job 954913
SUCCEEDED
CDS          127742
exon         138430
gene         17947
mRNA         17642
transcript   2484

#### qsub run_EGAPx_v0.2_HPC.sh test/EGAPx_v0.2/D_pulex/inputs_KAP106_ZQ_SRA.txt
##### job 917476 -> non test data subset (oops)
COMPLETED
##### job 925028
ERROR -> ERROR ~ Error executing process > 'egapx:rnaseq_short_plane:rnaseq_collapse:generate_jobs'
##### job 954914
SUCCEEDED
CDS          127742
exon         138430
gene         17947
mRNA         17642
transcript   2484

#### Protein tests

#### qsub run_EGAPx_v0.2_HPC.sh inputs_KAP106_ZQ_ZQ_SRA.txt
##### job 917381 -> full data set
COMPLETED
##### job 954915
The /scratch365/ebrooks5/multi_genome_project/EGAPx_v0.2/tested_november2024/ directory already exsists... please remove before proceeding.

#### qsub run_EGAPx_v0.2_HPC.sh test/EGAPx_v0.2/D_pulex/inputs_KAP106_ZQ_ZQ_WW.txt
##### job 917383 
ERROR
not formatted D obtusa WW data (oops) 
samtools sort: failed to read header from "wrkarea/STAR.1180121497024erNMJ5/D.pulex_KAP106_NMP_1.3.masked-D.obtusa_isoseq_coding/D.pulex_KAP106_NMP_1.3.masked-D.obtusa_isoseq_coding-Aligned.out.bam"
##### job 917396
not formatted WW data
ERROR -> Plus 10 more processes waiting for tasks…
##### job 925029
ERROR -> Plus 10 more processes waiting for tasks…
##### job 954916
SUCCEEDED
CDS          137123
exon         147254
gene         20378
mRNA         19860
transcript   2563

#### qsub run_EGAPx_v0.2_HPC.sh test/EGAPx_v0.2/D_pulex/inputs_KAP106_ZQ_ZQ_SRA.txt
##### job 917477 -> non test data subset (oops)
COMPLETED
##### job 925030
ERROR -> ERROR ~ Error executing process > 'egapx:rnaseq_short_plane:rnaseq_collapse:generate_jobs'
##### job 954917
SUCCEEDED
CDS          137123
exon         147254
gene         20378
mRNA         19860
transcript   2563


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
ERROR -> Plus 42 more processes waiting for tasks…
##### job 954920

#### qsub run_EGAPx_v0.2_HPC.sh test/EGAPx_v0.2/D_ambigua/inputs_D_ambigua_2_ZQ_ZQ_WW.txt
##### job 925032
ERROR -> Plus 42 more processes waiting for tasks…
##### job 954921

#### qsub run_EGAPx_v0.2_HPC.sh test/EGAPx_v0.2/D_obtusa/inputs_D_obtusa_2_ZQ_ZQ_trimmed.txt
##### job 925033
SUCCEEDED
##### job 954922

#### qsub run_EGAPx_v0.2_HPC.sh test/EGAPx_v0.2/D_obtusa/inputs_D_obtusa_2_ZQ_WW.txt
##### job 925041
ERROR -> Plus 42 more processes waiting for tasks…
##### job 954923

#### qsub run_EGAPx_v0.2_HPC.sh test/EGAPx_v0.2/D_obtusa/inputs_D_obtusa_2_ZQ_ZQ_WW.txt
##### job 925034
ERROR -> Plus 42 more processes waiting for tasks…
##### job 954924

#### qsub run_EGAPx_v0.2_HPC.sh test/EGAPx_v0.2/D_pulicaria/inputs_LK16_ZQ_ZQ_trimmed.txt
##### job 917384
ERROR ->   [ERRO] stat 18CRep6_TTAGGC_L002_R1.concat.fmt.fa: no such file or directory
##### job 925036
ERROR -> yaml.scanner.ScannerError: sequence entries are not allowed here
##### job 954925


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
