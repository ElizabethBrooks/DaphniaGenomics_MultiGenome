# Daphnia Genome Annotations

## Annotation Status

The [EGAPx\_v0.2\_daphnia\_annotation\_log](https://docs.google.com/spreadsheets/d/10nzxceWsXgf_4hcc5mAFBi7NVG6NLLwm38dv_k6yeUM/edit?usp=sharing) spreadsheet shows the annotation information and status for each Daphnia species in our analysis.

The annotations for Daphnia pulex, pulicaria, and magna have been completed using EGAPx and added to the [Daphnia\_Genome\_Annotations](https://notredame.app.box.com/folder/282385967278) Box folder.

## Code

Click [here](https://github.com/ElizabethBrooks/DaphniaGenomics_MultiGenome) for the code repository with scripts to analyze multiple daphnia species genomes.

## Inputs & Outputs

To use these sets of scripts to install and run the workflows, make sure to change the paths in the inputs files in the <b>inputData</b> directory. For example, the input and output paths in the <i>inputPaths.txt</i> file should be changed to the paths on your system.

## [EGAPx](https://github.com/ncbi/egapx/) Workflows
There are two workflows for EGAPx, local and HPC. The <i>local scripts</i> can be run locally on your system and the <i>HPC scripts</i> are setup for job submission to the ND CRC remote servers.

Note that singularity needs to be installed on your system. The ND CRC servers already have singularity available.

### Steps
1. Install and test the EGAPx software.
2. Format any input files, such as the reads fasta files or yaml guide file.
3. Run EGAPx using as many cores as possible and with sufficient data storage. This will depend on the size and number of input files, for example.

### Installation
The <i>install\_EGAPx.sh</i> script in the <b>install</b> directory can be used to install EGAPx and its dependencies. 

Make sure to change the paths in the <i>inputs\_annotations.txt</i> file to where you would like to have the software installed and outputs generated.

### Notes
There are some things to keep in mind when running EGAPx.

#### EGAPx Config
The <i>egapx/ui/assets/config/process\_resources.config</i> file specifies up to 31 cores (huge\_Job).

The ND CRC [system specifications](https://docs.crc.nd.edu/new_user/quick_start.html) indicates that our afs system has 263Gb RAM, 64 cores. Make sure to leave 1 core free for general processes, so request up to 63 cores per job on our afs system.

The <i>EGAPx\_v0.2\_process\_resources.config</i> file in the <i>inputData</i> directory may be used to run EGAPx workflow jobs on the ND CRC remote servers.

It is also possible to set the config using the -c or --config-dir CONFIG\_DIR flag (see the GitHub README for EGAPx or run <i>ui/egapx.py  -h</i>).

#### inputData

##### reads

###### EGAPx v0.2
EGAPx v0.2 expects the headers to simple, such as single words (e.g., read ID or name) with no extra spaces or strange symbols.

<b>TO-DO:</b> Altert EGAPx creators of the following error.<br>
EGAPx v0.2 should be able to accept fasta files compressed into gz format. However, the following error is returned on our ND CRC remote server system (see https://www.biostars.org/p/9469010/):<br>
Exiting because of \*FATAL ERROR\*: could not create FIFO file wrkarea/STAR.65804014732736FFdFHY/D.pulicaria\_LARRY\_HIC\_final-18CRep1\_ATCACG\_L001\_R1.concat.fq/D.pulicaria\_LARRY\_HIC\_final-18CRep1\_ATCACG\_L001\_R1.concat.fq-\_STARtmp/tmp.fifo.read1

###### EGAPx v0.1
The read fasta files need to be formatted very specifically, see the <i>format\_trimmed\_reads\_EGAPx.sh</i> script in the <b>formatting</b> directory.

EGAPx v0.1 expects the headers to simple, such as single words (e.g., read ID or name) with no extra spaces or strange symbols. Additionally, the fasta file needs to contain just header and sequence information (no quality scores, etc.).

EGAPx v0.1 expects that input reads are a list of FASTA read files, which are named in the form SRAxxx.1, SRAxxx.2 (see the <i>egapx/nf/./subworkflows/ncbi/./rnaseq\_short/star\_wnode/main.nf</i> file).

##### reads\_ids

###### EGAPx v0.1 & EGAPx v0.2
There is a limit to the number of SRA IDs that can be input to EGAPx, since the pipeline makes a query to the SRA. The HTTP header becomes too large if the list of SRA IDs is very long. 

###### NCBI Data Sets
These IDs can be retrieved from the annotation report pages of each species. For example, [KAP4 NCBI annotation report](https://www.ncbi.nlm.nih.gov/refseq/annotation_euk/Daphnia_pulex/100/). These are the "RNA-Seq alignments" "Project" IDs and the "SRA Long Read Alignment Statistics" "Run" ID. The unique Project IDs are being used since EGAPx fails if the HTTP header becomes to large from a long list of samples.
