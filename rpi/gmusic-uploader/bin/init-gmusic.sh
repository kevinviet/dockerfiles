#!/bin/bash

# UPLOADER_ID 
UPLOADER_ID=$1

# Credentials volume mapping
CREDENTIALS_VOLUME="$(readlink -f $2):/credentials"

# Docker image to run
IMAGE_NAME="gmusic-uploader"

# Sync command preparation
GMSYNC_CMD="gmsync -U $UPLOADER_ID -c /credentials/oauth"

if [ $# -lt 2 ]
  then
    echo "Wrong number of arguments supplied"
    echo "Usage: init.sh uid credentials_folder"
    exit -1
fi

CMD="sudo docker run -v $CREDENTIALS_VOLUME -it $IMAGE_NAME $GMSYNC_CMD"
echo "Calling: $CMD"
$CMD

