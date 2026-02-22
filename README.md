# Daphnia Genome Annotations

## Code

Click [here](https://github.com/ElizabethBrooks/DaphniaGenomics_MultiGenome) for the code repository with scripts to analyze multiple daphnia species genomes.

## [EGAPx](https://github.com/ncbi/egapx/) Workflows
There are two very similar workflows for EGAPx, local and HPC. The <i>local scripts</i> can be run locally on your system and the <i>HPC scripts</i> are setup for job submission to the ND CRC remote servers.

Note that singularity needs to be installed on your system. The ND CRC servers already have singularity available.

### Steps
1. Install, configure, and test the EGAPx software.
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

##### genome

[Masking is not needed, and not used in EGAPx at this time.](https://github.com/ncbi/egapx/issues/64)

EGAPx is predominantly an evidence-based predictor, using RNA-seq and protein alignments as the primary basis for nearly all models. Most aligners, including STAR and miniprot, don't care about and ignore soft-masking, and recommend against hard-masking, so there's no need for it. lncRNAs and 3' UTRs of coding genes also often include repeats which are valid to include in the model.

A carefully vetted masking library can be useful for identifying gene predictions on transposons and other repeats; however, without curation that can over-filter real genes (e.g. high-copy number gene families like histones can get masked). EGAPx includes some alternative logic to identify gene predictions that are predominantly transposon based on protein hits, and we pre-filter our protein evidence sets to remove repeat-based proteins. It is an area that we've been exploring for improvements, but I think focusing on protein characteristics (e.g. domain analysis) will be more suitable for the purpose. We've also set up EGAPx to require at least some alignment evidence for all models, whereas in RefSeq EGAP we include some models that are entirely based on ab initio prediction. That ab initio path can find a few more real genes, but is the major source of transposon noise in RefSeq XP models, so the EGAPx settings help improve precision.

##### reads

###### IsoSeq


[EGAPx does not yet support IsoSeq data. We're starting to work on it now, but please stick to just short reads with the current version.](https://github.com/ncbi/egapx/issues/66)

[Note we don't yet have support for PacBio reads in EGAPx (but we're starting to work on it). As configured, your PacBio input will be aligned with STAR and processed as if they are short reads.](https://github.com/ncbi/egapx/issues/63) STAR can align IsoSeq, but we use customized STAR parameters and have implemented some downstream processing to deal with some types of STAR alignment artifacts, and I can't predict how that will behave with longer reads. You could try with and without the PacBio to see which gives better results (e.g. running BUSCO on the final annotation using the laurasiatheria_odb10 reference set, and counting gene features with NCBIOrtholog Dbxrefs in the final GFF3 to get the count of orthologs). But I don't think that's related to the error you're seeing.


[Our initial release is aimed at gathering initial feedback on execution in a variety of compute environments, and is not yet feature complete.](https://github.com/ncbi/egapx/issues/2) We haven't added support for aligning IsoSeq data yet, but do plan to add it in a future version. Also note that to date for RefSeq we've always used IsoSeq in combination with Illumina data to help identify alignment artifacts and low frequency events. With increasing IsoSeq read depth and some additional filtering we're anticipating being able to annotate with only IsoSeq, but it's likely that Illumina will still help especially with longer genes/transcripts. So if you have the samples and budget I would consider also running some on a short read platform.

I anticipate it being another 6 months to fill out the feature set and generate output suitable for GenBank submission, but we'll probably have a version with IsoSeq support up before then.

###### EGAPx v0.2
EGAPx v0.2 expects the headers to be simple, such as single words (e.g., read ID or name) with no extra spaces or "strange" symbols.

See the <i>download\_SRA.sh</i> script in the <b>scripts</b> subdirectory of the <b>inputData</b> directory for an example of appropriate header formatting using downloaded SRA data.

EGAPx v0.2 should be able to accept fasta files compressed into gz format. However, the following error is returned on our ND CRC remote server system (see https://www.biostars.org/p/9469010/):<br>
Exiting because of \*FATAL ERROR\*: could not create FIFO file wrkarea/STAR.65804014732736FFdFHY/D.pulicaria\_LARRY\_HIC\_final-18CRep1\_ATCACG\_L001\_R1.concat.fq/D.pulicaria\_LARRY\_HIC\_final-18CRep1\_ATCACG\_L001\_R1.concat.fq-\_STARtmp/tmp.fifo.read1

###### EGAPx v0.1
The read fasta files need to be formatted very specifically, see the scripts in the <b>formatting</b> directory for examples.

EGAPx v0.1 expects the headers to simple, such as single words (e.g., read ID or name) with no extra spaces or strange symbols. Additionally, the fasta file needs to contain just header and sequence information (no quality scores, etc.).

EGAPx v0.1 expects that input reads are a list of FASTA read files, which are named in the form SRAxxx.1, SRAxxx.2 (see the <i>egapx/nf/./subworkflows/ncbi/./rnaseq\_short/star\_wnode/main.nf</i> file).

##### reads\_ids

###### EGAPx v0.1 & EGAPx v0.2
There is a limit to the number of SRA IDs that can be input to EGAPx, since the pipeline makes a query to the SRA. The HTTP header becomes too large if the list of SRA IDs is very long. 

###### NCBI Data Sets
These IDs can be retrieved from the annotation report pages of each species. For example, [KAP4 NCBI annotation report](https://www.ncbi.nlm.nih.gov/refseq/annotation_euk/Daphnia_pulex/100/). These are the "RNA-Seq alignments" "Project" IDs and the "SRA Long Read Alignment Statistics" "Run" ID. The unique Project IDs are being used since EGAPx fails if the HTTP header becomes to large from a long list of samples.
