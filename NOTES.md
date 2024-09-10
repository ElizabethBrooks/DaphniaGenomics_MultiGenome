### KAP4 & KAP106 NCBI Data
The following reads are duplicated:
  - /scratch365/ebrooks5/multi_genome_project/data/dump/KAP4_KAP106/SRR17282827/SRR17282827_1.fasta
  - /scratch365/ebrooks5/multi_genome_project/data/dump/KAP4_KAP106/SRP351713/SRR17282827_1.fasta


### Test 2

(base) [ebrooks5@crcfe02 SNP_Calling]$ du -hs /scratch365/ebrooks5/multi_genome_project/EGAPx_v0.2/*
85G /scratch365/ebrooks5/multi_genome_project/EGAPx_v0.2/D_magna_NIES_NCBI
3.0T  /scratch365/ebrooks5/multi_genome_project/EGAPx_v0.2/D_pulex_KAP106
3.3T  /scratch365/ebrooks5/multi_genome_project/EGAPx_v0.2/D_pulex_KAP4_NCBI
1.8T  /scratch365/ebrooks5/multi_genome_project/EGAPx_v0.2/D_pulicaria_LK16_NCBI
1.3T  /scratch365/ebrooks5/multi_genome_project/EGAPx_v0.2/D_pulicaria_SC_F0-13Bv2

(base) [ebrooks5@crcfe02 SNP_Calling]$ ls /scratch365/ebrooks5/multi_genome_project/EGAPx_v0.2/*
/scratch365/ebrooks5/multi_genome_project/EGAPx_v0.2/D_magna_NIES_NCBI:
egapx_config  nextflow.log.1  run_params.yaml  run.timeline.html  temp_datapath  work_dir_singularity.last
nextflow.log  resume.sh       run.report.html  run.trace.txt    work

/scratch365/ebrooks5/multi_genome_project/EGAPx_v0.2/D_pulex_KAP106:
egapx_config  nextflow.log.1  run_params.yaml  run.timeline.html  temp_datapath  work_dir_singularity.last
nextflow.log  resume.sh       run.report.html  run.trace.txt    work

/scratch365/ebrooks5/multi_genome_project/EGAPx_v0.2/D_pulex_KAP4_NCBI:
accept.gff        nextflow.log    run_params.yaml  run.trace.txt  work_dir_singularity.last
annot_builder_output  nextflow.log.1  run.report.html  temp_datapath
egapx_config        resume.sh       run.timeline.html  work

/scratch365/ebrooks5/multi_genome_project/EGAPx_v0.2/D_pulicaria_LK16_NCBI:
accept.gff        nextflow.log    run_params.yaml  run.trace.txt  work_dir_singularity.last
annot_builder_output  nextflow.log.1  run.report.html  temp_datapath
egapx_config        resume.sh       run.timeline.html  work

/scratch365/ebrooks5/multi_genome_project/EGAPx_v0.2/D_pulicaria_SC_F0-13Bv2:
accept.gff        nextflow.log    run_params.yaml  run.trace.txt  work_dir_singularity.last
annot_builder_output  nextflow.log.1  run.report.html  temp_datapath
egapx_config        resume.sh       run.timeline.html  work


### Questions

What files are necessary for re-starting the analysis? There are some output folders from completed analyses that require a lot of memory (e.g., temp_datapath or work).

(base) [ebrooks5@crcfe01 ~]$ du -hs /scratch365/ebrooks5/multi_genome_project/EGAPx/D_pulex_KAP4_NCBI/*
217M  /scratch365/ebrooks5/multi_genome_project/EGAPx/D_pulex_KAP4_NCBI/accept.gff
9.2G  /scratch365/ebrooks5/multi_genome_project/EGAPx/D_pulex_KAP4_NCBI/annot_builder_output
152K  /scratch365/ebrooks5/multi_genome_project/EGAPx/D_pulex_KAP4_NCBI/egapx_config
5.3M  /scratch365/ebrooks5/multi_genome_project/EGAPx/D_pulex_KAP4_NCBI/nextflow.log
5.8M  /scratch365/ebrooks5/multi_genome_project/EGAPx/D_pulex_KAP4_NCBI/nextflow.log.1
3.6M  /scratch365/ebrooks5/multi_genome_project/EGAPx/D_pulex_KAP4_NCBI/nextflow.log.2
16K /scratch365/ebrooks5/multi_genome_project/EGAPx/D_pulex_KAP4_NCBI/run_params.yaml
8.5M  /scratch365/ebrooks5/multi_genome_project/EGAPx/D_pulex_KAP4_NCBI/run.report.html
1.2M  /scratch365/ebrooks5/multi_genome_project/EGAPx/D_pulex_KAP4_NCBI/run.timeline.html
420K  /scratch365/ebrooks5/multi_genome_project/EGAPx/D_pulex_KAP4_NCBI/run.trace.txt
1.4T  /scratch365/ebrooks5/multi_genome_project/EGAPx/D_pulex_KAP4_NCBI/temp_datapath
2.1T  /scratch365/ebrooks5/multi_genome_project/EGAPx/D_pulex_KAP4_NCBI/work
16K /scratch365/ebrooks5/multi_genome_project/EGAPx/D_pulex_KAP4_NCBI/work_dir_singularity.last

(base) [ebrooks5@crcfe02 ~]$ du -hs /scratch365/ebrooks5/multi_genome_project/EGAPx/D_pulex_KAP106/*
196M  /scratch365/ebrooks5/multi_genome_project/EGAPx/D_pulex_KAP106/accept.gff
8.5G  /scratch365/ebrooks5/multi_genome_project/EGAPx/D_pulex_KAP106/annot_builder_output
152K  /scratch365/ebrooks5/multi_genome_project/EGAPx/D_pulex_KAP106/egapx_config
5.7M  /scratch365/ebrooks5/multi_genome_project/EGAPx/D_pulex_KAP106/nextflow.log
5.7M  /scratch365/ebrooks5/multi_genome_project/EGAPx/D_pulex_KAP106/nextflow.log.1
1.6M  /scratch365/ebrooks5/multi_genome_project/EGAPx/D_pulex_KAP106/nextflow.log.2
16K /scratch365/ebrooks5/multi_genome_project/EGAPx/D_pulex_KAP106/run_params.yaml
8.1M  /scratch365/ebrooks5/multi_genome_project/EGAPx/D_pulex_KAP106/run.report.html
1.1M  /scratch365/ebrooks5/multi_genome_project/EGAPx/D_pulex_KAP106/run.timeline.html
400K  /scratch365/ebrooks5/multi_genome_project/EGAPx/D_pulex_KAP106/run.trace.txt
1.3T  /scratch365/ebrooks5/multi_genome_project/EGAPx/D_pulex_KAP106/temp_datapath
2.0T  /scratch365/ebrooks5/multi_genome_project/EGAPx/D_pulex_KAP106/work
16K /scratch365/ebrooks5/multi_genome_project/EGAPx/D_pulex_KAP106/work_dir_singularity.last

(base) [ebrooks5@crcfe02 ~]$ du -hs /scratch365/ebrooks5/multi_genome_project/EGAPx/D_pulicaria_SC_F0-13Bv2/*
207M  /scratch365/ebrooks5/multi_genome_project/EGAPx/D_pulicaria_SC_F0-13Bv2/accept.gff
5.8G  /scratch365/ebrooks5/multi_genome_project/EGAPx/D_pulicaria_SC_F0-13Bv2/annot_builder_output
152K  /scratch365/ebrooks5/multi_genome_project/EGAPx/D_pulicaria_SC_F0-13Bv2/egapx_config
268K  /scratch365/ebrooks5/multi_genome_project/EGAPx/D_pulicaria_SC_F0-13Bv2/nextflow.log
4.7M  /scratch365/ebrooks5/multi_genome_project/EGAPx/D_pulicaria_SC_F0-13Bv2/nextflow.log.1
16K /scratch365/ebrooks5/multi_genome_project/EGAPx/D_pulicaria_SC_F0-13Bv2/run_params.yaml
3.4M  /scratch365/ebrooks5/multi_genome_project/EGAPx/D_pulicaria_SC_F0-13Bv2/run.report.html
376K  /scratch365/ebrooks5/multi_genome_project/EGAPx/D_pulicaria_SC_F0-13Bv2/run.timeline.html
44K /scratch365/ebrooks5/multi_genome_project/EGAPx/D_pulicaria_SC_F0-13Bv2/run.trace.txt
1.1T  /scratch365/ebrooks5/multi_genome_project/EGAPx/D_pulicaria_SC_F0-13Bv2/temp_datapath
313G  /scratch365/ebrooks5/multi_genome_project/EGAPx/D_pulicaria_SC_F0-13Bv2/work
16K /scratch365/ebrooks5/multi_genome_project/EGAPx/D_pulicaria_SC_F0-13Bv2/work_dir_singularity.last

### Test 1

(base) [ebrooks5@crcfe01 Annotation]$ qsub run_EGAPx_HPC.sh inputs_D_farinae.txt
Your job 688905 ("run_EGAPx_jobOutput") has been submitted
Completed at: 15-Jul-2024 13:12:18
Duration    : 17m 59s
CPU hours   : 5.6
Succeeded   : 192

(base) [ebrooks5@crcfe01 Annotation]$ qsub run_EGAPx_HPC.sh inputs_D_farinae_SRA.txt
Your job 688906 ("run_EGAPx_jobOutput") has been submitted
Completed at: 15-Jul-2024 17:09:21
Duration    : 2h 7m 48s
CPU hours   : 58.2
Succeeded   : 213

(base) [ebrooks5@crcfe01 Annotation]$ qsub run_EGAPx_HPC.sh inputs_D_farinae_dump.txt
Your job 688907 ("run_EGAPx_jobOutput") has been submitted
ERROR ~ index is out of range 0..-1 (index = 0)
 -- Check script '/afs/crc.nd.edu/user/e/ebrooks5/egapx/nf/./subworkflows/ncbi/./rnaseq_short/star_wnode/main.nf' at line: 83 or see '/scratch365/ebrooks5/multi_genome_project/EGAPx/D_farinae_small_dump/nextflow.log' file for more details

(base) [ebrooks5@crcfe01 Annotation]$ qsub run_EGAPx_HPC.sh inputs_D_farinae_dump_fmt.txt
Your job 699249 ("run_EGAPx_jobOutput") has been submitted
Completed at: 20-Jul-2024 08:48:36
Duration    : 2h 38m 51s
CPU hours   : 162.2
Succeeded   : 210

(base) [ebrooks5@crcfe01 Annotation]$ qsub run_EGAPx_HPC.sh inputs_D_farinae_dump_egapx.txt
Your job 699250 ("run_EGAPx_jobOutput") has been submitted
ERROR ~ index is out of range 0..-1 (index = 0)
 -- Check script '/afs/crc.nd.edu/user/e/ebrooks5/egapx/nf/./subworkflows/ncbi/./rnaseq_short/star_wnode/main.nf' at line: 83 or see '/scratch365/ebrooks5/multi_genome_project/EGAPx/D_farinae_small_dump_egapx/nextflow.log' file for more details

(base) [ebrooks5@crcfe01 Annotation]$ qsub run_EGAPx_HPC.sh inputs_D_farinae_dump_egapx_fmt.txt
Your job 699251 ("run_EGAPx_jobOutput") has been submitted
Completed at: 20-Jul-2024 06:17:03
Duration    : 2h 39m 15s
CPU hours   : 162.6
Succeeded   : 210

(base) [ebrooks5@crcfe01 Annotation]$ qsub run_EGAPx_HPC.sh inputs_D_farinae_wget.txt
Your job 688909 ("run_EGAPx_jobOutput") has been submitted
Completed at: 15-Jul-2024 13:30:17
Duration    : 17m 39s
CPU hours   : 5.5
Succeeded   : 192

(base) [ebrooks5@crcfe01 Annotation]$ qsub run_EGAPx_HPC.sh inputs_KAP4.txt
Your job 688910 ("run_EGAPx_jobOutput") has been submitted
Completed at: 15-Jul-2024 19:57:40
Duration    : 2h 11m 4s
CPU hours   : 54.8
Succeeded   : 83

(base) [ebrooks5@crcfe01 Annotation]$ qsub run_EGAPx_HPC.sh inputs_KAP4_dump.txt
Your job 688911 ("run_EGAPx_jobOutput") has been submitted
ERROR ~ index is out of range 0..-1 (index = 0)
 -- Check script '/afs/crc.nd.edu/user/e/ebrooks5/egapx/nf/./subworkflows/ncbi/./rnaseq_short/star_wnode/main.nf' at line: 83 or see '/scratch365/ebrooks5/multi_genome_project/EGAPx/D_pulex_KAP4_dump/nextflow.log' file for more details

(base) [ebrooks5@crcfe01 Annotation]$ qsub run_EGAPx_HPC.sh inputs_KAP4_dump_fmt.txt
Your job 700363 ("run_EGAPx_jobOutput") has been submitted
Command exit status:
  3
Command output:
  (empty)
 -- Check '/scratch365/ebrooks5/multi_genome_project/EGAPx/D_pulex_KAP4_dump_fmt/nextflow.log' file for details

 Your job 705596 ("run_EGAPx_jobOutput") has been submitted
Completed at: 23-Jul-2024 18:55:29
Duration    : 3h 8m 10s
CPU hours   : 193.6
Succeeded   : 80

(base) [ebrooks5@crcfe01 Annotation]$ qsub run_EGAPx_HPC.sh inputs_KAP4_dump_egapx.txt
Your job 700365 ("run_EGAPx_jobOutput") has been submitted
ERROR ~ index is out of range 0..-1 (index = 0)
 -- Check script '/afs/crc.nd.edu/user/e/ebrooks5/egapx/nf/./subworkflows/ncbi/./rnaseq_short/star_wnode/main.nf' at line: 83 or see '/scratch365/ebrooks5/multi_genome_project/EGAPx/D_pulex_KAP4_dump_egapx/nextflow.log' file for more details

(base) [ebrooks5@crcfe01 Annotation]$ qsub run_EGAPx_HPC.sh inputs_KAP4_dump_egapx_fmt.txt
Your job 700366 ("run_EGAPx_jobOutput") has been submitted
Completed at: 20-Jul-2024 22:29:31
Duration    : 3h 3m 52s
CPU hours   : 189.1
Succeeded   : 80
