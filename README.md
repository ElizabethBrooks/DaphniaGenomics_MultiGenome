# Daphnia Genome Annotations

## Annotation Status

The following tables show the annotation status for each Daphnia species that has been annotated, is currently being annotated, or is in the server job queue. Also included are the run times for the completed annotations.

### EGAPx v0.2 - NCBI Data

A detailed log of the EGAPx v0.2 daphnia genome annotations can be found in the 
Daphnia\_Genome\_Annotations Box folder: EGAPx\_v0.2\_daphnia\_annotation\_log.xlsx

These annotations are being completed using the SRA data assocaited with each of the NCBI genome assemblies. This will allow us to compare the annotations produced by EGAPx with the NCBI annotations.

| Species | Genotype | Status | Time |
| --- | --- | --- | --- |
| pulex | KAP4 | Running | N/A |
| pulex | KAP106 | Running | N/A |
| pulicaria | LK16 | Completed | 3d 20h 23m 8s |
| pulicaria | SC F1-1A | Running | N/A |
| magna | NIES | Completed | 11d 11h 17m 20s |

### EGAPx v0.1 - NCBI Data

These annotations are being completed using the SRA data assocaited with each of the NCBI genome assemblies. This will allow us to compare the annotations produced by EGAPx with the NCBI annotations.

The KAP4 and KAP106 annotations had to be re-started (possible since EGAPx uses Nextflow), which may have affected their analysis run times.

| Species | Genotype | Status | Time |
| --- | --- | --- | --- |
| pulex | KAP4 | Completed | 16 days	7 hours	38 minutes	10 seconds |
| pulex | KAP106 | Completed | 14 days	13 hours	40 minutes	23 seconds |
| pulicaria | LK16 | Killed, disk I/O error | 9:20:15:21 |
| pulicaria | SC F1-1A | Completed | 4 days 16 hours 23 minutes 22 seconds |
| magna | NIES | Killed, Error executing process | 01:34:54 |

## Code

Click [here](https://github.com/ElizabethBrooks/DaphniaGenomics_MultiGenome) for the code repository with scripts to analyze multiple daphnia species genomes.

### Compare feature type counts
- cat accept.gff | cut -f3 | grep -c "CDS"
- cat accept.gff | cut -f3 | grep -c "exon"
- cat accept.gff | cut -f3 | grep -c "gene"
- cat accept.gff | cut -f3 | grep -c "mRNA"
- cat accept.gff | cut -f3 | grep -c "transcript"
- cat accept.gff | grep -c "biotype=protein_coding" 

### View feature types
- cat accept.gff | grep "\tCDS\t"
- cat accept.gff | grep "\texon\t"
- cat accept.gff | grep "\tgene\t"
- cat accept.gff | grep "\tmRNA\t"
- cat accept.gff | grep "\ttranscript\t"
- cat accept.gff | grep "biotype=protein_coding" 

## Inputs & Outputs

To use these sets of scripts to install and run the workflows, make sure to change the paths in the inputs files in the <b>inputData</b> directory. For example, the input and output paths in the <i>inputPaths.txt</i> file should be changed to the paths on your system.

## [EGAPx](https://github.com/ncbi/egapx/) Workflows
There are two workflows for EGAPx, local and HPC. The <i>local scripts</i> can be run locally on your system and the <i>HPC scripts</i> are setup for job submission to the ND CRC remote servers.

First, make sure that you have singularity installed on your system. The ND CRC servers already have singularity available.

### Installation
The <i>install_EGAPx.sh</i> script in the <b>install</b> directory can be used to install EGAPx and its dependencies. 

Make sure to change the paths in the <i>inputs_annotations.txt</i> file to where you would like to have the software installed and outputs generated.

### Notes
There are some things to keep in mind when running EGAPx.

#### Running
- Either the number of cores requested for a job must be at least 31, or you will need to edit the default huge_Job value in the <i>egapx/ui/assets/config/process_resources.config</i> file
- The pipeline can take a lot of memory and time, if there is a large number of reads being retrieved from the SRA
- There is a limit to the number of SRA IDs that can be input to EGAPx

#### HPC scripts
The <i>egapx/ui/assets/config/process_resources.config</i> file specifies up to 31 cores (huge_Job).

#### inputData

##### reads
The read files need to be formatted very specifically, see the format_SRA_reads_EGAPx.sh and download_SRA_reads_EGAPx.sh scripts in the Formatting directory. This is because EGAPx expects that input "reads" are a list of FASTA read files, expects pairs in form SRAxxx.1, SRAxxx.2 (see the egapx/nf/./subworkflows/ncbi/./rnaseq_short/star_wnode/main.nf file).

##### reads_ids
There is a limit to the number of SRA IDs that can be input to EGAPx, since the pipeline makes a query to the SRA. The HTTP header becomes too large if the list of SRA IDs is very long. 

##### NCBI Data Sets
These IDs were retrieved from the annotation report pages of each species. For example, [KAP4 NCBI annotation report](https://www.ncbi.nlm.nih.gov/refseq/annotation_euk/Daphnia_pulex/100/). These are the "RNA-Seq alignments" "Project" IDs and the "SRA Long Read Alignment Statistics" "Run" ID. The unique Project IDs are being used since EGAPx fails if the HTTP header becomes to large from a long list of samples.

#### EGAPx Config
ND CRC [system specifications](https://docs.crc.nd.edu/new_user/quick_start.html).

The following template may be used to run EGAPx workflow jobs on the ND CRC remote servers. The config file template can also be found in the <i>EGAPx_v0.2_process_resources.config</i> file in the <i>inputData</i> directory.

##### Template
// Part of nextflow config describing resource requirements for EGAPx processes

// We rely on labels to define 3 tiers of processes - default, big, and huge.

// Make sure that executor you use supports job memory and CPU requirements

process {

    memory = 200.GB
    cpus = 63
    time = 336.h

    withLabel: 'big_job' {
        memory = 200.GB
        cpus = 63
    }

    withLabel: 'huge_job' {
        memory = 200.GB
        cpus = 63
    }

    withLabel: 'long_job' {
        time = 336.h
    }
}
