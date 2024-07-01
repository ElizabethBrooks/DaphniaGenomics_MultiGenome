# DaphniaGenomics_MultiGenome
Repository for scripts to analyze multiple daphnia species genomes.

## Inputs & Outputs

To use these sets of scripts to install and run the workflows, make sure to change the paths in the inputs files in the <b>InputData</b> directory.


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
- Do the reads need to be from the SRA (e.g., https paths in EGAPx example yaml files) or formatted very specifically (e.g., read headers or file names)?

##### Errors
ERROR ~ index is out of range 0..-1 (index = 0)
-- Check script '/afs/crc.nd.edu/user/e/ebrooks5/egapx/nf/./subworkflows/ncbi/./rnaseq_short/star_wnode/main.nf' at line: 83 or see '/scratch365/ebrooks5/multi_genome_project/EGAPx/D_pulicaria_LK16_raw/nextflow.log' file for more details
- Jun-30 20:49:03.315 [Actor Thread 23] ERROR nextflow.extension.OperatorImpl - @unknown
- java.lang.IndexOutOfBoundsException: index is out of range 0..-1 (index = 0)
- Jun-30 20:49:03.330 [Actor Thread 23] DEBUG nextflow.Session - Session aborted -- Cause: index is out of range 0..-1 (index = 0)


## [BRAKER3](https://github.com/Gaius-Augustus/BRAKER)
... in progress ...
