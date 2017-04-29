#!/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/games:/usr/games

OAUTH_LOCATION="$1/oauth"
OAUTH_FILE="$OAUTH_LOCATION.cred"
DELETE_ON_SUCCESS="--delete-on-success"
GMSYNC="gmsync -c $OAUTH_LOCATION -U $2 /music $DELETE_ON_SUCCESS"

# if oauth file is created sync the music
if [ -e "$OAUTH_FILE" ]
then
  echo "($date) : Syncing google music with command : $GMSYNC"
  $GMSYNC
  echo "($date) : Finished syncing"
else
  echo "($date) : Sync is off : no oauth file present at location $OAUTH_FILE"
fi
