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

#### reads_ids
There is a limit to the number of SRA IDs that can be input to EGAPx, since the pipeline makes a query to the SRA. The HTTP header becomes too large if the list of SRA IDs is very long. 

##### KAP4
These IDs were retrieved from the [KAP4 NCBI annotation report](https://www.ncbi.nlm.nih.gov/refseq/annotation_euk/Daphnia_pulex/100/). These are the "RNA-Seq alignments" "Project" IDs and the "SRA Long Read Alignment Statistics" "Run" ID. The unique Project IDs are being used since EGAPx fails if the HTTP header becomes to large from a long list of samples.

###### Errors
The following reads cause errors with EGAPx (ERROR ~ Error executing process > 'egapx:fetch_sra_fasta:run_fetch_sra_fasta), which are testable with the SRA tools prefetch command.
- prefetch.2.10.1: 'SRR6819015' is a local non-kart file
- warn: nothing found for SRR11089015.1
- warn: nothing found for SRR11089015.2


#### reads
- EGAPx expects that input "reads" are a list of FASTA read files, expects pairs in form SRAxxx.1, SRAxxx.2 (see the egapx/nf/./subworkflows/ncbi/./rnaseq_short/star_wnode/main.nf file)
- Do the reads need to be from the SRA (e.g., https paths in EGAPx example yaml files) or formatted very specifically (e.g., read headers or file names)?

##### Errors
ERROR ~ index is out of range 0..-1 (index = 0)
-- Check script '/afs/crc.nd.edu/user/e/ebrooks5/egapx/nf/./subworkflows/ncbi/./rnaseq_short/star_wnode/main.nf' at line: 83 or see '/scratch365/ebrooks5/multi_genome_project/EGAPx/D_pulicaria_LK16_raw/nextflow.log' file for more details
- Jun-30 20:49:03.315 [Actor Thread 23] ERROR nextflow.extension.OperatorImpl - @unknown
- java.lang.IndexOutOfBoundsException: index is out of range 0..-1 (index = 0)
- Jun-30 20:49:03.330 [Actor Thread 23] DEBUG nextflow.Session - Session aborted -- Cause: index is out of range 0..-1 (index = 0)


## [BRAKER3](https://github.com/Gaius-Augustus/BRAKER)
... in progress ...
