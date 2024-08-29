### Tests

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