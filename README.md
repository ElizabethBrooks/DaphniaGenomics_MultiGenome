# DaphniaGenomics_MultiGenome
Repository for scripts to analyze multiple daphnia species genomes.

Some things to keep in mind when running EGAPx:
- Either the number of cores requested for a job must be at least 31, or you will need to edit the default huge_Job value in the <i>egapx/ui/assets/config/process_resources.config</i> file
- The pipeline can take a lot of memory and time, if there is a large number of reads being retrieved from the SRA
- There is a limit to the number of SRA IDs that can be input to EGAPx


## Inputs & Outputs

To use these sets of scripts to install and run the workflows, make sure to change the paths in the inputs files in the <b>InputData</b> directory. For example, the input and output paths in the <i>inputPaths.txt</i> file should be changed to the paths on your system.


## [EGAPx](https://github.com/ncbi/egapx/)
There are two workflows for EGAPx, local and HPC. The <i>local scripts</i> can be run locally on your system and the <i>HPC scripts</i> are setup for job submission to the ND CRC remote servers.

First, make sure that you have singularity installed on your system. The ND CRC servers already have singularity available.

### Installation

The <i>install_EGAPx.sh</i> script in the <b>Install</b> directory can be used to install EGAPx and its dependencies.

### Notes on EGAPx

#### HPC scripts
The <i>egapx/ui/assets/config/process_resources.config</i> file specifies up to 31 cores (huge_Job).

#### reads
- EGAPx expects that input "reads" are a list of FASTA read files, expects pairs in form SRAxxx.1, SRAxxx.2 (see the egapx/nf/./subworkflows/ncbi/./rnaseq_short/star_wnode/main.nf file)
- The read files need to be formatted very specifically, details coming soon...

#### reads_ids
There is a limit to the number of SRA IDs that can be input to EGAPx, since the pipeline makes a query to the SRA. The HTTP header becomes too large if the list of SRA IDs is very long. 

##### KAP4
These IDs were retrieved from the [KAP4 NCBI annotation report](https://www.ncbi.nlm.nih.gov/refseq/annotation_euk/Daphnia_pulex/100/). These are the "RNA-Seq alignments" "Project" IDs and the "SRA Long Read Alignment Statistics" "Run" ID. The unique Project IDs are being used since EGAPx fails if the HTTP header becomes to large from a long list of samples.

###### Errors
The following reads cause errors with EGAPx (ERROR ~ Error executing process > 'egapx:fetch_sra_fasta:run_fetch_sra_fasta), which are testable with the SRA tools prefetch command.
- prefetch.2.10.1: 'SRR6819015' is a local non-kart file
- warn: nothing found for SRR11089015.1
- warn: nothing found for SRR11089015.2


## [BRAKER3](https://github.com/Gaius-Augustus/BRAKER)
... in progress ...


## NOTES

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
Your job 690819 ("run_EGAPx_jobOutput") has been submitted
EXITING because of FATAL ERROR in reads input: short read sequence line: 0
 -- Check '/scratch365/ebrooks5/multi_genome_project/EGAPx/D_farinae_small_dump_fmt/nextflow.log' file for details

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
Your job 691011 ("run_EGAPx_jobOutput") has been submitted
EXITING because of FATAL ERROR in reads input: short read sequence line: 0
 -- Check '/scratch365/ebrooks5/multi_genome_project/EGAPx/D_pulex_KAP4_dump_fmt/nextflow.log' file for details


### Config

// Part of nextflow config describing resource requirements for EGAPx processes
// We rely on labels to define 3 tiers of processes - default, big, and huge.
// Make sure that executor you use supports job memory and CPU requirements
process {
    memory = 200.GB
    cpus = 124
    time = 336.h

    withLabel: 'big_job' {
        memory = 200.GB
        cpus = 124
    }

    withLabel: 'huge_job' {
        memory = 200.GB
        cpus = 124
    }

    withLabel: 'long_job' {
        time = 336.h
    }
}
