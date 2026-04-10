#!/bin/bash

# script to install FCS GX
# https://github.com/ncbi/egapx?tab=readme-ov-file
# usage: bash install_FCS_GX.sh

# retrieve software path
softwarePath="/scratch365/ebrooks5/software/FCS_GX"

# move to software path
cd $softwarePath

# Retrieve the fcs.py runner script
curl -LO https://github.com/ncbi/fcs/raw/main/dist/fcs.py

# For Singularity users: Retrieve the Singularity image file fcs-gx.sif and set the environment variable to use the image with the runner
curl https://ftp.ncbi.nlm.nih.gov/genomes/TOOLS/FCS/releases/latest/fcs-gx.sif -Lo fcs-gx.sif
export FCS_DEFAULT_IMAGE=fcs-gx.sif

# To see the version of your Singularity image, you can run
singularity inspect fcs-gx.sif  

# Download the db: Using s5cmd (fastest option for cloud to cloud)
SOURCE_DB_MANIFEST="https://ncbi-fcs-gx.s3.amazonaws.com/gxdb/latest/all.manifest"
LOCAL_DB="scratch365/ebrooks5/software/FCS_GX"
python3 fcs.py db get --mft "$SOURCE_DB_MANIFEST" --dir "$LOCAL_DB/gxdb"

# Check if the database is downloaded successfully to $LOCAL_DB
ls "$LOCAL_DB/gxdb"

# Check if there are any differences between the source 'all' db and the downloaded 'all' db
python3 fcs.py db check --mft "$SOURCE_DB_MANIFEST" --dir "$LOCAL_DB/gxdb"
