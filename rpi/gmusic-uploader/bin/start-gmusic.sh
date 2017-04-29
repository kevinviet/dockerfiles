#!/bin/bash

# UID 
UPLOADER_ID_ENV="UPLOADER_ID=$1"

# Credentials volume mapping
CREDENTIALS_VOLUME="$(readlink -f $2):/credentials"

# Music volume mapping
MUSIC_VOLUME="$(readlink -f $3):/music"

IMAGE_NAME="gmusic-uploader"

if [ $# -lt 3 ]
  then
    echo "Wrong number of arguments supplied"
    echo "Usage: start_gmusic.sh uid credentials_folder music_folder"
    exit -1
fi

CMD="sudo docker run -v $CREDENTIALS_VOLUME -v $MUSIC_VOLUME --env $UPLOADER_ID_ENV -d $IMAGE_NAME"
echo "Calling: $CMD"
$CMD

