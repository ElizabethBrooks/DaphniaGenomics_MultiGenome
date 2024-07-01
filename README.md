# DaphniaGenomics_MultiGenome
Repository for scripts to analyze multiple daphnia species genomes.

# EGAPx
There are two workflows for EGAPx, local and HPC. The <i>local scripts</i> can be run locally on your system and the <i>HPC scripts</i> are setup for job submission to the ND CRC remote servers.

First, make sure that you have singularity installed on your system. The ND CRC servers have singularity already available.

Next, you may use the install_EGAPx.sh script in the Install folder to install EGAPx and its dependencies.

## Notes on EGAPx

### HPC scripts
The <i>egapx/ui/assets/config/process_resources.config</i> file specifies up to 31 cores (huge_Job).

### reads
- EGAPx expects that input "reads" are a list of FASTA read files, expects pairs in form SRAxxx.1, SRAxxx.2 (see the egapx/nf/./subworkflows/ncbi/./rnaseq_short/star_wnode/main.nf file)
- Do the reads need to be from the SRA (e.g., https paths in EGAPx example yaml files) or formatted very specifically (e.g., read headers or file names)?

#### Errors
ERROR ~ index is out of range 0..-1 (index = 0)
-- Check script '/afs/crc.nd.edu/user/e/ebrooks5/egapx/nf/./subworkflows/ncbi/./rnaseq_short/star_wnode/main.nf' at line: 83 or see '/scratch365/ebrooks5/multi_genome_project/EGAPx/D_pulicaria_LK16_raw/nextflow.log' file for more details
- Jun-30 20:49:03.315 [Actor Thread 23] ERROR nextflow.extension.OperatorImpl - @unknown
- java.lang.IndexOutOfBoundsException: index is out of range 0..-1 (index = 0)
- Jun-30 20:49:03.330 [Actor Thread 23] DEBUG nextflow.Session - Session aborted -- Cause: index is out of range 0..-1 (index = 0)
